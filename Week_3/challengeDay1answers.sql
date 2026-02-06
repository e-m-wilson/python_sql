
-- challenge day 1 answers

/*
SELECT * 
FROM customer
WHERE state = 'AZ';


SELECT *
FROM invoice
WHERE invoice_date >= NOW() - INTERVAL '6 months';


UPDATE customer
SET phone = NULL
WHERE phone !~ '^\+\d \(\d{3}\) \d{3}-\d{4}$';


UPDATE customer
SET phone = REGEXP_REPLACE(phone, '^\+\d ', '')
WHERE phone ~ '^\+\d \(\d{3}\) \d{3}-\d{4}$';


ALTER TABLE customer
ADD CONSTRAINT phone_us
CHECK (phone ~ '^\(\d{3}\) \d{3}-\d{4}$');



SELECT * FROM track
WHERE milliseconds > 180000;



UPDATE customer
SET country='USA', address=NULL, city=NULL, state=NULL
WHERE country != 'USA';


*/

