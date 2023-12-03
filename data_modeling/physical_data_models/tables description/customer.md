✍️ customer 상세 정보

```mariadb
-- customer 테이블
CREATE TABLE IF NOT EXISTS `customer`
(
    `id`          BIGINT      NOT NULL AUTO_INCREMENT,
    `user_id`     VARCHAR(50) NOT NULL,
    `name`        VARCHAR(10) NOT NULL,
    `password`    VARCHAR(20) NOT NULL,
    `tel`         VARCHAR(15) NOT NULL,
    `addr_id`     BIGINT,
    `age`         TINYINT UNSIGNED,
    `gender`      ENUM ('M', 'W', 'NONE') DEFAULT 'NONE',
    `point`       INT UNSIGNED,
    `alarm`       ENUM ('Y','N')          DEFAULT 'Y',
    `signin_date` DATETIME                DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`addr_id`) REFERENCES addr_info (`id`) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `user_id`: 유저 ID
- `name`: 이름
- `password`: 비밀번호
- `tel`: 전화번호
- `addr_id`: FK (addr_info의 id)
- `age`: 나이
- `gender`
  - 'M': 남성
  - 'W': 여성
  - 'NONE': 입력하지 않음. 기본값
- `point`: 누적 포인트
- `alarm`: 알림 수신 여부
- `signin_date`: 가입일.