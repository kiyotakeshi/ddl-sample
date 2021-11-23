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

create table employee_authorization
(
    employee_id      integer      not null,
    authorization_id varchar(255) not null
);

alter table employee_authorization
    add constraint foreign key (authorization_id)
        references authorization (id);

alter table employee_authorization
    add constraint foreign key (employee_id)
        references employee (id);

select e.first_name, e.last_name, a.name
from employee e
         join employee_authorization ea on e.id = ea.employee_id
         join authorization a on ea.authorization_id = a.id;

/*
+----------+---------+----------+
|first_name|last_name|name      |
+----------+---------+----------+
|mike      |popcorn  |ROLE_USER |
|mike      |popcorn  |ROLE_ADMIN|
+----------+---------+----------+
*/
