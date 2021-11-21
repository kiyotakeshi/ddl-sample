create table employee
(
    id           integer     not null auto_increment,
    birthday     date,
    first_name   varchar(20) not null,
    last_name    varchar(20) not null,
    mail_address varchar(255),
    gender       varchar(10),
    primary key (id)
);

alter table employee
    add constraint unique (mail_address);

create table authentication
(
    id          integer not null auto_increment,
    password    varchar(255),
    employee_id integer not null,
    primary key (id)
);

alter table authentication
    add constraint unique (employee_id);

alter table authentication
    add constraint foreign key (employee_id)
        references employee (id);

select e.id,
       e.birthday,
       e.first_name,
       e.last_name,
       e.gender,
       a.password
from employee e
         join authentication a on e.id = a.employee_id;

/*
+--+----------+----------+---------+------+---------+
|id|birthday  |first_name|last_name|gender|password |
+--+----------+----------+---------+------+---------+
|1 |1999-11-29|mike      |popcorn  |male  |1qazxsw12|
+--+----------+----------+---------+------+---------+
*/
