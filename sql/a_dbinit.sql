/*
Run this file to intialize database
*/

-- Database: sepatu
-- Tables: products, inventory

-- Drop tables if exists

use sepatu;

DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS specifications;
DROP TABLE IF EXISTS pictures;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS contact;

-- Initialize contact table

CREATE TABLE contact (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (id)
);
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

-- Initialize customers table

CREATE TABLE customers (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `salutation` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (id)
);

-- Initialize inventory table

CREATE TABLE inventory (
  `id` int(10) NOT NULL  AUTO_INCREMENT,
  `productID` int(10) NOT NULL,
  `size` int(10) NOT NULL,
  `stock` int(10) NOT NULL,
  CONSTRAINT
    FOREIGN KEY (productID)
    REFERENCES products(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (id)
);

-- Initialize pictures table

CREATE TABLE pictures (
  `id` int(10) NOT NULL  AUTO_INCREMENT,
  `productID` int(10) NOT NULL,
  `pictureURL` varchar(150) NOT NULL,
  CONSTRAINT
    FOREIGN KEY (productID)
    REFERENCES products(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (id)
);

-- Initialize specifications table

CREATE TABLE specifications (
  `id` int(10) NOT NULL  AUTO_INCREMENT,
  `productID` int(10) NOT NULL,
  `specification` text NOT NULL,
  CONSTRAINT
    FOREIGN KEY (productID)
    REFERENCES products(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  PRIMARY KEY (id)
);



-- Initialize orders table

CREATE TABLE `transactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customerID` INT(10) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `zipCode` int(6),
  `phone` varchar(20) NOT NULL,
  `totalPrice` int(255) NOT NULL,
  PRIMARY KEY (id),
  INDEX `FK_CUSTOMER_ID` (`customerID` ASC),
  CONSTRAINT `FK_CUSTOMER_ID`
    FOREIGN KEY (customerID)
    REFERENCES customers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE orders (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `transactionID` INT(10) NOT NULL,
  `productID` int(10) NOT NULL,
  `dateOrder` DATE NOT NULL,
  `quantity` int(10) NOT NULL,
  `size` int(2) NOT NULL,
  PRIMARY KEY (id),
  INDEX `FK_TRANSACTION_ID` (`transactionID` ASC),
  INDEX `FK_PRODUCT_ID` (`productID` ASC),
  CONSTRAINT `FK_TRANSACTION_ID`
    FOREIGN KEY (transactionID)
    REFERENCES transactions(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_ID`
    FOREIGN KEY (productID)
    REFERENCES products(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Initialize reviews table

CREATE TABLE reviews (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `transactionID` int(10) NOT NULL,
  `reviews` text NOT NULL,
  PRIMARY KEY (id),
  INDEX `FK_REVIEW_TRANSACTION_ID` (`transactionID` ASC),
  CONSTRAINT `FK_REVIEW_TRANSACTION_ID`
    FOREIGN KEY (transactionID)
    REFERENCES transactions(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Initialize member table

CREATE TABLE `members`(
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `customerID` int(10),
  PRIMARY KEY(id),
  INDEX `FK_MEMBER_CUSTOMER_ID` (`customerID` ASC),
  CONSTRAINT `FK_MEMBER_CUSTOMER_ID`
    FOREIGN KEY (customerID)
    REFERENCES customers(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Intialize admin table

CREATE TABLE `admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY(id)
);
