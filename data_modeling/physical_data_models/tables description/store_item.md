# ✍️ store_item 상세 정보

> 매장 별 재고 수량 테이블

```mariadb
-- store_item 테이블
CREATE TABLE IF NOT EXISTS `store_item`
(
    `id`       BIGINT NOT NULL AUTO_INCREMENT,
    `store_id` BIGINT NOT NULL,
    `item_id`  BIGINT NOT NULL,
    `count`    INT UNSIGNED DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`store_id`) REFERENCES `store_info` (`id`),
    FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `store_id`: FK, store_info 테이블의 id
- `item_id`: FK, item 테이블의 id
- `count`: 매장 내의 품목 별 재고 수량. 기본값은 0
