# ✍️ ownership_coupon 상세 정보

```mariadb
-- 사용자 별 보유 쿠폰 리스트
CREATE TABLE IF NOT EXISTS `ownership_coupon`
(
    `id`          BIGINT NOT NULL AUTO_INCREMENT,
    `customer_id` BIGINT NOT NULL,
    `coupon_id`   BIGINT NOT NULL,
    `is_used`     ENUM ('Y','N') DEFAULT 'N',
    `issue_date`  DATETIME,
    `expire_date` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`coupon_id`) REFERENCES `coupon_list` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `customer_id`: FK (customer 테이블의 id)
- `coupon_id`: FK (coupon 테이블의 id)
- `is_used`: 쿠폰 사용 여부, 기본 값은 '사용하지 않음'.
- `issue_date`: 쿠폰 발급일
- `expire_date`: 쿠폰 만료일