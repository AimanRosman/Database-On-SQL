CREATE DATABASE kedai;

CREATE TABLE employee(
  emp_id INT AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(255),
  contact VARCHAR(255),
  notice_period BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (emp_id)
);

SELECT * FROM kedai.employee;

INSERT INTO kedai.employee (first_name,last_name,date_of_birth)
VALUES 
('man','rose','2003-06-24'),
('mr','dumdum','2003-06-23'),
('Abdul','Wahub','2001-11-27');

INSERT INTO kedai.employee (first_name,last_name,date_of_birth,email,contact,notice_period)
VALUES 
('Ahmad','Nisfu','1987-07-13',DEFAULT,DEFAULT,TRUE),
('Sulaiman','Akhlaken','1997-10-10','sulaiman@kedai.com',DEFAULT,DEFAULT),
('Jamal','Pak Tongko','1995-01-01',DEFAULT,DEFAULT,DEFAULT);