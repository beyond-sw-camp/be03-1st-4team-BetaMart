# ✍️ store_type 상세 정보

```mariadb
CREATE TABLE IF NOT EXISTS `item`
(
    `id`               bigint      NOT NULL AUTO_INCREMENT,
    `event_id`         bigint      not null unique,
    `item_description` text        NOT NULL,
    `item_name`        varchar(30) NOT NULL,
    `store_type`       enum (0, 1, 2) DEFAULT 0,
    `expire_date`      datetime,
    `cost_price`       decimal        DEFAULT NULL,
    `grade`            int(1)         DEFAULT 0,
    `category1`        varchar(50) NOT NULL,
    `category2`        varchar(50) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`event_id`) REFERENCES event (`id`)
);
```

- `store_type`
  - 보관 방법
  - 0: 냉장, 1: 냉동, 2: 상온
  - default 0
- `cost_price`: 원가 정보
- `category1`: 상품 대분류
- `category2`: 상품 소분류