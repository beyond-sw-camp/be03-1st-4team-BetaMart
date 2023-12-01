-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.3.0-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- orders 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `orders` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `orders`;

-- 테이블 orders.orders 구조 내보내기
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

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
