회원가입
- insert into customer(user_id, name, password, tel, age, gender) values('jang4952', 'jangjunhyeok', 'Passw0rd', '010-3748-5573', 25, 'M');

회원 가입 시 알람 서비스 이용자들에게만 이벤트성 광고 송신
-- alarm 값이 Y로 들어오면 알람 서비스에 동의 한것이므로 이벤트성 광고 송신
- insert into customer(user_id, name, password, tel, age, gender, alarm) values('jang4952', 'jangjunhyeok', 'Passw0rd', '010-3748-5573', 25, 'M', 'Y');
- select user_id, name from customer where alarm = 'Y';

배민 쿠폰 리스트에 쿠폰 등록(보류)
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
