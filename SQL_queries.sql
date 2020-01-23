--Q1:
SELECT distinct W1.company_name
FROM employee E1, employee E2, works W1, works W2
WHERE W1.company_name= W2.company_name  
 and E1.Lastname = W1.LastName 
 and E1.FirstName = W1.FirstName 
 and E1.MidInitial = W1.MidInitial 
 and E2.Lastname = W2.LastName 
 and E2.FirstName = W2.FirstName 
 and E2.MidInitial = W2.MidInitial 
and E1.city='Omaha' AND E2.city = 'Lincoln';

--Q2:
SELECT distinct M.ManagerLastname, M.MFirstName, M.MMidInitial, E.street, E.city 
FROM employee E, works W, manages M 
WHERE E.Lastname = M.ManagerLastname 
 and E.FirstName = M.MFirstName 
 and E.MidInitial = M.MMidInitial 
 and M.Lastname = W.LastName 
 and M.FirstName = W.FirstName 
 and M.MidInitial = W.MidInitial 
 and W.company_name = 'Union Pacific';

--Q3:
SELECT distinct W.salary, M.ManagerLastname, M.MFirstName, M.MMidInitial
FROM employee E, works W, manages M 
WHERE E.Lastname = M.ManagerLastname 
 and E.FirstName = M.MFirstName 
 and E.MidInitial = M.MMidInitial 
 and E.Lastname = W.LastName 
 and E.FirstName = W.FirstName 
 and E.MidInitial = W.MidInitial 
 and W.company_name = 'First Bank' 
 and E.city = 'Omaha';

--Q4:
SELECT DISTINCT EMPLOYEE.Lastname, EMPLOYEE.FIRSTNAME, EMPLOYEE.MidInitial, salary
FROM employee, WORKS, COMPANY
WHERE EMPLOYEE.CITY = COMPANY.CITY
 AND EMPLOYEE.Lastname = WORKS.LastName 
 and EMPLOYEE.FirstName = WORKS.FirstName 
 and EMPLOYEE.MidInitial = WORKS.MidInitial
 and works.company_name = company.company_name; 

--Q5:
SELECT E1.Lastname, E1.FIRSTNAME, E1.MidInitial
FROM EMPLOYEE E1, EMPLOYEE E2, MANAGES M
WHERE E1.Lastname = M.LastName 
 and E1.FirstName = M.FirstName 
 and E1.MidInitial = M.MidInitial 
 and M.ManagerLastname = E2.Lastname
 and M.MFirstName = E2.FirstName  
 and M.MMidInitial = E2.MidInitial
 and E1.street = E2.street
 and E1.city = E2.city; 

--Q6:
SELECT DISTINCT EMPLOYEE.Lastname, EMPLOYEE.FIRSTNAME, EMPLOYEE.MidInitial, 
       WORKS.company_name, salary
FROM employee, works
WHERE EMPLOYEE.Lastname = WORKS.LastName 
 and EMPLOYEE.FirstName = WORKS.FirstName 
 and EMPLOYEE.MidInitial = WORKS.MidInitial
 and (EMPLOYEE.Lastname, EMPLOYEE.FirstName, EMPLOYEE.MidInitial) 
 not in (SELECT manages.ManagerLastname, manages.MFirstName, manages.MMidInitial FROM manages);

--Q7: 
SELECT DISTINCT EMPLOYEE.Lastname, EMPLOYEE.FIRSTNAME, EMPLOYEE.MidInitial, 
       WORKS.company_name, salary
FROM employee, works
where EMPLOYEE.Lastname = WORKS.LastName 
  and EMPLOYEE.FirstName = WORKS.FirstName 
  and EMPLOYEE.MidInitial = WORKS.MidInitial
  and (works.salary) in (SELECT MAX (works.salary) from works);
 
 --Q8:
CREATE VIEW ManagerInfo AS 
SELECT EMPLOYEE.Lastname, EMPLOYEE.FirstName, EMPLOYEE.MidInitial, 
       employee.street, employee.city 
       FROM employee, manages
       where EMPLOYEE.Lastname = manages.ManagerLastName 
         and EMPLOYEE.FirstName = manages.MFirstName 
         and EMPLOYEE.MidInitial = manages.MMidInitial;
SELECT DISTINCT *FROM ManagerInfo;

--Q9:
SELECT DISTINCT ManagerInfo.Lastname, ManagerInfo.FirstName, 
                ManagerInfo.MidInitial, WORKS.company_name
From ManagerInfo, works
WHERE WORKS.LastName = ManagerInfo.Lastname
  and WORKS.FirstName = ManagerInfo.FirstName
  and WORKS.MidInitial = ManagerInfo.MidInitial
  and works.salary > ( SELECT avg (works.salary) 
	                       from works, ManagerInfo
						   WHERE WORKS.LastName = ManagerInfo.Lastname
						   and WORKS.FirstName = ManagerInfo.FirstName
	                       and WORKS.MidInitial = ManagerInfo.MidInitial);
						   
