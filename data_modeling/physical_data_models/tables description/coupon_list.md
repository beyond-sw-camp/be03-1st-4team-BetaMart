# ✍️ coupon_list 상세 정보
> Beta마트 전체 쿠폰테이블

```mariadb
CREATE TABLE IF NOT EXISTS `coupon_list`
(
    `id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `coupon_name` VARCHAR(50)  NOT NULL,
    `price`       INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `coupon_name`: 쿠폰명
- `price`: 쿠폰 별 혜택 금액
