Puzzle 1: Finding Distinct Values (based on two columns)

You want to get distinct pairs where (a, b) and (b, a) are considered the same. Result example:

col1	col2
a	b
c	d
m	n
Method 1: Using CASE or IIF to reorder pairs consistently, then DISTINCT
SELECT DISTINCT
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

Method 2: Using UNION of two selects and DISTINCT on one normalized pair
SELECT DISTINCT col1, col2 FROM InputTbl
WHERE col1 <= col2

UNION

SELECT DISTINCT col2 AS col1, col1 AS col2 FROM InputTbl
WHERE col1 > col2;

Puzzle 2: Remove Rows Where All Columns Are Zero

Show rows where not all columns are zero.

SELECT *
FROM TestMultipleZero
WHERE NOT (ISNULL(A, 0) = 0 AND ISNULL(B, 0) = 0 AND ISNULL(C, 0) = 0 AND ISNULL(D, 0) = 0);

Puzzle 3: Find those with odd IDs
SELECT *
FROM section1
WHERE id % 2 = 1;

Puzzle 4: Person with the smallest ID
SELECT TOP 1 *
FROM section1
ORDER BY id ASC;

Puzzle 5: Person with the highest ID
SELECT TOP 1 *
FROM section1
ORDER BY id DESC;

Puzzle 6: People whose name starts with 'b' (case-insensitive)
SELECT *
FROM section1
WHERE LOWER(name) LIKE 'b%';

Puzzle 7: Rows where Code contains literal underscore _

Since _ is a wildcard in LIKE, escape it using ESCAPE clause or square brackets:

-- Method 1: Using ESCAPE
SELECT *
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';

-- Method 2: Using brackets to treat underscore literally
SELECT *
FROM ProductCodes
WHERE Code LIKE '%[_]%';
