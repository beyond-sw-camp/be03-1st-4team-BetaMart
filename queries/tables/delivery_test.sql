SELECT * FROM delivery;
SELECT * FROM orders;
SELECT * FROM order_details;

INSERT INTO delivery (name, state, locate, order_id)
VALUES ('테스트', 'WAIT', 'A4-245', '1');
