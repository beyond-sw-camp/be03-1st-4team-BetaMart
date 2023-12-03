# ✍️ order_details 상세 정보

```mariadb
CREATE TABLE IF NOT EXISTS `order_details`
(
    `id`            BIGINT       NOT NULL AUTO_INCREMENT,
    `count`         INT UNSIGNED NOT NULL,
    `store_item_id` BIGINT       NOT NULL,
    `order_id`      BIGINT       NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`store_item_id`) REFERENCES `store_item` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `count`: 품목 별 주문 수량
- `store_item_id`: store_item 테이블의 id
- `order_id`: orders 테이블의 id