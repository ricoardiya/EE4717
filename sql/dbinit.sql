/*
Run this file to intialize database
*/

-- Database: sepatu
-- Tables: products, inventory

-- Drop tables if exists

DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS products;

-- Initialize products table

CREATE TABLE products (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `color` char(10) NOT NULL,
  `desc` char(41) NOT NULL,
  `gender` char(4) NOT NULL,
  PRIMARY KEY (id)
);

-- Initialize inventory table

CREATE TABLE inventory (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productID` int(10) NOT NULL,
  `size` int(10) NOT NULL,
  `stock` int(10) NOT NULL,
  FOREIGN KEY (id) REFERENCES products(id),
  PRIMARY KEY (id)
);
