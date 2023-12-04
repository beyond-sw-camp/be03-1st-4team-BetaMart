-- 새로운 고객 생성: 유효한 데이터화 함께 새 고객 레코드 추가.
INSERT INTO customer(user_id, name, password, tel, age, gender) values('jang4952', 'jangjunhyeok', 'Passw0rd', '010-3748-5573', 25, 'M');|

-- 중복된 전화번호를 사용하여 고객 추가: 중복 데이터를 사용하여 고객 레코드 추가 시도
INSERT INTO customer(user_id, name, password, tel, age, gender) values('jang4953', 'jangjunhyeok', 'password', '010-3748-5573', 26, 'W');|

-- 고객의 배송지 주소 추가: 고객의 주소 정보를 기존 주소와 연결하여 추가
UPDATE 