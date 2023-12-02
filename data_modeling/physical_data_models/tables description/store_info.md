# ✍️ store_info 상세 정보

```mariadb
-- store_info 테이블
CREATE TABLE IF NOT EXISTS `store_info`
(
    `id`            BIGINT(20) NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(20) DEFAULT NULL UNIQUE,
    `manager`       VARCHAR(20) DEFAULT NULL,
    `tel`           CHAR(11) DEFAULT NULL,
    `addr_id`       INT(11) DEFAULT NULL,
    `addr_details`  VARCHAR(45) DEFAULT NULL,
    `covered_area`  VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`addr_id`) REFERENCES addr_info(id) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
```

- `id`: `store_info` 테이블의 PK
- `name`: 매장명
- `manager`: 점장 이름
- `tel`: 매장 번호
- `addr_id`: FK references `addr_info`
- `addr_details`: 매장 상세 주소
- `covered_area`: 매장의 담당 지역(단일)