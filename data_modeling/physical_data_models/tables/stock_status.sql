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