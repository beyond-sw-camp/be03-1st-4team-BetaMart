CREATE TABLE `crew` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_general_ci',
	`age` INT(11) UNSIGNED NOT NULL,
	`gender` ENUM('M','W') NOT NULL COLLATE 'utf8mb4_general_ci',
	`duty_start_date` DATETIME NULL DEFAULT current_timestamp(),
	`store_id` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;;