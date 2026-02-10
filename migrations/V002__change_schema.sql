ALTER TABLE product
    ADD CONSTRAINT pk_product PRIMARY KEY (id);

ALTER TABLE orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (id);

ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_product FOREIGN KEY (product_id) REFERENCES product (id);

ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_order FOREIGN KEY (order_id) REFERENCES orders (id);

ALTER TABLE product
    ADD COLUMN price DOUBLE PRECISION;

ALTER TABLE orders
    ADD COLUMN date_created DATE;

DROP TABLE product_info;
DROP TABLE orders_date;
