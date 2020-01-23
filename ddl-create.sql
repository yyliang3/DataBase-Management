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
    FOREIGN KEY (LastName, FirstName, MidInitial) REFERENCES employee(LastName, FirstName, MidInitial)
    )