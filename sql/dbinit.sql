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
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `color` char(10) NOT NULL,
  `desc` text NOT NULL,
  `gender` char(4) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (id)
);

-- Initialize inventory table

CREATE TABLE inventory (
  `id` int(10) NOT NULL  AUTO_INCREMENT,
  `productID` int(10) NOT NULL,
  `size` int(10) NOT NULL,
  `stock` int(10) NOT NULL,
  FOREIGN KEY (productID) REFERENCES products(id),
  PRIMARY KEY (id)
);

-- Initialize pictures table

CREATE TABLE pictures (
  `id` int(10) NOT NULL  AUTO_INCREMENT,
  `productID` int(10) NOT NULL,
  `pictureURL` varchar(150) NOT NULL,
  FOREIGN KEY (productID) REFERENCES products(id),
  PRIMARY KEY (id)
);

-- Initialize customers table

CREATE TABLE customers (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `salutation` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zipCode` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(8) NOT NULL,
  PRIMARY KEY (id)
);
-- Initialize orders table

CREATE TABLE orders (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customerID` INT(10) NOT NULL,
  `dateOrder` DATE NOT NULL,
  `productID` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `size` int(2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (productID) REFERENCES products(id),
  FOREIGN KEY (customerID) REFERENCES customers(id)
);

CREATE TABLE reviews (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderID` int(10) NOT NULL,
  `review` text NOT NULL,
  PRIMARY KEY (id) ,
  FOREIGN KEY (orderID) REFERENCES orders(id)
);


CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (id)
)
