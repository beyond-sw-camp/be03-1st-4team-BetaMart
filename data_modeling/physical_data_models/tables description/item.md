# ✍️ item 상세 정보
> Beta마트 전체재고수량 테이블

```mariadb
CREATE TABLE IF NOT EXISTS `item`
(
    `id`          BIGINT      NOT NULL AUTO_INCREMENT,
    `description` TEXT        NOT NULL,
    `name`        VARCHAR(50) NOT NULL,
    `item_type`   ENUM ('냉장', '냉동', '상온', '해당없음') DEFAULT '해당없음',
    `expire_date` DATETIME,
    `cost_price`  INT UNSIGNED                    DEFAULT NULL,
    `grade`       TINYINT UNSIGNED                DEFAULT 0 CHECK (`grade` BETWEEN 0 AND 5),
    `category`    VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;
```

- `id`: PK
- `description`: 상품 상세 정보
- `name`: 상품명
- `item_type`
    - 보관 방법
    - 보관 방법에 영향을 받지 않는 제품(e.g. 생활용품, 가전)은 '해당없음'으로 표시한다.
    - 기본 값은 '해당없음'
- `expire_date`: 유통기한
- `cost_price`: 원가 정보
- `grade`: 평점. 0이상 5이하의 정수만 입력할 수 있다.
- `category`: 상품 분류
