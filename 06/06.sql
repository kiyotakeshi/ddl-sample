drop table if exists authentication;
drop table if exists employee_telephones;
drop table if exists employee;
drop table if exists department;
drop table if exists product;
drop table if exists authorization;
drop table if exists employee_authorization;

create table department
(
    id   integer not null auto_increment,
    name varchar(255),
    primary key (id)
);

-- create table if not exists employee
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

alter table employee
    add constraint unique (mail_address);

alter table employee
    add constraint foreign key (department_id)
        references department (id);
-- alter table employee drop constraint employee_ibfk_1;

create table employee_telephones
(
    employee_id integer not null,
    number      varchar(255),
    type        varchar(255)
);


alter table employee_telephones
    add constraint foreign key (employee_id)
        references employee (id);

create table product
(
    category_name      varchar(255) not null,
    product_name       varchar(255) not null,
    created_by         varchar(255),
    created_date       date,
    last_modified_by   varchar(255),
    last_modified_date date,
    price              integer      not null,
    primary key (category_name, product_name)
);

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

create table authorization
(
    id   integer not null auto_increment,
    name varchar(255) not null,
    primary key (id)
);

alter table authorization
    add constraint unique (name);

create table employee_authorization
(
    employee_id      integer      not null,
    authorization_id integer not null
);

alter table employee_authorization
    add constraint foreign key (authorization_id)
        references authorization (id);

alter table employee_authorization
    add constraint foreign key (employee_id)
        references employee (id);
