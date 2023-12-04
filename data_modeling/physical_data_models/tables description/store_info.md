# ✍️ store_info 상세 정보
> Beta 마트 매장정보

```mariadb
CREATE TABLE IF NOT EXISTS `store_info`
(
    `id`           BIGINT NOT NULL AUTO_INCREMENT,
    `name`         VARCHAR(20) UNIQUE,
    `manager`      VARCHAR(20),
    `tel`          VARCHAR(15),
    `addr_id`      BIGINT,
    `addr_details` VARCHAR(50),
    `covered_area` VARCHAR(20),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`addr_id`) REFERENCES addr_info (id) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `name`: 매장명
- `manager`: 점장 이름
- `tel`: 매장 번호
- `addr_id`: FK (addr_info 테이블의 id)
- `addr_details`: 매장 상세 주소
- `covered_area`: 매장의 담당 지역(단일)
