CREATE DATABASE IF NOT EXISTS `Beta_Mart`;
USE `Beta_Mart`;

-- addr_info 테이블
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

-- item 테이블
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

-- 전체 coupon table
CREATE TABLE IF NOT EXISTS `coupon_list`
(
    `id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `coupon_name` VARCHAR(50)  NOT NULL,
    `price`       INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- event 테이블
CREATE TABLE IF NOT EXISTS `event`
(
    `id`          BIGINT       NOT NULL AUTO_INCREMENT,
    `item_id`     BIGINT       NOT NULL,
    `discount`    INT(11) UNSIGNED DEFAULT 0 CHECK (`discount` BETWEEN 0 AND 100),
    `event_name`  VARCHAR(255) NOT NULL,
    `start_time`  DATETIME     NOT NULL,
    `expire_time` DATETIME     NOT NULL,
    `company`     VARCHAR(100),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`item_id`) REFERENCES item (id) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- store_info 테이블
CREATE TABLE IF NOT EXISTS `store_info`
(
    `id`           BIGINT NOT NULL AUTO_INCREMENT,
    `name`         VARCHAR(20) UNIQUE,
    `manager`      VARCHAR(20),
    `tel`          VARCHAR(15),
    `addr_id`      BIGINT,
    `addr_details` VARCHAR(50),
    `covered_area` VARCHAR(20),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`addr_id`) REFERENCES addr_info (id) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- customer 테이블
CREATE TABLE IF NOT EXISTS `customer`
(
    `id`          BIGINT      NOT NULL AUTO_INCREMENT,
    `user_id`     VARCHAR(50) NOT NULL UNIQUE,
    `name`        VARCHAR(10) NOT NULL,
    `password`    VARCHAR(20) NOT NULL UNIQUE,
    `tel`         VARCHAR(15) NOT NULL UNIQUE,
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

-- 사용자 별 보유 쿠폰 리스트
CREATE TABLE IF NOT EXISTS `ownership_coupon`
(
    `id`          BIGINT NOT NULL AUTO_INCREMENT,
    `customer_id` BIGINT NOT NULL,
    `coupon_id`   BIGINT NOT NULL,
    `is_used`     ENUM ('Y','N') DEFAULT 'N',
    `issue_date`  DATETIME,
    `expire_date` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`coupon_id`) REFERENCES `coupon_list` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- crew 테이블
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
    `store_id`    BIGINT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`addr_id`) REFERENCES `addr_info` (`id`) ON UPDATE SET NULL ON DELETE SET NULL,
    FOREIGN KEY (`store_id`) REFERENCES `store_info` (`id`) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- orders 테이블
CREATE TABLE IF NOT EXISTS `orders`
(
    `id`           BIGINT       NOT NULL AUTO_INCREMENT,
    `order_number` INT UNSIGNED NOT NULL,
    `customer_id`  BIGINT,
    `total_count`  INT UNSIGNED NOT NULL,
    `use_point`    INT UNSIGNED DEFAULT 0,
    `total_price`  INT UNSIGNED NOT NULL,
    `distance`     INT          NOT NULL,
    `coupon_id`    BIGINT,
    `crew_id`      BIGINT,
    `deliveryfee`  INT UNSIGNED NOT NULL,
    `order_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE SET NULL ON DELETE SET NULL,
    FOREIGN KEY (`coupon_id`) REFERENCES `ownership_coupon` (`id`) ON UPDATE SET NULL ON DELETE SET NULL,
    FOREIGN KEY (`crew_id`) REFERENCES `crew` (`id`) ON UPDATE SET NULL ON DELETE SET NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- store_item 테이블
CREATE TABLE IF NOT EXISTS `store_item`
(
    `id`       BIGINT NOT NULL AUTO_INCREMENT,
    `store_id` BIGINT NOT NULL,
    `item_id`  BIGINT NOT NULL,
    `count`    INT UNSIGNED DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`store_id`) REFERENCES `store_info` (`id`),
    FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- stock_status 테이블
CREATE TABLE IF NOT EXISTS `stock_status`
(
    `id`            BIGINT NOT NULL AUTO_INCREMENT,
    `store_item_id` BIGINT NOT NULL,
    `stocked_time`  DATETIME     DEFAULT CURRENT_TIMESTAMP,
    `damaged`       INT UNSIGNED DEFAULT 0,
    `item_stock`    INT UNSIGNED DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`store_item_id`) REFERENCES `store_item` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- delivery 테이블
CREATE TABLE IF NOT EXISTS `delivery`
(
    `id`       BIGINT                NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(50)           NOT NULL,
    `state`    ENUM ('PICK', 'WAIT') NOT NULL,
    `locate`   VARCHAR(255)          NOT NULL,
    `order_id` BIGINT                NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

-- order_details 테이블
CREATE TABLE IF NOT EXISTS `order_details`
(
    `id`            BIGINT       NOT NULL AUTO_INCREMENT,
    `count`         INT UNSIGNED NOT NULL,
    `store_item_id` BIGINT       NOT NULL,
    `order_id`      BIGINT       NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`store_item_id`) REFERENCES `store_item` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;