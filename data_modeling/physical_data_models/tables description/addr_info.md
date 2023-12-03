# ✍️ addr_info 상세 정보

```mariadb
CREATE TABLE IF NOT EXISTS `addr_info`
(
    `id`               BIGINT          NOT NULL AUTO_INCREMENT,
    `stat_code`        VARCHAR(10)     NOT NULL,
    `city`             VARCHAR(40)     NOT NULL,
    `sigungu`          VARCHAR(40)     NOT NULL,
    `eupmyeondong`     VARCHAR(40)     NOT NULL,
    `lee`              VARCHAR(40)              DEFAULT NULL,
    `mountain`         ENUM ('대지','산') NOT NULL DEFAULT '대지',
    `street_code`      VARCHAR(12)     NOT NULL,
    `street_name`      VARCHAR(80)     NOT NULL,
    `zip_code`         VARCHAR(5)      NOT NULL,
    `building`         VARCHAR(40)              DEFAULT NULL,
    `building_details` VARCHAR(100)             DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `stat_code`: 법정동코드
- `city`: 시도명
- `sigungu`: 시군구명
- `eupmyeondong`: 법정읍면동명
- `lee`: 법정리명
- `mountain`: 산지여부, 기본값은 대지
- `street_code`: 도로명코드
- `street_name`: 도로명
- `zip_code`: 우편번호
- `building`: 건물명
- `building_details`: 빌딩 상세 정보

### Reference.

- [데이터 베이스 도로명 주소 테이블 구축하기_MySQL](https://m.blog.naver.com/pkm500/222380977788)