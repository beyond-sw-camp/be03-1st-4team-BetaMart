# ✍️ store_addr 상세 정보

```mariadb
CREATE TABLE IF NOT EXISTS `store_addr`
(
    `id`            bigint(20)  NOT NULL AUTO_INCREMENT,
    `branch_name`   varchar(20) NOT NULL,
    `beopjeongdong` varchar(10) NOT NULL,
    `city`          varchar(40) NOT NULL,
    `sigungu`       varchar(40) NOT NULL,
    `eupmyeondong`  varchar(40) NOT NULL,
    `lee`           varchar(40)          DEFAULT NULL,
    `mountain`      varchar(1)  NOT NULL DEFAULT '0',
    `street_code`   varchar(12) NOT NULL,
    `street_name`   varchar(80) NOT NULL,
    `zip_code`      varchar(5)  NOT NULL,
    `building`      varchar(40)          DEFAULT NULL,
    `details`       varchar(255)         DEFAULT NULL,
    PRIMARY KEY (`id`)
);
```

- `id`: `store_addr` 테이블의 PK
- `branch_name`: 매장 이름
- `beopjeongdong`: 법정동
- `city`: 시도명
- `sigungu`: 시군구명
- `eupmyeondong`: 법정읍면동명
- `lee`: 법정리명
- `mountain`: 산여부, 대지(0), 산(1), 기본값은 대지
- `street_code`: 도로명코드
- `street_name`: 도로명
- `zip_code`: 우편번호
- `building`: 건축물대장 건물명
- `building_details`: 상세건물명
- `details`: 상세주소

### Reference.

- [데이터 베이스 도로명 주소 테이블 구축하기_MySQL](https://m.blog.naver.com/pkm500/222380977788)