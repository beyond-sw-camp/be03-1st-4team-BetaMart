# 풀필먼트 시스템과 가장 큰 영향이 있는 테이블

- [x] item
- [x] addr_info
- [x] store_info
- [ ] stock_status

<br/>

---

<br/>

# 🧪 item table test

```mariadb
SELECT *
FROM item;

-- item 테이블에 상품을 추가한다.
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('초코초코초코초코초코', '초코파이', '0', '2024-10-30', 7290, 100, '과자');

-- item_name의 길이가 30자를 초과하면 입력이 되지 않는다.
-- [22001][1406] (conn=194) Data too long for column 'name' at row 1
INSERT INTO item (description, name, item_type, cost_price, grade, category)
VALUES ('잘풀리는집 클래식 25m 6롤을 사용하면 3달은 거뜬해요', '잘풀리는집 클래식 25m 6롤 잘풀리는집 클래식 25m 6롤', '2', 4990, 50, '생활');
-- name의 길이에 맞게 입력하면 INSERT에 성공한다.
INSERT INTO item (description, name, item_type, cost_price, grade, category)
VALUES ('잘풀리는집 클래식 25m 6롤을 사용하면 3달은 거뜬해요', '잘풀리는집 클래식 25m 6롤', '2', 4990, 50, '생활');

-- item_type에 값을 넣지 않으면 기본 값으로 0이 입력된다.
INSERT INTO item (description, name, expire_date, cost_price, grade, category)
VALUES ('초코초코', '메론맛 초코파이', '2024-10-30', 7290, 30, '과자');

-- cost_price에 음수를 넣는다면 INSERT에 실패한다(구현 안됨)
# INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
# VALUES ('좋은 재료의 기본을 지키는 북창동 순두부', '북창동 소고기 순두부찌개 620g', '1', '2025-12-01', -10990, 98, '국·탕·찌개');

-- cost_price에 값이 없다면 NULL이 입력된다.
INSERT INTO item (description, name, item_type, expire_date, grade, category)
VALUES ('좋은 재료의 기본을 지키는 북창동 순두부', '북창동 소고기 순두부찌개 620g', '1', '2025-12-01', 98, '국·탕·찌개');

-- grade에 tinyint의 범위(-128에서 127까지)를 초과하는 값을 입력될 경우 insert에 실패한다.
-- [22003][1264] (conn=194) Out of range value for column 'grade' at row 1
-- 실패
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('열은 내리고 갈증은 푸는 시원한 한 모금', '[2개 묶음] 웅진 하늘보리 1.5L', '0', '2024-12-02', 2380, 128, '음료·커피·생수');
-- 실패
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('열은 내리고 갈증은 푸는 시원한 한 모금', '[2개 묶음] 웅진 하늘보리 1.5L', '0', '2024-12-02', 2380, -129, '음료·커피·생수');
-- 성공
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('열은 내리고 갈증은 푸는 시원한 한 모금', '[2개 묶음] 웅진 하늘보리 1.5L', '0', '2024-12-02', 2380, 127, '음료·커피·생수');
-- 성공
INSERT INTO item (description, name, item_type, expire_date, cost_price, grade, category)
VALUES ('열은 내리고 갈증은 푸는 시원한 한 모금', '[2개 묶음] 웅진 하늘보리 1.5L', '0', '2024-12-02', 2380, -128, '음료·커피·생수');

-- grade에 값을 입력하지 않는다면 0이 입력된다.
INSERT INTO item (description, name, item_type, expire_date, cost_price, category)
VALUES ('짜릿함은 그대로, 칼로리 걱정은 제로!', '[4개 묶음] 펩시 제로 슈거 라임향 500ml', '0', '2024-08-30', 7560, '음료·커피·생수');

-- category에 50자가 넘는 카테고리명을 입력하면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'category' at row 1
INSERT INTO item (description, name, item_type, expire_date, cost_price, category)
VALUES ('배민보다는 SSG닷컴', 'SSG', '0', '2024-08-30', 7560,'랄라난난난난나나나
랄라랄라랄랄라
랄랄랄랄랄(랄랄라~)라
난난난난나
난나난나난나난난나

해피해피해피 맑은 날~
우리 가족 손잡고
함께 가요 이마~트(이마트~)
행복해요 이마~트
해피해피해피 이마트

이마↗트~');
```

