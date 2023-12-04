# ✍️ delivery 상세 정보
> 배송정보테이블

```mariadb
CREATE TABLE IF NOT EXISTS `delivery`
(
    `id`       BIGINT                NOT NULL AUTO_INCREMENT,
    `crew_id`  BIGINT,
    `state`    ENUM ('PICK', 'WAIT') NOT NULL,
    `locate`   VARCHAR(255)          NOT NULL,
    `distance`     INT          NOT NULL,
    `deliveryfee`  INT UNSIGNED      NOT NULL,
    `order_id` BIGINT                NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY ('crew_id') REFERENCES `crew` (`id`) ON DELETE SET NULL ON UDPATE CASCADE,
    FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `name`: 라이더 명
- `distance` : 배달 거리
- `deliveryfee`: 배달료
- `crew_id`: FK. 매장 내에서 일하는 직원의 ID를 가져온다. 여기서는 배달담당자의 정보를 가져오기 위해 필요.
- `state`: 매장 내에서 배달 대기 중인 물건의 배달 상태(가져갔는지, 대기상태인지)
- `locate`: 매장 내에서 배달 대기 중인 물건의 위치(포장이 완료된 물건 픽업위치표시)
- `order_id`: FK, orders 테이블의 id
