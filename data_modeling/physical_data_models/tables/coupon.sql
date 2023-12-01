CREATE TABLE `coupon_list` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`coupon_name` VARCHAR(255) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`price` INT(11) NOT NULL DEFAULT '0',
	`expire_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;;

CREATE TABLE `coupon_published` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL DEFAULT '0',
	`whether_used` CHAR(1) NOT NULL DEFAULT 'N' COLLATE 'utf8mb4_general_ci',
	`download_date` DATETIME NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE
) COLLATE='utf8mb4_general_ci' ENGINE=InnoDB;