### 실행 결과

<p align="center">
  <img src="/queries/fullfillment test/img/item_test.png"/>
</p>

### 🔰 메모

- [ ] `cost_price`에 `UNSIGNED`를 명시해서 음수 값이 들어오지 않도록 제한한다.
- [ ] `grade`에 `UNSIGNED`를 명시해서 음수 값이 들어오지 않도록 제한한다.
- [ ] `grade`를 어떤 식으로 표현할지에 따라서 실제 화면에 출력되는 길이를 제한한다.
  - 5점 만점 `TINYINT(1)`
  - 10점 만점 `TINYINT(2)`
  - 100점 만점 
- [ ] `item_type`에 생활용품 카테고리가 있는 것을 고려해서 '해당 없음'을 표현할 수 있도록 ENUM에 값을 추가한다.

<br/>

---

<br/>

# 🧪 addr_info table test

```mariadb
select *
from addr_info;

-- addr_info에 주소 정보를 삽입한다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       lee, mountain, street_code, street_name,
                       zip_code, building, building_details)
VALUES ('0108', '서울특별시', '강남구', '논현동',
        '해당없음', '1', '116801000033', '논현로',
        '11111', '논현동 149-32 도시형주택주택', '주건축물제1동');



###################################
########## stat_code 관련 ##########
###################################

-- stat_code의 길이가 11이면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'stat_code' at row 1
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       lee, mountain, street_code, street_name,
                       zip_code, building, building_details)
VALUES ('01081111111', '서울특별시', '영등포구', '문래동',
        '해당없음', '0', '116801000033', '문래로28길',
        '07298', '문래동3가 55-18 영등포빌딩', '지하 1층');

-- stat_code가 NULL이면 INSERT에 실패한다.
-- [HY000][1364] (conn=194) Field 'stat_code' doesn't have a default value
INSERT INTO addr_info (city, sigungu, eupmyeondong,
                       lee, mountain, street_code, street_name,
                       zip_code, building, building_details)
VALUES ('서울특별시', '영등포구', '문래동',
        '해당없음', '0', '116801000033', '문래로28길',
        '07298', '문래동3가 55-18 영등포빌딩', '지하 1층');

-- stat_code의 길이가 10이면 INSERT에 성공한다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       lee, mountain, street_code, street_name,
                       zip_code, building, building_details)
VALUES ('0108111111', '서울특별시', '영등포구', '문래동',
        '해당없음', '0', '116801000033', '문래로28길',
        '07298', '문래동3가 55-18 영등포빌딩', '지하 1층');



##############################
########## city 관련 ##########
##############################

-- city의 길이가 41이면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'city' at row 1
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       lee, mountain, street_code, street_name,
                       zip_code, building, building_details)
VALUES ('0108111111', '서울특별시서울특별시서울특별시서울특별시서울특별시서울특별시서울특별시서울특별시서', '영등포구', '문래동',
        '해당없음', '0', '116801000033', '문래로28길',
        '07298', '문래동3가 55-18 영등포빌딩', '지하 1층');

-- city가 NULL이면 INSERT에 실패한다.
-- [HY000][1364] (conn=194) Field 'city' doesn't have a default value
INSERT INTO addr_info (stat_code, sigungu, eupmyeondong,
                       lee, mountain, street_code, street_name,
                       zip_code, building, building_details)
VALUES ('0108111111', '영등포구', '문래동',
        '해당없음', '0', '116801000033', '문래로28길',
        '07298', '문래동3가 55-18 영등포빌딩', '지하 1층');

-- city의 길이가 40이면 INSERT를 성공한다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       lee, mountain, street_code, street_name,
                       zip_code, building, building_details)
VALUES ('0108111111', '서울특별시서울특별시서울특별시서울특별시서울특별시서울특별시서울특별시서울특별시', '영등포구', '문래동',
        '해당없음', '0', '116801000033', '문래로28길',
        '07298', '문래동3가 55-18 영등포빌딩', '지하 1층');



#############################
########## lee 관련 ##########
#############################

-- lee를 생략하면 NULL이 입력된다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       mountain, street_code, street_name,
                       zip_code, building, building_details)
VALUES ('767423', '대전광역시', '유성구', '죽동',
        '0', '302003350374', '죽동로297번길 55',
        '34127', '아주존타워', '304호');



##################################
########## mountain 관련 ##########
##################################

-- mountain에 '0' 또는 '1'이 아닌 다른 값을 입력하면 INSERT에 실패한다. (!!! 쿼리 문제 해결 필요 !!!)
# INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
#                        mountain, street_code, street_name,
#                        zip_code, building, building_details)
# VALUES ('대전B마트', '대전광역시', '동구', '홍도동',
#         '2', '302004301033', '홍도로 11',
#         '34558', '아리랑프라자', '205~215호');

-- mountain을 생략하면 '0'이 입력된다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name,
                       zip_code, building, building_details)
VALUES ('대전B마트', '대전광역시', '동구', '홍도동',
        '302004301033', '홍도로 11',
        '34558', '아리랑프라자', '205~215호');



#####################################
########## street_code 관련 ##########
#####################################

-- street_code의 길이가 13이 되면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'street_code' at row 1
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name,
                       zip_code, building, building_details)
VALUES ('대전B마트', '대전광역시', '동구', '홍도동',
        '3020043010330', '홍도로 11',
        '34558', '아리랑프라자', '205~215호');

-- street_code를 생략하면 INSERT에 실패한다.
-- [HY000][1364] (conn=194) Field 'street_code' doesn't have a default value
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong, street_name,
                       zip_code, building, building_details)
VALUES ('대전B마트', '대전광역시', '동구', '홍도동', '홍도로 11',
        '34558', '아리랑프라자', '205~215호');



#####################################
########## street_name 관련 ##########
#####################################

-- street_name의 길이가 81이면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'street_name' at row 1
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name,
                       zip_code, building, building_details)
VALUES ('대전B마트', '대전광역시', '동구', '홍도동',
        '302004301033', 'PARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUE1',
        '34558', '아리랑프라자', '205~215호');

-- street_name이 생략되면 INSERT에 실패한다.
-- [HY000][1364] (conn=194) Field 'street_name' doesn't have a default value
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code,
                       zip_code, building, building_details)
VALUES ('1234567', 'NEW YORK', 'Brooklyn', '홍도동',
        '302004301033',
        '34558', '아리랑프라자', '205~215호');

-- street_name이 80자일 경우 INSERT에 성공한다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name,
                       zip_code, building, building_details)
VALUES ('1234567', 'NEW YORK', 'Brooklyn', '홍도동',
        '302004301033', 'PARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUEPARKAVENUE',
        '34558', '아리랑프라자', '205~215호');



##################################
########## zip_code 관련 ##########
##################################

-- zip_code의 길이가 6일 경우 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'zip_code' at row 1
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name,
                       zip_code, building, building_details)
VALUES ('1234567', 'NEW YORK', 'Brooklyn', '홍도동',
        '302004301033', 'park avenue',
        '345589', '아리랑프라자', '205~215호');

-- zip_code가 생략된 경우 INSERT에 실패한다.
-- [HY000][1364] (conn=194) Field 'zip_code' doesn't have a default value
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name,
                       building, building_details)
VALUES ('1234567', 'NEW YORK', 'Brooklyn', '홍도동',
        '302004301033', 'park avenue',
        '아리랑프라자', '205~215호');



##################################
########## building 관련 ##########
##################################

-- building을 생략할 경우 NULL로 표시된다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code,
                       building_details)
VALUES ('1111111111', '경기도', '성남시', '서현동',
        '411353180007', '돌마로 478', '13586',
        '지하 1,2층');

-- building명이 40자를 넘어가면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'building' at row 1
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1111111111', '경기도', '성남시', '서현동',
        '411353180007', '돌마로 478', '13586',
        '창인프라자창인프라자창인프라자창인프라자창인프라자창인프라자창인프라자창인프라자1', '지하 1,2층');

-- building의 길이가 40자일 경우 INSERT에 성공한다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1111111111', '경기도', '성남시', '서현동',
        '411353180007', '돌마로 478', '13586',
        '창인프라자창인프라자창인프라자창인프라자창인프라자창인프라자창인프라자창인프라자', '지하 1,2층');



##########################################
########## building_details 관련 ##########
##########################################

-- building_details를 생략하면 NULL로 표시된다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code,
                       building)
VALUES ('1111111111', '경기도', '성남시', '서현동',
        '411353180007', '돌마로 478', '13586',
        '창인프라자');

-- building_details의 길이가 101자인 경우 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'building_details' at row 1
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1111111111', '경기도', '성남시', '서현동',
        '411353180007', '돌마로 478', '13586',
        '창인프라자',
        '창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창');

-- building_details의 길이가 100자인 경우 INSERT에 성공한다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code,
                       building, building_details)
VALUES ('1111111111', '경기도', '성남시', '서현동',
        '411353180007', '돌마로 478', '13586',
        '창인프라자',
        '창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층창인프라자지하일이층');
```

