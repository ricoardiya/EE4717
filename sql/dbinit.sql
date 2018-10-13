/*
Run this file to intialize database
*/

-- Database: sepatu
-- Tables: products, inventory

-- Drop tables if exists
use sepatu;

DROP TABLE IF EXISTS pictures;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

-- Initialize products table

CREATE TABLE products (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` char(10) NOT NULL,
  `desc` text NOT NULL,
  `gender` char(4) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (id)
);

-- Initialize inventory table

CREATE TABLE inventory (
  `id` int(10) NOT NULL,
  `productID` int(10) NOT NULL,
  `size` int(10) NOT NULL,
  `stock` int(10) NOT NULL,
  FOREIGN KEY (productID) REFERENCES products(id),
  PRIMARY KEY (id)
);

-- Initialize pictures table

CREATE TABLE pictures (
  `id` int(10) NOT NULL,
  `productID` int(10) NOT NULL,
  `pictureURL` varchar(80) NOT NULL,
  FOREIGN KEY (productID) REFERENCES products(id),
  PRIMARY KEY (id)
);

-- Initialize customers table

CREATE TABLE customers (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zipCode` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(8) NOT NULL,
  PRIMARY KEY (id) AUTO_INCREMENT
);
-- Initialize orders table

CREATE TABLE orders (
  `id` int(10) NOT NULL,
  `customerID` INT(10) NOT NULL,
  `dateOrder` DATE NOT NULL,
  `productID` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `size` int(2) NOT NULL,
  PRIMARY KEY (id) AUTO_INCREMENT,
  FOREIGN KEY (productID) REFERENCES products(id),
  FOREIGN KEY (customerID) REFERENCES customers(id)
);

-- 1 customer punya banyak order, 1 order punya 1 customer
-- 1 order punya 1 product , tapi sebaliknya tidak

CREATE TABLE reviews (
  `id` int(10) NOT NULL,
  `customerID` INT(10) NOT NULL,
  `productID` int(10) NOT NULL,
  PRIMARY KEY (id) AUTO_INCREMENT,
  FOREIGN KEY (productID) REFERENCES products(id),
  FOREIGN KEY (customerID) REFERENCES customers(id)
);
