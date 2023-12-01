-- 테이블 orders.event 구조 내보내기

CREATE TABLE IF NOT EXISTS `event` (
  `event_id_pk` int(11) NOT NULL,
  `event_item_id_fk` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `expire time` datetime NOT NULL,
  `company` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id_pk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
