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

SELECT * FROM addr_info;
SELECT * FROM store_info;



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

SELECT * FROM addr_info;
SELECT * FROM store_info;
