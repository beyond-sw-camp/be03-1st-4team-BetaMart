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
