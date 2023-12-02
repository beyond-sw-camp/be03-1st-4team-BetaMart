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
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;