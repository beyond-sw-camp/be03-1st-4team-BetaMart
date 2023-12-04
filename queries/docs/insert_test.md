# 테스트 데이터 삽입 결과

## 📌 addr_info 테이블

<details>
<summary>addr_info insert문</summary>
<div markdown="1">

```sql
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1111013500', '서울특별시', '종로구', '관철동', '111104100307', '종로12길 15', '03190',
        '종로코아', '3층');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1117013000', '서울특별시', '용산구', '이태원동', '111703102009', '이태원로 145', '04351',
        '동호프라자', '2층');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1117013000', '서울특별시', '중량구', '면목동', '112603005029', '겸재로 240', '02200',
        '행복오피스텔', '지하 1층');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1123010200', '서울특별시', '동대문구', '용두동', '112303105008', '왕산로 122', '02566',
        '한방천하 용두동 포스빌', '지상 2층');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('3017010800', '대전광역시', '서구', '괴정동', '301703166004', '갈마로 251', '35294',
        '한민쇼핑', '한민프라자 2층');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('2635010600', '부산광역시', '해운대구', '중동', '263503133039', '좌동순환로 473', '48097',
        '해운대로데오아울렛', '2층');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code, building)
VALUES ('1111011800', '서울특별시', '종로구', '내수동',
        '111104100135', '사직로8길 20', '03174', '경희궁 파크팰리스');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code, building, building_details)
VALUES ('1117012800', '서울특별시', '용산구', '한강로3가',
        '111704106354', '청파로20길 95', '04372', '서울드래곤시티', 'A동');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code, building)
VALUES ('1123010600', '서울특별시', '동대문구', '장안동',
        '112302000008', '천호대로 383', '02633', '더리센츠동대문호텔');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code, building)
VALUES ('3017010800', '대전광역시', '서구', '괴정동',
        '301703166038', '용문로 41-80', '35299', '리베라 아이누리');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code, building, building_details)
VALUES ('2817710500', '인천광역시', '미추홀구', '주안동',
        '281774253132', '남주길 150', '22159', '힐스테이트 푸르지오 주안', '101동');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code, building, building_details)
VALUES ('2635010600', '부산광역시', '해운대구', '중동',
        '263504199011', '달맞이길 30', '48099', '엘시티', '타워에이동');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1174010800', '서울특별시', '강동구', '성내동', '117402123001', '강동대로 205', '05407',
        'MSA Center', '3층');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code)
VALUES ('1159010500', '서울특별시', '동작구', '흑석동', '115904157660', '흑석로6가길 15', '06974');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1159010500', '서울특별시', '동작구', '흑석동', '115903119009', '현충로 52', '06909',
        '아크로 리버하임', '101동');

INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1159010500', '서울특별시', '동작구', '흑석동', '115903119006', '서달로 90', '06987',
        '흑석자이아파트', '321동');
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/addr_info_insert.png"/>
</p>

## 📌 coupon_list 테이블

<details>
<summary>coupon_list insert문</summary>
<div markdown="1">

```sql
select * from coupon_list;

INSERT INTO coupon_list (coupon_name, price)
VALUES ('달달한 디터트 쿠폰 매일 드려요', '5000');

INSERT INTO coupon_list (coupon_name, price)
VALUES ('친구 초대 이벤트 쿠폰', '7000');

INSERT INTO coupon_list (coupon_name, price)
VALUES ('올해 마지막 1만원 쿠폰팩', '10000');

INSERT INTO coupon_list (coupon_name, price)
VALUES ('받고 또 받는 7천원 쿠폰', '7000');

INSERT INTO coupon_list (coupon_name, price)
VALUES ('새로 나왔어요! 비타민 보충 과일', '2000');

INSERT INTO coupon_list (coupon_name, price)
VALUES ('초특급 할인 이번주 전단 특가', '5000');

INSERT INTO coupon_list (coupon_name, price)
VALUES ('리뷰 이벤트', '300');
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/coupon_list_insert.png"/>
</p>

## 📌 crew_insert 테이블

<details>
<summary>crew insert문</summary>
<div markdown="1">

