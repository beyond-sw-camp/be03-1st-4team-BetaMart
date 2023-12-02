CREATE DATABASE IF NOT EXISTS `Beta_Mart`;
USE `Beta_Mart`;

-- addr_info 테이블
CREATE TABLE IF NOT EXISTS `addr_info`
(
    `id`               INT(11)     NOT NULL AUTO_INCREMENT,
    `stat_code`        VARCHAR(10)    NOT NULL,
    `city`             VARCHAR(40)    NOT NULL,
    `sigungu`          VARCHAR(40)    NOT NULL,
    `eupmyeondong`     VARCHAR(40)    NOT NULL,
    `lee`              VARCHAR(40)    DEFAULT NULL,
    `mountain`         ENUM('0','1')  NOT NULL DEFAULT '0',
    `street_code`      VARCHAR(12)    NOT NULL,
    `street_name`      VARCHAR(80)    NOT NULL,
    `zip_code`         VARCHAR(5)     NOT NULL,
    `building`         VARCHAR(40)    DEFAULT NULL,
    `building_details` VARCHAR(100)   DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- item 테이블
CREATE TABLE IF NOT EXISTS `item`
(
    `id`               BIGINT(20)      NOT NULL AUTO_INCREMENT,
    `description`      TEXT        NOT NULL,
    `name`             VARCHAR(30) NOT NULL,
    `item_type`        ENUM ('0', '1', '2') DEFAULT '0',
    `expire_date`      DATETIME,
    `cost_price`       INT(11)        DEFAULT NULL,
    `grade`            TINYINT(3)         DEFAULT 0,
    `category`        VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 전체 coupon table
CREATE TABLE IF NOT EXISTS `coupon_list` (
	`id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
	`coupon_name` VARCHAR(50) NOT NULL,
	`price`       INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- event 테이블
CREATE TABLE IF NOT EXISTS `event` (
  `id`          INT(11) NOT NULL AUTO_INCREMENT,
  `item_id`     BIGINT(11) NOT NULL,
  `discount`    INT(11) NOT NULL,
  `event_type`  VARCHAR(45) NOT NULL,
  `expire_time` DATETIME NOT NULL,
  `company`     VARCHAR(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  FOREIGN KEY (`item_id`) REFERENCES item(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- customer 테이블
CREATE TABLE IF NOT EXISTS `customer` (
	`id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
	`user_id`     VARCHAR(50) NOT NULL,
	`name`        VARCHAR(10) NOT NULL, 
	`password`    VARCHAR(20) NOT NULL,
	`tel`         CHAR(11) NOT NULL,
	`addr_id`     INT(11) DEFAULT NULL,
	`age`         TINYINT(3) NULL DEFAULT NULL,
	`gender`      ENUM('M','W') NOT NULL,
	`point`       INT(11) NULL DEFAULT NULL,
	`alarm`       ENUM('Y','N') NULL DEFAULT 'Y',
	`signin_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`) USING BTREE,
  FOREIGN KEY (`addr_id`) REFERENCES `addr_info`(`id`) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 사용자 별 보유 쿠폰 리스트
CREATE TABLE IF NOT EXISTS `ownership_coupon` (
	`id`            BIGINT(20) NOT NULL AUTO_INCREMENT,
	`customer_id`   BIGINT(20) NOT NULL,
  `coupon_id`     BIGINT(20) NOT NULL,
	`is_used`       ENUM('Y','N') NOT NULL DEFAULT 'N',
	`expire_date`   DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`) USING BTREE,
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`coupon_id`) REFERENCES `coupon_list`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- crew 테이블
CREATE TABLE IF NOT EXISTS `crew` (
	`id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
	`name`        VARCHAR(10) NOT NULL,
	`age`         TINYINT(3) UNSIGNED NOT NULL,
	`gender`      ENUM('M','W') NOT NULL,
	`start_date`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date`    DATETIME NULL,
  `addr_id`     INT(11) DEFAULT NULL,
  `addr_detail` VARCHAR(45) NULL,
	`store_id`    BIGINT(20) DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	FOREIGN KEY (`addr_id`) REFERENCES `addr_info`(`id`) ON UPDATE SET NULL ON DELETE SET NULL,
  FOREIGN KEY (`store_id`) REFERENCES `store_info`(`id`) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- orders 테이블
CREATE TABLE IF NOT EXISTS `orders` (
  `id`                BIGINT(11) NOT NULL AUTO_INCREMENT,
  `order_number`      INT(11) NOT NULL,
  `customer_id`       BIGINT(20) DEFAULT NULL,
  `total_count`       INT(11) NOT NULL,
  `use_point`         INT(11) DEFAULT 0,
  `total_price`       INT(11) NOT NULL,
  `distance`          INT(11) NOT NULL,
  `order_item_id_fk`  VARCHAR(50) NOT NULL,
  `coupon_id`         BIGINT(20) DEFAULT NULL,
  `crew_id`           BIGINT(20) DEFAULT NULL,
  `deliveryfee`       INT(11) NOT NULL,
  `order_time`        DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)  USING BTREE,
  FOREIGN KEY (`customer_id`)   REFERENCES `customer`(`id`)   ON UPDATE SET NULL ON DELETE SET NULL,
  FOREIGN KEY (`coupon_id`)     REFERENCES `ownership_coupon`(`id`)     ON UPDATE SET NULL ON DELETE SET NULL,
  FOREIGN KEY (`crew_id`)       REFERENCES `crew`(`id`)       ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- store_item 테이블
CREATE TABLE IF NOT EXISTS `store_item`
(
    `id`          BIGINT(20)   NOT NULL AUTO_INCREMENT,
    `store_id`    BIGINT(20) NOT NULL,
    `item_id`     BIGINT(20) NOT NULL,
    `count`       TINYINT(3) DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`store_id`)  REFERENCES `store_info`(`id`),
    FOREIGN KEY (`item_id`)   REFERENCES `item`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- stock_status 테이블
CREATE TABLE IF NOT EXISTS `stock_status`
(
    `id`            BIGINT(20)   NOT NULL AUTO_INCREMENT,
    `store_item_id` BIGINT(20) NOT NULL,
    `stocked_time`  DATETIME DEFAULT CURRENT_TIMESTAMP,
    `damaged`       ENUM('Y','N'),
    `item_stock`    TINYINT(3) DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`store_item_id`) REFERENCES `store_item`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- delivery 테이블
CREATE TABLE IF NOT EXISTS `delivery` (
	`id`        BIGINT(20)  NOT NULL AUTO_INCREMENT,
	`name`      VARCHAR(10) NOT NULL,
	`state`     ENUM('PICK','WAIT') NOT NULL,
	`locate`    VARCHAR(255) NOT NULL,
	`order_id`  BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `order_details` (
	`id`        BIGINT(20)  NOT NULL AUTO_INCREMENT,
	`count`     TINYINT(3) NOT NULL,
  `store_item_id`  BIGINT(20) NOT NULL,
	`order_id`  BIGINT(20) NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`store_item_id`) REFERENCES `store_item`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;