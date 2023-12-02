-- addr_info 테이블
CREATE TABLE IF NOT EXISTS `addr_info`
(
    `id`               INT(11)        NOT NULL AUTO_INCREMENT,
    `stat_code`        VARCHAR(10)    NOT NULL,
    `city`             VARCHAR(40)    NOT NULL,
    `sigungu`          VARCHAR(40)    NOT NULL,
    `eupmyeondong`     VARCHAR(40)    NOT NULL,
    `lee`              VARCHAR(40)             DEFAULT NULL,
    `mountain`         ENUM ('0','1') NOT NULL DEFAULT '0',
    `street_code`      VARCHAR(12)    NOT NULL,
    `street_name`      VARCHAR(80)    NOT NULL,
    `zip_code`         VARCHAR(5)     NOT NULL,
    `building`         VARCHAR(40)             DEFAULT NULL,
    `building_details` VARCHAR(100)            DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;