### 회원가입 프로시저
DELIMITER //
CREATE PROCEDURE create_user()
	BEGIN
	insert into, customer(user_id name, password, tel, age, gender, alarm) values('user1', '장준혁', '012345', '010-3748-5573', 23, 'M', 'N');
        INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code, building, building_details)
        VALUES ('1111013500', '서울특별시', '종로구', '관철동', '111104100307', '종로12길 15', '03190', '종로코아', '3층');
    insert into customer(user_id, name, password, tel, age, gender, alarm) values('user2', '신재석', '012346', '010-1352-4241', 25, 'M', 'N');
        INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code, building, building_details)
        VALUES ('1117013000', '서울특별시', '용산구', '이태원동', '111703102009', '이태원로 145', '04351', '동호프라자', '2층');
    insert into customer(user_id, name, password, tel, age, gender, alarm) values('user3', '한희준', '012347', '010-4846-4213', 24, 'W', 'Y');
        INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code, building, building_details)
        VALUES ('1117013000', '서울특별시', '중량구', '면목동', '112603005029', '겸재로 240', '02200', '행복오피스텔', '지하 1층');
    insert into customer(user_id, name, password, tel, age, gender, alarm) values('user4', '손정민', '012348', '010-9788-7622', 20, 'M', 'Y');
        INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code, building, building_details)
        VALUES ('1123010200', '서울특별시', '동대문구', '용두동', '112303105008', '왕산로 122', '02566', '한방천하 용두동 포스빌', '지상 2층');
    insert into customer(user_id, name, password, tel, age, gender, alarm) values('user5', '유우저', '012349', '010-9632-0254', 34, 'W', 'Y');
        INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code, building, building_details)
        VALUES ('3017010800', '대전광역시', '서구', '괴정동', '301703166004', '갈마로 251', '35294', '한민쇼핑', '한민프라자 2층');
    END //
    DELIMITER ;

### 매장 정보 입력

### 회원 가입 시 알람 서비스 이용자들에게만 이벤트성 광고 송신
-- alarm 값이 Y로 들어오면 알람 서비스에 동의 한것이므로 이벤트성 광고 송신
- select user_id, name from customer where alarm = 'Y';

### 배민 쿠폰 리스트에 쿠폰 등록
DELIMITER //
CREATE PROCEDURE create_user()
	BEGIN
    INSERT INTO coupon_list (coupon_name, price) VALUES ('크리스마스 기념 할인쿠폰', '3000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('달달한 디저트 쿠폰 매일 드려요', '5000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('친구 초대 이벤트 쿠폰', '7000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('올해 마지막 1만원 쿠폰팩', '10000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('받고 또 받는 7천원 쿠폰', '7000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('새로 나왔어요! 비타민 보충 과일', '2000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('초특급 할인 이번주 전단 특가', '5000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('리뷰 이벤트', '300');
	END //
DELIMITER ;

### USER 쿠폰 다운로드 시 사용자 별 보유 쿠폰 리스트에 정보 저장

DELIMITER //
CREATE PROCEDURE create_user()
	BEGIN
    INSERT INTO coupon_list (coupon_name, price) VALUES ('크리스마스 기념 할인쿠폰', '3000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('달달한 디저트 쿠폰 매일 드려요', '5000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('친구 초대 이벤트 쿠폰', '7000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('올해 마지막 1만원 쿠폰팩', '10000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('받고 또 받는 7천원 쿠폰', '7000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('새로 나왔어요! 비타민 보충 과일', '2000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('초특급 할인 이번주 전단 특가', '5000');
    INSERT INTO coupon_list (coupon_name, price) VALUES ('리뷰 이벤트', '300');
	END //
DELIMITER ;

-- 사용자 별 보유 쿠폰 리스트
CREATE TABLE IF NOT EXISTS `ownership_coupon`
(
    `id`          BIGINT NOT NULL AUTO_INCREMENT,
    `customer_id` BIGINT NOT NULL,
    `coupon_id`   BIGINT NOT NULL,
    `is_used`     ENUM ('Y','N') DEFAULT 'N',
    `issue_date`  DATETIME,
    `expire_date` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`coupon_id`) REFERENCES `coupon_list` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

- insert into coupon_list(coupon_name, price, expire_date) values('크리스마스 기념 할인쿠폰', '3000', '2023-12-31 23:59:59');
배민 쿠폰 리스트에서 사용자가 쿠폰발급(보류)
=== 쿠폰은 컬럼 확정 안나서 테스트케이스 나중에 작성

소비자 상품 주문(포인트, 쿠폰 사용X)	
- insert into orders(order_number, user_id_fk, user_address_fk, order_item_id_fk, total_amount, actual payment_amount, distance, deliveryfee, order_time)
values('BM4534', 1, '010-3748-5573', '서울특별시 관악구 관천로 1287길 35', 25, 'M', 'Y');
== 위와 같이 insert 구문으로 orders 테이블에 order정보가 들어가야 하는데 다른 테이블에서 fk가 걸려서 들어옴으로
실제적인 데이터를 작성할 수 없어서 보류.

소비자 상품 주문(포인트만 사용, 쿠폰 사용X)		
- 

소비자 상품 주문(쿠폰만 사용, 포인트 사용 X)
- 

소비자가 상품을 주문한 후 주문취소를 했을 때