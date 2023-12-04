# ✍️ store_status 상세 정보

> 파손제품 수량확인 테이블
```mariadb
CREATE TABLE IF NOT EXISTS `stock_status`
(
    `id`            BIGINT NOT NULL AUTO_INCREMENT,
    `store_item_id` BIGINT NOT NULL,
    `stocked_time`  DATETIME     DEFAULT CURRENT_TIMESTAMP,
    `damaged`       INT UNSIGNED DEFAULT 0,
    `item_stock`    INT UNSIGNED DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`store_item_id`) REFERENCES `store_item` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `store_item_id`: FK, store_item의 id
- `stocked_time`: 입고 날짜
- `damaged`: 파손 상품 개수
- `item_stock`: 상품별 재고 현황

> 🚨 기존 `damaged`의 데이터 타입이 ENUM으로 되어 있던 것을 파손 제품의 개수를 명확하게 파악할 수 있도록 INT 타입으로 수정했습니다. 
