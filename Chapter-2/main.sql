-- Active: 1777627290817@@127.0.0.1@5432@analysis
CREATE TABLE teachers (
    id BIGSERIAL,
    first_name VARCHAR(25),
    last_name VARCHAR(30),
    school VARCHAR(30),
    hire_Date DATE,
    salary NUMERIC
);

INSERT INTO
    teachers (
        first_name,
        last_name,
        school,
        hire_date,
        salary
    )
VALUES (
        'Janet',
        'Smith',
        'F.D. Roosevelt HS',
        '2011-10-30',
        36200
    ),
    (
        'Lee',
        'Reynolds',
        'F.D. Roosevelt HS',
        '1993-05-22',
        65000
    ),
    (
        'Samuel',
        'Cole',
        'Myers Middle School',
        '2005-08-01',
        43500
    ),
    (
        'Samantha',
        'Bush',
        'Myers Middle School',
        '2011-10-30',
        36200
    ),
    (
        'Betty',
        'Diaz',
        'Myers Middle School',
        '2005-08-30',
        43500
    ),
    (
        'Kathleen',
        'Roush',
        'F.D. Roosevelt HS',
        '2010-10-22',
        38500
    );


COPY teachers TO 'F:\Postgres\Chapter-2\table.csv' WITH (FORMAT CSV, HEADER, DELIMITER ',');