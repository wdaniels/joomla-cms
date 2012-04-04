<?php
/**
 * @package     Joomla.Platform
 * @subpackage  Database
 *
 * @copyright   Copyright (C) 2012 Will Daniels <mail@willdaniels.co.uk>.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('JPATH_PLATFORM') or die;

JLoader::register('JDatabaseQueryVirtuoso', dirname(__FILE__) . '/virtuosoquery.php');

/**
 * Virtuoso ODBC database driver
 *
 * @package     Joomla.Platform
 * @subpackage  Database
 * @see         http://virtuoso.openlinksw.com/
 * @see         http://docs.openlinksw.com/virtuoso/sqlreference.html
 * @since       11.1
 */
class JDatabaseVirtuoso extends JDatabase
{
	/**
	 * The name of the database driver.
	 *
	 * @var    string
	 * @since  11.1
	 */
	public $name = 'virtuoso';

	/**
	 * The character(s) used to quote SQL statement names such as table names or field names,
	 * etc. The child classes should define this as necessary.  If a single character string the
	 * same character is used for both sides of the quoted name, else the first character will be
	 * used for the opening quote and the second for the closing quote.
	 *
	 * @var    string
	 * @since  11.1
	 */
	protected $nameQuote = '"';

	/**
	 * The null or zero representation of a timestamp for the database driver.  This should be
	 * defined in child classes to hold the appropriate value for the engine.
	 *
	 * @var    string
	 * @since  11.1
	 */
	protected $nullDate = '0001-01-01 00:00:00';

	/**
	 * odbc_affected_rows
	 *
	 * The number of affected rows captured for the last query. We have to do it
	 * this way for ODBC because odbc_num_rows operates on a result cursor 
	 * instead of the connection resource like mysql_affected_rows.
	 */
	private $odbc_affected_rows = 0;

	/**
	 * Constructor.
	 *
	 * @param   array  $options  Array of database options with keys: host, user, password, database, select.
	 *
	 * @since   11.1
	 */
	protected function __construct($options)
	{
		// TODO: Talk to Joomla team about support for ODBC DSN names here
		// Ideally we would want to just pre-populate a list of DSNs to select
		$options['host'] = (isset($options['host'])) ? $options['host'] : 'localhost';
		$options['user'] = (isset($options['user'])) ? $options['user'] : 'root';
		$options['password'] = (isset($options['password'])) ? $options['password'] : '';
		$options['database'] = (isset($options['database'])) ? $options['database'] : '';
		$options['select'] = (isset($options['select'])) ? (bool) $options['select'] : true;

		// Make sure the ODBC extension for PHP is installed and enabled.
		if (!function_exists('odbc_connect')) {
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_ADAPTER_ODBC'));
		}

		// TODO: Probably shouldn't assume that this is what the user wants here:
		$dsn = function_exists('__virt_internal_dsn') ? __virt_internal_dsn() : $options['host'];

		if (!($this->connection = @ odbc_connect($dsn, $options['user'], $options['password']))) {
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_CONNECT_ODBC'));
		}
		$this->select($options['database']);

		// Finalize initialisation
		parent::__construct($options);
	}

	/**
	 * Destructor.
	 *
	 * @since   11.1
	 */
	public function __destruct()
	{
		if (is_resource($this->connection))
		{
			odbc_close($this->connection);
		}
	}

	/**
	 * Method to escape a string for usage in an SQL statement.
	 *
	 * @param   string   $text   The string to be escaped.
	 * @param   boolean  $extra  Optional parameter to provide extra escaping.
	 *
	 * @return  string  The escaped string.
	 *
	 * @since   11.1
	 */
	public function escape($text, $extra = false)
	{
		$result = addslashes($text);
		// TODO: Check that c-slashes are enabled in Virtuoso config, else just do:
		// $result = str_replace('\'', '\'\'', str_replace('\\', '\\\\', $text));

		if ($extra)
		{
			// TODO: Find out what this "extra" is all about!?
		}

		return $result;
	}

	/**
	 * Test to see if the ODBC connector is available.
	 *
	 * @return  boolean  True on success, false otherwise.
	 *
	 * @since   11.1
	 */
	public static function test()
	{
		return (function_exists('odbc_connect'));
	}

