## ⭐event테이블 SQL구문
```
CREATE TABLE IF NOT EXISTS `event` (
  `event_id_pk` int(11) NOT NULL,
  `event_item_id_fk` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `expire time` datetime NOT NULL,
  `company` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id_pk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

- `event_id_pk` : event 테이블 ID
- `event_item_id_fk` : event에 해당하는 item ID
- `discount` : event 할인률
- `expire time` : event 쿠폰 만료시간
- `company` : event 주최 회사
