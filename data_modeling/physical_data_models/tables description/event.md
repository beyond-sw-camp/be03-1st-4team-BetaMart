# ✍️ event 상세 정보

```mariadb
-- event 테이블
CREATE TABLE IF NOT EXISTS `event`
(
    `id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `item_id`     BIGINT       NOT NULL,
    `discount`    INT(11) UNSIGNED DEFAULT 0 CHECK (`discount` BETWEEN 0 AND 100),
    `event_name`  VARCHAR(255) NOT NULL,
    `start_time`  DATETIME     NOT NULL,
    `expire_time` DATETIME     NOT NULL,
    `company`     VARCHAR(100),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`item_id`) REFERENCES item (id) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `item_id`: FK(item 테이블 id)
- `discount`
    - 할인율.
    - 0이상 100이하의 정수만 입력할 수 있다.
    - DEFAULT는 0.
- `event_name`: 이벤트명
- `start_time`: 이벤트 시작일과 시간
- `expire_time`: 이벤트 종료일과 시간
- `company` : event 주최 회사
