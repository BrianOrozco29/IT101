--Creating a table named student

create table student (id INT PRIMARY KEY, firstname VARCHAR(25), lastname VARCHAR(50), address VARCHAR(50), state VARCHAR(2), gpa DOUBLE, credits INT);

--inserting all of the student values to match assignment description in problem 1

insert into student values ('1', 'Brad', 'Benson', '24 Grand Ave', 'WA', '3.85', '96');
insert into student values ('2', 'Brad', 'Benson', '24 Grand Ave', 'WA', '3.84', '96');
insert into student values ('3', 'Brad', 'Benson', '24 Grand Ave', 'WA', '3.7', '97');
insert into student values ('4', 'Barry', 'Benson', '26 Grand Ave', 'WA', '3.69', '98');
insert into student values ('5', 'Brian', 'Benson', '26 Grand Ave', 'WA', '2.7', '99');
insert into student values ('6', 'Brandon', 'Benson', '26 Grand Ave', 'WA', '3.69', '63');
insert into student values ('7', 'Brett', 'Benson', '26 Grand Ave', 'WA', '1.7', '52');
insert into student values ('8', 'Brigette', 'Benson', '124 Main St', 'CA', '1.69', '44');
insert into student values ('9', 'Brie', 'Benson', '124 Main St', 'CA', '1', '31');
insert into student values ('10', 'Bella', 'Benson', '124 Main St', 'CA', '0.87', '27');
insert into student values ('11', 'Indy', 'Jones', '101 Raiders Ave', 'OR', '3.9', '89');
insert into student values ('12', 'Hideo', 'Kojima', '1337 Gear St.', 'OR', '4', '100');
insert into student values ('13', 'Tara', 'Strong', '364 2nd St', 'NY', '3.2', '67');
insert into student values ('14', 'David', 'Hayter', '419 Elm St', 'NJ', '3.15', '75');
insert into student values ('15', 'Sean', 'Schemmel', '609 Kame Ave', 'HI', '2.8', '62');
insert into student values ('16', 'Phil', 'Lamarr', '3018 Static St', 'NY', '3.1', '53');
insert into student values ('17', 'Jane', 'Doe', '14 King Blvd.', 'MA', '3.17', '124');
insert into student values ('18', 'Chris P.', 'Bacon', '420 Scorch Road', 'VA', '1.9', '69');
insert into student values ('19', 'Ronald', 'Drumpf', '1600 Penn Ave', 'MD', '1.5', '32');
insert into student values ('20', 'Ronald', 'Drumpf', '1600 Penn Ave', 'MD', '1.2', '33');
insert into student values ('21', 'Ronald', 'Drumpf', '1600 Penn Ave', 'MD', '1.05', '64');
insert into student values ('22', 'Ronald', 'Drumpf', '1600 Penn Ave', 'MD', '1', '65');
insert into student values ('23', 'Ronald', 'Drumpf', '1600 Penn Ave', 'MD', '0.5', '96');
insert into student values ('24', 'Ryan', 'Borozco', '419 Chilton St', 'NJ', '3', '90');


/* 
Try creating another student with the id 1.
How does MySQL respond? Explain what the message displayed means.
*/

insert into student values ('1', 'Jane', 'Doe', '14 King Blvd.', 'NJ', '3.17', '124');

/*
SQL responds with “Duplicate entry ‘1’ for key ‘PRIMARY’”. This means that there may only be one entry with a specific Primary key, as each key must be unique from each other. Therefore, there cannot be more than one entry with the ‘1’ id Primary Key.
*/

--To retrieve all the records in the table I can use this function:

select * from student;

--The following query will retrieve the gpa, lastname and state records of all students from New Jersey

select gpa, lastname, state from student where state='NJ';

--To show how many students are from each state:

select state, COUNT(state) from student group by state ASC;


--To show the ids and student NOT living at '24 Grand Ave':

select id, firstname, lastname from student where address != '24 Grand Ave';


--Ordering all Benson students by their gpa:

select firstname, lastname, gpa from student where lastname='Benson' order by gpa desc;


--Finding all students in Honors who are not freshman, ordered by credits:

select id, firstname, lastname, address, state, gpa, credits from student where (credits >= 33) and (gpa >= 3.7 and gpa <= 3.84) order by gpa desc;


--To show lastname and address of all senior students from Washington. Including any student from Oregon:

select lastname, address from student where ((credits>=96 and state='OR') or state='OR') order by credits asc;


--To show the average GPA for the students from CA:

select state, AVG(gpa) from student where state='CA';
