-- PRACTICE 5
-- Chapter 8: https://github.com/mpalomera/practical-sql-2/tree/master/Chapter_08

-- Constraints 
-- April 25, 2022

-- PRIMARY KEY
-- unique, not null

CREATE TABLE natural_key_example (
    license_id text CONSTRAINT license_key PRIMARY KEY,
    first_name text,
    last_name text
);

-- Another way of do it: CONSTRAINT license_key PRIMARY KEY (license_id

-- GENERATED ALWAYS: automatically increments

CREATE TABLE surrogate_key_example (
    order_number bigint GENERATED ALWAYS AS IDENTITY,
    product_name text,
    order_time timestamp with time zone,
    CONSTRAINT order_number_key PRIMARY KEY (order_number)
);


-- FOREIGN KEY
-- exists in the original table

CREATE TABLE licenses (
    license_id text,
    first_name text,
    last_name text,
    CONSTRAINT licenses_key PRIMARY KEY (license_id)
);

CREATE TABLE registrations (
    registration_id text,
    registration_date timestamp with time zone,
    license_id text REFERENCES licenses (license_id),
    CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
);



-- Check a contrainst to add a condition

CREATE TABLE check_constraint_example (
    user_id bigint GENERATED ALWAYS AS IDENTITY,
    user_role text,
    salary numeric(10,2),
    CONSTRAINT user_id_key PRIMARY KEY (user_id),
    CONSTRAINT check_role_in_list CHECK (user_role IN('Admin', 'Staff')),
    CONSTRAINT check_salary_not_below_zero CHECK (salary >= 0)
);


-- UNIQUE 
-- value in the column must be unique

CREATE TABLE unique_constraint_example (
    contact_id bigint GENERATED ALWAYS AS IDENTITY,
    first_name text,
    last_name text,
    email text,
    CONSTRAINT contact_id_key PRIMARY KEY (contact_id),
    CONSTRAINT email_unique UNIQUE (email)
);


-- NOT NULL
-- value in the column must not be empty

CREATE TABLE not_null_example (
    student_id bigint GENERATED ALWAYS AS IDENTITY,
    first_name text NOT NULL,
    last_name text NOT NULL,
    CONSTRAINT student_id_key PRIMARY KEY (student_id)
);