--Q10:
SELECT distinct W2.company_name
FROM employee E1, employee E2, works W1, works W2
WHERE E1.city = E2.city 
  and E1.Lastname = W1.LastName 
  and E1.FirstName = W1.FirstName 
  and E1.MidInitial = W1.MidInitial 
  and E2.Lastname = W2.LastName 
  and E2.FirstName = W2.FirstName 
  and E2.MidInitial = W2.MidInitial 
  and W1.company_name = 'Mutual of Omaha'
  and W2.company_name not in (SELECT company_name 
						     FROM works
							 WHERE company_name = 'Mutual of Omaha');
		
--Q11:
SELECT DISTINCT employee.LastName, employee.FIRSTNAME, employee.MidInitial, employee.city
FROM works, employee
where EMPLOYEE.Lastname = WORKS.LastName 
  and EMPLOYEE.FirstName = WORKS.FirstName 
  and EMPLOYEE.MidInitial = WORKS.MidInitial
  and works.salary < (SELECT avg (works.salary) 
	                 from works)
 and employee.LastName not LIKE 'C%';
 
--Q12:
SELECT AVG(ct) as avgE
from (SELECT company_name, count(lastName) as ct 
	  FROM works
	  group by company_name);

--Q13:
--(a)
UPDATE works
set salary = case
When (LastName, FirstName, MidInitial) 
 in (SELECT ManagerLastname, MFirstName, MMidInitial FROM manages)
 then  1.04 * salary
 else  1.06 * salary
 end;
SELECT LastName, FirstName, MidInitial, salary
from works;
--(b)
--Click RollBack once, then undo this update.

--Q14:
SELECT totalE.city, totalEmployee, avgSalary, totalManagers
from (select city, count(distinct lastName) as totalEmployee
	  from employee
	  group by city) totalE, 
	 (select city, avg(SALARY) as avgSalary
	  from works natural join employee
	  group by employee.city)  
	 (select city, count(distinct Lastname) as totalManagers
	  from ManagerInfo
	  group by city) totalM
where totalE.city = avgS.city 
  and avgS.city = totalM.city;
  
SELECT totalE.city, totalEmployee, avgSalary
from (select city, count(distinct lastName) as totalEmployee
	  from employee
	  group by city) totalE, 
	 (select city, avg(SALARY) as avgSalary
	  from works natural join employee
	  group by employee.city) avgS
    where totalE.city = avgS.city;
SELECT totalManagers.city, totalManagers
from (select city, count(distinct Lastname) as totalManagers
	  from ManagerInfo
	  group by city) totalM;

	
									
--Q15:
SELECT DISTINCT lastname, firstname, midinitial, start_date
FROM (SELECT M1.lastname, M1.firstname, M1.midinitial, M1.start_date
	  FROM manages M1 JOIN manages M2 ON ( M1.managerlastname = M2.managerlastname )
	  WHERE M1.firstname != M2.firstname AND M1.start_date!= M2.start_date);
									
--Q16:
CREATE VIEW OmahaInfo AS
SELECT lastName, firstName, midInitial, gender, street
FROM Employee
WHERE city = 'Omaha';
SELECT *FROM OmahaInfo;

CREATE VIEW LincolnInfo AS
SELECT lastName, firstName, midInitial, gender, street
FROM Employee
WHERE city = 'Lincoln';											
SELECT *FROM LincolnInfo;

--Q17:
(SELECT lastName, firstName, midInitial
FROM lincolnInfo
WHERE gender = 'M')
UNION (SELECT lastName, firstName, midInitial
       FROM OmahaInfo
       WHERE gender = 'M');

--Q18:
SELECT DISTINCT company_name, count(lastName) as TotalEmployee
FROM Works natural join company
WHERE city ='Omaha' 
GROUP BY company_name;

--Q19:
SELECT DISTINCT works.company_name, M1.lastname, M1.firstname, M1.start_date
FROM manages M1, manages M2, works
WHERE M1.lastname = M2.managerlastname
AND M1.FirstName = M2.MFirstName 
AND M1.MidInitial = M2.MMidInitial
AND works.lastname = M1.lastname 
AND (works.company_name ='FDR' OR works.company_name = 'Union Pacific');

answer: 
SELECT DISTINCT start_date
FROM manages natural join works
WHERE (works.company_name ='FDR' OR works.company_name = 'Union Pacific');

--Q20:
SELECT DISTINCT manages.ManagerLastName, manages.MFirstName, manages.MMidInitial, salary
FROM Manages, works, employee
where EMPLOYEE.Lastname = manages.ManagerLastName 
  and EMPLOYEE.FirstName = manages.MFirstName 
  and EMPLOYEE.MidInitial = manages.MMidInitial
  and works.Lastname = manages.ManagerLastName 
  and works.FirstName = manages.MFirstName 
  and works.MidInitial = manages.MMidInitial
  and employee.city = 'Omaha'
  and employee.gender = 'F'
  and (works.salary) in (SELECT MAX (works.salary) from works);




