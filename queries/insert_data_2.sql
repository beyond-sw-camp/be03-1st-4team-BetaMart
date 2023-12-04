-- 매핑되어있는 테이블들에 대한 데이터 삽입 procedure

DELIMITER //
CREATE PROCEDURE insert_data()
BEGIN
-- ownership_coupon 데이터 삽입
INSERT INTO ownership_coupon (customer_id, coupon_id, is_used, issue_date, expire_date)
VALUES (4, 4, 'Y', '2023-11-05 11:05:28', '2023-12-01');

INSERT INTO ownership_coupon (customer_id, coupon_id, is_used, issue_date, expire_date)
VALUES (4, 4, 'N', '2023-11-28 11:10:59', '2023-12-01');

INSERT INTO ownership_coupon (customer_id, coupon_id, is_used, issue_date, expire_date)
VALUES (7, 3, 'N', '2023-12-01 10:27:31', '2023-12-31');

INSERT INTO ownership_coupon (customer_id, coupon_id, is_used, issue_date, expire_date)
VALUES (2, 7, 'N', '2023-12-03 18:31:04', '2023-12-17');

INSERT INTO ownership_coupon (customer_id, coupon_id, is_used, issue_date, expire_date)
VALUES (2, 7, 'N', '2023-12-03 18:35:45', '2023-12-17');
	
-- event 데이터 삽입
INSERT INTO event (item_id, discount, event_name, start_time, expire_time, company)
VALUES (1, 3, '베스트 리뷰 상품', '2023-11-27', '2023-12-10', 'beta-mart');
INSERT INTO event (item_id, discount, event_name, start_time, expire_time, company)
VALUES (2, 21, '베스트 리뷰 상품', '2023-11-27', '2023-12-10', 'beta-mart');

-- store_item 데이터 삽입
INSERT INTO store_item (store_id, item_id, count)
VALUES (1, 1, 100);

INSERT INTO store_item (store_id, item_id, count)
VALUES (1, 2, 300);

INSERT INTO store_item (store_id, item_id, count)
VALUES (1, 3, 200);

INSERT INTO store_item (store_id, item_id, count)
VALUES (1, 4, 500);

INSERT INTO store_item (store_id, item_id)
VALUES (2, 4);

INSERT INTO store_item (store_id, item_id, count)
VALUES (2, 3, 50);

INSERT INTO store_item (store_id, item_id, count)
VALUES (3, 8, 200);

INSERT INTO store_item (store_id, item_id, count)
VALUES (3, 5, 100);

-- stock_status 데이터 삽입
INSERT INTO stock_status (store_item_id, damaged, item_stock)
VALUES (1, 3, 97);
INSERT INTO stock_status (store_item_id, damaged, item_stock)
VALUES (2, 1, 299);
INSERT INTO stock_status (store_item_id, damaged, item_stock)
VALUES (3, 0, 200);
INSERT INTO stock_status (store_item_id, damaged, item_stock)
VALUES (4, 0, 500);
INSERT INTO stock_status (store_item_id, damaged, item_stock)
VALUES (5, 0, 0);
INSERT INTO stock_status (store_item_id, damaged, item_stock)
VALUES (6, 5, 45);
INSERT INTO stock_status (store_item_id, damaged, item_stock)
VALUES (7, 0, 200);
INSERT INTO stock_status (store_item_id, damaged, item_stock)
VALUES (8, 0, 100);

-- orders 데이터 삽입
INSERT INTO orders (order_number, customer_id, total_count, total_price, coupon_id, crew_id)
VALUES (1+FLOOR(RAND()*10000), 8, 10, 71900, 2, 2);

-- 4590원 * 5 = 22950원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (5, 1, 1);
-- 7990원 * 2 = 15980원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (2, 2, 1);
-- 10990원 * 3 = 32970원
INSERT INTO order_details (count, store_item_id, order_id)
VALUES (3, 3, 1);

-- delivery 데이터 삽입
INSERT INTO delivery (name, state, locate, order_id, distance, deliveryfee)
VALUES ('테스트', 'WAIT', 'A4-245', '1', '3', '4000');

END //
DELIMITER ;

drop procedure insert_data;
call insert_data();
INSERT INTO orders (order_number, customer_id, total_count, total_price, coupon_id, crew_id)
VALUES (1+FLOOR(RAND()*10000), 8, 10, 71900, 2, 2);

select * from orders;