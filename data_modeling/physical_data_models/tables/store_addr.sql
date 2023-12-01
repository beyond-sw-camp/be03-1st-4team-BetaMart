-- hanwha_db_team4 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `hanwha_db_team4`;
USE `hanwha_db_team4`;

-- 테이블 hanwha_db_team4.store_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_addr`
(
    `id`               bigint(20)  NOT NULL AUTO_INCREMENT,
    `branch_name`      varchar(20) NOT NULL,
    `beopjeongdong`    varchar(10) NOT NULL,
    `city`             varchar(40) NOT NULL,
    `sigungu`          varchar(40) NOT NULL,
    `eupmyeondong`     varchar(40) NOT NULL,
    `lee`              varchar(40)          DEFAULT NULL,
    `mountain`         varchar(1)  NOT NULL DEFAULT '0',
    `street_code`      varchar(12) NOT NULL,
    `street_name`      varchar(80) NOT NULL,
    `zip_code`         varchar(5)  NOT NULL,
    `building`         varchar(40)          DEFAULT NULL,
    `building_details` varchar(100)         DEFAULT NULL,
    `details`          varchar(255)         DEFAULT NULL,
    PRIMARY KEY (`id`)
);