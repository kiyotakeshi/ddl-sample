create table employee
(
    id           integer     not null,
    birthday     date,
    first_name   varchar(20) not null,
    gender       varchar(10),
    last_name    varchar(20) not null,
    mail_address varchar(255),
    primary key (id)
);

create table employee_telephones
(
    employee_id integer not null,
    number      varchar(255),
    type        varchar(255)
);

alter table employee
    add constraint UK_juipuvrjn0ygo4oe6qtu9jyuj unique (mail_address);

alter table employee_telephones
    add constraint foreign key (employee_id)
        references employee (id);

INSERT INTO employee
    (id, birthday, first_name, last_name, mail_address, gender)
VALUES (1, '1999-11-29', 'mike', 'popcorn', 'mike.popcorn@mail.com', 'male');

insert
into employee_telephones
    (employee_id, number, type)
values (1, '0120-444-444', 'business');

insert
into employee_telephones
    (employee_id, number, type)
values (1, '0120-555-555', 'business');

select id,
       birthday,
       first_name,
       gender,
       last_name,
       mail_address,
       number,
       type
from employee e
         left join employee_telephones et on e.id = et.employee_id;
/**
1,1999-11-29,mike,male,popcorn,mike.popcorn@mail.com,0120-444-444,business
1,1999-11-29,mike,male,popcorn,mike.popcorn@mail.com,0120-555-555,business
**/
