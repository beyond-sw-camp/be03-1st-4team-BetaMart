-- 고객(Customer) 관련 테스트 케이스
-- 새로운 고객 생성: 유효한 데이터화 함께 새 고객 레코드 추가.
INSERT INTO customer(user_id, name, password, tel, age, gender) values('jang4952', 'jangjunhyeok', 'Passw0rd', '010-3748-5573', 25, 'M');|

-- 중복된 전화번호를 사용하여 고객 추가: 중복 데이터를 사용하여 고객 레코드 추가 시도
INSERT INTO customer(user_id, name, password, tel, age, gender) values('jang4953', 'jangjunhyeok', 'password', '010-3748-5573', 26, 'W');|

-- 상품(Item) 관련 테스트 케이스
    -- 새로운 상품 추가: 유효한 데이터와 함께 새 상품 레코드 추가.
    INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
    VALUES ('토핑이 쏟아지는 명장면을 포착하세요!',
            '[3개 묶음] 비요뜨 쵸코링 138g',
            '냉장', '2024-01-03', 4590, 5, '우유·유제품') ;
    -- 상품의 유효기간 설정: 상품의 유효기간 설정 및 관련 정보 확인
    UPDATE item SET expire_date = '2024-01-01' WHERE name like '%비요뜨%';
    -- 잘못된 유형의 상품 추가: 허용되지 않는 상품 유형으로 레코드 추가 시도.  
    -- Error Code: 1265. Data truncated for column 'item_type' at row 1
    INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
    VALUES ('토핑이 쏟아지는 명장면을 포착하세요!',
            '[3개 묶음] 비요뜨 쵸코링 138g',
            '실내', '2024-01-03', 4590, 5, '우유·유제품') ;

--매장(Store) 관련 테스트 케이스
    -- 새로운 매장 추가: 유효한 데이터와 함께 새 매장 레코드 추가.
    INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
    VALUES ('중구명동점', '김영남', '010-1001-2222', 1, '종로코아빌딩 3층', '서울특별시 중구');
    -- 매장 담당자 정보 갱신: 매장 담당자 정보 업데이트 및 확인.
    UPDATE store_info SET manager = '김용대', tel = '010-1234-2345' WHERE name = '중구명동점';
    -- 존재하지 않는 주소에 매장 추가: 존재하지 않는 주소로 매장 추가 시도.
    INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
    VALUES ('중구명동점', '김영남', '010-1001-2222', 1, '종로코아빌딩 3층', '서울특별시 중구');

-- 주문(Order) 관련 테스트 케이스
    -- 새로운 주문 생성: 유효한 데이터와 함께 새 주문 레코드 추가
        INSERT INTO orders (order_number, customer_id, total_count, total_price)
	VALUES (1+FLOOR(RAND()*10000), 1, 10, 71900);
    -- 주문의 쿠폰 및 할인 적용: 주문에 쿠폰 및 할인 적용 및 금액 확인.
        SELECT 
        o.id AS order_id,
        o.total_price AS original_price,
        IFNULL(cl.price, 0) AS coupon_discount,
        CASE
                WHEN cl.price IS NOT NULL THEN o.total_price - cl.price
        ELSE o.total_price
        END AS discounted_price
        FROM orders o
        LEFT JOIN ownership_coupon oc ON o.coupon_id = oc.id
        LEFT JOIN coupon_list cl ON oc.coupon_id = cl.id
        WHERE o.id = 1;
    -- 존재하지 않는 고객 주문 시도: 존재하지 않는 고객으로 주문 추가 시도.
        INSERT INTO orders (order_number, customer_id, total_count, total_price, coupon_id, crew_id)
	VALUES (1+FLOOR(RAND()*10000), 106, 10, 71900, 2, 2);

-- 배송(Delivery) 관련 테스트 케이스
    -- 새로운 배송 추가: 유효한 데이터와 함께 새 배송 레코드 추가.
        INSERT INTO delivery (name, state, locate, order_id, distance, deliveryfee)
	VALUES ('배달테스트', 'WAIT', 'A4-245', '1', '3', '4000');
    -- 배송 상태 변경: 배송 상태 변경 및 확인.
        UPDATE delivery SET state = 'PICK' WHERE id = 1 AND order_id = 1;
    -- 존재하지 않는 주문에 배송 추가 시도: 존재하지 않는 주문에 배송 정보 추가 시도.
        INSERT INTO delivery (name, state, locate, order_id, distance, deliveryfee)
	VALUES ('배달테스트', 'WAIT', 'A4-245', '10', '3', '4000');