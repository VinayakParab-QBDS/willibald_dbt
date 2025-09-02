import re
from pathlib import Path

def sqlserver_to_snowflake(sql: str) -> str:
    # Replace square brackets with double quotes
    sql = re.sub(r'\[([^\]]+)\]', r'"\1"', sql)

    # Uppercase everything inside quotes (columns + tables first)
    sql = re.sub(r'"([^"]+)"', lambda m: f'"{m.group(1).upper()}"', sql)

    # Prepend WEBSHOP_ only to table names in CREATE/INSERT/ALTER/DROP
    def prefix_tablename(match):
        keyword = match.group(1)
        name = match.group(2).upper()
        return f'{keyword} "WEBSHOP_{name}"'

    sql = re.sub(r'\b(CREATE TABLE|INSERT INTO|ALTER TABLE|DROP TABLE)\s+"([^"]+)"',
                 prefix_tablename, sql, flags=re.IGNORECASE)

    # Replace common datatypes
    sql = re.sub(r'\bNVARCHAR\b', "VARCHAR", sql, flags=re.IGNORECASE)
    sql = re.sub(r'\bDATETIME\b', "TIMESTAMP_NTZ", sql, flags=re.IGNORECASE)
    sql = re.sub(r'\bMONEY\b', "NUMBER(10,2)", sql, flags=re.IGNORECASE)

    # Identity → Autoincrement
    sql = re.sub(r'IDENTITY\s*\(\d+,\s*\d+\)', 'AUTOINCREMENT', sql, flags=re.IGNORECASE)

    # GETDATE() → CURRENT_TIMESTAMP()
    sql = re.sub(r'GETDATE\s*\(\)', 'CURRENT_TIMESTAMP()', sql, flags=re.IGNORECASE)

    # Remove "GO" batch separators
    sql = re.sub(r'(?i)\bGO\b', '', sql)

    return sql.strip()


def convert_file(input_path: str, output_path: str):
    input_file = Path(input_path)
    output_file = Path(output_path)

    with input_file.open("r", encoding="utf-8") as f:
        sql_content = f.read()

    converted_sql = sqlserver_to_snowflake(sql_content)

    with output_file.open("w", encoding="utf-8") as f:
        # Add the USE statement at the beginning
        f.write("USE SANDBOXES.WILLIBALD_DEV;\n\n")
        f.write(converted_sql)

    print(f"✅ Converted file saved to {output_file}")


# Example usage
convert_file("input.sql", "output_snowflake.sql")