```sql
INSERT INTO crew (name, age, gender, addr_id, addr_detail, work_type, store_id)
VALUES ('이두나', 25, 'W', 15, 'MSA 엔터테인먼트', '매니저', 1);

INSERT INTO crew (name, age, gender, addr_id, addr_detail, work_type, store_id)
VALUES ('이원준', 21, 'M', 16, '민송셰어하우스 301호', '포장', 1);

INSERT INTO crew (name, age, gender, addr_id, addr_detail, work_type, store_id)
VALUES ('구정훈', 25, 'M', 16, '민송셰어하우스 201호', '포장', 1);

INSERT INTO crew (name, age, gender, addr_id, addr_detail, work_type, store_id)
VALUES ('서윤택', 26, 'M', 16, '민송셰어하우스 202호', '배달', 1);

INSERT INTO crew (name, age, gender, addr_id, addr_detail, work_type, store_id)
VALUES ('김진주', 21, 'W', 17, '아크로리버하임', '포장', 2);

INSERT INTO crew (name, age, gender, addr_id, addr_detail, work_type, store_id)
VALUES ('최이라', 21, 'W', 18, '흑석자이', '포장', 3);
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/crew_insert.png"/>
</p>

## 📌 customer 테이블

<details>
<summary>customer insert문</summary>
<div markdown="1">

```sql
INSERT INTO customer (user_id, name, password, tel, addr_id, age, gender, point, alarm, signin_date)
VALUES ('나는B마트', '김비비', '1q2w3e4r!', '010-1234-5668', 8, 20, 'W', 200, 'Y', '2023-11-27');

INSERT INTO customer (user_id, name, password, tel, addr_id, age, gender, point, alarm)
VALUES ('H마트도좋아', '한화아', 'qawssedrf%', '010-8923-5258', 9, 33, 'M', 52200, 'N');

INSERT INTO customer (user_id, name, password, tel, addr_id, age, point, signin_date)
VALUES ('요기요주문', '요기요', 'z&x*c(v)@', '010-7328-9032', 10, 27, 8236, '2023-11-28');

INSERT INTO customer (user_id, name, password, tel, addr_id, age, point)
VALUES ('배민우수회원', '나배민', 'wlslalsl3#', '010-8123-4563', 11, 22, 391);

INSERT INTO customer (user_id, name, password, tel, addr_id, age, gender, point, alarm, signin_date)
VALUES ('블루스카이', '월터화이트', 'saymyname', '010-3289-7457', 12, 52, 'M', 1958, 'N', '2023-01-20');

INSERT INTO customer (user_id, name, password, tel, addr_id, age, gender, point, alarm, signin_date)
VALUES ('핑크맨', '제시', 'p!nkm4n', '010-9999-8178', 13, 25, 'M', 1984, 'Y', '2023-09-24');

INSERT INTO customer (user_id, name, password, tel, addr_id, age, gender, point, alarm, signin_date)
VALUES ('BALLERINA', '전종서', 'burn!nG', '010-1017-0001', 14, 29, 'W', 20000, 'Y', '2023-07-05');

INSERT INTO customer (user_id, name, password, tel, addr_id, age, gender, point, alarm, signin_date)
VALUES ('파친코', '김민하', 'pachinko123', '010-2022-0325', 9, 29, 'W', 164, 'Y', '2023-11-11');

SELECT * FROM customer;
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/customer_insert.png"
</p>

## 📌 delivery 테이블 

<details>
<summary>delivery insert문</summary>
<div markdown="1">

```sql
INSERT INTO delivery (name, state, distance, locate, deliveryfee, order_id)
VALUES ('테스트', 'WAIT', 8, 'A4-245', 8, 2);
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/delivery_insert.png">
</p>

## 📌 event 테이블

<details>
<summary>event insert문</summary>
<div markdown="1">

```sql
INSERT INTO event (item_id, discount, event_name, start_time, expire_time, company)
VALUES (1, 3, '베스트 리뷰 상품', '2023-11-27', '2023-12-10', 'beta-mart');
INSERT INTO event (item_id, discount, event_name, start_time, expire_time, company)
VALUES (2, 21, '베스트 리뷰 상품', '2023-11-27', '2023-12-10', 'beta-mart');
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/event_insert.png"/>
</p>

## 📌 item 테이블

