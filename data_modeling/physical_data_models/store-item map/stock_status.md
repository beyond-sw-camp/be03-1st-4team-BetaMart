# ✍️ store_status 상세 정보

- 매장/상품 매핑 테이블
- 각 매장 별 재고 현황을 파악하는 것이 주 목적

```mariadb
CREATE TABLE IF NOT EXISTS `stock_status`
(
    `id`         bigint   NOT NULL AUTO_INCREMENT,
    `item_id`    bigint   NOT NULL,
    `store_id`   bigint   NOT NULL UNIQUE,
    `stocked`    datetime NOT NULL,
    `damaged`    int,
    `item_stock` int DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`item_id`) REFERENCES item (`id`),
    FOREIGN KEY (`store_id`) REFERENCES store_info (`id`)
);
```

- `stocked`: 입고 날짜
- `damaged`: 파손 상품 개수
- `item_stock`: 상품별 재고 현황