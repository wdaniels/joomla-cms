<?php
/**
 * @package     Joomla.Platform
 * @subpackage  Database
 *
 * @copyright   Copyright (C) 2012 Will Daniels <mail@willdaniels.co.uk>.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('JPATH_PLATFORM') or die;

JLoader::register('JDatabaseQuerySQL92', dirname(__FILE__) . '/sql92query.php');

/**
 * Generic ODBC Database Driver
 *
 * Provides a rudimentary implementation of an ODBC driver class.
 *
 * A complete and functional implementation will require further
 * extension because some necessary procedures cannot be accomplished
 * with only generic ODBC calls. And some ODBC features cannot be
 * accessed via PHP's standard ODBC extensions.
 *
 * So this class may serve only as a base for inheritance in other
 * ODBC-based drivers tailored for specific RDBMS backends.
 *
 * Also provided are some default SQL implementations where there is
 * a standard syntax per SQL-92.
 *
 * @package     Joomla.Platform
 * @subpackage  Database
 * @since       11.1
 */
abstract class JDatabaseODBC extends JDatabase
{
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
	protected $odbc_affected_rows = 0;

	/**
	 * Constructor.
	 *
	 * @param   array  $options  Array of database options with keys: host, user, password, database, select.
	 *
	 * @since   11.1
	 */
	protected function __construct($options)
	{
		// Ideally we would want to just pre-populate a list of DSNs to select
		// The usual defaults (e.g. localhost) don't really apply for ODBC
		$options['select'] = (isset($options['select'])) ? (bool) $options['select'] : true;

		// Make sure the ODBC extension for PHP is installed and enabled
		if (!function_exists('odbc_connect')) {
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_ADAPTER_ODBC'));
		}

		$dsn = $options['host']; // TODO: throw an exception if this is missing

		if (!($this->connection = @ odbc_connect($dsn, $options['user'], $options['password']))) {
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_CONNECT_ODBC'));
		}

		if ($options['select']) $this->select($options['database']);

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
	 * Determines if the connection to the server is active.
	 *
	 * @return  boolean  True if connected to the database engine.
	 *
	 * @since   11.1
	 */
	public function connected()
	{
		if (is_resource($this->connection))
		{
			$res = odbc_exec($this->connection, 'SELECT 1 AS foo');
			if (is_resource($res))
			{
				if (odbc_result($res, 'foo') == 1)
				{
					return true;
				}
			}
		}
		return false;
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
		// SQL-92: Just need the single quote to be escaped by doubling it
		$result = str_replace('\'', '\'\'', $text);

		// SQL-92: Escape some extra characters used in LIKE patterns
		if ($extra)
		{
			$result = addcslashes($result, '%_');
		}

		return $result;
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
		return false;
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
		if (!class_exists('JDatabaseExporterODBC'))
		{
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_MISSING_EXPORTER'));
		}

		$o = new JDatabaseExporterODBC;
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
		if (!class_exists('JDatabaseImporterODBC'))
		{
			throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_MISSING_IMPORTER'));
		}

		$o = new JDatabaseImporterODBC;
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
			if (!class_exists('JDatabaseQuerySQL92'))
			{
				throw new JDatabaseException(JText::_('JLIB_DATABASE_ERROR_MISSING_QUERY'));
			}
			return new JDatabaseQuerySQL92($this);
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
		return false;
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
		// TODO: Consider odbc_columns
		return false;
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
		// TODO: Consider odbc_primarykeys odbc_foreignkeys odbc_specialcolumns
		return false;
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
		// TODO: Consider odbc_tables
		return false;
	}

	/**
	 * Get the version of the database connector.
	 *
	 * @return  string  The database connector version.
	 *
	 * @since   11.1
	 *
	 * @todo    Some installer code still assumes MySQL versions
	 */
	public function getVersion()
	{
		return 6; // just fake it by default
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
		JLog::add('JDatabaseVirtuoso::hasUTF() is deprecated.', JLog::WARNING, 'deprecated');
		return false;
	}

	/**
	 * Method to get the auto-incremented value from the last INSERT statement.
	 *
	 * There is perhaps a potential to use SQL_LASTSERIAL implemented by some
	 * ODBC drivers, but since SQLGetStmtOption doesn't appear to be callable
	 * from PHP's ODBC implementation, this is just going to need RDBMS-specific
	 * overrides.
	 *
	 * @return  integer  The value of the auto-increment field from the last inserted row.
	 *
	 * @since   11.1
	 */
	public function insertid()
	{
		return 0;
	}

	/**
	 * Inserts a row into a table based on an object's properties.
	 *
	 * Base implementation wants to set zero in the PK to use auto-increment,
	 * but that is MySQL specific, all other RDBMS (AFAIK) want NULL instead.
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
	 * Locks a table in the database.
	 *
	 * We could consider opening a serializable transaction and selecting the entire
	 * table as a way to fake this, but it doesn't seem like a good idea. Better to
	 * leave this one (and the unlockTable counterpart) for RDBMS-specific overrides.
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
		return $this;
	}

	/**
	 * Execute the SQL statement.
	 *
	 * Some hacky modifications here to allow for producing multiple SQL statements
	 * from a single query object. This is because we don't want to assume support
	 * for "row value constructors" e.g. 'INSERT ... VALUES (foo), (bar)', so any
	 * Joomla queries using that form will get rewritten as multiple INSERTs
	 * instead (ref. JDatabaseQuerySQL92::__toString).
	 *
	 * Note that row value constructors are part of the SQL-92 standard but only
	 * at the "full" compliance level, much of which is not widely supported by
	 * older (yet still commonplace) and/or non-mainstream RDBMS.
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

		// NB: We allow multiple queries in this driver by setting a serialized array via ::setQuery
		// This is non-standard for joomla but needed to support multi-row INSERTs for Virtuoso
		$queries = $this->sql;

		// Serialized values look like a:x (array) or O:x (objects) which cannot be valid SQL
		if ($queries[1] == ':') $queries = unserialize($queries);

		if (!is_array($queries)) $queries = array($queries); // normalise

		foreach ($queries as $query)
		{
			// Take a local copy so that we don't modify the original query and cause issues later
			$sql = $this->replacePrefix((string) $query);

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
		}

		// In the case of multiple queries, we can only capture affected rows for the final one
		$this->odbc_affected_rows = odbc_num_rows($this->cursor);

		return is_resource($this->cursor);
	}

	/**
	 * This function replaces a string identifier <var>$prefix</var> with the string held is the
	 * <var>tablePrefix</var> class variable.
	 *
	 * Override because base implementation is not compliant with SQL-92
	 * standard. Double quotes are for identifiers, not string literals.
	 *
	 * If we don't fix this then for typical ODBC usage, prefixes in any
	 * quoted table names will be treated as strings and not replaced.
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

					// if the prefix is within a string literal, skip replacement
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
		return true;
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
	 * Method to commit a transaction.
	 *
	 * @return  void
	 *
	 * @since   11.1
	 * @throws  JDatabaseException
	 */
	public function transactionCommit()
	{
		$success = odbc_commit($this->connection);
		odbc_autocommit($this->connection, true);
		return $success;
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
		odbc_rollback($this->connection);
		odbc_autocommit($this->connection, true);
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
		odbc_autocommit($this->connection, false);
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
	 *
	 * @todo    Find a way to accomplish the non-stdClass case.
	 */
	protected function fetchObject($cursor = null, $class = 'stdClass')
	{
		// odbc_fetch_object will only give us a stdClass object
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

		$queries = $this->sql;

		// Serialized values look like a:x (array) or O:x (objects) which cannot be valid SQL
		if ($queries[1] == ':') $queries = unserialize($queries);

		if (!is_array($queries)) $queries = $this->splitSql($queries);

		// We support setting an array of queries anyway in this driver
		$this->setQuery($queries);

		// If the batch is meant to be transaction safe then we need to wrap it in a transaction.
		if ($transactionSafe) $this->transactionStart();
		try
		{
			$this->query();
		}
		catch (Exception $e)
		{
			if ($transactionSafe) $this->transactionRollback();
			throw $e;
		}
		return $transactionSafe ? $this->transactionCommit() : true;
	}

	/**
	 * Unlocks tables in the database.
	 *
	 * Will need RDBMS-specific overrides (see notes in lockTable).
	 *
	 * @return  JDatabaseVirtuoso  Returns this object to support chaining.
	 *
	 * @since   11.4
	 * @throws  JDatabaseException
	 */
	public function unlockTables()
	{
		return $this;
	}
}