<details>
<summary>item insert문</summary>
<div markdown="1">

```sql
SELECT * FROM item;

INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('토핑이 쏟아지는 명장면을 포착하세요!',
        '[3개 묶음] 비요뜨 쵸코링 138g',
        '냉장', '2024-01-03', 4590, 5, '우유·유제품') ;

INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('해동 없이 전자레인지로 1분 40초 조리해드세요.',
        '[배민 이지] 크리스피 핫도그 500g(5개입)',
        '냉동', '2024-08-30', 7990, 5, '분식·야식');

INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('소고기를 듬뿍 넣어 묵직하고 진한 국물 맛을 느낄 수 있는 북창동 소고기 순두부 이제 집에서도 만나보세요.',
        '북창동 소고기 순두부찌개 620g',
        '냉동', '2024-06-10', 10990, 3, '국·탕·찌개');

INSERT INTO item (description, name, cost_price, grade, category)
VALUES ('내 피부에 닿는 거니까 깐깐하게 따져보세요',
        '[2개 묶음] 답이답이다 물티슈 100매(색상랜덤)',
        2980, 4, '화장지·생리대');

INSERT INTO item (description, name, cost_price, grade, category)
VALUES ('빨래에 붙는 잡냄새, 훌훌 떠나보내요',
        '액츠퍼펙트 세탁세제 실내건조(일반) 용기 3.0L',
        12990, 5, '세제·방향·탈취');

INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('문득 수박이 먹고 싶은 날, 엘제이드를 떠오릴 수 밖에!',
        '[2개 묶음] 엘제이드 얼린 생수박주스 410ml',
        '냉동', '2024-03-21', 9980, 3, '음료·커피·생수');

INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('중국 유학파가 인정한 오리지널 마라탕',
        '프로즌 마라탕 진한맛 1150g',
        '냉동', '2024-05-12', 19390, 4, '밀키트·간편식');

INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('돼지고기의 명가, 하남돼지집',
        '[2개 묶음] 하남돼지집 고깃집 차돌 된장찌개 250g',
        '냉동', '2024-06-30', 9980, 5, '밀키트·간편식');
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/item_insert.png"/>
</p>

## 📌 orders 테이블

<details>
<summary>orders insert문</summary>
<div markdown="1">

```sql
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
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/orders_insert.png"/>
    <img src="/queries/tables/insert_test_img/order_details_insert.png"/>
</p>

## 📌 ownership_coupon 테이블

<details>
<summary>ownership_coupon insert문</summary>
<div markdown="1">

```sql
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

SELECT * FROM ownership_coupon;
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/ownership_coupon_insert.png"/>
</p>

## 📌 stock_status 테이블

<details>
<summary>stock_status insert문</summary>
<div markdown="1">

```sql
SELECT * FROM stock_status;

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
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/stock_status_insert.png"/>
</p>

## 📌 store_info 테이블

<details>
<summary>store_info insert문</summary>
<div markdown="1">

```sql
INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('중구명동점', '김영남', '010-1001-2222', 1, '종로코아빌딩 3층', '서울특별시 중구');

INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('용산한남점', '이택조', '010-2134-2895', 2, '서울시 이태원동 183-1번지, 2층', '서울특별시 용산구');

INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('중랑면목점', '김민수', '010-3333-4444', 3, '행복오피스텔 지하 1층', '서울특별시 중랑구');

INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('동대문제기점', '배용길', '010-5555-6666', 4, '용두포스빌 지상 2층', '동대문구');

INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('대전서구점', '정광용', '010-7777-7777', 5, '한민프라자 2층', '대전 서구');

INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('인천남부점', '마츠다', '010-8888-9090', 6, '인천시 미추홀구 경원대로 848, 지하 1층', '인천 남부');

INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('부산해운대점', '도요다', '010-9999-1010', 7, '해운대로데오아울렛 2층', '부산 해운대');

SELECT * FROM store_info;
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/store_info_insert.png"/>
</p>

## 📌 store_item 테이블

<details>
<summary>store_item insert문</summary>
<div markdown="1">

```sql
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
```

</div>
</details>

<p align="center">
    <img src="/queries/tables/insert_test_img/store_item_insert.png"/>
</p>