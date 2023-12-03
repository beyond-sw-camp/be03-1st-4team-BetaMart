# ✍️ delivery 상세 정보

```mariadb
-- delivery 테이블
CREATE TABLE IF NOT EXISTS `delivery`
(
    `id`       BIGINT                NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(50)           NOT NULL,
    `state`    ENUM ('PICK', 'WAIT') NOT NULL,
    `locate`   VARCHAR(255)          NOT NULL,
    `order_id` BIGINT                NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `name`:
- `state`: 매장 내에서 배달 대기 중인 물건의 배달 상태
- `locate`:
- `order_id`: FK, orders 테이블의 id
