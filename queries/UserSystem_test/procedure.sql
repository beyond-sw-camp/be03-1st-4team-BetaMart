-- 임의의 유저 5명 회원가입
DELIMITER //
CREATE PROCEDURE create_user()
	BEGIN
	insert into customer(user_id, name, password, tel, age, gender) values('user1', '장준혁', '012345', '010-3748-5573', 23, 'M');
    insert into customer(user_id, name, password, tel, age, gender) values('user2', '신재석', '012346', '010-1352-4241', 25, 'M');
    insert into customer(user_id, name, password, tel, age, gender) values('user3', '한희준', '012347', '010-4846-4213', 24, 'W');
    insert into customer(user_id, name, password, tel, age, gender) values('user4', '손정민', '012348', '010-9788-7622', 20, 'M');
    insert into customer(user_id, name, password, tel, age, gender) values('user5', '유우저', '012349', '010-9632-0254', 34, 'W');
	END //
DELIMITER ;

-- 매장에 상품 n개 진열하기