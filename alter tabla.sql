-- Add the new column
ALTER TABLE autor
ADD pueblo VARCHAR2(10);

-- Rename the existing column
ALTER TABLE autor
RENAME COLUMN nombre TO nombreAutor;