### 실행 결과

<p align="center">
  <img src="/queries/fullfillment test/img/addr_info_test.png"/>
</p>

<br/>

---

<br/>

# 🧪 store_info table test

```mariadb
-- store_info에 지점 정보를 INSERT한다.
INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('대전 유성점', '홍길동', '0421112222', 17, '죽동로297번길 55', '유성구');



##############################
########## name 관련 ##########
##############################

-- name에 21자를 입력하면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'name' at row 1
INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('대전유성점대전유성점대전유성점대전유성점대', '홍길동', '0421112222', 17, '죽동로297번길 55', '유성구');

-- name에 중복된 값이 들어가면 INSERT에 실패한다.
-- [23000][1062] (conn=194) Duplicate entry '대전 유성점' for key 'name'
INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('대전 유성점', '홍길동', '0421112222', 17, '죽동로297번길 55', '유성구');

-- name이 20자이면 INSERT에 성공한다.
INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('대전유성점대전유성점대전유성점대전유성점', '홍길동', '0421112222', 17, '죽동로297번길 55', '유성구');

-- name을 생략하면 null이 출력된다.
INSERT INTO store_info (manager, tel, addr_id, addr_details, covered_area)
VALUES ('홍길동', '0421112222', 17, '죽동로297번길 55', '유성구');



#################################
########## manager 관련 ##########
#################################

-- manager가 21자면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'manager' at row 1
INSERT INTO store_info (manager, tel, addr_id, addr_details, covered_area)
VALUES ('HANWHAHANWHAHANWHAHAN', '021115678', '15', '문래타워 2-3층', '문래동');

-- manager가 20자면 INSERT에 성공한다.
INSERT INTO store_info (manager, tel, addr_id, addr_details, covered_area)
VALUES ('HANWHAHANWHAHANWHAHA', '021115678', '15', '문래타워 2-3층', '문래동');

-- manager를 생략하면 null로 출력된다.
INSERT INTO store_info (tel, addr_id, addr_details, covered_area)
VALUES ('0421112222', 17, '죽동로297번길 55', '유성구');



#############################
########## tel 관련 ##########
#############################

-- tel의 길이가 12라면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'tel' at row 1
INSERT INTO store_info (tel, addr_id, addr_details, covered_area)
VALUES ('042-111-2222', 17, '죽동로297번길 55', '유성구');

-- tel의 길이가 11이면 INSERT에 성공한다.
INSERT INTO store_info (tel, addr_id, addr_details, covered_area)
VALUES ('042-111-222', 17, '죽동로297번길 55', '유성구');

-- tel을 생략하면 null이 입력된다.
INSERT INTO store_info (addr_id, addr_details, covered_area)
VALUES (17, '죽동로297번길 55', '유성구');



#################################
########## addr_id 관련 ##########
#################################

-- addr_id를 생략하면 null이 입력된다.
INSERT INTO store_info (addr_details, covered_area)
VALUES ('죽동로297번길 55', '유성구');



######################################
########## addr_details 관련 ##########
######################################

-- addr_details를 생략하면 null이 입력된다.
INSERT INTO store_info (covered_area)
VALUES ('유성구');

-- addr_details의 길이가 46이면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'addr_details' at row 1
INSERT INTO store_info (addr_details, covered_area)
VALUES ('죽동로297번길 55죽동로297번길 55죽동로297번길 55죽동로297번길 55죽동', '유성구');

-- addr_details의 길이가 45이면 INSERT에 성공한다.
INSERT INTO store_info (addr_details, covered_area)
VALUES ('죽동로297번길 55죽동로297번길 55죽동로297번길 55죽동로297번길 55죽', '유성구');



######################################
########## covered_area 관련 ##########
######################################

-- covered_area를 생략하면 null이 입력된다.
INSERT INTO store_info (name, manager)
VALUES ('분당점', '젠슨 황');

-- covered_area의 길이가 21이면 INSERT에 실패한다.
-- [22001][1406] (conn=194) Data too long for column 'covered_area' at row
INSERT INTO store_info (name, covered_area)
VALUES ('동탄점', '반송동반송동반송동반송동반송동반송동반송동');

-- covered_area의 길이가 20이면 INSERT에 성공한다.
INSERT INTO store_info (name, covered_area)
VALUES ('동탄점', '반송동반송동반송동반송동반송동반송동반송');
```

