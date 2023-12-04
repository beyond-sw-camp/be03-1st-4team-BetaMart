# ✍️ crew 상세 정보
>Beta마트 전체 직원정보테이블

```mariadb
CREATE TABLE IF NOT EXISTS `crew`
(
    `id`          BIGINT           NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(20)      NOT NULL,
    `age`         TINYINT UNSIGNED NOT NULL,
    `gender`      ENUM ('M', 'W', 'NONE')   DEFAULT 'NONE',
    `start_date`  DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `end_date`    DATETIME,
    `addr_id`     BIGINT,
    `addr_detail` VARCHAR(45),
    `work_type`   VARCHAR(40),
    `store_id`    BIGINT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`addr_id`) REFERENCES `addr_info` (`id`) ON UPDATE SET NULL ON DELETE SET NULL,
    FOREIGN KEY (`store_id`) REFERENCES `store_info` (`id`) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `name`: 크루 이름
- `age`: 크루 나이
- `gender`: 크루 성별. default는 NONE
- `start_date`: 합류 날짜
- `end_date`: 퇴사 날짜
- `addr_id`: FK, addr_info 테이블의 id
- `addr_detail`: 상세 주소
- `work_type`: 담당 직무 (점장, 매니저, 포장, 배달)
- `store_id`: FK, store_info 테이블의 id
