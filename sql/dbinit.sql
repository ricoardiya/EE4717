/*
Run this file to intialize database
*/

-- Database: sepatu
-- Tables: products, inventory

-- Drop tables if exists

DROP TABLE IF EXISTS pictures;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS products;

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
)
