create table department
(
    id   integer not null auto_increment,
    name varchar(255),
    primary key (id)
);

create table employee
(
    id           integer     not null auto_increment,
    birthday     date,
    first_name   varchar(20) not null,
    last_name    varchar(20) not null,
    mail_address varchar(255),
    gender       varchar(10),
    department_id integer not null,
    primary key (id)
);

alter table employee
    add constraint unique (mail_address);

alter table employee
    add constraint foreign key (department_id)
        references department (id);

insert
into department
    (name, id)
values ('sales', 1);

INSERT INTO employee
(id, birthday, first_name, last_name, mail_address, gender, department_id)
VALUES (1, '1999-11-29', 'mike', 'popcorn', 'mike.popcorn@mail.com', 'male', 1);

INSERT INTO employee
(id, birthday, first_name, last_name, mail_address, gender, department_id)
VALUES (2, '2009-01-19', 'kendrick', 'west', 'kendrick.west@mail.com', 'male', 1);

select e.first_name,
       e.last_name
from employee e
where department_id = 1;
/*
+----------+---------+
|first_name|last_name|
+----------+---------+
|mike      |popcorn  |
|kendrick  |west     |
+----------+---------+
*/

select e.first_name,
       e.last_name,
       d.name
from employee e
         join department d on d.id = e.department_id;

/*
+----------+---------+-----+
|first_name|last_name|name |
+----------+---------+-----+
|mike      |popcorn  |sales|
|kendrick  |west     |sales|
+----------+---------+-----+
*/
