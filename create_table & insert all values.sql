set echo on;

CREATE TABLE company (
    company_name  VARCHAR(20),
    city    VARCHAR(20),
    PRIMARY KEY(company_name)
    )

CREATE TABLE employee (
    LastName  VARCHAR(20),
    FirstName  VARCHAR(20),
    MidInitial  VARCHAR(20),
    gender  VARCHAR(20),
    street  VARCHAR(20),
    city    VARCHAR(20),
    PRIMARY KEY(LastName, FirstName, MidInitial)
    )
    
CREATE TABLE works (
    LastName  VARCHAR(20),
    FirstName  VARCHAR(20),
    MidInitial  VARCHAR(20),
    company_name  VARCHAR(20),
    salary   numeric(8,2),
    PRIMARY KEY(LastName, FirstName, MidInitial, company_name),
    FOREIGN KEY (LastName, FirstName, MidInitial) REFERENCES employee(LastName, FirstName, MidInitial),
    FOREIGN KEY (company_name) REFERENCES company(company_name)
    )

CREATE TABLE manages (
    LastName  VARCHAR(20),
    FirstName  VARCHAR(20),
    MidInitial  VARCHAR(20),
    ManagerLastName  VARCHAR(20),
    MFirstName  VARCHAR(20),
    MMidInitial  VARCHAR(20),
    start_date  VARCHAR(30),
	PRIMARY KEY(LastName, FirstName, MidInitial),
    FOREIGN KEY (LastName, FirstName, MidInitial) REFERENCES employee(LastName, FirstName, MidInitial),
    FOREIGN KEY (ManagerLastNameLastName, MFirstName, MMidInitial) REFERENCES employee(LastName, FirstName, MidInitial)
    )

INSERT INTO company VALUES ('First Bank', 'Omaha');
INSERT INTO company VALUES ('FDR', 'Omaha');
INSERT INTO company VALUES ('Lincoln Star', 'Lincoln');
INSERT INTO company VALUES ('Mutual of Omaha', 'Omaha');
INSERT INTO company VALUES ('Union Pacific', 'Omaha');

INSERT INTO employee   (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Anderson', 'Susan', 'L', 'F', '108th', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES('Brady','Dan', 'L', 'M', 'P street', 'Lincoln');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES('Chen', 'Peter', 'K', 'M', '124th', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES('Clemson', 'Ann', 'M', 'F', 'O', 'Lincoln');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Dale', 'Mary', 'K', 'F', '132th', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Gill', 'Mary', 'L', 'F', 'P street', 'Lincoln');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Harrison', 'Susan', 'M', 'F', 'Old Mill', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Jackson', 'Kim', 'A', 'F', '178th','Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Jason', 'Pat', 'M', 'M', '8th', 'C.Bluffs');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Kumar', 'Paul', 'T', 'M', 'Dodge', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Orr', 'Susanne', 'S', 'F', 'Q', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Peterson', 'Mike', 'E', 'M', 'Blondo', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Powell', 'Tom', 'E', 'M', 'Broadway', 'C.Bluffs');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Quinn', 'Jacky', 'M', 'F', '168st', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Rand', 'Pam', 'R', 'F', '13st', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Schreck', 'Ann', 'P', 'F', '214st', 'Elkhorn');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Simon', 'Eric', 'K', 'M', '77th', 'Lincoln');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Smith', 'John', 'A', 'M', '8th', 'C.Bluffs');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Thomson', 'Ron', 'F', 'M', 'Farnam', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Young', 'Don', 'R', 'F', 'Dodge', 'Omaha');
INSERT INTO employee (lastname, firstname, midinitial, gender, street, city) 
VALUES ('Wong', 'Carole', 'S', 'F', 'Broadway', 'C.Bluffs');


INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Anderson', 'Susan', 'L', 'Mutual of Omaha', 48000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Brady','Dan', 'L', 'FDR', 42000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Chen', 'Peter', 'K', 'FDR', 53000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Clemson', 'Ann', 'M', 'First Bank', 39000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Dale', 'Mary', 'K', 'Mutual of Omaha', 58000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Gill', 'Mary', 'L', 'Union Pacific', 48700);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Harrison', 'Susan', 'M', 'Union Pacific', 54320);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Jackson', 'Kim', 'A', 'FDR', 68000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Jason', 'Pat', 'M', 'FDR', 83000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Kumar', 'Paul', 'T', 'FDR', 44000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Orr', 'Susanne','S', 'Lincoln Star', 32000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Peterson', 'Mike', 'E', 'First Bank', 37000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Powell', 'Tom', 'E', 'First Bank', 54000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Quinn', 'Jacky', 'M', 'First Bank', 85000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Rand', 'Pam', 'R', 'FDR', 37000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Schreck', 'Ann', 'P', 'First Bank', 36000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Simon', 'Eric', 'K', 'Mutual of Omaha', 45000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Smith', 'John', 'A', 'FDR', 55000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Thomson', 'Ron', 'F', 'First Bank', 39000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Young', 'Don', 'R', 'Mutual of Omaha', 27000);
INSERT INTO works (lastname, firstname, midinitial, company_name, salary) 
VALUES ('Wong', 'Carole', 'S', 'First Bank', 44000);


INSERT INTO manages   (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Anderson', 'Susan', 'L', 'Dale', 'Mary', 'K', '15-SEP-2002');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Brady', 'Dan', 'L', 'Jason', 'Pat', 'M', '05-MAR-2004');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Chen', 'Peter', 'K', 'Jason', 'Pat', 'M', '12-JUNE-2003');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Clemson', 'Ann', 'M', 'Powell', 'Tom', 'E', '30-AUG-2001');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Gill', 'Mary', 'L', 'Harrison', 'Susan', 'M', '25-JAN-2003');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Jackson', 'Kim', 'A', 'Jason', 'Pat', 'M', '09-MAY-2008');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Kumar', 'Paul', 'T', 'Jason', 'Pat', 'M', '09-MAY-2001');
INSERT INTO manages   (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Rand', 'Pam', 'R', 'Smith', 'John', 'A', '15-JAN-2004');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Peterson', 'Mike', 'E', 'Powell', 'Tom', 'E', '30-AUG-2006');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Schreck', 'Ann', 'P', 'Quinn', 'Jacky', 'M', '28-FEB-1996');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Simon', 'Eric', 'K', 'Anderson', 'Susan', 'L', '22-FEB-2004');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Smith', 'John', 'A', 'Jason', 'Pat', 'M', '05-MAR-2003');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Thomson', 'Ron', 'F', 'Powell', 'Tom', 'M', '30-AUG-1998');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Wong', 'Carole', 'S', 'Quinn', 'Jacky', 'M', '28-FEB-2001');
INSERT INTO manages    (lastname, firstname, midinitial, ManagerLastName, MFirstName, MMidInitial, start_date) 
VALUES ('Young', 'Don', 'R', 'Dale', 'Mary', 'K', '15-SEP-2007');
