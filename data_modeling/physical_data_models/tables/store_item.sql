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