### 실행결과

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test1.png"/>
</p>

<br/>

## 📌 `ON UPDATE SET NULL` 테스트

```mariadb
############################################
########## ON UPDATE SET NULL 관련 ##########
############################################

-- on update set null의 동작을 확인한다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code, building)
VALUES ('3113', '서울특별시', '마포구', '상수동',
        '114403113017', '와우산로 48', '04068', '로하스타워');

INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('마포홍대점', '박하늘별님구름햇님보다사랑스러우리', '026459234', '25', '로하스타워 2,3층', '마포구');
```

### addr_info 사전 세팅

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test2.png"/>
</p>

### store_info 사전 세팅

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test3.png"/>
</p>

### addr_info테이블에서 id값을 변경 (25 -> 15))

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test4.png"/>
</p>

### store_info테이블의 addr_id는 `<null>`로 표시되어야 한다.

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test5.png"/>
</p>

<br/>

## 📌 `ON DELETE SET NULL` 테스트

```mariadb
############################################
########## ON DELETE SET NULL 관련 ##########
############################################

-- on delete set null의 동작을 확인한다.
INSERT INTO addr_info (stat_code, city, sigungu, eupmyeondong,
                       street_code, street_name, zip_code, building)
VALUES ('3114', '서울특별시', '용산구', '이태원동',
        '111703102009', '이태원로 145', '04351', '동호프라자.외환은행');

INSERT INTO store_info (name, manager, tel, addr_id, addr_details, covered_area)
VALUES ('용산한남점', '김희희', '026358888', '26', '동호프라자 2,3층', '이태원');
```

### addr_info 사전 세팅

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test6.png"/>
</p>

### store_info 사전 세팅

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test7.png"/>
</p>

### addr_info테이블에서 id가 26인 row를 삭제

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test8.png"/>
</p>

### store_info테이블에서 id가 17인 row의 addr_id는 `<null>`로 표시되어야 한다.

<p align="center">
  <img src="/queries/fullfillment test/img/store_info_test9.png"/>
</p>

### 🔰 메모

- [ ] 현재 PK는 모두 BIGINT로 처리하고 있기 때문에 FK도 BIGINT로 수정해야 한다.

<br/>

---

<br/>