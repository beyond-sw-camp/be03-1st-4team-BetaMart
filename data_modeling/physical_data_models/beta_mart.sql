-- store_info 테이블
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


-- store_addr 테이블
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


-- orders 테이블
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id_pk` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `user_id_fk` varchar(50) NOT NULL,
  `user_address_fk` varchar(50) NOT NULL,
  `order_item_id_fk` varchar(50) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `coupon_fk` int(11) DEFAULT 0,
  `point_fk` int(11) DEFAULT 0,
  `actual payment_amount` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  `deliveryfee` int(11) NOT NULL,
  `order_time` datetime NOT NULL,
  PRIMARY KEY (`orders_id_pk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- item 테이블
CREATE TABLE IF NOT EXISTS `item`
(
    `id`               bigint      NOT NULL AUTO_INCREMENT,
    `event_id`         bigint      not null unique,
    `item_description` text        NOT NULL,
    `item_name`        varchar(30) NOT NULL,
    `store_type`       enum (0, 1, 2) DEFAULT 0,
    `expire_date`      datetime,
    `cost_price`       decimal        DEFAULT NULL,
    `grade`            int(1)         DEFAULT 0,
    `category1`        varchar(50) NOT NULL,
    `category2`        varchar(50) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`event_id`) REFERENCES event (`id`)
);


-- event 테이블
CREATE TABLE IF NOT EXISTS `event` (
  `event_id_pk` int(11) NOT NULL,
  `event_item_id_fk` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `expire time` datetime NOT NULL,
  `company` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id_pk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- delivery 테이블
CREATE TABLE `delivery` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`rider_name` VARCHAR(10) NOT NULL,
	`rider_state` ENUM('PICK','WAIT') NOT NULL,
	`rider_locate` VARCHAR(255) NOT NULL,
	`order_number` INT UNSIGNED NOT NULL DEFAULT 0,
	`store_id` BIGINT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	INDEX `order_number` (`order_number`),
	UNIQUE INDEX `order_number` (`order_number`),
	INDEX `store_id` (`store_id`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- customer 테이블
CREATE TABLE `customer` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`password` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tel` CHAR(11) NOT NULL COLLATE 'utf8mb4_general_ci',
	`address` VARCHAR(255) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`age` INT(11) NULL DEFAULT NULL,
	`gender` ENUM('M','W') NOT NULL COLLATE 'utf8mb4_general_ci',
	`point` BIGINT(20) NULL DEFAULT NULL,
	`alarm` CHAR(1) NULL DEFAULT 'Y' COLLATE 'utf8mb4_general_ci',
	`signin_date` DATETIME NULL DEFAULT NULL,
	`coupon` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- crew 테이블
CREATE TABLE `crew` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_general_ci',
	`age` INT(11) UNSIGNED NOT NULL,
	`gender` ENUM('M','W') NOT NULL COLLATE 'utf8mb4_general_ci',
	`duty_start_date` DATETIME NULL DEFAULT current_timestamp(),
	`store_id` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `store_id` (`store_id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'


-- 전체 coupon table
CREATE TABLE `coupon_list` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`coupon_name` VARCHAR(255) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`price` INT(11) NOT NULL DEFAULT '0',
	`expire_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- coupon 발행테이블(중간)
CREATE TABLE `coupon_published` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL DEFAULT '0',
	`whether_used` CHAR(1) NOT NULL DEFAULT 'N' COLLATE 'utf8mb4_general_ci',
	`download_date` DATETIME NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


-- stock_status 테이블
CREATE TABLE IF NOT EXISTS `stock_status`
(
    `id`         bigint   NOT NULL AUTO_INCREMENT,
    `item_id`    bigint   NOT NULL,
    `store_id`   bigint   NOT NULL UNIQUE,
    `stocked`    datetime NOT NULL,
    `damaged`    int,
    `item_stock` int DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`item_id`) REFERENCES item (`id`),
    FOREIGN KEY (`store_id`) REFERENCES store_info (`id`)
);