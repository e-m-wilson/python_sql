-- you will likely never need this
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- This is a single line comment
/*
    This is a multiline comment!

    Create schema creates a schema :)
    These act as 'folders' within our DB, 
    used to organize tables or set levels 
    of access on a per schema basis. 

    SET search path is the ordered list of 
    schemas psql searches when you refer to
    an object without qualifying it.GROUP BY

    i.e. SELECT * FROM users; <- which user? from what schema?
    SELECT * FROM my_schema.users; <- or be explicit 
*/

-- CREATE SCHEMA my_schema;
SET search_path TO my_schema, public;


-- Make custom datatypes:
-- CREATE TYPE mood AS ENUM('sad', 'ok', 'happy');

/* 
CREATE DOMAIN email_address AS TEXT
CHECK (
    VALUE ~* 'regex expression here to format email'
)

~ -- regex case sensitive
~* -- regex case insensitive
!~ -- regex does not match case sensitive
!~* -- regex does not match case insensitive

CREATE TYPE address AS (
    street TEXT,
    city TEXT,
    state char(2),
    zip TEXT
)
*/

CREATE TABLE IF NOT EXISTS users (
    user_id UUID PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    age INT CHECK (age >= 18),
    created_at TIMESTAMP DEFAULT NOW(), -- set default values
    banned BOOLEAN,
    last_login TIMESTAMP,
    is_active BOOLEAN
);

/*
ALTER TABLE users
ADD COLUMN is_active BOOLEAN DEFAULT true;

ALTER TABLE users 
ALTER COLUMN email SET NOT NULL;

ALTER TABLE users
DROP CONSTRAINT users_age_check,
ADD CONSTRAINT users_age_check CHECK (age >= 21);

-- note that this is short form
-- need FOREIGN KEY clause if adding "ON" operations
CREATE TABLE IF NOT EXISTS orders (
    order_id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(user_id)
);

/*
CREATE TABLE orders (
    order_id UUID PRIMARY KEY,
    user_id UUID,
    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

   -- this is rare
   -- usually only comes up if we allow updates to PKs
CREATE TABLE orders (
    order_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON UPDATE CASCADE
);
*/


INSERT INTO users (user_id, email, created_at)
VALUES (gen_random_uuid(), 'test@example.com', NOW());

INSERT INTO users (user_id, email)
VALUES
    (gen_random_uuid(), 'a@example.com'),
    (gen_random_uuid(), 'b@example.com');

UPDATE users 
SET email = 'new@example.com'
WHERE user_id = 'something';

UPDATE users 
SET 
    email = 'new@example.com',
    age = 24,
    last_login = NOW()
WHERE user_id = 'something';

UPDATE users
SET 
    is_active = CASE 
        WHEN banned = false THEN true
        ELSE true 
    END, 
    last_login = NOW()
WHERE user_id = 'something';

/*
UPDATE products 
SET price = price * 1.10
WHERE category = 'electronics';
*/

DELETE FROM users 
WHERE last_login < NOW() - INTERVAL '2 years';
/*
    INTERVAL supports: 
    year, month, day, hour, minute, second
    milliseconds, microseconds

    you can do arithmetic against it, or generate from functions: 
    INTERVAL '1 hour 10 minutes' / 2
    INTERVAL '3 days 22 hours 1 minute' * 3
*/

-- postgres special sauce (INSERT RETURNING):  
INSERT INTO users (email)
VALUES ('new@example.com')
RETURNING user_id, created_at;

-- more special sauce (UPDATE RETURNING)
UPDATE users 
SET active = false 
WHERE last_login < NOW() - INTERVAL '1 year'
RETURNING user_id, email;

-- special sauce (DELETE RETURNING)
DELETE FROM users 
WHERE banned = true
RETURNING user_id;

-- upsert "try and insert this record, if a record exists with the same email, update the name field to the new value"
-- EXCLUDED = record that had the conflict 
INSERT INTO users (email, name)
VALUES ('c@example.com', 'Alice')
ON CONFLICT (email)
DO UPDATE SET name = EXCLUDED.name;

-- OR return something after still:
INSERT INTO users (email, name)
VALUES ('d@example.com', 'Alice')
ON CONFLICT (email)
DO UPDATE SET name = EXCLUDED.name 
RETURNING *;


SELECT * FROM users
WHERE email = 'something@something.com';

SELECT * FROM users
WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31';

SELECT * FROM users 
WHERE role IN ('admin', 'editor');

-- case sensitive 
-- % = zero or more characters
-- _ = exactly one character
SELECT * FROM users 
WHERE email LIKE '%@gmail.com';

-- case insensitive (postgres feature)
SELECT * FROM users 
WHERE email ILIKE '%gmail.com';

-- regex matching case sensitive (postgres specific)
SELECT * FROM users 
WHERE email ~ 'regex expression here'

-- regex matching case insenstive (postgres specific)
SELECT * FROM users 
WHERE email ~* 'regex expression here'

SELECT * FROM users
ORDER BY created_at;

SELECT * FROM users
ORDER BY created_at DESC;

SELECT * FROM users 
ORDER BY last_login ASC, created_at DESC NULLS LAST;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS orders;
-- drops tables and any dependent tables
-- DROP TABLE users CASCADE;

/*
    For money NEVER use float datatypes
    SELECT 0.1 + 0.2 = 0.3; -- false
    floats are approximations 
    
    use either 
    NUMERIC(10,2)

    OR

    INT -- in cents


    BOOLEAN types
    true, false
    t, f
    yes, no
    1, 0

    -- returns 0 rows even if deleted_at is NULL
    SELECT *
    FROM users
    WHERE deleted_at = NULL; 

    instead:
    SELECT *
    FROM users
    WHERE deleted_at IS NULL; -- or IS NOT NULL

    <> same as != -- the former is the official way


    WHERE is_active -- you can just leave it at that if its a boolean


    STRINGS
    default to TEXT > VARCHAR(n) -- varchar is still fine tho if you must set a max length that way

    time/dates
    default to TIMESTAMP WITH TIMEZONE
    NOW() -- constant for whole transaction
    clock_timestamp() -- actual current time

    SELECT COUNT(*) FROM users; -- counts all including nulls
    SELECT COUNT(column) FROM users; -- counts non-null values in that column

    SELECT SUM(amount) from orders;
    SELECT AVG(age) FROM users; -- always returns decimal
    SELECT MIN(created_at), MAX(created_at) FROM users;

    -- every selected column must be in either an aggregate function or the group by clause
    SELECT country, COUNT(*)
    FROM customer
    GROUP BY country;

    SELECT 
    billing_country,
    COUNT(*) AS customer_count,
    AVG(total) AS avg_total,
    MIN(invoice_date) AS first_order
    FROM invoice
    GROUP BY billing_country;

    SELECT 
    billing_country,
    COUNT(*) AS customer_count,
    AVG(total) AS avg_total,
    MIN(invoice_date) AS first_order
    FROM invoice
    GROUP BY billing_country
    HAVING COUNT(*) > 10;

    SELECT 
    billing_country,
    COUNT(*) AS customer_count,
    AVG(total) AS avg_total,
    MIN(invoice_date) AS first_order
    FROM invoice
    WHERE invoice_date >= NOW() - INTERVAL '1 year'
    GROUP BY billing_country
    HAVING COUNT(*) > 10;

*/