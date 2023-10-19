-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 10, 2023 at 03:19 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: "id21104298_youtube_database"
--
CREATE DATABASE IF NOT EXISTS "id21104298_youtube_database" DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE "id21104298_youtube_database";

-- --------------------------------------------------------

--
-- Table structure for table "address"
--

CREATE TABLE "address" (
  "address_id" int(11) NOT NULL,
  "address_usersid" int(11) NOT NULL,
  "address_city" varchar(100) NOT NULL,
  "address_street" varchar(100) NOT NULL,
  "address_name" varchar(100) NOT NULL COMMENT 'the name that the user prefer for example the home or the place of work.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table "address"
--

INSERT INTO "address" ("address_id", "address_usersid", "address_city", "address_street", "address_name") VALUES
(1, 40, 'دمشق', 'شارع النصر مقابل مشفى ابن النفيس', 'المنزل'),
(2, 40, 'دمشق', 'لا باشا جامع الإيمان', 'مكان العمل');

-- --------------------------------------------------------

--
-- Table structure for table "admin"
--

CREATE TABLE "admin" (
  "admin_id" int(11) NOT NULL,
  "admin_name" varchar(100) NOT NULL,
  "admin_email" varchar(100) NOT NULL,
  "admin_password" varchar(255) NOT NULL,
  "admin_phone" varchar(100) NOT NULL,
  "admin_createdAt" timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table "admin"
--

INSERT INTO "admin" ("admin_id", "admin_name", "admin_email", "admin_password", "admin_phone", "admin_createdAt") VALUES
(41, 'أحمد صالح', 'demo@gmail.com', '12345', '0969013933', '2023-10-02 11:57:09');

-- --------------------------------------------------------

--
-- Table structure for table "ads"
--

CREATE TABLE "ads" (
  "ads_id" int(11) NOT NULL,
  "ads_title" varchar(100) NOT NULL,
  "ads_title_ar" varchar(100) NOT NULL,
  "ads_body" varchar(100) NOT NULL,
  "ads_body_ar" varchar(100) NOT NULL,
  "ads_datatime" timestamp NOT NULL DEFAULT current_timestamp(),
  "ads_color" varchar(100) NOT NULL,
  "ads_color_circle" varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table "ads"
--

INSERT INTO "ads" ("ads_id", "ads_title", "ads_title_ar", "ads_body", "ads_body_ar", "ads_datatime", "ads_color", "ads_color_circle") VALUES
(4, 'A Summer surprise', 'مفاجأة الصيف', 'discount 20%', 'خصم 20%', '2023-10-08 12:35:34', '4294938624', '4294951175'),
(5, 'Crismis Surprise', ' عرض رأس السنة', 'Discount 10%', 'خصم 10%', '2023-10-08 12:38:18', '4284073967', '4279010222'),
(8, 'bb', 'bb', 'bb', 'bb', '2023-10-08 14:05:38', '4294901912', '4288091477');

-- --------------------------------------------------------

--
-- Table structure for table "cart"
--

CREATE TABLE "cart" (
  "cart_id" int(11) NOT NULL,
  "cart_usersid" int(11) NOT NULL,
  "cart_productsid" int(11) NOT NULL,
  "cart_products_count" int(11) NOT NULL DEFAULT 1,
  "cart_total_product_price" float NOT NULL,
  "cart_orders" int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view "cartsview"
-- (See below for the actual view)
--
CREATE TABLE "cartsview" (
"products_id" int(11)
,"products_name" varchar(100)
,"products_name_ar" varchar(100)
,"products_description" varchar(255)
,"products_description_ar" varchar(255)
,"products_image" varchar(255)
,"products_count" int(11)
,"products_active" tinyint(4)
,"products_price" float
,"products_discount" smallint(6)
,"products_datetime" timestamp
,"products_categories" int(11)
,"categories_id" int(11)
,"categories_name" varchar(100)
,"categories_name_ar" varchar(100)
,"categories_image" varchar(255)
,"categories_datetime" timestamp
,"cart_id" int(11)
,"cart_usersid" int(11)
,"cart_productsid" int(11)
,"cart_products_count" int(11)
,"cart_total_product_price" float
,"cart_orders" int(11)
,"products_price_discount" double
);

-- --------------------------------------------------------

--
-- Table structure for table "categories"
--

CREATE TABLE "categories" (
  "categories_id" int(11) NOT NULL,
  "categories_name" varchar(100) NOT NULL,
  "categories_name_ar" varchar(100) NOT NULL,
  "categories_image" varchar(255) NOT NULL,
  "categories_datetime" timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table "categories"
--

INSERT INTO "categories" ("categories_id", "categories_name", "categories_name_ar", "categories_image", "categories_datetime") VALUES
(1, 'berger', 'همبرغر', 'berger.svg', '2023-09-04 19:17:31'),
(2, 'samon', 'سمون', 'samon.svg', '2023-09-05 09:00:22'),
(3, 'brwonies', 'براونيز ', 'brownies.svg', '2023-09-05 09:00:58'),
(4, 'sableh', 'سابليه ', 'sableh.svg', '2023-09-05 09:02:35'),
(5, 'kler', 'كلير', 'kler.svg', '2023-09-05 09:03:14');

-- --------------------------------------------------------

--
-- Table structure for table "favorite"
--

CREATE TABLE "favorite" (
  "favorite_id" int(11) NOT NULL,
  "favorite_usersid" int(11) NOT NULL,
  "favorite_productsid" int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table "favorite"
--

INSERT INTO "favorite" ("favorite_id", "favorite_usersid", "favorite_productsid") VALUES
(1, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table "notification"
--

CREATE TABLE "notification" (
  "notification_id" int(11) NOT NULL,
  "notification_title" varchar(100) NOT NULL,
  "notification_title_ar" varchar(255) NOT NULL DEFAULT 'نتعامل لاحقاً',
  "notification_body" varchar(255) NOT NULL,
  "notification_body_ar" varchar(255) NOT NULL DEFAULT 'نتعامل لاحقاً',
  "notification_usersid" int(11) NOT NULL,
  "notification_datetime" timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table "notification"
--

INSERT INTO "notification" ("notification_id", "notification_title", "notification_title_ar", "notification_body", "notification_body_ar", "notification_usersid", "notification_datetime") VALUES
(1, 'نجاح', 'نتعامل لاحقاً', 'تمت الموافقة على الطلب', 'نتعامل لاحقاً', 40, '2023-10-07 11:20:25');

-- --------------------------------------------------------

--
-- Stand-in structure for view "orderdetailsview"
-- (See below for the actual view)
--
CREATE TABLE "orderdetailsview" (
"products_id" int(11)
,"products_name" varchar(100)
,"products_name_ar" varchar(100)
,"products_description" varchar(255)
,"products_description_ar" varchar(255)
,"products_image" varchar(255)
,"products_count" int(11)
,"products_active" tinyint(4)
,"products_price" float
,"products_discount" smallint(6)
,"products_datetime" timestamp
,"products_categories" int(11)
,"categories_id" int(11)
,"categories_name" varchar(100)
,"categories_name_ar" varchar(100)
,"categories_image" varchar(255)
,"categories_datetime" timestamp
,"cart_id" int(11)
,"cart_usersid" int(11)
,"cart_productsid" int(11)
,"cart_products_count" int(11)
,"cart_total_product_price" float
,"cart_orders" int(11)
,"products_price_discount" double
,"orders_id" int(11)
,"orders_usersid" int(11)
,"orders_address" int(11)
,"orders_type" tinyint(4)
,"orders_pricedelivery" int(11)
,"orders_allprodcutsprice" float
,"orders_coupon" int(11)
,"orders_datetime" timestamp
,"orders_paymentmethod" tinyint(4)
,"orders_state" varchar(100)
,"orders_total_price" double
,"address_id" int(11)
,"address_usersid" int(11)
,"address_city" varchar(100)
,"address_street" varchar(100)
,"address_name" varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table "orders"
--

CREATE TABLE "orders" (
  "orders_id" int(11) NOT NULL,
  "orders_usersid" int(11) NOT NULL,
  "orders_address" int(11) NOT NULL DEFAULT 0,
  "orders_type" tinyint(4) NOT NULL,
  "orders_pricedelivery" int(11) NOT NULL DEFAULT 0 COMMENT '0 => delivery ; 1 =>',
  "orders_allprodcutsprice" float NOT NULL,
  "orders_coupon" int(11) NOT NULL DEFAULT 0,
  "orders_datetime" timestamp NOT NULL DEFAULT current_timestamp(),
  "orders_paymentmethod" tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = cash\r\n1= card',
  "orders_state" varchar(100) NOT NULL DEFAULT '0',
  "orders_total_price" double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view "ordersview"
-- (See below for the actual view)
--
CREATE TABLE "ordersview" (
"orders_id" int(11)
,"orders_usersid" int(11)
,"orders_address" int(11)
,"orders_type" tinyint(4)
,"orders_pricedelivery" int(11)
,"orders_allprodcutsprice" float
,"orders_coupon" int(11)
,"orders_datetime" timestamp
,"orders_paymentmethod" tinyint(4)
,"orders_state" varchar(100)
,"orders_total_price" double
,"address_id" int(11)
,"address_usersid" int(11)
,"address_city" varchar(100)
,"address_street" varchar(100)
,"address_name" varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table "products"
--

CREATE TABLE "products" (
  "products_id" int(11) NOT NULL,
  "products_name" varchar(100) NOT NULL,
  "products_name_ar" varchar(100) NOT NULL,
  "products_description" varchar(255) NOT NULL,
  "products_description_ar" varchar(255) NOT NULL,
  "products_image" varchar(255) NOT NULL,
  "products_count" int(11) NOT NULL,
  "products_active" tinyint(4) NOT NULL DEFAULT 1,
  "products_price" float NOT NULL,
  "products_discount" smallint(6) NOT NULL,
  "products_datetime" timestamp NOT NULL DEFAULT current_timestamp(),
  "products_categories" int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table "products"
--

INSERT INTO "products" ("products_id", "products_name", "products_name_ar", "products_description", "products_description_ar", "products_image", "products_count", "products_active", "products_price", "products_discount", "products_datetime", "products_categories") VALUES
(1, 'Chicken Burger', 'همبرغر دجاج', 'Chicken Burger is the  best type of berger', 'برغر الدجاج هو أفضل أنواغ البرغر', 'chicken_burger.webp', 10, 1, 5.5, 0, '2023-09-05 15:52:17', 1),
(2, 'Pita Bread', 'صمون عربي', 'one of the best types of bread in the world', 'أفخر أنواع الصمون في سوريا', 'samon.jpg', 5, 1, 200, 10, '2023-09-05 15:57:34', 2),
(3, 'Brownies', 'براونيز', 'great and amazed Brownies', 'ذاكرة 500 غيغا بايت و كميرا 108 MP', 'brownies.webp', 1, 1, 1000, 20, '2023-09-05 16:01:14', 3),
(6, 'bb', 'bb', 'bb', 'bb', 'x.jpeg', 1, 0, 1, 1, '2023-10-05 15:24:22', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view "productsview"
-- (See below for the actual view)
--
CREATE TABLE "productsview" (
"products_id" int(11)
,"products_name" varchar(100)
,"products_name_ar" varchar(100)
,"products_description" varchar(255)
,"products_description_ar" varchar(255)
,"products_image" varchar(255)
,"products_count" int(11)
,"products_active" tinyint(4)
,"products_price" float
,"products_discount" smallint(6)
,"products_datetime" timestamp
,"products_categories" int(11)
,"categories_id" int(11)
,"categories_name" varchar(100)
,"categories_name_ar" varchar(100)
,"categories_image" varchar(255)
,"categories_datetime" timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view "topselling"
-- (See below for the actual view)
--
CREATE TABLE "topselling" (
"counttimes" bigint(21)
,"cart_id" int(11)
,"cart_usersid" int(11)
,"cart_productsid" int(11)
,"cart_products_count" int(11)
,"cart_total_product_price" float
,"cart_orders" int(11)
,"products_id" int(11)
,"products_name" varchar(100)
,"products_name_ar" varchar(100)
,"products_description" varchar(255)
,"products_description_ar" varchar(255)
,"products_image" varchar(255)
,"products_count" int(11)
,"products_active" tinyint(4)
,"products_price" float
,"products_discount" smallint(6)
,"products_datetime" timestamp
,"products_categories" int(11)
,"products_price_discount" double
);

-- --------------------------------------------------------

--
-- Table structure for table "users"
--

CREATE TABLE "users" (
  "users_id" int(11) NOT NULL,
  "users_name" varchar(100) NOT NULL,
  "users_email" varchar(100) NOT NULL,
  "users_password" varchar(255) NOT NULL,
  "users_phone" varchar(100) NOT NULL,
  "users_verifycode" int(11) NOT NULL,
  "users_approve" tinyint(4) NOT NULL DEFAULT 0,
  "users_createdAt" timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table "users"
--

INSERT INTO "users" ("users_id", "users_name", "users_email", "users_password", "users_phone", "users_verifycode", "users_approve", "users_createdAt") VALUES
(32, 'Housin ', 'housinasmail@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '123456789', 56526, 1, '2023-09-02 12:27:42'),
(33, 'Hdfg', 'zrrg@gh.gt', '8cb2237d0679ca88db6464eac60da96345513964', '144575552', 48326, 1, '2023-09-02 16:16:08'),
(34, 'leen', '093jfdaj;@gmail.com', 'a74c2ea887dd6d1ff4180c8ea3eb8e2be7f2d948', '0934341176', 30283, 1, '2023-09-03 06:03:23'),
(35, 'Housin ', '0934341176samira@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '5452887588', 26744, 1, '2023-09-03 06:21:06'),
(36, 'hksje', 'gsjrjjsd@fnsfj.sa', 'b50049f4d4331544dcbfe424bbc780268f30d26a', '12344884645', 40229, 0, '2023-09-03 09:24:50'),
(37, 'grgff', 'gdgf@f.gd', '04d4b547a4a9dd7055e321bb6897752576865ac7', '5555565552', 11183, 1, '2023-09-03 09:28:58'),
(38, 'hello', 'shsf@fd.ss', 'b2dfd80c3d0f5862f24e502abaa652222d91e540', '56466264955', 40206, 1, '2023-09-03 09:57:33'),
(40, 'leen', 'leen@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '12345678910', 86392, 1, '2023-09-09 15:18:31');

-- --------------------------------------------------------

--
-- Table structure for table "youtube_video"
--

CREATE TABLE "youtube_video" (
  "website" varchar(255) NOT NULL,
  "id" varchar(255) NOT NULL,
  "sura_name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table "youtube_video"
--

INSERT INTO "youtube_video" ("website", "id", "sura_name") VALUES
('https://youtu.be/NzzbsLnsgqk', 'NzzbsLnsgqk', 'سورة الحديد');

-- --------------------------------------------------------

--
-- Structure for view "cartsview"
--
DROP TABLE IF EXISTS "cartsview";

CREATE ALGORITHM=UNDEFINED DEFINER="id21104298_housinasmail"@"%" SQL SECURITY DEFINER VIEW "cartsview"  AS SELECT "productsview"."products_id" AS "products_id", "productsview"."products_name" AS "products_name", "productsview"."products_name_ar" AS "products_name_ar", "productsview"."products_description" AS "products_description", "productsview"."products_description_ar" AS "products_description_ar", "productsview"."products_image" AS "products_image", "productsview"."products_count" AS "products_count", "productsview"."products_active" AS "products_active", "productsview"."products_price" AS "products_price", "productsview"."products_discount" AS "products_discount", "productsview"."products_datetime" AS "products_datetime", "productsview"."products_categories" AS "products_categories", "productsview"."categories_id" AS "categories_id", "productsview"."categories_name" AS "categories_name", "productsview"."categories_name_ar" AS "categories_name_ar", "productsview"."categories_image" AS "categories_image", "productsview"."categories_datetime" AS "categories_datetime", "cart"."cart_id" AS "cart_id", "cart"."cart_usersid" AS "cart_usersid", "cart"."cart_productsid" AS "cart_productsid", "cart"."cart_products_count" AS "cart_products_count", "cart"."cart_total_product_price" AS "cart_total_product_price", "cart"."cart_orders" AS "cart_orders", "productsview"."products_price"- "productsview"."products_price" * "productsview"."products_discount" / 100 AS "products_price_discount" FROM ("productsview" join "cart" on("cart"."cart_productsid" = "productsview"."products_id")) ;

-- --------------------------------------------------------

--
-- Structure for view "orderdetailsview"
--
DROP TABLE IF EXISTS "orderdetailsview";

CREATE ALGORITHM=UNDEFINED DEFINER="id21104298_housinasmail"@"%" SQL SECURITY DEFINER VIEW "orderdetailsview"  AS SELECT "cartsview"."products_id" AS "products_id", "cartsview"."products_name" AS "products_name", "cartsview"."products_name_ar" AS "products_name_ar", "cartsview"."products_description" AS "products_description", "cartsview"."products_description_ar" AS "products_description_ar", "cartsview"."products_image" AS "products_image", "cartsview"."products_count" AS "products_count", "cartsview"."products_active" AS "products_active", "cartsview"."products_price" AS "products_price", "cartsview"."products_discount" AS "products_discount", "cartsview"."products_datetime" AS "products_datetime", "cartsview"."products_categories" AS "products_categories", "cartsview"."categories_id" AS "categories_id", "cartsview"."categories_name" AS "categories_name", "cartsview"."categories_name_ar" AS "categories_name_ar", "cartsview"."categories_image" AS "categories_image", "cartsview"."categories_datetime" AS "categories_datetime", "cartsview"."cart_id" AS "cart_id", "cartsview"."cart_usersid" AS "cart_usersid", "cartsview"."cart_productsid" AS "cart_productsid", "cartsview"."cart_products_count" AS "cart_products_count", "cartsview"."cart_total_product_price" AS "cart_total_product_price", "cartsview"."cart_orders" AS "cart_orders", "cartsview"."products_price_discount" AS "products_price_discount", "ordersview"."orders_id" AS "orders_id", "ordersview"."orders_usersid" AS "orders_usersid", "ordersview"."orders_address" AS "orders_address", "ordersview"."orders_type" AS "orders_type", "ordersview"."orders_pricedelivery" AS "orders_pricedelivery", "ordersview"."orders_allprodcutsprice" AS "orders_allprodcutsprice", "ordersview"."orders_coupon" AS "orders_coupon", "ordersview"."orders_datetime" AS "orders_datetime", "ordersview"."orders_paymentmethod" AS "orders_paymentmethod", "ordersview"."orders_state" AS "orders_state", "ordersview"."orders_total_price" AS "orders_total_price", "ordersview"."address_id" AS "address_id", "ordersview"."address_usersid" AS "address_usersid", "ordersview"."address_city" AS "address_city", "ordersview"."address_street" AS "address_street", "ordersview"."address_name" AS "address_name" FROM ("ordersview" join "cartsview" on("ordersview"."orders_usersid" = "cartsview"."cart_usersid")) WHERE "cartsview"."cart_orders" <> 0 ;

-- --------------------------------------------------------

--
-- Structure for view "ordersview"
--
DROP TABLE IF EXISTS "ordersview";

CREATE ALGORITHM=UNDEFINED DEFINER="id21104298_housinasmail"@"%" SQL SECURITY DEFINER VIEW "ordersview"  AS SELECT "orders"."orders_id" AS "orders_id", "orders"."orders_usersid" AS "orders_usersid", "orders"."orders_address" AS "orders_address", "orders"."orders_type" AS "orders_type", "orders"."orders_pricedelivery" AS "orders_pricedelivery", "orders"."orders_allprodcutsprice" AS "orders_allprodcutsprice", "orders"."orders_coupon" AS "orders_coupon", "orders"."orders_datetime" AS "orders_datetime", "orders"."orders_paymentmethod" AS "orders_paymentmethod", "orders"."orders_state" AS "orders_state", "orders"."orders_total_price" AS "orders_total_price", "address"."address_id" AS "address_id", "address"."address_usersid" AS "address_usersid", "address"."address_city" AS "address_city", "address"."address_street" AS "address_street", "address"."address_name" AS "address_name" FROM ("orders" left join "address" on("orders"."orders_address" = "address"."address_id")) ;

-- --------------------------------------------------------

--
-- Structure for view "productsview"
--
DROP TABLE IF EXISTS "productsview";

CREATE ALGORITHM=UNDEFINED DEFINER="id21104298_housinasmail"@"%" SQL SECURITY DEFINER VIEW "productsview"  AS SELECT "products"."products_id" AS "products_id", "products"."products_name" AS "products_name", "products"."products_name_ar" AS "products_name_ar", "products"."products_description" AS "products_description", "products"."products_description_ar" AS "products_description_ar", "products"."products_image" AS "products_image", "products"."products_count" AS "products_count", "products"."products_active" AS "products_active", "products"."products_price" AS "products_price", "products"."products_discount" AS "products_discount", "products"."products_datetime" AS "products_datetime", "products"."products_categories" AS "products_categories", "categories"."categories_id" AS "categories_id", "categories"."categories_name" AS "categories_name", "categories"."categories_name_ar" AS "categories_name_ar", "categories"."categories_image" AS "categories_image", "categories"."categories_datetime" AS "categories_datetime" FROM ("products" join "categories" on("categories"."categories_id" = "products"."products_categories")) ;

-- --------------------------------------------------------

--
-- Structure for view "topselling"
--
DROP TABLE IF EXISTS "topselling";

CREATE ALGORITHM=UNDEFINED DEFINER="id21104298_housinasmail"@"%" SQL SECURITY DEFINER VIEW "topselling"  AS SELECT count("cart"."cart_productsid") AS "counttimes", "cart"."cart_id" AS "cart_id", "cart"."cart_usersid" AS "cart_usersid", "cart"."cart_productsid" AS "cart_productsid", "cart"."cart_products_count" AS "cart_products_count", "cart"."cart_total_product_price" AS "cart_total_product_price", "cart"."cart_orders" AS "cart_orders", "products"."products_id" AS "products_id", "products"."products_name" AS "products_name", "products"."products_name_ar" AS "products_name_ar", "products"."products_description" AS "products_description", "products"."products_description_ar" AS "products_description_ar", "products"."products_image" AS "products_image", "products"."products_count" AS "products_count", "products"."products_active" AS "products_active", "products"."products_price" AS "products_price", "products"."products_discount" AS "products_discount", "products"."products_datetime" AS "products_datetime", "products"."products_categories" AS "products_categories", "products"."products_price"- "products"."products_price" * "products"."products_discount" / 100 AS "products_price_discount" FROM ("cart" join "products" on("products"."products_id" = "cart"."cart_productsid")) WHERE "cart"."cart_orders" <> 0 GROUP BY "cart"."cart_productsid" ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table "address"
--
ALTER TABLE "address"
  ADD PRIMARY KEY ("address_id"),
  ADD KEY "address_usersid" ("address_usersid");

--
-- Indexes for table "admin"
--
ALTER TABLE "admin"
  ADD PRIMARY KEY ("admin_id"),
  ADD UNIQUE KEY "admin_email" ("admin_email"),
  ADD UNIQUE KEY "admin_phone" ("admin_phone");

--
-- Indexes for table "ads"
--
ALTER TABLE "ads"
  ADD PRIMARY KEY ("ads_id");

--
-- Indexes for table "cart"
--
ALTER TABLE "cart"
  ADD PRIMARY KEY ("cart_id"),
  ADD KEY "cart_productsid" ("cart_productsid"),
  ADD KEY "cart_usersid" ("cart_usersid");

--
-- Indexes for table "categories"
--
ALTER TABLE "categories"
  ADD PRIMARY KEY ("categories_id");

--
-- Indexes for table "favorite"
--
ALTER TABLE "favorite"
  ADD PRIMARY KEY ("favorite_id"),
  ADD KEY "favorite_productsid" ("favorite_productsid"),
  ADD KEY "favorite_usersid" ("favorite_usersid");

--
-- Indexes for table "notification"
--
ALTER TABLE "notification"
  ADD PRIMARY KEY ("notification_id"),
  ADD KEY "notification_usersid" ("notification_usersid");

--
-- Indexes for table "orders"
--
ALTER TABLE "orders"
  ADD PRIMARY KEY ("orders_id"),
  ADD KEY "orders_address" ("orders_address"),
  ADD KEY "orders_usersid" ("orders_usersid");

--
-- Indexes for table "products"
--
ALTER TABLE "products"
  ADD PRIMARY KEY ("products_id"),
  ADD KEY "products_libfk_1" ("products_categories");

--
-- Indexes for table "users"
--
ALTER TABLE "users"
  ADD PRIMARY KEY ("users_id"),
  ADD UNIQUE KEY "users_email" ("users_email"),
  ADD UNIQUE KEY "users_phone" ("users_phone");

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table "address"
--
ALTER TABLE "address"
  MODIFY "address_id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table "admin"
--
ALTER TABLE "admin"
  MODIFY "admin_id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table "ads"
--
ALTER TABLE "ads"
  MODIFY "ads_id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table "cart"
--
ALTER TABLE "cart"
  MODIFY "cart_id" int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table "categories"
--
ALTER TABLE "categories"
  MODIFY "categories_id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table "favorite"
--
ALTER TABLE "favorite"
  MODIFY "favorite_id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table "notification"
--
ALTER TABLE "notification"
  MODIFY "notification_id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table "orders"
--
ALTER TABLE "orders"
  MODIFY "orders_id" int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table "products"
--
ALTER TABLE "products"
  MODIFY "products_id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table "users"
--
ALTER TABLE "users"
  MODIFY "users_id" int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table "address"
--
ALTER TABLE "address"
  ADD CONSTRAINT "address_ibfk_1" FOREIGN KEY ("address_usersid") REFERENCES "users" ("users_id") ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table "cart"
--
ALTER TABLE "cart"
  ADD CONSTRAINT "cart_ibfk_1" FOREIGN KEY ("cart_productsid") REFERENCES "products" ("products_id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "cart_ibfk_2" FOREIGN KEY ("cart_usersid") REFERENCES "users" ("users_id") ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table "favorite"
--
ALTER TABLE "favorite"
  ADD CONSTRAINT "favorite_ibfk_1" FOREIGN KEY ("favorite_productsid") REFERENCES "products" ("products_id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "favorite_ibfk_2" FOREIGN KEY ("favorite_usersid") REFERENCES "users" ("users_id") ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table "notification"
--
ALTER TABLE "notification"
  ADD CONSTRAINT "notification_ibfk_1" FOREIGN KEY ("notification_usersid") REFERENCES "users" ("users_id");

--
-- Constraints for table "orders"
--
ALTER TABLE "orders"
  ADD CONSTRAINT "orders_ibfk_1" FOREIGN KEY ("orders_address") REFERENCES "address" ("address_id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "orders_ibfk_2" FOREIGN KEY ("orders_usersid") REFERENCES "users" ("users_id") ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table "products"
--
ALTER TABLE "products"
  ADD CONSTRAINT "products_libfk_1" FOREIGN KEY ("products_categories") REFERENCES "categories" ("categories_id") ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