	/**
	 * Determines if the connection to the server is active.
	 *
	 * @return  boolean  True if connected to the database engine.
	 *
	 * @since   11.1
	 */
	public function connected()
	{
		return is_resource($this->connection); // TODO: something else
	}

	/**
	 * Drops a table from the database.
	 *
	 * @param   string   $tableName  The name of the database table to drop.
	 * @param   boolean  $ifExists   Optionally specify that the table must exist before it is dropped.
	 *
	 * @return  JDatabaseVirtuoso  Returns this object to support chaining.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function dropTable($tableName, $ifExists = true)
	{
		$query = $this->getQuery(true);

		// TODO: Check exists via INFORMATION_SCHEMA
		if (in_array($tableName, $this->getTableList())) {
			$this->setQuery('DROP TABLE ' . $query->quoteName($tableName));
			$this->query();
		}
		return $this;
	}

	/**
	 * Get the number of affected rows for the previous executed SQL statement.
	 *
	 * @return  integer  The number of affected rows.
	 *
	 * @since   11.1
	 */
	public function getAffectedRows()
	{
		// TODO: needs to operate on a result, unlike the mysql variant which
		// operates on the connection. Look into the cost of calling this
		// to store the result after every exec.
		return $this->odbc_affected_rows;
	}

	/**
	 * Method to get the database collation in use by sampling a text field of a table in the database.
	 *
	 * @return  mixed  The collation in use by the database (string) or boolean false if not supported.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function getCollation()
	{
		/*
		 * Some 8-bit charsets are shipped with Virtuoso, but the schema used
		 * for this driver defines unicode columns, since these are automatically
		 * stored as UTF-8 internally by Virtuoso for efficiency it seems like
		 * the best way to future-proof the schema. However...
		 *
		 * By default Virtuoso does not ship any unicode collations, those need
		 * to be defined (and named) by the administrator. Consequently we do not
		 * specify any collation in the schema and the default sort order will
		 * be the binary order of unicode serialisation.
		 *
		 * If there is a way to find the collation defined for a given column
		 * I do not know it. The collation can be seen in V_COL_CHECK in
		 * INFORMATION_SCHEMA.COLUMNS, but not exclusively and I do not know how
		 * to reliably decode that field.
		 *
		 * So the best we can do here, for now, is return any database-wide
		 * collation setting from the INI file. But since unicode collations are
		 * defined separately, there's no telling whether the configured collation
		 * is going to be used for unicode strings or not, without looking that up
		 * in SYS_COLLATIONS, but frankly this whole area of functionality in
		 * Virtuoso is just going to need handling manually by a competent server
		 * andmin and not via Joomla!
		*/
		$sql = "SELECT cfg_item_value(virtuoso_ini_path(), 'Parameters', 'Collation')";
		$this->setQuery($sql);
		$cfg = $this->loadColumn(); // column value will be null if not set

