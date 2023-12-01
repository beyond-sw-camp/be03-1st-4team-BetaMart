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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;; 
