create table authorization
(
    id   varchar(255) not null,
    name varchar(255),
    primary key (id)
);

create table employee
(
    id            integer     not null auto_increment,
    birthday      date,
    first_name    varchar(20) not null,
    last_name     varchar(20) not null,
    mail_address  varchar(255),
    gender        varchar(10),
    department_id integer     not null,
    primary key (id)
);

create table employee_authorizations
(
    employees_id      integer      not null,
    authorizations_id varchar(255) not null
);

alter table employee_authorizations
    add constraint foreign key (authorizations_id)
        references authorization (id);

alter table employee_authorizations
    add constraint foreign key (employees_id)
        references employee (id);

select e.first_name, e.last_name, a.name
from employee e
         join employee_authorizations ea on e.id = ea.employees_id
         join authorization a on ea.authorizations_id = a.id;

/*
+----------+---------+----------+
|first_name|last_name|name      |
+----------+---------+----------+
|mike      |popcorn  |ROLE_USER |
|mike      |popcorn  |ROLE_ADMIN|
+----------+---------+----------+
*/