		return $cfg[0] ? $cfg[0] : false; 
	}

	/**
	 * Gets an exporter class object.
	 *
	 * @return  JDatabaseExporterODBC  An exporter object.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function getExporter()
	{
		// Make sure we have an exporter class for this driver.
		if (!class_exists('JDatabaseExporterVirtuoso'))
		{
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_MISSING_EXPORTER'));
		}

		$o = new JDatabaseExporterVirtuoso;
		$o->setDbo($this);

		return $o;
	}

	/**
	 * Gets an importer class object.
	 *
	 * @return  JDatabaseImporterODBC  An importer object.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function getImporter()
	{
		// Make sure we have an importer class for this driver.
		if (!class_exists('JDatabaseImporterVirtuoso'))
		{
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_MISSING_IMPORTER'));
		}

		$o = new JDatabaseImporterVirtuoso;
		$o->setDbo($this);

		return $o;
	}

	/**
	 * Get the number of returned rows for the previous executed SQL statement.
	 *
	 * @param   resource  $cursor  An optional database cursor resource to extract the row count from.
	 *
	 * @return  integer   The number of returned rows.
	 *
	 * @since   11.1
	 */
	public function getNumRows($cursor = null)
	{
		return odbc_num_rows(is_resource($cursor) ? $cursor : $this->cursor);
	}

	/**
	 * Get the current or query, or new JDatabaseQuery object.
	 *
	 * @param   boolean  $new  False to return the last query set, True to return a new JDatabaseQuery object.
	 *
	 * @return  mixed  The current value of the internal SQL variable or a new JDatabaseQuery object.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function getQuery($new = false)
	{
		if ($new)
		{
			// Make sure we have a query class for this driver.
			if (!class_exists('JDatabaseQueryVirtuoso'))
			{
				throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_MISSING_QUERY'));
			}
			return new JDatabaseQueryVirtuoso($this);
		}
		else
		{
			return $this->sql;
		}
	}

	/**
	 * Shows the table CREATE statement that creates the given tables.
	 *
	 * @param   mixed  $tables  A table name or a list of table names.
	 *
	 * @return  array  A list of the create SQL for the tables.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function getTableCreate($tables)
	{
		// TODO: Virtuoso has create_table_sql function added by the
		// yacutia (conductor) app but we cannot assume it exists.
		// Check is this function really needed?
		return false;
	}

	/**
	 * Sets the SQL statement string for later execution.
	 *
	 * @param   mixed    $query   The SQL statement to set either as a JDatabaseQuery object or a string.
	 * @param   integer  $offset  The affected row offset to set.
	 * @param   integer  $limit   The maximum affected rows to set.
	 *
	 * @return  JDatabase  This object to support method chaining.
	 *
	 * @since   11.1
	 */
	public function setQuery($query, $offset = 0, $limit = 0)
	{
		$q = $query; $dbstmt = null;

		if ($limit > 0 || $offset > 0) {
			$top = "SELECT TOP $offset,$limit";
			$q = preg_replace('/^\s*SELECT/i', $top, $q);
		}
		else {
			// TODO: Database operations need to be abstracted in the driver!
			if (preg_match('/(CREATE|ALTER) DATABASE (".*")/i', $q, $dbstmt)) {
				if ($dbstmt[1] == 'CREATE') $q = 'USE '.$dbstmt[2];
				else $q = "SELECT 'Suppressed query: ".$this->escape($q)."'";
			}
		}
		// TODO: Ideally composition of date literals should be abstracted in the
		// driver like quoting. Virtuoso doesn't like doing implicit casts and
		// will generate lots of noise with QW004 errors, and also has some
		// unpredictable (buggy) behaviours if we don't do this:
		if (!preg_match('/(CREATE|ALTER) TABLE (".*")/i', $q)) {
			$q = preg_replace('/(?<!{ts)([^\\\\\\(])(\'\\d\\d\\d\\d-\\d\\d-\\d\\d \\d\\d:\\d\\d:\\d\\d\')/', '${1}stringdate(${2})', $q);
		}
		// Strip any GROUP BY clauses that include known long data types
		// TODO: Talk to the Joomla! devs about this issue!
		$q = preg_replace('/GROUP BY [^A-Z]*(params|introtext)[^A-Z]*/', '', $q);

		return parent::setQuery($q);
	}

	/**
	 * Retrieves field information about a given table.
	 *
	 * @param   string   $table     The name of the database table.
	 * @param   boolean  $typeOnly  True to only return field types.
	 *
	 * @return  array  An array of fields for the database table.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function getTableColumns($table, $typeOnly = true)
	{
		$result = array();
		$sql = 'SELECT COLUMN_NAME AS "Field", DATA_TYPE AS "Type",';
		$sql.= ' NULLABLE AS "Null", COLUMN_DEF AS "Default" ';
		$sql.= 'FROM INFORMATION_SCHEMA.COLUMNS ';
		$sql.= 'WHERE TABLE_NAME = '.$this->quote($this->replacePrefix($table));

		$this->setQuery($sql);
		$fields = $this->loadObjectList();

		// If we only want the type as the value add just that to the list.
		if ($typeOnly)
		{
			foreach ($fields as $field)
			{
				// TODO: Don't think Virtuoso will include the precision here
				$result[$field->Field] = preg_replace("/[(0-9)]/", '', $field->Type);
			}
		}
		// If we want the whole field data object add that to the list.
		else
		{
			foreach ($fields as $field)
			{
				$result[$field->Field] = $field;
			}
		}
		return $result;
	}

	/**
	 * Get the details list of keys for a table.
	 *
	 * @param   string  $table  The name of the table.
	 *
	 * @return  array  An array of the column specification for the table.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function getTableKeys($table)
	{
		// TODO: Check what column names are expected here
		$sql = 'SELECT COLUMN_NAME, V_KEY_IS_MAIN, V_KEY_IS_UNIQUE ';
		$sql.= 'FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE ';
		$sql.= 'WHERE TABLE_CATALOG = '.$this->quote($this->getDatabase());
		$sql.= '  AND TABLE_NAME = '.$this->quote($table) . ' ';
		$sql.= 'ORDER BY V_KEY_IS_UNIQUE, ORDINAL_POSITION';

		$this->setQuery($sql);
		$keys = $this->loadObjectList();
		return $keys;
	}

	/**
	 * Method to get an array of all tables in the database.
	 *
	 * @return  array  An array of all the tables in the database.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function getTableList()
	{
		// In Virtuoso TABLES will only describe current catalog anyway
		$sql = 'SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES';

		$this->setQuery($sql);
		$tables = $this->loadColumn();
		return $tables;
	}

	/**
	 * Get the version of the database connector.
	 *
	 * @return  string  The database connector version.
	 *
	 * @since   11.1
	 */
	public function getVersion()
	{
		$cur = odbc_exec($this->connection, "SELECT sys_stat('st_dbms_ver')");
		if (is_resource($cur)) $ver = odbc_fetch_array($cur);
		return (isset($id['sys_stat']) ? $id['sys_stat'] : 6);
	}

	/**
	 * Determines if the database engine supports UTF-8 character encoding.
	 *
	 * @return  boolean  True if supported.
	 *
	 * @since   11.1
	 * @deprecated 12.1
	 */
	public function hasUTF()
	{
		// TODO: Is this for column charsets or schema names, or both?
		// Virtuoso: SQL_UTF8_EXECS config setting server-wide for schema names
		// upper/lower functions are narrow, needs charset_recode to make wide
		// Need to find out more about Joomla's requirements for UTF-8
		JLog::add('JDatabaseVirtuoso::hasUTF() is deprecated.', JLog::WARNING, 'deprecated');
		return false;
	}

	/**
	 * Method to get the auto-incremented value from the last INSERT statement.
	 *
	 * @return  integer  The value of the auto-increment field from the last inserted row.
	 *
	 * @since   11.1
	 */
	public function insertid()
	{
		// TODO: Virtuoso specific, maybe use ODBC SQL_LASTSERIAL statement instead
		$cur = odbc_exec($this->connection, "SELECT identity_value()");
		if (is_resource($cur)) $id = odbc_fetch_array($cur);
		return (isset($id['identity_value']) ? $id['identity_value'] : 0);
	}

	/**
	 * Locks a table in the database.
	 *
	 * @param   string  $table  The name of the table to unlock.
	 *
	 * @return  JDatabaseVirtuoso  Returns this object to support chaining.
	 *
	 * @since   11.4
	 * @throws  JDatabaseException
	 */
	public function lockTable($table)
	{
		// TODO: AFAIK not possible/easy to manually set table locks in Virtuoso 
		// without faking a predictable query to do it. How important is this?
		return $this;
	}

	/**
	 * Execute the SQL statement.
	 *
	 * @return  mixed  A database cursor resource on success, boolean false on failure.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function query()
	{
		if (!is_resource($this->connection))
		{
			JLog::add(JText::sprintf('JLIB_DATABASE_QUERY_FAILED', $this->errorNum, $this->errorMsg), JLog::ERROR, 'database');
			throw new JDatabaseException($this->errorMsg, $this->errorNum);
		}

		// Take a local copy so that we don't modify the original query and cause issues later
		$sql = $this->replacePrefix((string) $this->sql);

		// TODO: Virtuoso doesn't like a trailing ; in SQLExecDirect, consider
		// checking and stripping that here.

		// If debugging is enabled then let's log the query.
		if ($this->debug)
		{
			// Increment the query counter and add the query to the object queue.
			$this->count++;
			$this->log[] = $sql;

			JLog::add($sql, JLog::DEBUG, 'databasequery');
		}

		// Reset the error values.
		$this->errorNum = 0;
		$this->errorMsg = '';

		// Execute the query.
		$this->cursor = odbc_exec($this->connection, $sql);

		// If an error occurred handle it.
		if (!is_resource($this->cursor))
		{
			$trace = array();
			array_walk(debug_backtrace(), create_function('$a, $b, $c',
				'$c[] = "{$a[\'function\']}() in [".basename($a[\'file\']).":{$a[\'line\']}]; ";'),
				&$trace);

			$this->errorNum = (int) odbc_error($this->connection);
			$this->errorMsg = (string) odbc_errormsg($this->connection);
			$this->errorMsg.= ' SQL=' . $sql;
			$this->errorMsg.= ' TRACE=' . implode(' >> ', array_reverse($trace));

			JLog::add(JText::sprintf('JLIB_DATABASE_QUERY_FAILED', $this->errorNum, $this->errorMsg), JLog::ERROR, 'databasequery');
			throw new JDatabaseException($this->errorMsg, $this->errorNum);
		}

		$this->odbc_affected_rows = odbc_num_rows($this->cursor);
		return is_resource($this->cursor);
	}

	/**
	 * This function replaces a string identifier <var>$prefix</var> with the string held is the
	 * <var>tablePrefix</var> class variable.
	 *
	 * @param   string  $sql     The SQL statement to prepare.
	 * @param   string  $prefix  The common table prefix.
	 *
	 * @return  string  The processed SQL statement.
	 *
	 * @since   11.1
	 */
	public function replacePrefix($sql, $prefix = '#__')
	{
		// NB: Overloaded because of virtuoso name quoting using double quotes
		// NB: ISO SQL standard for quoting identifiers is also the double quote!

		// Best case performance is no prefix, cost is only this preg_match
		if (preg_match_all("/$prefix/", $sql, $matches, PREG_OFFSET_CAPTURE))
		{
			$prefixes = $matches[0];

			$q = str_replace('\\\'', 'xx', $sql); // ignore escaped string quotes
			preg_match_all('@\'.*?\'@', $q, $strings, PREG_OFFSET_CAPTURE);

			$modified = $sql; $offset = 0;
			$exclusions = $strings[0];

			// performance here will degrade with |prefixes| . |exclusions|
			foreach ($prefixes as $match)
			{
				$replace = true; // assume it's OK to replace
				foreach ($exclusions as $exclude)
				{
					$begin = $exclude[1]; // offset of string literal
					$end = $begin + strlen($exclude[0]); // end of string literal

					// if the prefix is within this a string literal, skip replacement
					if ($match[1] >= $begin && $match[1] <= $end) $replace = false;
				}
				if ($replace)
				{
					$modified = substr_replace($modified, $this->tablePrefix,
						$match[1] + $offset, strlen($match[0]));

					// track offset adjustment to account for our modifications
					$offset += (strlen($this->tablePrefix) - strlen($prefix));
				}
			}
			return $modified;
		}
		return $sql;
	}

	/**
	 * Inserts a row into a table based on an object's properties.
	 *
	 * @param   string  $table    The name of the database table to insert into.
	 * @param   object  &$object  A reference to an object whose public properties match the table fields.
	 * @param   string  $key      The name of the primary key. If provided the object property is updated.
	 *
	 * @return  boolean    True on success.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function insertObject($table, &$object, $key = null)
	{
		// Initialise variables.
		$fields = array();
		$values = array();

		// Create the base insert statement.
		$statement = 'INSERT INTO ' . $this->quoteName($table) . ' (%s) VALUES (%s)';

		// Iterate over the object variables to build the query fields and values.
		foreach (get_object_vars($object) as $k => $v)
		{
			// Only process non-null scalars.
			if (is_array($v) or is_object($v) or $v === null)
			{
				continue;
			}

			// Ignore any internal fields or the primary key.
			// NB: Virtuoso does not accept 0 in PK for auto-increment unlike mysql!
			if ($k[0] == '_' || $k == $key)
			{
				continue;
			}

			// Prepare and sanitize the fields and values for the database query.
			$fields[] = $this->quoteName($k);
			$values[] = is_numeric($v) ? $v : $this->quote($v);
		}

		// Set the query and execute the insert.
		$this->setQuery(sprintf($statement, implode(',', $fields), implode(',', $values)));
		if (!$this->query())
		{
			return false;
		}

		// Update the primary key if it exists.
		$id = $this->insertid();
		if ($key && $id)
		{
			$object->$key = $id;
		}

		return true;
	}

	/**
	 * Renames a table in the database.
	 *
	 * @param   string  $oldTable  The name of the table to be renamed
	 * @param   string  $newTable  The new name for the table.
	 * @param   string  $backup    Not used by ODBC.
	 * @param   string  $prefix    Not used by ODBC.
	 *
	 * @return  JDatabase  Returns this object to support chaining.
	 *
	 * @since   11.4
	 * @throws  JDatabaseException
	 */
	public function renameTable($oldTable, $newTable, $backup = null, $prefix = null)
	{
		$this->setQuery('ALTER TABLE ' . $oldTable . ' RENAME ' . $newTable)->query();

		return $this;
	}

	/**
	 * Select a database for use.
	 *
	 * @param   string  $database  The name of the database to select for use.
	 *
	 * @return  boolean  True if the database was successfully selected.
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function select($database)
	{
		if (!$database)
		{
			return false;
		}

		$sql = 'USE '.$this->quoteName($database);
		if (!is_resource($res = odbc_exec($this->connection, $sql))) {
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_DATABASE_CONNECT'));
		}
		odbc_free_result($res);

		return true;
	}

	/**
	 * Set the connection to use UTF-8 character encoding.
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   11.1
	 */
	public function setUTF()
	{
		// TODO: See notes in hasUTF()
		return true;
	}

	/**
	 * Method to commit a transaction.
	 *
	 * @return  void
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function transactionCommit()
	{
		$this->setQuery('COMMIT');
		$this->query();
	}

	/**
	 * Method to roll back a transaction.
	 *
	 * @return  void
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function transactionRollback()
	{
		$this->setQuery('ROLLBACK');
		$this->query();
	}

	/**
	 * Method to initialize a transaction.
	 *
	 * @return  void
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function transactionStart()
	{
		$this->setQuery('START TRANSACTION');
		$this->query();
	}

	/**
	 * Method to fetch a row from the result set cursor as an array.
	 *
	 * @param   mixed  $cursor  The optional result set cursor from which to fetch the row.
	 *
	 * @return  mixed  Either the next row from the result set or false if there are no more rows.
	 *
	 * @since   11.1
	 */
	protected function fetchArray($cursor = null)
	{
		if (!is_resource($cursor)) $cursor = $this->cursor;
		if (!odbc_fetch_into($cursor, $ret)) return false;
		return $ret;
	}

	/**
	 * Method to fetch a row from the result set cursor as an associative array.
	 *
	 * @param   mixed  $cursor  The optional result set cursor from which to fetch the row.
	 *
	 * @return  mixed  Either the next row from the result set or false if there are no more rows.
	 *
	 * @since   11.1
	 */
	protected function fetchAssoc($cursor = null)
	{
		if (!is_resource($cursor)) $cursor = $this->cursor;

		// unixODBC supports fetching associative arrays:
		if (function_exists('odbc_fetch_array')) {
			return odbc_fetch_array($cursor);
		}
		// but for iODBC we will need to build it ourselves...
		$ret = $row = array();
		$count = odbc_num_fields($cursor);

		while (odbc_fetch_into($cursor, $row)) {
			for ($i = 1; $i <= $count; $i++) {
				$ret[odbc_field_name($cursor, $i)] = $row[$i - 1];
			}
		}
		return $ret;
	}

	/**
	 * Method to fetch a row from the result set cursor as an object.
	 *
	 * @param   mixed   $cursor  The optional result set cursor from which to fetch the row.
	 * @param   string  $class   The class name to use for the returned row object.
	 *
	 * @return  mixed   Either the next row from the result set or false if there are no more rows.
	 *
	 * @since   11.1
	 */
	protected function fetchObject($cursor = null, $class = 'stdClass')
	{
		// TODO: odbc_fetch_object will only give us a stdClass object.
		// See if the non-stdClass case is ever likely to happen, how to implement.
		if ($class != 'stdClass') {
			throw new JDatabaseException("Unsupported request for non-generic ($class) class in fetchObject.");
		}

		if (!is_resource($cursor)) $cursor = $this->cursor;
		if ($ret = odbc_fetch_object($cursor)) {
			return $ret;
		}
		return false;
	}

	/**
	 * Method to free up the memory used for the result set.
	 *
	 * @param   mixed  $cursor  The optional result set cursor from which to fetch the row.
	 *
	 * @return  void
	 *
	 * @since   11.1
	 */
	protected function freeResult($cursor = null)
	{
		odbc_free_result(is_resource($cursor) ? $cursor : $this->cursor);
	}

	/**
	 * Diagnostic method to return explain information for a query.
	 *
	 * @return      string  The explain output.
	 *
	 * @since       11.1
	 * @deprecated  12.1
	 */
	public function explain()
	{
		// Deprecation warning.
		JLog::add('JDatabaseVirtuoso::explain() is deprecated.', JLog::WARNING, 'deprecated');

		// Backup the current query so we can reset it later.
		$backup = $this->sql;

		// TODO: This method is Virtuoso specific, not suitable for pure ODBC
		$this->sql = 'explain(' . $this->quote($this->sql) . ')';
		$report = implode("\n", $this->loadColumn());
		$buffer = '<pre id="explain-sql">' . $report . '</pre>';

		// Restore the original query to its state before we ran the explain.
		$this->sql = $backup;

		// Free up system resources and return.
		$this->freeResult($cursor);

		return $buffer;
	}

	/**
	 * Execute a query batch.
	 *
	 * @param   boolean  $abortOnError     Abort on error.
	 * @param   boolean  $transactionSafe  Transaction safe queries.
	 *
	 * @return  mixed  A database resource if successful, false if not.
	 *
	 * @deprecated  12.1
	 * @since   11.1
	 */
	public function queryBatch($abortOnError = true, $transactionSafe = false)
	{
		// Deprecation warning.
		JLog::add('JDatabaseVirtuoso::queryBatch() is deprecated.', JLog::WARNING, 'deprecated');

		$sql = $this->replacePrefix((string) $this->sql);
		$this->errorNum = 0;
		$this->errorMsg = '';

		// If the batch is meant to be transaction safe then we need to wrap it in a transaction.
		if ($transactionSafe)
		{
			$sql = 'START TRANSACTION;' . rtrim($sql, "; \t\r\n\0") . '; COMMIT;';
		}
		$queries = $this->splitSql($sql);
		$error = 0;
		foreach ($queries as $query)
		{
			$query = trim($query);
			if ($query != '')
			{
				$this->cursor = odbc_exec($this->connection, $query);
				if ($this->debug)
				{
					$this->count++;
					$this->log[] = $query;
				}
				if (!is_resource($this->cursor))
				{
					$error = 1;
				  $this->errorNum = (int) odbc_error($this->connection);
				  $this->errorMsg = (string) odbc_errormsg($this->connection) . " SQL=$query <br />";

					if ($abortOnError)
					{
						return $this->cursor;
					}
				}
			}
		}
		return $error ? false : true;
	}

	/**
	 * Unlocks tables in the database.
	 *
	 * @return  JDatabaseVirtuoso  Returns this object to support chaining.
	 *
	 * @since   11.4
	 * @throws  JDatabaseException
	 */
	public function unlockTables()
	{
		// TODO: AFAIK not possible/easy to manually set table locks in Virtuoso 
		// without faking a predictable query to do it. How important is this?
		return $this;
	}
}
