<?php
/**
 * @package     Joomla.Platform
 * @subpackage  Database
 *
 * @copyright   Copyright (C) 2012 Will Daniels <mail@willdaniels.co.uk>.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('JPATH_PLATFORM') or die;

JLoader::register('JDatabaseODBC', dirname(__FILE__) . '/odbc.php');

define('SQL_NO_CHAR_C_ESCAPE', 5002);

/**
 * Virtuoso ODBC database driver
 *
 * @package     Joomla.Platform
 * @subpackage  Database
 * @see         http://virtuoso.openlinksw.com/
 * @see         http://docs.openlinksw.com/virtuoso/sqlreference.html
 * @since       11.1
 */
class JDatabaseVirtuoso extends JDatabaseODBC
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
	 * Constructor.
	 *
	 * @param   array  $options  Array of database options with keys: host, user, password, database, select.
	 *
	 * @since   11.1
	 */
	protected function __construct($options)
	{
		// If Virtuoso is also our webserver, get defaults from the internal DSN
		if (function_exists('__virt_internal_dsn'))
		{
			$map = array('DSN' => 'host', 'UID' => 'user', 'PWD' => 'password');
			$dsn = explode(';', __virt_internal_dsn());
			foreach ($dsn as $param)
			{
				$x = explode('=', $param);
				if (!isset($options[$map[$x[0]]]))
				{
					$options[$map[$x[0]]] = $x[1];
				}
			}
		}

		$options['host'] = isset($options['host']) ? $options['host'] : 'Local Virtuoso';
		$options['user'] = isset($options['user']) ? $options['user'] : 'dba';
		$options['password'] = isset($options['password']) ? $options['password'] : '';
		$options['database'] = isset($options['database']) ? $options['database'] : '';
		$options['select'] = isset($options['select']) ? (bool) $options['select'] : true;

		// Temporary kludge to avoid buggy memory allocation issue in PHP
		ini_set('odbc.defaultlrl', '1000000');

		// Call the ODBC parent class to make the connection
		parent::__construct($options);

		// Set the connection options to how we want them
		if (is_resource($this->connection))
		{
//			odbc_setoption($this->connection, 1, SQL_NO_CHAR_C_ESCAPE, 1);

			// Don't use setoption because Virtuoso ODBC driver has a bug that reverses
			// the meaning of the parameter so that 0 means ON and 1 means OFF
			odbc_exec($this->connection, 'SET NO_CHAR_C_ESCAPE OFF');
		}
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

		// Add extra escapes used in LIKE patterns
		if ($extra)
		{
			$result = addcslashes($result, '%_');
		}

		return $result;
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
		$sql = 'SELECT cfg_item_value(virtuoso_ini_path(), \'Parameters\', \'Collation\')';
		$this->setQuery($sql);
		$cfg = $this->loadColumn(); // column value will be null if not set

		return $cfg[0] ? $cfg[0] : false; 
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
		if (is_resource($cur)) return odbc_result($cur, 'sys_stat');
		return  6;
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
		$cur = odbc_exec($this->connection, "SELECT identity_value()");
		if (is_resource($cur)) return odbc_result($cur, 'identity_value');
		return 0;
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
	 * Sets the SQL statement string for later execution.
	 *
	 *
	 * @param   mixed    $query   The SQL statement to set either as a JDatabaseQuery object or a string.
	 * @param   integer  $offset  The affected row offset to set.
	 * @param   integer  $limit   The maximum affected rows to set.
	 *
	 * @return  JDatabase  This object to support method chaining.
	 *
	 * @since   11.1
	 *
	 * @todo    Fix issues in Platform/CMS to get rid of all the nasty regex
	 */
	public function setQuery($query, $offset = 0, $limit = 0)
	{
		$q = $query; $dbstmt = null;

		if ($limit > 0 || $offset > 0) {
			$top = "SELECT TOP $offset,$limit";
			$q = preg_replace('/^\s*SELECT/i', $top, $q);
		}
		else {
			// FIXME: Database operations need to be abstracted in the driver!
			if (preg_match('/(CREATE|ALTER) DATABASE (".*")/i', $q, $dbstmt)) {
				if ($dbstmt[1] == 'CREATE') $q = 'USE '.$dbstmt[2];
				else $q = "SELECT 'Suppressed query: ".$this->escape($q)."'";
			}
		}

		// FIXME: Add a quoteDateTime to the Platform and change everything to use it
		if (!preg_match('/(CREATE|ALTER) TABLE (".*")/i', $q)) {
			$q = preg_replace('/(?<!{ts)([^\\\\\\(])(\'\\d\\d\\d\\d-\\d\\d-\\d\\d \\d\\d:\\d\\d:\\d\\d\')/', '${1}{ts ${2}}', $q);
		}

		// Strip any GROUP BY clauses that include known long data types
		$q = preg_replace('/GROUP BY [^A-Z]*(params|introtext)[^A-Z]*/', '', $q);

		return parent::setQuery($q);
	}
}
