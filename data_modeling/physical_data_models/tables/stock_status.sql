-- stock_status 테이블
CREATE TABLE IF NOT EXISTS `stock_status`
(
    `id`            BIGINT(20) NOT NULL AUTO_INCREMENT,
    `store_item_id` BIGINT(20) NOT NULL,
    `stocked_time`  DATETIME   DEFAULT CURRENT_TIMESTAMP,
    `damaged`       ENUM ('Y','N'),
    `item_stock`    TINYINT(3) DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`store_item_id`) REFERENCES `store_item` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;