create table product
(
    category_name varchar(255) not null,
    product_name  varchar(255) not null,
    price         integer      not null,
    primary key (category_name, product_name)
)

insert
into product
    (price, category_name, product_name)
values (20000, 'business', 'display1');

select * from product;
-- business,display1,20000
