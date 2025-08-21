
Use SANDBOXES.WILLIBALD_DEV;

SELECT 'DROP TABLE "' || table_schema || '"."' || table_name || '";' AS drop_statement
FROM information_schema.tables
WHERE table_schema = 'WILLIBALD_DEV'
  AND table_catalog = 'SANDBOXES' AND Table_name LIKE 'HUB_%';

  SELECT 'DROP VIEW "' || table_schema || '"."' || table_name || '";' AS drop_statement
FROM information_schema.views
WHERE table_schema = 'WILLIBALD_DEV'
  AND table_catalog = 'SANDBOXES'';


