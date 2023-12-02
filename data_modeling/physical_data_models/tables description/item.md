# ✍️ item 상세 정보

```mariadb
-- item 테이블
CREATE TABLE IF NOT EXISTS `item`
(
  `id`          BIGINT(20)  NOT NULL AUTO_INCREMENT,
  `description` TEXT        NOT NULL,
  `name`        VARCHAR(30) NOT NULL,
  `item_type`   ENUM ('0', '1', '2') DEFAULT '0',
  `expire_date` DATETIME,
  `cost_price`  INT(11)              DEFAULT NULL,
  `grade`       TINYINT(3)           DEFAULT 0,
  `category`    VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `item_type`
  - 보관 방법
  - 0: 냉장, 1: 냉동, 2: 상온
  - default 0
- `grade`: 평점
- `cost_price`: 원가 정보
- `category1`: 상품 대분류
- `category2`: 상품 소분류