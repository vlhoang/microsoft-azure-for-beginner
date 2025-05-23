create database company;
use company;

CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    salary INT(10) NOT NULL
);


INSERT INTO `company`.`employees`
(
`name`,
`address`,
`salary`)
VALUES
('Linh','Quan 12, TPHCM','5000000'),
('Chien','Quan 1, TPHCM','1000000'),
('Thong','Quan 9, TPHCM','20000000'),
('Hai Huy','Quan 13, TPHCM','5000000');

select * from  employees;

update employees set salary = 30000000 where id = 3;

delete from employees where id = 2;