CREATE TABLE departments (
    dept_id integer,
    dept text,
    city text,
    CONSTRAINT dept_key PRIMARY KEY (dept_id),
    CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

CREATE TABLE employees (
    emp_id integer,
    first_name text,
    last_name text,
    salary numeric(10, 2),
    dept_id integer REFERENCES departments (dept_id),
    CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

INSERT INTO
    departments
VALUES (1, 'Tax', 'Atlanta'),
    (2, 'IT', 'Boston');

INSERT INTO
    employees
VALUES (
        1,
        'Julia',
        'Reyes',
        115300,
        1
    ),
    (2, 'Janet', 'King', 98000, 1),
    (
        3,
        'Arthur',
        'Pappas',
        72700,
        2
    ),
    (
        4,
        'Michael',
        'Taylor',
        89500,
        2
    );