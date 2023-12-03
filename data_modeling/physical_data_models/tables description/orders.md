# ✍️ orders 상세 정보

```mariadb
CREATE TABLE IF NOT EXISTS `orders`
(
    `id`           BIGINT       NOT NULL AUTO_INCREMENT,
    `order_number` INT UNSIGNED NOT NULL,
    `customer_id`  BIGINT,
    `total_count`  INT UNSIGNED NOT NULL,
    `use_point`    INT UNSIGNED DEFAULT 0,
    `total_price`  INT UNSIGNED NOT NULL,
    `distance`     INT          NOT NULL,
    `coupon_id`    BIGINT,
    `crew_id`      BIGINT,
    `deliveryfee`  INT UNSIGNED NOT NULL,
    `order_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE SET NULL ON DELETE SET NULL,
    FOREIGN KEY (`coupon_id`) REFERENCES `ownership_coupon` (`id`) ON UPDATE SET NULL ON DELETE SET NULL,
    FOREIGN KEY (`crew_id`) REFERENCES `crew` (`id`) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `order_number`: 주문번호
- `customer_id`: FK, customer 테이블의 id
- `total_count`: 총 주문 수량
- `user_point`: 사용한 포인트
- `total_price`: 총 주문 금액
- `distance`: 배달 거리
- `coupon_id`: FK, ownership_coupon 테이블의 id
- `crew_id`: FK, crew 테이블의 id
- `deliveryfee`: 배달료
- `order_time`: 결제 시간. 현재 시간이 기본값으로 들어간다.

> 🚨 `order_item_id_fk`가 기존에는 VARCHAR(50)으로 되어 있었는데, FK가 걸려 있지 않은 것 같아 삭제했습니다.