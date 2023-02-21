-- List indexes
SELECT
    tablename,
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    schemaname = 'public'
ORDER BY
    tablename,
    indexname;

-- List all FK's
SELECT
    conrelid::regclass AS table_name,
    conname AS foreign_key,
    pg_get_constraintdef(oid)
FROM
    pg_constraint
WHERE
    contype = 'f'
    AND connamespace = 'public'::regnamespace
ORDER BY
    conrelid::regclass::text,
    contype DESC;