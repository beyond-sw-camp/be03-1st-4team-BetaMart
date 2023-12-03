# orders와 order_details 2개 테이블에 대한 테스트를 함께 진행합니다.

SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM store_item;
SELECT * FROM coupon_list;
SELECT * FROM crew;
SELECT * FROM item;

INSERT INTO orders (order_number, customer_id, total_count, total_price, distance, coupon_id, crew_id, deliveryfee)
VALUES ('123986', 8, 10, 71900, 8, 2, 2, 3000);

-- 4590원 * 5 = 22950원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (5, 1, 1);
-- 7990원 * 2 = 15980원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (2, 2, 1);
-- 10990원 * 3 = 32970원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (3, 3, 1);
