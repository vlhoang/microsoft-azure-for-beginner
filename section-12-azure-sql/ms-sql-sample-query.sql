CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    salary INT NOT NULL
);

INSERT INTO employees
(
name,
address,
salary)
VALUES
('Linh','Quan 12, TPHCM','5000000'),
('Chien','Quan 1, TPHCM','1000000'),
('Thong','Quan 9, TPHCM','20000000'),
('Hai Huy','Quan 13, TPHCM','5000000');

SELECT * FROM employees;

UPDATE employees SET salary = 30000000 WHERE id = 3;

DELETE FROM employees WHERE id = 2;