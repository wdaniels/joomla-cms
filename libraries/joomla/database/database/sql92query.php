<?php
/**
 * @package     Joomla.Platform
 * @subpackage  Database
 *
 * @copyright   Copyright (C) 2012 Will Daniels <mail@willdaniels.co.uk>.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('JPATH_PLATFORM') or die;

/**
 * Query Building Class for typical SQL-92 compliant dialects.
 *
 * Not everything defined here is part of the SQL standard, and some
 * things depend upon the level of compliance. For the most part we
 * assume Intermediate Level compliance, except where implementations
 * are known to be uncommon.
 *
 * Noteworthy:
 *
 *  - Wide character data types (e.g. NVARCHAR) support is assumed.
 *  - Support for CASE expressions (Intermediate Level) is assumed.
 *  - Support for the CAST function (Transactional Level) is assumed.
 *  - Support for "row value constructors" (Full Level) is _not_ assumed.
 *
 * @package     Joomla.Platform
 * @subpackage  Database
 * @since       11.1
 */
class JDatabaseQuerySQL92 extends JDatabaseQuery
{
	/**
	 * The character(s) used to quote SQL statement names such as table names or field names,
	 * etc.  The child classes should define this as necessary.  If a single character string the
	 * same character is used for both sides of the quoted name, else the first character will be
	 * used for the opening quote and the second for the closing quote.
	 *
	 * @var    string
	 *
	 * @since  11.1
	 */
	protected $name_quotes = '"';

	/**
	 * The null or zero representation of a timestamp for the database driver.  This should be
	 * defined in child classes to hold the appropriate value for the engine.
	 *
	 * @var    string
	 *
	 * @since  11.1
	 */
	protected $null_date = '0001-01-01 00:00:00';

	/**
	 * Magic function to convert the query to a string.
	 *
	 * @return  string	The completed query.
	 *
	 * @since   11.1
	 */
	public function __toString()
	{
		$query = '';

		switch ($this->type)
		{
			case 'insert':
				$q = (string) $this->insert;

				// Set method
				if ($this->set)
				{
					throw new JDatabaseException('Invalid SQL form INSERT ... SET ...');
				}
				// Columns-Values method
				elseif ($this->values)
				{
					if ($this->columns)
					{
						$q .= (string) $this->columns;
					}

					$tuples = $this->values->getElements();
					if (count($tuples) > 1)
					{
						$query = array();
						foreach ($tuples as $tuple)
						{
							$query[] = $q . ' VALUES (' . $tuple . ')';
						}
						$query = serialize($query);
					}
					else {
						$query .= $q . ' VALUES (' . $tuples[0] . ')';
					}
				}

				break;

			default:
				$query = parent::__toString();
				break;
		}
		return $query;
	}

	/**
	 * Add a single condition string, or an array of strings to the SET clause of the query.
	 *
	 * Usage:
	 * $query->set('a = 1')->set('b = 2');
	 * $query->set(array('a = 1', 'b = 2');
	 *
	 * @param   mixed   $conditions  A string or array of string conditions.
	 * @param   string  $glue        The glue by which to join the condition strings. Defaults to ,.
	 *                               Note that the glue is set on first use and cannot be changed.
	 *
	 * @return  JDatabaseQuery  Returns this object to allow chaining.
	 *
	 * @since   11.1
	 */
	public function set($conditions, $glue = ',')
	{
		if (!is_null($this->insert))
		{
			/**
			* The non-standard SQL form INSERT ... SET foo = bar is unsupported.
			*
			* We're going to massage this into the standard SQL form:
			*
			*   INSERT ... (column, list) VALUES (foo, bar)
			*
			* assuming that usage will never be like ->set('foo=bar, x=y') rather
			* than multiple calls or passed as an array, as shown in the usage
			* notes above.
			*
			* That may be an unsafe assumption. Time will tell.
			*/

			if (!is_array($conditions))
			{
				$conditions = array($conditions); // normalise inputs
			}

			foreach($conditions as $condition)
			{
				$parts = explode('=', $condition);
				$column = array_shift($parts);
				$this->columns($column);

				$value = implode('', $parts);
				if (!is_null($this->values))
				{
					$elements = $this->values->getElements();
					if (($i = count($elements)) > 1)
					{
						$msg = 'Multiple value tuples for INSERT query unexpected.';
						throw new JDatabaseException($msg);
					}
					$value = $elements[0] . ', ' . $value;
					$this->values = null; // _elements is protected so force recreate
				}
				$this->values($value);
			}
			return $this;
		}
		return parent::set($conditions, $glue);
	}

	/**
	 * Casts a value to a char.
	 *
	 * Ensure that the value is properly quoted before passing to the method.
	 *
	 * @param   string  $value  The value to cast as a char.
	 *
	 * @return  string  Returns the cast value.
	 *
	 * @since   11.1
	 */
	public function castAsChar($value)
	{
		return 'CAST(' . $value . ' AS NVARCHAR)';
	}

	/**
	 * Gets the function to determine the length of a character string.
	 *
	 * @param   string  $field  A value.
	 *
	 * @return  string  The required char length call.
	 *
	 * @since 11.1
	 */
	public function charLength($field)
	{
		return 'CHAR_LENGTH(' . $field . ')';
	}

	/**
	 * Concatenates an array of column names or values.
	 *
	 * @param   array   $values     An array of values to concatenate.
	 * @param   string  $separator  As separator to place between each value.
	 *
	 * @return  string  The concatenated values.
	 *
	 * @since   11.1
	 */
	public function concatenate($values, $separator = null)
	{
		if ($separator)
		{
			return implode(' || ' . $this->quote($separator) . ' || ', $values);
		}
		else
		{
			return implode(' || ', $values);
		}
	}

	/**
	 * Gets the current date and time.
	 *
	 * @return  string
	 *
	 * @since   11.1
	 */
	public function currentTimestamp()
	{
		return 'CURRENT_TIMESTAMP';
	}

	/**
	 * Get the length of a string in bytes.
	 *
	 * @param   string  $value  The string to measure.
	 *
	 * @return  integer
	 *
	 * @since   11.1
	 */
	public function length($value)
	{
		// Assume we're never going to see an odd octet length
		return '(OCTET_LENGTH(' . $value . ') / 2)';
	}
}
