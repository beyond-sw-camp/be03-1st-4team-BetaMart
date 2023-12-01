## ⭐orders테이블 SQL구문
```
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id_pk` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `user_id_fk` varchar(50) NOT NULL,
  `user_address_fk` varchar(50) NOT NULL,
  `order_item_id_fk` varchar(50) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `coupon_fk` int(11) DEFAULT 0,
  `point_fk` int(11) DEFAULT 0,
  `actual payment_amount` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  `deliveryfee` int(11) NOT NULL,
  `order_time` datetime NOT NULL,
  PRIMARY KEY (`orders_id_pk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```
- `orders_id_pk` : orders 테이블 ID
- `order_number` : 주문번호
- `user_id_fk` : 소비자 ID
- `user_address_fk` : 소비자 주소
- `order_item_id_fk` : 주문 상품 ID
- `total_amount` : 주문 총 금액
- `coupon_fk` : 쿠폰(할인율)
- `point_fk` : 포인트(사용포인트)
- `actual payment_amount` : 실제 결제 금액
- `distance` : 거리
- `deliveryfee` : 배달료
- `order_time` : 결제 시간
