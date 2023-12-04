# orders와 order_details 2개 테이블에 대한 테스트를 함께 진행합니다.

INSERT INTO orders (order_number, customer_id, total_count, total_price, coupon_id, crew_id)
VALUES ('123986', 8, 10, 71900, 2, 9);

-- 4590원 * 5 = 22950원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (5, 2, 2);
-- 7990원 * 2 = 15980원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (2, 3, 2);
-- 10990원 * 3 = 32970원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (3, 4, 2);