-- hanwha_db_team4 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `hanwha_db_team4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `hanwha_db_team4`;

-- 테이블 hanwha_db_team4.store_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `store_info`
(
    `id`            bigint(20) NOT NULL AUTO_INCREMENT,
    `store_addr_id` bigint(20) NOT NULL UNIQUE,
    `store_name`    varchar(20) DEFAULT NULL UNIQUE,
    `store_manager` varchar(20) DEFAULT NULL,
    `tel1`          varchar(20) DEFAULT NULL,
    `tel2`          varchar(20) DEFAULT NULL,
    `tel3`          varchar(20) DEFAULT NULL,
    `covered_area`  varchar(20) DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`store_addr_id`) REFERENCES store_addr (`id`)
);