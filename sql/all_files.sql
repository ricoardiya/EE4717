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

INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,1,'Reprehenderit sint occaecat fugiat eiusmod occaecat ea.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,2,'Et quis incididunt adipisicing veniam amet sunt Lorem ipsum.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,3,'Pariatur ex mollit proident culpa do culpa.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,4,'Culpa id ullamco Lorem amet labore nostrud dolor duis ex incididunt ad duis.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,5,'Est sunt eiusmod ex tempor adipisicing eu elit.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,6,'Nostrud reprehenderit est laborum veniam enim adipisicing voluptate.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,7,'Ad aliquip mollit labore consequat laborum culpa sunt culpa consequat minim ex aute.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,8,'Ut duis eiusmod minim culpa exercitation est dolor.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,9,'Minim veniam minim nulla dolore do pariatur ad.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,10,'Cupidatat do deserunt anim excepteur esse excepteur occaecat.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,11,'Et irure laborum do proident dolor.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,12,'Sint laboris culpa ad ad exercitation aliqua ut eiusmod.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,13,'Adipisicing nisi exercitation quis commodo commodo aliquip amet labore ea dolor dolor quis cillum.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,14,'Consectetur eiusmod adipisicing veniam eu sint exercitation dolor exercitation tempor minim consequat.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,15,'Est voluptate qui sint nostrud sunt cupidatat deserunt cillum id officia reprehenderit.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,16,'Commodo et esse culpa irure est exercitation officia laboris.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,17,'Est consequat aute esse labore exercitation fugiat et Lorem occaecat voluptate.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,18,'Sunt nulla aliquip nulla minim esse cillum aute velit aliqua.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,19,'Aute sunt voluptate veniam ullamco Lorem velit laborum ex occaecat.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,20,'Aute ea enim id nostrud est duis pariatur minim.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,21,'Laborum enim non commodo consectetur aliquip.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,22,'Culpa excepteur tempor do do ad reprehenderit anim reprehenderit tempor in Lorem occaecat laborum eu.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,23,'Velit laborum pariatur proident enim elit esse exercitation exercitation non.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,24,'Magna ea labore exercitation aliqua Lorem dolor aliqua.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,25,'Laborum cupidatat ea sit quis labore sunt tempor.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,26,'Officia esse aliquip excepteur ipsum duis irure eiusmod duis minim.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,27,'Ad sint reprehenderit esse commodo excepteur reprehenderit sit.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,28,'Veniam dolor amet aliquip veniam irure.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,29,'Nulla aute sint exercitation aliquip deserunt dolore ex ea.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,30,'Laboris ullamco aliquip anim ad culpa do consectetur dolor qui.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,31,'Officia cupidatat ut in ipsum culpa in.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,32,'Ut laboris magna id cupidatat pariatur amet esse id ea deserunt labore dolor.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,33,'Adipisicing tempor excepteur est nostrud minim aliquip.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,34,'Proident excepteur quis anim consectetur ea dolore.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,35,'Magna culpa nisi ut deserunt non culpa pariatur adipisicing officia nulla.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,36,'Laborum qui magna consequat voluptate nulla aliqua dolor culpa ex est proident sunt est.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,37,'Deserunt ex reprehenderit proident mollit nisi aliqua.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,38,'Et aliqua laborum esse tempor consectetur incididunt.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,39,'Est do duis laboris amet occaecat occaecat quis veniam velit amet voluptate enim.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,40,'Exercitation anim laborum quis irure ut magna esse ullamco laborum nulla ea eu sunt tempor.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,41,'Lorem proident voluptate qui labore amet duis culpa laboris enim qui officia ut laboris exercitation.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,42,'Minim ipsum Lorem qui cillum reprehenderit proident est officia fugiat non.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,43,'Ut velit ad Lorem do dolor fugiat cupidatat in sunt anim.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,44,'Tempor consectetur ex adipisicing commodo qui pariatur dolore ad.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,45,'Excepteur officia incididunt culpa minim sit proident cillum esse incididunt.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,46,'Culpa eiusmod Lorem nostrud non eiusmod laborum.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,47,'Dolor ad sit aliqua id occaecat commodo consectetur voluptate qui laborum irure.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,48,'Sit proident ut Lorem minim in cupidatat velit duis et cupidatat tempor incididunt.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,49,'Incididunt consequat velit eu voluptate cupidatat eiusmod incididunt esse laboris non cupidatat consequat adipisicing minim.');
INSERT INTO reviews(id,transactionID,reviews) VALUES (NULL,50,'Magna deserunt cillum tempor sunt dolore ullamco ullamco.');
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'leliabeck@skinserve.com', sha1('password'), 1);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'joyprice@skinserve.com', sha1('password'), 2);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'gillespiearmstrong@skinserve.com', sha1('password'),3);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'nixonclark@skinserve.com', sha1('password'), 4);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'pollymcpherson@skinserve.com', sha1('password'), 5);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'michaelrivas@skinserve.com', sha1('password'), 6);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'rhondaroy@skinserve.com', sha1('password'), 7);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'rhondaroy@skinserve.com', sha1('password'), 8);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'marjoriecarlson@skinserve.com', sha1('password'), 9);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'frankiegutierrez@skinserve.com', sha1('password'), 10);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'grantmcfarland@skinserve.com', sha1('password'), 11);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'leonardvance@skinserve.com', sha1('password'), 12);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'jessicafields@skinserve.com', sha1('password'), 13);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'yatesbailey@skinserve.com', sha1('password'), 14);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'eulaclayton@skinserve.com', sha1('password'), 15);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'penablankenship@skinserve.com', sha1('password'), 16);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'randolphbeard@skinserve.com', sha1('password'), 17);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'lakeishalevy@skinserve.com', sha1('password'), 18);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'chasitywooten@skinserve.com', sha1('password'), 19);
INSERT INTO members(id,email,password,customerId) VALUES (NULL,'elsabowers@skinserve.com', sha1('password'), 20);
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Mcdowell','Mayo','mcdowellmayo@exospeed.com','Velit id reprehenderit velit adipisicing adipisicing in dolor id.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Angelia','Castro','angeliacastro@exospeed.com','Sit elit occaecat consectetur exercitation enim.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Rogers','Sanchez','rogerssanchez@exospeed.com','Fugiat est cillum sunt officia laboris qui occaecat nostrud laboris consequat Lorem reprehenderit aute.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Schneider','Rice','schneiderrice@exospeed.com','Do magna Lorem quis cillum velit consectetur ea velit elit duis voluptate veniam magna anim.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Janie','Richmond','janierichmond@exospeed.com','Voluptate fugiat minim dolore excepteur labore laborum quis ipsum cillum minim anim consectetur pariatur.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Gilliam','Suarez','gilliamsuarez@exospeed.com','Sint pariatur nulla eiusmod aliqua laboris aliquip cillum sint aliquip est officia.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Lydia','Park','lydiapark@exospeed.com','Occaecat aute amet in mollit eiusmod.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Mckinney','Holloway','mckinneyholloway@exospeed.com','Aute consequat culpa irure nulla cillum tempor eu proident sit qui commodo.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Galloway','Duke','gallowayduke@exospeed.com','Nostrud labore consequat occaecat Lorem reprehenderit ea.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Bette','Coffey','bettecoffey@exospeed.com','Occaecat eu occaecat sunt cillum aliqua occaecat do veniam.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Fulton','Avila','fultonavila@exospeed.com','Dolor cillum veniam incididunt enim sunt.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Barrera','Mclean','barreramclean@exospeed.com','Incididunt ut ullamco dolor non ex incididunt nulla eu.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Nora','Fowler','norafowler@exospeed.com','Eu qui magna pariatur voluptate aliquip proident incididunt consequat culpa tempor cillum.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Cain','Hatfield','cainhatfield@exospeed.com','Magna commodo et ex eiusmod ullamco excepteur cillum minim dolor.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Jamie','Franco','jamiefranco@exospeed.com','Eiusmod laborum Lorem qui occaecat consectetur deserunt ipsum non laboris sit.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Ingram','Gates','ingramgates@exospeed.com','Sunt officia excepteur duis cupidatat sint ipsum occaecat aliqua dolor.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Noemi','Wooten','noemiwooten@exospeed.com','Culpa et consectetur Lorem est ad consequat voluptate ullamco nisi enim pariatur adipisicing minim.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Sherman','Dunlap','shermandunlap@exospeed.com','Laborum ut incididunt esse nisi est mollit dolor do in.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Salazar','Horton','salazarhorton@exospeed.com','Commodo laborum reprehenderit deserunt eu consequat non sunt veniam duis ea velit tempor.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Herring','Reed','herringreed@exospeed.com','Fugiat sunt ex cillum reprehenderit.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Maldonado','Fuller','maldonadofuller@exospeed.com','Nisi mollit est et minim ad magna ullamco elit ea aute incididunt.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Hughes','Mcfarland','hughesmcfarland@exospeed.com','Consectetur consequat magna fugiat dolor quis voluptate elit minim pariatur sint excepteur.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Chavez','Moody','chavezmoody@exospeed.com','Commodo consectetur laborum anim irure laborum labore irure cillum cupidatat officia.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Alisha','Cash','alishacash@exospeed.com','Laboris magna eiusmod cillum in veniam ex excepteur deserunt ut anim eu.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Cecile','Holmes','cecileholmes@exospeed.com','Cupidatat laborum magna exercitation ut ipsum dolor id elit nostrud minim.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Alvarez','Ochoa','alvarezochoa@exospeed.com','Dolor elit cupidatat et labore proident duis.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Summers','Beach','summersbeach@exospeed.com','Elit nostrud officia incididunt do est id consectetur id mollit nulla aliqua dolor ea.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Suarez','Nunez','suareznunez@exospeed.com','Tempor aliquip sint duis est laborum.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Anastasia','Tanner','anastasiatanner@exospeed.com','Ea officia dolore excepteur adipisicing ad irure labore duis non aute tempor ut velit.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Gabrielle','Mcfadden','gabriellemcfadden@exospeed.com','In non in aliqua irure.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Castro','Parsons','castroparsons@exospeed.com','Aliquip ullamco elit sit labore.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Gladys','Kane','gladyskane@exospeed.com','Aliqua velit ut incididunt excepteur irure aute mollit nisi sit aute voluptate consequat ipsum ad.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Cash','Armstrong','casharmstrong@exospeed.com','Velit magna dolore velit sit velit amet.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Boyer','Cooley','boyercooley@exospeed.com','Veniam proident reprehenderit aliqua elit eiusmod voluptate ipsum excepteur proident minim ut minim nulla ex.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Cook','Ferrell','cookferrell@exospeed.com','Ullamco tempor adipisicing esse sint in sint exercitation nulla ipsum.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Poole','Evans','pooleevans@exospeed.com','Fugiat eiusmod ipsum officia sunt sint exercitation esse.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Simone','Gardner','simonegardner@exospeed.com','Sit veniam Lorem labore id esse aliqua elit et.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'English','Petersen','englishpetersen@exospeed.com','Proident sunt et et non velit tempor dolore nostrud exercitation Lorem non enim.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Natalia','Hooper','nataliahooper@exospeed.com','Ex cillum est enim tempor cupidatat ea nostrud labore nostrud amet excepteur reprehenderit et.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Kay','Castillo','kaycastillo@exospeed.com','Minim nulla irure ea adipisicing exercitation cupidatat.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Shelia','Dunn','sheliadunn@exospeed.com','Velit incididunt magna do aute ullamco ad aliqua cupidatat consequat esse.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Marjorie','Paul','marjoriepaul@exospeed.com','Consectetur cupidatat nostrud eu nulla in do est esse anim consectetur.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Hodges','Robles','hodgesrobles@exospeed.com','Mollit excepteur pariatur deserunt ipsum nisi.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Dominguez','Bates','dominguezbates@exospeed.com','Elit reprehenderit eu exercitation dolor do cupidatat ipsum Lorem labore irure minim.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Roberson','Reeves','robersonreeves@exospeed.com','Velit nulla tempor ex ex et aute consectetur aliquip voluptate qui nostrud.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Johnson','Rasmussen','johnsonrasmussen@exospeed.com','Velit irure ullamco duis proident.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Strickland','Mosley','stricklandmosley@exospeed.com','Officia ullamco irure consectetur aliquip ea.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Cummings','Pittman','cummingspittman@exospeed.com','Labore reprehenderit nulla elit eu est ea do.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Colette','Holcomb','coletteholcomb@exospeed.com','Reprehenderit cillum officia veniam minim ullamco fugiat irure nulla non laboris.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Fay','King','fayking@exospeed.com','Sit do labore pariatur excepteur et qui et esse esse esse sit ipsum consectetur.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Hogan','Sutton','hogansutton@exospeed.com','Cillum incididunt non officia culpa sit.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'King','Wells','kingwells@exospeed.com','Sint duis magna fugiat aliqua veniam sint occaecat quis quis culpa.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Parrish','Perez','parrishperez@exospeed.com','Commodo incididunt ullamco nostrud qui sunt.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Combs','Thornton','combsthornton@exospeed.com','Lorem minim nostrud consectetur do.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Mcclure','Mcmahon','mccluremcmahon@exospeed.com','Dolor ut consequat aliqua mollit.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Dale','Hurley','dalehurley@exospeed.com','In pariatur occaecat ut non adipisicing culpa magna consequat aliquip.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Ethel','Pugh','ethelpugh@exospeed.com','Consectetur aliquip ex excepteur deserunt aute.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Mcdonald','Chaney','mcdonaldchaney@exospeed.com','Nisi ea reprehenderit nostrud sunt.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Wynn','Hendrix','wynnhendrix@exospeed.com','Fugiat labore velit enim ut nostrud Lorem.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Elma','James','elmajames@exospeed.com','Lorem culpa deserunt exercitation aute culpa cupidatat ut.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Holloway','Dickson','hollowaydickson@exospeed.com','Aliquip qui ullamco in in cillum.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Holt','Fuentes','holtfuentes@exospeed.com','Ipsum eu deserunt duis ex.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Darla','Morales','darlamorales@exospeed.com','Laboris nisi elit consequat veniam magna.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Carlson','Holman','carlsonholman@exospeed.com','Eu nulla fugiat amet culpa.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Gibson','Spears','gibsonspears@exospeed.com','Proident ullamco pariatur consequat est commodo do eu labore proident voluptate consectetur anim ipsum.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Gail','Downs','gaildowns@exospeed.com','Amet ipsum cillum ex laborum.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Donna','Cobb','donnacobb@exospeed.com','Sunt fugiat ad cupidatat duis.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Knowles','Stuart','knowlesstuart@exospeed.com','Ullamco nulla velit in in officia anim ex aliquip id Lorem mollit.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Mattie','Hughes','mattiehughes@exospeed.com','Ut reprehenderit Lorem ut sunt Lorem.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Curry','Hogan','curryhogan@exospeed.com','Ipsum voluptate consequat velit aliquip deserunt id ad cillum officia.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Yvonne','Anthony','yvonneanthony@exospeed.com','Sunt fugiat irure tempor do.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Emma','Hardin','emmahardin@exospeed.com','Deserunt qui consequat do deserunt tempor aliqua laborum elit.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Burris','Waters','burriswaters@exospeed.com','Do ullamco nostrud ea non.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Avis','Kramer','aviskramer@exospeed.com','Velit in incididunt elit excepteur fugiat duis reprehenderit proident.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Iris','Bruce','irisbruce@exospeed.com','Laboris ut quis tempor veniam voluptate quis labore nisi.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Amy','Valenzuela','amyvalenzuela@exospeed.com','Non sunt Lorem do voluptate deserunt ipsum magna cillum ea aute aute.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Whitley','Raymond','whitleyraymond@exospeed.com','Veniam veniam aliquip fugiat est eu tempor consequat ex ea non fugiat est.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Allie','Mays','alliemays@exospeed.com','Exercitation ea nostrud labore voluptate esse minim laboris.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Hernandez','Leonard','hernandezleonard@exospeed.com','Aute deserunt nulla voluptate et dolore cillum nisi consequat in ullamco nisi.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Jocelyn','Wade','jocelynwade@exospeed.com','Ad mollit ullamco laboris fugiat ex deserunt.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Wilkinson','Irwin','wilkinsonirwin@exospeed.com','Mollit ad cillum quis eiusmod dolor veniam magna duis aliquip.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Kelly','Guerrero','kellyguerrero@exospeed.com','Mollit occaecat excepteur excepteur aute ipsum laborum exercitation eiusmod quis.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Sonya','Tyson','sonyatyson@exospeed.com','Eiusmod laborum sit labore aliquip et est veniam nostrud velit sit Lorem excepteur ex.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Haley','Bentley','haleybentley@exospeed.com','Lorem proident officia tempor consequat cupidatat quis laborum enim.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Sheree','Conrad','shereeconrad@exospeed.com','Voluptate laboris reprehenderit elit culpa nisi ex eiusmod.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Robin','Mendez','robinmendez@exospeed.com','Laboris eiusmod sint culpa qui incididunt reprehenderit ut ut enim mollit.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Brewer','Santiago','brewersantiago@exospeed.com','Commodo do culpa reprehenderit dolor enim.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Lorraine','Martinez','lorrainemartinez@exospeed.com','Occaecat do dolor ut deserunt commodo in do nostrud.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Herman','Briggs','hermanbriggs@exospeed.com','Qui tempor adipisicing consectetur enim sint.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Christina','Crosby','christinacrosby@exospeed.com','Non adipisicing qui irure officia eu Lorem veniam ea eu proident consequat irure.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Sloan','Cain','sloancain@exospeed.com','Pariatur ad amet deserunt pariatur velit exercitation id ad.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Gates','Simmons','gatessimmons@exospeed.com','Ut exercitation dolore est cupidatat.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Brooks','Clements','brooksclements@exospeed.com','Adipisicing tempor qui consectetur pariatur qui laboris esse irure.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Warren','Norman','warrennorman@exospeed.com','Non eiusmod duis do non enim anim nulla.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Margaret','Cooper','margaretcooper@exospeed.com','Amet id laboris est pariatur.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Bonita','Sandoval','bonitasandoval@exospeed.com','Elit exercitation amet aliquip incididunt qui pariatur officia exercitation labore Lorem.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Lorrie','Peck','lorriepeck@exospeed.com','Lorem voluptate fugiat et do amet fugiat est reprehenderit nostrud ea cupidatat in exercitation.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Mcintyre','Melton','mcintyremelton@exospeed.com','Consequat sunt duis consequat non dolore aute ullamco enim deserunt.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Booth','Webster','boothwebster@exospeed.com','Ad deserunt veniam minim est occaecat.');
INSERT INTO contact(id,firstname,lastname,email,message) VALUES (NULL,'Ramos','Wilkerson','ramoswilkerson@exospeed.com','Exercitation mollit cillum elit voluptate sint officia adipisicing enim enim veniam pariatur pariatur.');
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Lelia Beck','857 Llama Court, Worton, Pennsylvania','leliabeck@skinserve.com',95504892);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Joy Price','860 Lincoln Terrace, Campo, Virgin Islands','joyprice@skinserve.com',52777122);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Gillespie Armstrong','528 Oakland Place, Lafferty, South Carolina','gillespiearmstrong@skinserve.com',64595552);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Nixon Clark','597 Homecrest Court, Crayne, Utah','nixonclark@skinserve.com',76533499);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Polly Mcpherson','381 Chester Street, Siglerville, District Of Columbia','pollymcpherson@skinserve.com',87124211);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Michael Rivas','202 Langham Street, Edmund, Arkansas','michaelrivas@skinserve.com',59277308);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Rhonda Roy','990 Lafayette Walk, Belva, West Virginia','rhondaroy@skinserve.com',62692240);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Rhonda Roy','990 Lafayette Walk, Belva, West Virginia','rhondaroy@skinserve.com',62692240);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Marjorie Carlson','933 Oceanview Avenue, Moquino, Colorado','marjoriecarlson@skinserve.com',44572995);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Frankie Gutierrez','327 Girard Street, Reinerton, Guam','frankiegutierrez@skinserve.com',46983265);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Grant Mcfarland','925 Jay Street, Fairacres, Wisconsin','grantmcfarland@skinserve.com',55170307);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Leonard Vance','438 Roder Avenue, Jessie, Marshall Islands','leonardvance@skinserve.com',62605889);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Jessica Fields','700 Kensington Walk, Ypsilanti, Minnesota','jessicafields@skinserve.com',97527848);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Yates Bailey','306 Lefferts Avenue, Celeryville, Federated States Of Micronesia','yatesbailey@skinserve.com',35927125);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Eula Clayton','801 Irving Avenue, Coleville, Arizona','eulaclayton@skinserve.com',74072081);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Pena Blankenship','325 Poplar Street, Mammoth, Kansas','penablankenship@skinserve.com',61028307);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Randolph Beard','755 Hope Street, Belvoir, Alaska','randolphbeard@skinserve.com',69741918);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Lakeisha Levy','779 Cranberry Street, Kempton, Palau','lakeishalevy@skinserve.com',89789899);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Chasity Wooten','461 Delevan Street, Carrsville, Indiana','chasitywooten@skinserve.com',91892037);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Elsa Bowers','813 Maple Street, Osmond, Nebraska','elsabowers@skinserve.com',93730313);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Weber Baldwin','833 Wyckoff Street, Maplewood, Delaware','weberbaldwin@skinserve.com',99099976);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Patrick Preston','707 Tiffany Place, Orason, North Carolina','patrickpreston@skinserve.com',40613810);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Jeanine Glass','560 Perry Place, Sutton, Illinois','jeanineglass@skinserve.com',34619327);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Ellis Witt','895 Grand Street, Sunbury, Wyoming','elliswitt@skinserve.com',44442606);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Crystal Cummings','230 Lee Avenue, Neahkahnie, Texas','crystalcummings@skinserve.com',76066704);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Lottie Fischer','781 Bevy Court, Chamberino, Virginia','lottiefischer@skinserve.com',54588732);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Emma Sweet','837 Holly Street, Naomi, Washington','emmasweet@skinserve.com',51642482);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Wilda Rich','827 Doone Court, Fivepointville, North Dakota','wildarich@skinserve.com',86725323);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Armstrong Snow','735 Trucklemans Lane, Dubois, New York','armstrongsnow@skinserve.com',99626428);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Theresa Travis','505 Meadow Street, Smeltertown, New Mexico','theresatravis@skinserve.com',95483007);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Kellie Haney','373 Chestnut Avenue, Vaughn, Missouri','kelliehaney@skinserve.com',96378131);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Elisabeth Hester','214 Eastern Parkway, Leming, California','elisabethhester@skinserve.com',62350719);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Hudson Roth','826 Vermont Court, Rockingham, South Dakota','hudsonroth@skinserve.com',60030931);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Kent Espinoza','208 Hanson Place, Goodville, Idaho','kentespinoza@skinserve.com',77122485);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Rae Garza','671 Lamont Court, Beechmont, Kentucky','raegarza@skinserve.com',70201469);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Liz Rice','959 Schermerhorn Street, Choctaw, Northern Mariana Islands','lizrice@skinserve.com',88974631);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Randi Whitney','639 Goodwin Place, Sehili, Puerto Rico','randiwhitney@skinserve.com',92776160);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Amber Alvarez','615 Borinquen Pl, Centerville, Iowa','amberalvarez@skinserve.com',71406900);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Margret Stevens','321 Beekman Place, Farmers, Georgia','margretstevens@skinserve.com',92102598);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Beck Solomon','276 Independence Avenue, Northchase, American Samoa','becksolomon@skinserve.com',94761568);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Moore Weaver','545 Fanchon Place, Tampico, Oklahoma','mooreweaver@skinserve.com',98743919);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Melva Franco','703 Bristol Street, Wyoming, Louisiana','melvafranco@skinserve.com',83964342);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Josie Sullivan','569 Ditmas Avenue, Cutter, Massachusetts','josiesullivan@skinserve.com',91856643);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Natalie Montgomery','616 Sackman Street, Windsor, Tennessee','nataliemontgomery@skinserve.com',53838656);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Heidi Ortiz','402 Herkimer Place, Chilton, Rhode Island','heidiortiz@skinserve.com',51306177);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Claire Ratliff','301 Shale Street, Chaparrito, Alabama','claireratliff@skinserve.com',50922110);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Tiffany Brooks','144 Lincoln Place, Loveland, Mississippi','tiffanybrooks@skinserve.com',35217331);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Dunlap Watson','886 Ryder Street, Grantville, Maryland','dunlapwatson@skinserve.com',89755579);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Estela Elliott','638 Beaumont Street, Wiscon, Florida','estelaelliott@skinserve.com',86100953);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Mercer Wagner','444 Dunne Place, Ilchester, New Hampshire','mercerwagner@skinserve.com',65190346);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Adele Delgado','476 Rapelye Street, Brazos, Montana','adeledelgado@skinserve.com',64695196);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Alma Nolan','509 Church Lane, Tonopah, Hawaii','almanolan@skinserve.com',38442669);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Turner Gonzales','188 Sackett Street, Wikieup, Connecticut','turnergonzales@skinserve.com',89401253);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Obrien Brewer','944 Wallabout Street, Alafaya, Oregon','obrienbrewer@skinserve.com',52982539);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Enid Bray','585 Diamond Street, Stollings, Vermont','enidbray@skinserve.com',96696302);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Camille Arnold','495 Taylor Street, Epworth, Michigan','camillearnold@skinserve.com',42748160);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Helena Parker','531 Harman Street, Westwood, Ohio','helenaparker@skinserve.com',86157946);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Scott Pearson','171 Harkness Avenue, Roland, New Jersey','scottpearson@skinserve.com',52596500);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Anne Jimenez','456 Linden Boulevard, Kersey, Maine','annejimenez@skinserve.com',87278798);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Simone Hutchinson','151 Fleet Street, Dyckesville, Pennsylvania','simonehutchinson@skinserve.com',87081020);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Annie Hampton','392 Seeley Street, Lynn, Virgin Islands','anniehampton@skinserve.com',36310815);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Mann Mccoy','664 Whitney Avenue, Harmon, South Carolina','mannmccoy@skinserve.com',87519995);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Lou Harris','382 Bridgewater Street, Brethren, Utah','louharris@skinserve.com',70222824);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Cheryl Bonner','820 Bills Place, Riegelwood, District Of Columbia','cherylbonner@skinserve.com',50733537);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Eve Giles','998 Holmes Lane, Crenshaw, Arkansas','evegiles@skinserve.com',43513834);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Abbott Dodson','933 Lawrence Avenue, Eggertsville, West Virginia','abbottdodson@skinserve.com',93639252);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Casey Rivers','361 Seigel Street, Glenville, Colorado','caseyrivers@skinserve.com',50347838);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Jeri Tran','775 Lorimer Street, Greenbush, Guam','jeritran@skinserve.com',52735247);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','David Tate','101 Neptune Court, Winston, Wisconsin','davidtate@skinserve.com',55517067);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Debbie Patton','592 Stryker Street, Floris, Marshall Islands','debbiepatton@skinserve.com',75431338);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Bolton Herring','558 Kansas Place, Foxworth, Minnesota','boltonherring@skinserve.com',35853976);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Vang Hubbard','724 Hamilton Walk, Carrizo, Federated States Of Micronesia','vanghubbard@skinserve.com',76134858);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Flowers Bradley','469 Morton Street, Orin, Arizona','flowersbradley@skinserve.com',45113723);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Ivy Golden','547 Bleecker Street, Dennard, Kansas','ivygolden@skinserve.com',85717366);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Lydia Larson','190 Rock Street, Lowell, Alaska','lydialarson@skinserve.com',45067709);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Wilkinson Mueller','300 Temple Court, Harrison, Palau','wilkinsonmueller@skinserve.com',81661646);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Watkins Stanton','551 Norman Avenue, Kylertown, Indiana','watkinsstanton@skinserve.com',42255427);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Estella Quinn','612 Tapscott Street, Albrightsville, Nebraska','estellaquinn@skinserve.com',46200999);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Osborne Ayers','821 Beayer Place, Madaket, Delaware','osborneayers@skinserve.com',69693623);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Shelly Clemons','726 Forest Place, Nicholson, North Carolina','shellyclemons@skinserve.com',98124968);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Willie Mckay','635 Wogan Terrace, Zeba, Illinois','williemckay@skinserve.com',70297195);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Addie Maddox','991 Seabring Street, Deercroft, Wyoming','addiemaddox@skinserve.com',52480560);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Branch Perry','126 Madison Street, Levant, Texas','branchperry@skinserve.com',53632967);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Gregory Hardy','249 Schroeders Avenue, Cedarville, Virginia','gregoryhardy@skinserve.com',53403929);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Sims Yates','967 Cooke Court, Escondida, Washington','simsyates@skinserve.com',45006369);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Beard Gentry','872 Drew Street, Belleview, North Dakota','beardgentry@skinserve.com',46452566);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Bernadine Silva','959 Grattan Street, Taycheedah, New York','bernadinesilva@skinserve.com',66872453);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Merrill Knight','473 Lombardy Street, Beaulieu, New Mexico','merrillknight@skinserve.com',57052417);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Lynne Washington','342 Whitty Lane, Holcombe, Missouri','lynnewashington@skinserve.com',64513455);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Pacheco Chen','828 Lawn Court, Glenshaw, California','pachecochen@skinserve.com',96651428);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Burt Bass','407 Seba Avenue, Witmer, South Dakota','burtbass@skinserve.com',87804939);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Conner Mercer','676 Ryerson Street, Vowinckel, Idaho','connermercer@skinserve.com',80311782);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Cabrera Terrell','396 Morgan Avenue, Jugtown, Kentucky','cabreraterrell@skinserve.com',88063653);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Monica Mayo','221 Atkins Avenue, Biddle, Northern Mariana Islands','monicamayo@skinserve.com',72690298);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Selena Snyder','493 Locust Street, Esmont, Puerto Rico','selenasnyder@skinserve.com',94576763);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Lavonne Vega','533 Victor Road, Belmont, Iowa','lavonnevega@skinserve.com',60403295);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Salazar Nixon','462 Adler Place, Healy, Georgia','salazarnixon@skinserve.com',64101526);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Washington Dickson','221 Just Court, Dalton, American Samoa','washingtondickson@skinserve.com',73660158);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Mara Ferrell','450 Lincoln Avenue, Waukeenah, Oklahoma','maraferrell@skinserve.com',82617467);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Denise Mcgowan','428 Lexington Avenue, Maybell, Louisiana','denisemcgowan@skinserve.com',58640862);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Danielle Walker','275 Putnam Avenue, Gila, Massachusetts','daniellewalker@skinserve.com',38441770);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Flossie Wilkins','292 Brighton Court, Wheaton, Tennessee','flossiewilkins@skinserve.com',77442090);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Dodson England','346 Sandford Street, Jenkinsville, Rhode Island','dodsonengland@skinserve.com',50472981);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Gabrielle Green','358 Seaview Court, Slovan, Alabama','gabriellegreen@skinserve.com',98076413);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Decker Frank','804 Jamison Lane, Ryderwood, Mississippi','deckerfrank@skinserve.com',54074310);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Odom Copeland','945 Locust Avenue, Drummond, Maryland','odomcopeland@skinserve.com',73408708);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Griffith Hendrix','898 Evans Street, Cetronia, Florida','griffithhendrix@skinserve.com',37822696);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Leanne Chambers','131 Chase Court, Newkirk, New Hampshire','leannechambers@skinserve.com',32029000);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Kirkland Ingram','419 Channel Avenue, Vicksburg, Montana','kirklandingram@skinserve.com',45852653);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Boyer Erickson','601 Cropsey Avenue, Waterloo, Hawaii','boyererickson@skinserve.com',71363943);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Letha Mcgee','211 Everit Street, Gouglersville, Connecticut','lethamcgee@skinserve.com',49033696);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Glenn Carroll','345 Albee Square, Carbonville, Oregon','glenncarroll@skinserve.com',82074223);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Ray Coffey','181 Schenectady Avenue, Singer, Vermont','raycoffey@skinserve.com',74484165);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Santos Ayala','407 Coffey Street, Lopezo, Michigan','santosayala@skinserve.com',57059147);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Carey Bright','698 Montauk Court, Welch, Ohio','careybright@skinserve.com',77208538);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Galloway Richmond','325 Pacific Street, Winfred, New Jersey','gallowayrichmond@skinserve.com',59975759);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Conrad Cardenas','539 Aberdeen Street, Gerton, Maine','conradcardenas@skinserve.com',36894319);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Leblanc Stafford','612 Poly Place, Brownlee, Pennsylvania','leblancstafford@skinserve.com',99484667);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Blankenship Livingston','910 Himrod Street, Westboro, Virgin Islands','blankenshiplivingston@skinserve.com',39912831);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Patrica Waller','454 Merit Court, Darbydale, South Carolina','patricawaller@skinserve.com',90394625);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Koch Noble','613 Nixon Court, Thermal, Utah','kochnoble@skinserve.com',30071687);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Gilmore Mcmahon','548 Fair Street, Breinigsville, District Of Columbia','gilmoremcmahon@skinserve.com',54876246);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Nita Logan','767 Canda Avenue, Finzel, Arkansas','nitalogan@skinserve.com',50207646);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Betty Romero','370 Ferris Street, Cowiche, West Virginia','bettyromero@skinserve.com',47572718);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Kathy Skinner','166 Grace Court, Gorst, Colorado','kathyskinner@skinserve.com',62880478);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Wilkins Wallace','613 Hornell Loop, Needmore, Guam','wilkinswallace@skinserve.com',63265575);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Christensen Bridges','508 Cyrus Avenue, Northridge, Wisconsin','christensenbridges@skinserve.com',36305986);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Burris Gross','973 Orange Street, Nescatunga, Marshall Islands','burrisgross@skinserve.com',78921956);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Figueroa Bradshaw','637 Sullivan Street, Cotopaxi, Minnesota','figueroabradshaw@skinserve.com',36211419);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Ella Foreman','114 Wyona Street, Retsof, Federated States Of Micronesia','ellaforeman@skinserve.com',62917540);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Ola Strickland','509 Seagate Terrace, Strong, Arizona','olastrickland@skinserve.com',34194284);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Jennings Grimes','204 Corbin Place, Caspar, Kansas','jenningsgrimes@skinserve.com',46645707);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Wanda Phelps','414 Jardine Place, Kieler, Alaska','wandaphelps@skinserve.com',85211820);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Wong Moore','328 Pilling Street, Avoca, Palau','wongmoore@skinserve.com',47912694);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Townsend Thompson','801 Elmwood Avenue, Lemoyne, Indiana','townsendthompson@skinserve.com',87370662);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Eleanor Meyers','173 Sharon Street, Vandiver, Nebraska','eleanormeyers@skinserve.com',81806168);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Fitzgerald Fleming','194 Carroll Street, Cashtown, Delaware','fitzgeraldfleming@skinserve.com',34348073);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Vivian Osborne','683 Roosevelt Court, Darrtown, North Carolina','vivianosborne@skinserve.com',71941764);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Pickett Kemp','559 Hinckley Place, Elliston, Illinois','pickettkemp@skinserve.com',64420338);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Nadia Kirby','455 Dekalb Avenue, Bowie, Wyoming','nadiakirby@skinserve.com',90332824);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Letitia Mooney','959 Glenwood Road, Ivanhoe, Texas','letitiamooney@skinserve.com',82619183);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Bruce Nguyen','446 Coyle Street, Brogan, Virginia','brucenguyen@skinserve.com',39809178);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Brandi Bruce','788 Clinton Avenue, Hoagland, Washington','brandibruce@skinserve.com',85603978);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Opal Petersen','894 Lincoln Road, Hannasville, North Dakota','opalpetersen@skinserve.com',38663712);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Marina Payne','421 Throop Avenue, Takilma, New York','marinapayne@skinserve.com',63436713);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Curtis Mccarthy','525 Orient Avenue, Stagecoach, New Mexico','curtismccarthy@skinserve.com',93021482);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Hicks Morales','193 Branton Street, Noxen, Missouri','hicksmorales@skinserve.com',95272162);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Rivas Conner','717 Norfolk Street, Greenfields, California','rivasconner@skinserve.com',75086078);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Snow Burns','398 Barwell Terrace, Laurelton, South Dakota','snowburns@skinserve.com',88600967);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Jayne Brady','838 Greenwood Avenue, Valmy, Idaho','jaynebrady@skinserve.com',86654172);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Leona Harper','353 Gallatin Place, Macdona, Kentucky','leonaharper@skinserve.com',63841909);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Ruthie Savage','965 Sullivan Place, Dotsero, Northern Mariana Islands','ruthiesavage@skinserve.com',87414837);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Verna Cameron','445 Jerome Street, Sanford, Puerto Rico','vernacameron@skinserve.com',47634094);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Gail Nichols','103 Oak Street, Collins, Iowa','gailnichols@skinserve.com',59626282);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Angela Wood','592 Kent Street, Glasgow, Georgia','angelawood@skinserve.com',36896068);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Ferrell Kirk','925 Atlantic Avenue, Silkworth, American Samoa','ferrellkirk@skinserve.com',98992245);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Carrie William','561 Losee Terrace, Cazadero, Oklahoma','carriewilliam@skinserve.com',47717822);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Holloway Roberson','992 Menahan Street, Richford, Louisiana','hollowayroberson@skinserve.com',48389278);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Beasley Crosby','980 Walker Court, Helen, Massachusetts','beasleycrosby@skinserve.com',34633699);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Michael Marshall','639 Billings Place, Groveville, Tennessee','michaelmarshall@skinserve.com',55491675);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Kim Chavez','530 Fayette Street, Fairhaven, Rhode Island','kimchavez@skinserve.com',65537318);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Catherine Norman','608 Canton Court, Hayden, Alabama','catherinenorman@skinserve.com',36756569);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Pamela David','480 Douglass Street, Keller, Mississippi','pameladavid@skinserve.com',69792889);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Katheryn Pollard','102 Johnson Street, Dana, Maryland','katherynpollard@skinserve.com',53844435);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Kara Caldwell','184 Monitor Street, Richville, Florida','karacaldwell@skinserve.com',87532045);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Lancaster Cruz','355 Ridgecrest Terrace, Greer, New Hampshire','lancastercruz@skinserve.com',94035877);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Carmela Hodges','596 Rockwell Place, Jacksonburg, Montana','carmelahodges@skinserve.com',74424080);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Carr Berry','144 Hudson Avenue, Sabillasville, Hawaii','carrberry@skinserve.com',67640598);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Tasha Flores','525 Glenmore Avenue, Virgie, Connecticut','tashaflores@skinserve.com',80402510);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Harrington Merritt','614 Colonial Road, Dahlen, Oregon','harringtonmerritt@skinserve.com',44738724);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Millie Santiago','161 Gardner Avenue, Bentley, Vermont','milliesantiago@skinserve.com',62502368);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Peggy Conrad','759 Harbor Court, Fingerville, Michigan','peggyconrad@skinserve.com',49275683);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Owens Stephens','400 Autumn Avenue, Cornucopia, Ohio','owensstephens@skinserve.com',96394293);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Simon Rosario','574 Quincy Street, Orick, New Jersey','simonrosario@skinserve.com',77242785);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Lessie Morin','850 Senator Street, Wakarusa, Maine','lessiemorin@skinserve.com',51970736);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Welch Shannon','644 Howard Place, Turpin, Pennsylvania','welchshannon@skinserve.com',87047407);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Hope Shaw','257 Wyckoff Avenue, Calpine, Virgin Islands','hopeshaw@skinserve.com',84079453);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Lucinda Mcfadden','273 Fountain Avenue, Lowgap, South Carolina','lucindamcfadden@skinserve.com',45846036);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Priscilla Morgan','505 Ralph Avenue, Islandia, Utah','priscillamorgan@skinserve.com',62447630);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Tate Lang','744 Thornton Street, Ballico, District Of Columbia','tatelang@skinserve.com',62212671);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Adrienne Hicks','529 Garden Street, Caroline, Arkansas','adriennehicks@skinserve.com',75684480);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Mccray Hancock','500 Dinsmore Place, Hendersonville, West Virginia','mccrayhancock@skinserve.com',80655331);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Linda Sexton','329 Newel Street, Homestead, Colorado','lindasexton@skinserve.com',43374831);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Nona Marquez','615 Glendale Court, Oberlin, Guam','nonamarquez@skinserve.com',51338931);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Oconnor Todd','569 Krier Place, Southmont, Wisconsin','oconnortodd@skinserve.com',36089890);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Barry Randolph','596 Nelson Street, Bedias, Marshall Islands','barryrandolph@skinserve.com',94541716);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Love Dorsey','532 Seigel Court, Snowville, Minnesota','lovedorsey@skinserve.com',38019826);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Dale Conway','279 Battery Avenue, Trona, Federated States Of Micronesia','daleconway@skinserve.com',40697092);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Riddle Meadows','278 Stuyvesant Avenue, Interlochen, Arizona','riddlemeadows@skinserve.com',98071220);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Karina Church','527 Fleet Place, Noblestown, Kansas','karinachurch@skinserve.com',72771610);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Leola Walton','535 Anna Court, Babb, Alaska','leolawalton@skinserve.com',87563937);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Ware Bartlett','715 Ingraham Street, Derwood, Palau','warebartlett@skinserve.com',36520181);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Constance Velasquez','141 Harden Street, Oneida, Indiana','constancevelasquez@skinserve.com',37940570);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mrs','Fernandez Horne','813 Pierrepont Street, Greenock, Nebraska','fernandezhorne@skinserve.com',50510940);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Anita Pena','916 Centre Street, Townsend, Delaware','anitapena@skinserve.com',58766547);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Madeleine Maxwell','149 Ludlam Place, Hayes, North Carolina','madeleinemaxwell@skinserve.com',32135132);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Juliette Mcneil','290 Keap Street, Westerville, Illinois','juliettemcneil@skinserve.com',86682142);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'ms','Mavis Watkins','665 Linwood Street, Catherine, Wyoming','maviswatkins@skinserve.com',93984790);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Thelma Sloan','566 Monument Walk, Waumandee, Texas','thelmasloan@skinserve.com',54026955);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Bernard Donovan','148 Cypress Court, Richmond, Virginia','bernarddonovan@skinserve.com',65460343);
INSERT INTO customers(id,salutation,name,address,email,phone) VALUES (NULL,'mr','Clara Hays','629 Berry Street, Conway, Washington','clarahays@skinserve.com',43655352);
INSERT INTO `products` (`id`, `name`, `color`, `desc`, `gender`, `price`) VALUES
(NULL, 'boots captoe brogues espresso crazy horse leather', 'espresso', 'Our boots captoe gives a dash of heritage charm by detailing them with classic broguing. Skilfully crafted in military from tactile crazy horse in a rich espresso with leather microrubber sole. This shoes made with Military last, D width.We recommend true to size for this shoes.', 'M', 90),
(NULL, 'chelsea boots black suede', 'black', 'Ticking off almost two centuries of adventures, the Chelsea boot is a style staple for men around the globe. Wherever your week takes you, to the concrete jungle or somewhere off the beaten track, a pair of Chelsea boots are the ultimate companion. Made from Black suede upper and leather sole combination on a Venice last, we recommend you go true size for this model.', 'M', 80),
(NULL, 'chelsea boots grey suede', 'grey', 'Ticking off almost two centuries of adventures, the Chelsea boot is a style staple for men around the globe. Wherever your week takes you, to the concrete jungle or somewhere off the beaten track, a pair of Chelsea boots are the ultimate companion. Made from Dark Grey suede upper and leather sole combination on a Venice last, we recommend you go true size for this model.', 'M', 80),
(NULL, 'chelsea boots tan ch', 'tan', 'Cut from crazy horse leather with elasticated side panels and a grosgrain heel tab, the Chelsea boots are a classic design that lends the perfect finish to smart casual dressing.When scraped the crazy horse leather will change its color and will give it a worn out appearance. This allows you to make your favorite brand new item look rugged, rare and matured.', 'M', 80),
(NULL, 'chukka captoe brogues tan ch', 'tan', 'Chukka boots are cut from the label''s standard last for a sleek look and comfortable fit. The handsome crazy horse Tan is modern and easy to wear. Outsole using comfort leather microrubber sole. This shoes has last Military, D width. We recommend True to Size for this shoes.', 'M', 90),
(NULL, 'chukka captoe brogues firebrown ch', 'brown', 'Chukka boots are cut from the label''s standard last for a sleek look and comfortable fit. The handsome crazy horse firebrown is modern and easy to wear. Outsole using comfort leather microrubber sole. This shoes has last Military, D width. We recommend True to Size for this shoes.', 'M', 90),
(NULL, 'derby longwing black & scotch black', 'black', 'Derby longwing shoes have been made from black and scotch black leather set on slightly exaggerated soles for a modern look. Wear yours to smarten up dark-wash jeans and other casual trousers.This shoes has last Military, D width. We recommend True to Size for this shoes.', 'M', 85),
(NULL, 'derby wing tip oxblood', 'oxblood', 'Derby shoes are crafted from a sleek leather that''s polished to an impressive lustre. This timeless oxblood pair will make a versatile addition to your workwear wardrobe. Using manual punches brogues medalion with comfort rubber sole. This shoes has last Military, D width. We recommend True to Size for this shoes.', 'M', 75),
(NULL, 'loafers slippers l.i.f.e heels black', 'black', 'Our signature Loafers Slippers silhouette with our new Lightweight Injected Foam Exthane heels outsole or as we like to call it L.I.F.E outsole. Its super lightweight at only 278gr. Proudly claimed to be first local brand to adapt a tie-less lace for easier putting on and off your shoes. We recommend true size for your perfect fit.', 'M', 50),
(NULL, 'loafers penny black', 'black', 'Classic Loafer Penny feels so comfortable you will not believe it''s a dress shoe. This classic men''s dress shoe is as stylish and comfortable in a business meeting as it is worn barefoot. The Classic Loafer Penny is the perfect dress shoe to pair with a suit for the office, or khaki''s for a dinner with friends.', 'M', 90),
(NULL, 'loafers penny l.i.f.e heels black', 'black', 'Our signature Loafers Penny silhouette with our new Lightweight Injected Foam Exthane heels outsole or as we like to call it L.I.F.E outsole. Its super lightweight at only 278gr. Proudly claimed to be first local brand to adapt a tie-less lace for easier putting on and off your shoes. We recommend true size for your perfect fit.', 'M', 50),
(NULL, 'loafers slippers black', 'black', 'Meticulously crafted in Indonesia from black nappa leather, they are set on the label''s signature leather soles for sure traction. Wear them with slim tailoring to anchor smart-casual looks. We recommend True to Size for this shoes.', 'M', 85),
(NULL, 'loafers tasseled l.i.f.e whiskey', 'whiskey', 'Your cabinet is not complete without a brown shoe, and your brown shoe is not complete without a semi-casual brogues. So to fulfill your needs we make you wingtip oxford in whiskey leather. Cope one and your life is complete.', 'M', 50),
(NULL, 'loafers tasseled oxblood leather', 'oxblood', 'Loafers will lend sophisticated flair to both tailored and smart-casual looks in a streamlined silhouette. Made with brush-off leather it''ll give an antique finished look. Complete with natural leather outsole for that classic look and finished with small bows at the fronts.', 'M', 90),
(NULL, 'loafers wingtip black leather', 'black', 'Loafers will lend sophisticated flair to both tailored and smart-casual looks. In a streamlined silhouette, they''re fully lined in leather and finished with black leather sole and small bows at the fronts. This shoes has last Italy, C Width. We recommend True to Size for this shoes.', 'M', 90),
(NULL, 'oxford blucher black wax', 'black', 'Blucher is a type of shoes that made from a single piece of leather. Its simple and perfect for a very formal suit and tie occation. Made on our Italy last it tick another box as our Italy last are narrow shape on the toe.', 'M', 90),
(NULL, 'oxford captoe brogues black leather', 'black', 'This oxford is a contemporary take on our captoe brogue on black leather, every man''s wardrobe staple. This oxford using italy last with leather microrubber sole. This shoes has last Italy, C width. We recommend True to Size for this shoes.', 'M', 85),
(NULL, 'oxford captoe brogues calf tan', 'tan', 'One of our favorite combination. A calf tan upper on an antique double bend leather sole. A very versatile colorway, which can be worn for business during the week and with denim on the weekends', 'M', 90),
(NULL, 'oxford captoe l.i.f.e all black', 'black', 'Our signature Oxford Captoe silhouette with our new Lightweight Injected Foam Exthane outsole or as we like to call it L.I.F.E outsole. Its super lightweight at only 270gr. Featuring the first local brand to adapt a tie-less lace for easier putting on and off your shoes. See through brogues with breathable lining for super comfort. We recommend true size for your perfect fit.', 'M', 50),
(NULL, 'oxford captoe l.i.f.e fire brown', 'brown', 'Another L.I.F.E series in Oxford Captoe with a combination of fire brown crazy horse leather and black colour outsole. Crazy horse leather will go darker and looks distressed with used. As every person used are the different the aging effect will vary from one to another, leads to a very personal pair along with time.', 'M', 50),
(NULL, 'oxford cap toe l.i.f.e saddle tan', 'tan', 'One of the best selling Oxford from our L.I.F.E series now come in saddle tan leather pair with natural colour L.I.F.E outsole.The saddle tan will age gracefully with usage and the natural L.I.F.E outsole are perfect match for them.Oh and this Oxford Captoe are full brogues, which bring a twist of dapper shoes for casual daily usage.', 'M', 50),
(NULL, 'oxford wingtip l.i.f.e black', 'black', 'Our signature Oxford wingtip silhouette with our new Lightweight Injected Foam Exthane outsole or as we like to call it L.I.F.E outsole. Its super lightweight at only 270gr. Featuring the first local brand to adapt a tie-less lace for easier putting on and off your shoes. See through brogues with breathable lining for super comfort. We recommend true size for your perfect fit.', 'M', 50),
(NULL, 'oxford wingtip l.i.f.e cigar brown', 'brown', 'Your cabinet is not complete without a brown shoe, and your brown shoe is not complete without a semi-casual brogues. So to fulfill your needs we make you wingtip oxford in cigar brown leather. Cope one and your life is complete.', 'M', 50),
(NULL, 'oxford wing tip l.i.f.e fire brown', 'brown', 'Another L.I.F.E series in Oxford Wingtip with a combination of fire brown crazy horse leather and natural colour outsole. Crazy horse leather will go darker and looks distressed with used. As every person used are the different the aging effect will vary from one to another, leads to a very personal pair along with time.', 'M', 50),
(NULL, 'oxford wingtip l.i.f.e whiskey', 'brown', 'Your cabinet is not complete without a brown shoe, and your brown shoe is not complete without a semi-casual brogues. So to fulfill your needs we make you wingtip oxford in whiskey leather. Cope one and your life is complete.', 'M', 50),
(NULL, 'oxford wing tip l.i.f.e wolf grey', 'grey', 'A very special L.I.F.E series article. This article made on chrome-crust leather hand finished into what we would like to call wolf-grey leather. Combined with natural colour L.I.F.E series this is perfect for everyday leisure.', 'M', 50),
(NULL, 'oxford captoe l.i.f.e black natural sole', 'black', 'Our signature Oxford Captoe silhouette with our new Lightweight Injected Foam Exthane outsole or as we like to call it L.I.F.E outsole. Its super lightweight at only 270gr. Featuring the first local brand to adapt a tie-less lace for easier putting on and off your shoes. See through brogues with breathable lining for super comfort. We recommend true size for your perfect fit.', 'M', 50),
-- -- for woman
(NULL, 'billy short black', 'black', 'The little sister of the Billy Pull On. With its beautifully distressed surface, this short boot is made from brush off full grain leather that gets that perfectly broken-in look you''re going for.', 'W', 554.70),
(NULL, 'billy short cognac', 'cognac', 'The little sister of the Billy Pull On. With its beautifully distressed surface, this short boot is made from leather that''s been well-oiled and washed to get that perfectly broken-in look. These boots thrive in both rural grasslands and fashion centers. Slip on, kick off, dance frequently.', 'W', 383.30),
(NULL, 'elyssa oxford black', 'black', 'The Elyssa oxfords are expertly crafted from a soft dip-dyed leather. They have a round toe, traditional lace-up closures and a stacked heel for added comfort.', 'W', 439.20),
(NULL, 'elyssa oxford cognac', 'cognac', 'The Elyssa oxfords are expertly crafted from a soft dip-dyed leather. They have a round toe, traditional lace-up closures and a stacked heel for added comfort. ', 'W', 439.20),
(NULL, 'elyssa oxford silver', 'silver', 'The Elyssa oxfords are expertly crafted from a soft dip-dyed leather. They have a round toe, traditional lace-up closures and a stacked heel for added comfort. ', 'W', 439.20),
(NULL, 'kelly cvo oxford black', 'black', 'Feel instantly smarter and more pulled-together with the thoughtfully made dip-dyed leather slip-on oxford shoes. This style is free from decoration or extraneous detail. The cement construction ensures they feel comfortable from morning to evening as they are extremely soft and flexible.', 'W', 477.70),
(NULL, 'kelly cvo oxford grey', 'grey', 'Feel instantly smarter and more pulled-together with the thoughtfully made dip-dyed leather slip-on oxford shoes. This style is free from decoration or extraneous detail. The cement construction ensures they feel comfortable from morning to evening as they are extremely soft and flexible.', 'W', 477.70),
(NULL, 'kenzie venetian black', 'black', 'The ''Kenzie'' ballerina-inspired flats are every girl''s dream- simple and very cool. This slip-on pair has been crafted from supple antiqued Italian leather in a sleek pointed-toe shape.', 'W', 381.40),
(NULL, 'kenzie venetian red', 'red', 'The ''Kenzie'' ballerina-inspired flats are every girl''s dream- simple and very cool. This slip-on pair has been crafted from supple antiqued Italian leather in a sleek pointed-toe shape.', 'W', 381.40),
(NULL, 'ray mule black', 'black', 'The sleek city Western-inspired silhouette of the mule makes for a subtle style statement. Simple slip on construction with a pointed toe and low heel crafted from a smooth oiled vegetable tanned Italian leather.', 'W', 344.80),
(NULL, 'ray mule cognac', 'cognac', 'The sleek city Western-inspired silhouette of the mule makes for a subtle style statement. Simple slip on construction with a pointed toe and low heel crafted from a smooth oiled vegetable tanned Italian leather.', 'W', 344.80),
(NULL, 'sienna ballet black', 'black', 'A hybrid of our beloved Carson and Regina ballet flats, the Sienna defines dressy sophistication. Beautifully tailored with a pointed toe, this shoe is handcrafted from a luxuriously soft polished full grain Italian leather. Leather lined, lightweight and designed with a rubber outsole-it''s like you''re walking on air.', 'W', 342.90),
(NULL, 'sienna ballet red', 'red', 'A hybrid of our beloved Carson and Regina ballet flats, the Sienna defines dressy sophistication. Beautifully tailored with a pointed toe, this shoe is handcrafted from a luxuriously soft polished full grain Italian leather. Leather lined, lightweight and designed with a rubber outsole-it''s like you''re walking on air.', 'W', 287.90),
(NULL, 'sienna ballet saddle', 'saddle', 'A hybrid of our beloved Carson and Regina ballet flats, the Sienna defines dressy sophistication. Beautifully tailored with a pointed toe, this shoe is handcrafted from a luxuriously soft polished full grain Italian leather. Leather lined, lightweight and designed with a rubber outsole-it''s like you''re walking on air.', 'W', 287.90),
(NULL, 'terri penny cognac', 'cognac', 'Made from tumbled Buffalo leather, these ''Terri'' loafers are embellished with hammered coin like studs where you''d traditionally find a penny slot. They have a low heel and subtlety squared off at the toe. Showcase this statement pair by wearing yours to the office, or when you''re out and about.', 'W', 344.80),
(NULL, 'terri penny loafer black', 'black', 'Topped with a classic penny slot and set on a comfortable flat heel, these loafers have been cleanly crafted from the finest tumbled Italian Buffalo leather. Flexible leather sole with rubber top lift.', 'W', 439.20),
(NULL, 'terri zip ankle bootie black', 'black', 'Frye designs timeless pieces with simplicity. These booties are made from soft antiqued vintage Italian leather in a zip-up silhouette so they fit snugly against your ankle. Flexible leather soles with rubber top lift ensure traction.', 'W', 439.20),
(NULL, 'terri zip ankle bootie cognac', 'cognac', 'Frye designs timeless pieces with simplicity. These booties are made from soft antiqued vintage Italian leather in a zip-up silhouette so they fit snugly against your ankle. Flexible leather soles with rubber top lift ensure traction.', 'W', 439.20),
(NULL, 'terri zip ankle bootie grey', 'grey', 'Frye designs timeless pieces with simplicity. These booties are made from soft antiqued vintage Italian leather in a zip-up silhouette so they fit snugly against your ankle. Flexible leather soles with rubber top lift ensure traction.', 'W', 439.20),
(NULL, 'veronica bootie black', 'black', 'Sometimes re-thinking one simple detail is all it takes to modernize a classic style- take the buckles on these booties, for example. Crafted from soft full grain leather, the ''Veronica'' have hand-stitched Goodyear welt soles that are durable and waterproof. We''re not exactly sure what it is, but there''s something about the style that gives you a boost and well, attitude. Whatever it is, we know magic when we see it. Trust us', 'W', 535.50),
(NULL, 'veronica bootie redwood', 'redwood', 'Sometimes re-thinking one simple detail is all it takes to modernize a classic style- take the buckles on these booties, for example. Crafted from soft full grain leather, the ''Veronica'' have hand-stitched Goodyear welt soles that are durable and waterproof. We''re not exactly sure what it is, but there''s something about the style that gives you a boost and well, attitude. Whatever it is, we know magic when we see it. Trust us', 'W', 535.50),
(NULL,'veronica booties tan', 'tan', 'Sometimes re-thinking one simple detail is all it takes to modernize a classic style- take the buckles on these booties, for example. Crafted from soft full grain leather, the ''Veronica'' have hand-stitched Goodyear welt soles that are durable and waterproof. We''re not exactly sure what it is, but there''s something about the style that gives you a boost and well, attitude. Whatever it is, we know magic when we see it. Trust us', 'W', 535.50);
INSERT INTO `pictures` (`id`, `productID`, `pictureURL`) VALUES
(NULL,1,'assets/pictures/men/boots-captoe-brogues-espresso-crazy-horse-leather/boots-captoe-brogues-espresso-crazy-horse-leather-1.jpg'),
(NULL,1,'assets/pictures/men/boots-captoe-brogues-espresso-crazy-horse-leather/boots-captoe-brogues-espresso-crazy-horse-leather-2.jpg'),
(NULL,1,'assets/pictures/men/boots-captoe-brogues-espresso-crazy-horse-leather/boots-captoe-brogues-espresso-crazy-horse-leather-3.jpg'),
(NULL,1,'assets/pictures/men/boots-captoe-brogues-espresso-crazy-horse-leather/boots-captoe-brogues-espresso-crazy-horse-leather-4.jpg'),
(NULL,1,'assets/pictures/men/boots-captoe-brogues-espresso-crazy-horse-leather/boots-captoe-brogues-espresso-crazy-horse-leather.jpg'),
(NULL,2,'assets/pictures/men/chelsea-boots-black-suede/chelsea-boots-black-suede-1.jpg'),
(NULL,2,'assets/pictures/men/chelsea-boots-black-suede/chelsea-boots-black-suede-2.jpg'),
(NULL,2,'assets/pictures/men/chelsea-boots-black-suede/chelsea-boots-black-suede-3.jpg'),
(NULL,2,'assets/pictures/men/chelsea-boots-black-suede/chelsea-boots-black-suede.jpg'),
(NULL,3,'assets/pictures/men/chelsea-boots-grey-suede/chelsea-boots-grey-suede-1.jpg'),
(NULL,3,'assets/pictures/men/chelsea-boots-grey-suede/chelsea-boots-grey-suede-2.jpg'),
(NULL,3,'assets/pictures/men/chelsea-boots-grey-suede/chelsea-boots-grey-suede-3.jpg'),
(NULL,3,'assets/pictures/men/chelsea-boots-grey-suede/chelsea-boots-grey-suede-4.jpg'),
(NULL,3,'assets/pictures/men/chelsea-boots-grey-suede/chelsea-boots-grey-suede.jpg'),
(NULL,4,'assets/pictures/men/chelsea-boots-tan-ch/chelsea-boots-tan-ch-1.jpg'),
(NULL,4,'assets/pictures/men/chelsea-boots-tan-ch/chelsea-boots-tan-ch-2.jpg'),
(NULL,4,'assets/pictures/men/chelsea-boots-tan-ch/chelsea-boots-tan-ch-3.jpg'),
(NULL,4,'assets/pictures/men/chelsea-boots-tan-ch/chelsea-boots-tan-ch-4.jpg'),
(NULL,4,'assets/pictures/men/chelsea-boots-tan-ch/chelsea-boots-tan-ch.jpg'),
(NULL,5,'assets/pictures/men/chukka-captoe-brogues/chukka-captoe-brogues-1.jpg'),
(NULL,5,'assets/pictures/men/chukka-captoe-brogues/chukka-captoe-brogues-2.jpg'),
(NULL,5,'assets/pictures/men/chukka-captoe-brogues/chukka-captoe-brogues-3.jpg'),
(NULL,5,'assets/pictures/men/chukka-captoe-brogues/chukka-captoe-brogues-4.jpg'),
(NULL,5,'assets/pictures/men/chukka-captoe-brogues/chukka-captoe-brogues.jpg'),
(NULL,6,'assets/pictures/men/chukka-captoe-brogues-firebrown/chukka-captoe-brogues-firebrown-1.jpg'),
(NULL,6,'assets/pictures/men/chukka-captoe-brogues-firebrown/chukka-captoe-brogues-firebrown-2.jpg'),
(NULL,6,'assets/pictures/men/chukka-captoe-brogues-firebrown/chukka-captoe-brogues-firebrown-3.jpg'),
(NULL,6,'assets/pictures/men/chukka-captoe-brogues-firebrown/chukka-captoe-brogues-firebrown-4.jpg'),
(NULL,6,'assets/pictures/men/chukka-captoe-brogues-firebrown/chukka-captoe-brogues-firebrown.jpg'),
(NULL,7,'assets/pictures/men/derby-longwing-black-scotch-black/derby-longwing-black-scotch-black-1.jpg'),
(NULL,7,'assets/pictures/men/derby-longwing-black-scotch-black/derby-longwing-black-scotch-black-2.jpg'),
(NULL,7,'assets/pictures/men/derby-longwing-black-scotch-black/derby-longwing-black-scotch-black-3.jpg'),
(NULL,7,'assets/pictures/men/derby-longwing-black-scotch-black/derby-longwing-black-scotch-black-4.jpg'),
(NULL,7,'assets/pictures/men/derby-longwing-black-scotch-black/derby-longwing-black-scotch-black.jpg'),
(NULL,8,'assets/pictures/men/derby-wingtip-oxblood/derby-wingtip-oxblood-1.jpg'),
(NULL,8,'assets/pictures/men/derby-wingtip-oxblood/derby-wingtip-oxblood-2.jpg'),
(NULL,8,'assets/pictures/men/derby-wingtip-oxblood/derby-wingtip-oxblood-3.jpg'),
(NULL,8,'assets/pictures/men/derby-wingtip-oxblood/derby-wingtip-oxblood-4.jpg'),
(NULL,8,'assets/pictures/men/derby-wingtip-oxblood/derby-wingtip-oxblood-5.jpg'),
(NULL,8,'assets/pictures/men/derby-wingtip-oxblood/derby-wingtip-oxblood-6.jpg'),
(NULL,8,'assets/pictures/men/derby-wingtip-oxblood/derby-wingtip-oxblood.jpg'),
(NULL,9,'assets/pictures/men/laofers-slippers-life-heels-black/loafers-slippers-life-heels-black-1.jpg'),
(NULL,9,'assets/pictures/men/laofers-slippers-life-heels-black/loafers-slippers-life-heels-black-2.jpg'),
(NULL,9,'assets/pictures/men/laofers-slippers-life-heels-black/loafers-slippers-life-heels-black-3.jpg'),
(NULL,9,'assets/pictures/men/laofers-slippers-life-heels-black/loafers-slippers-life-heels-black.jpg'),
(NULL,10,'assets/pictures/men/loafers-penny-black/loafers-penny-black-1.jpg'),
(NULL,10,'assets/pictures/men/loafers-penny-black/loafers-penny-black-2.jpg'),
(NULL,10,'assets/pictures/men/loafers-penny-black/loafers-penny-black-3.jpg'),
(NULL,10,'assets/pictures/men/loafers-penny-black/loafers-penny-black-4.jpg'),
(NULL,10,'assets/pictures/men/loafers-penny-black/loafers-penny-black.jpg'),
(NULL,11,'assets/pictures/men/loafers-penny-life-heels-black/loafers-penny-life-heels-black-1.jpg'),
(NULL,11,'assets/pictures/men/loafers-penny-life-heels-black/loafers-penny-life-heels-black-2.jpg'),
(NULL,11,'assets/pictures/men/loafers-penny-life-heels-black/loafers-penny-life-heels-black-3.jpg'),
(NULL,11,'assets/pictures/men/loafers-penny-life-heels-black/loafers-penny-life-heels-black.jpg'),
(NULL,12,'assets/pictures/men/loafers-slippers-black/loafers-slippers-black-1.jpg'),
(NULL,12,'assets/pictures/men/loafers-slippers-black/loafers-slippers-black-2.jpg'),
(NULL,12,'assets/pictures/men/loafers-slippers-black/loafers-slippers-black-3.jpg'),
(NULL,12,'assets/pictures/men/loafers-slippers-black/loafers-slippers-black-4.jpg'),
(NULL,12,'assets/pictures/men/loafers-slippers-black/loafers-slippers-black-5.jpg'),
(NULL,12,'assets/pictures/men/loafers-slippers-black/loafers-slippers-black.jpg'),
(NULL,13,'assets/pictures/men/loafers-tasseled-life-whiskey/loafers-tasseled-life-whiskey-1.jpg'),
(NULL,13,'assets/pictures/men/loafers-tasseled-life-whiskey/loafers-tasseled-life-whiskey-2.jpg'),
(NULL,13,'assets/pictures/men/loafers-tasseled-life-whiskey/loafers-tasseled-life-whiskey-3.jpg'),
(NULL,13,'assets/pictures/men/loafers-tasseled-life-whiskey/loafers-tasseled-life-whiskey-4.jpg'),
(NULL,13,'assets/pictures/men/loafers-tasseled-life-whiskey/loafers-tasseled-life-whiskey.jpg'),
(NULL,14,'assets/pictures/men/loafers-tasseled-oxblood-leather/loafers-tasseled-oxblood-leather-1.jpg'),
(NULL,14,'assets/pictures/men/loafers-tasseled-oxblood-leather/loafers-tasseled-oxblood-leather-2.jpg'),
(NULL,14,'assets/pictures/men/loafers-tasseled-oxblood-leather/loafers-tasseled-oxblood-leather-3.jpg'),
(NULL,14,'assets/pictures/men/loafers-tasseled-oxblood-leather/loafers-tasseled-oxblood-leather-4.jpg'),
(NULL,14,'assets/pictures/men/loafers-tasseled-oxblood-leather/loafers-tasseled-oxblood-leather.jpg'),
(NULL,15,'assets/pictures/men/loafers-wingtip-black-leather/loafers-wingtip-black-leather-1.jpg'),
(NULL,15,'assets/pictures/men/loafers-wingtip-black-leather/loafers-wingtip-black-leather-2.jpg'),
(NULL,15,'assets/pictures/men/loafers-wingtip-black-leather/loafers-wingtip-black-leather-3.jpg'),
(NULL,15,'assets/pictures/men/loafers-wingtip-black-leather/loafers-wingtip-black-leather-4.jpg'),
(NULL,15,'assets/pictures/men/loafers-wingtip-black-leather/loafers-wingtip-black-leather-5.jpg'),
(NULL,15,'assets/pictures/men/loafers-wingtip-black-leather/loafers-wingtip-black-leather.jpg'),
(NULL,16,'assets/pictures/men/oxford-blucher-black-wax/oxford-blucher-black-wax-1.jpg'),
(NULL,16,'assets/pictures/men/oxford-blucher-black-wax/oxford-blucher-black-wax-2.jpg'),
(NULL,16,'assets/pictures/men/oxford-blucher-black-wax/oxford-blucher-black-wax-3.jpg'),
(NULL,16,'assets/pictures/men/oxford-blucher-black-wax/oxford-blucher-black-wax-4.jpg'),
(NULL,16,'assets/pictures/men/oxford-blucher-black-wax/oxford-blucher-black-wax.jpg'),
(NULL,17,'assets/pictures/men/oxford-captoe-brogues-black-leather/oxford-captoe-brogues-black-leather-1.jpg'),
(NULL,17,'assets/pictures/men/oxford-captoe-brogues-black-leather/oxford-captoe-brogues-black-leather-2.jpg'),
(NULL,17,'assets/pictures/men/oxford-captoe-brogues-black-leather/oxford-captoe-brogues-black-leather-3.jpg'),
(NULL,17,'assets/pictures/men/oxford-captoe-brogues-black-leather/oxford-captoe-brogues-black-leather-4.jpg'),
(NULL,17,'assets/pictures/men/oxford-captoe-brogues-black-leather/oxford-captoe-brogues-black-leather-5.jpg'),
(NULL,17,'assets/pictures/men/oxford-captoe-brogues-black-leather/oxford-captoe-brogues-black-leather.jpg'),
(NULL,18,'assets/pictures/men/oxford-captoe-brogues-calf-tan/oxford-captoe-brogues-calf-tan-1.jpg'),
(NULL,18,'assets/pictures/men/oxford-captoe-brogues-calf-tan/oxford-captoe-brogues-calf-tan-2.jpg'),
(NULL,18,'assets/pictures/men/oxford-captoe-brogues-calf-tan/oxford-captoe-brogues-calf-tan-3.jpg'),
(NULL,18,'assets/pictures/men/oxford-captoe-brogues-calf-tan/oxford-captoe-brogues-calf-tan-4.jpg'),
(NULL,18,'assets/pictures/men/oxford-captoe-brogues-calf-tan/oxford-captoe-brogues-calf-tan.jpg'),
(NULL,19,'assets/pictures/men/oxford-captoe-life-black/oxford-captoe-life-black-1.jpg'),
(NULL,19,'assets/pictures/men/oxford-captoe-life-black/oxford-captoe-life-black-2.jpg'),
(NULL,19,'assets/pictures/men/oxford-captoe-life-black/oxford-captoe-life-black-3.jpg'),
(NULL,19,'assets/pictures/men/oxford-captoe-life-black/oxford-captoe-life-black-4.jpg'),
(NULL,19,'assets/pictures/men/oxford-captoe-life-black/oxford-captoe-life-black.jpg'),
(NULL,20,'assets/pictures/men/oxford-captoe-life-fire-brown/oxford-captoe-life-fire-brown-1.jpg'),
(NULL,20,'assets/pictures/men/oxford-captoe-life-fire-brown/oxford-captoe-life-fire-brown-2.jpg'),
(NULL,20,'assets/pictures/men/oxford-captoe-life-fire-brown/oxford-captoe-life-fire-brown-3.jpg'),
(NULL,20,'assets/pictures/men/oxford-captoe-life-fire-brown/oxford-captoe-life-fire-brown.jpg'),
(NULL,21,'assets/pictures/men/oxford-captoe-life-saddle-tan/oxford-captoe-life-saddle-tan-1.jpg'),
(NULL,21,'assets/pictures/men/oxford-captoe-life-saddle-tan/oxford-captoe-life-saddle-tan-2.jpg'),
(NULL,21,'assets/pictures/men/oxford-captoe-life-saddle-tan/oxford-captoe-life-saddle-tan-3.jpg'),
(NULL,21,'assets/pictures/men/oxford-captoe-life-saddle-tan/oxford-captoe-life-saddle-tan-4.jpg'),
(NULL,21,'assets/pictures/men/oxford-captoe-life-saddle-tan/oxford-captoe-life-saddle-tan.jpg'),
(NULL,22,'assets/pictures/men/oxford-wingtip-life-black/oxford-wingtip-life-black-1.jpg'),
(NULL,22,'assets/pictures/men/oxford-wingtip-life-black/oxford-wingtip-life-black-2.jpg'),
(NULL,22,'assets/pictures/men/oxford-wingtip-life-black/oxford-wingtip-life-black-3.jpg'),
(NULL,22,'assets/pictures/men/oxford-wingtip-life-black/oxford-wingtip-life-black-4.jpg'),
(NULL,22,'assets/pictures/men/oxford-wingtip-life-black/oxford-wingtip-life-black.jpg'),
(NULL,23,'assets/pictures/men/oxford-wingtip-life-cigar-brown/oxford-wingtip-life-cigar-brown-1.jpg'),
(NULL,23,'assets/pictures/men/oxford-wingtip-life-cigar-brown/oxford-wingtip-life-cigar-brown-2.jpg'),
(NULL,23,'assets/pictures/men/oxford-wingtip-life-cigar-brown/oxford-wingtip-life-cigar-brown-3.jpg'),
(NULL,23,'assets/pictures/men/oxford-wingtip-life-cigar-brown/oxford-wingtip-life-cigar-brown-4.jpg'),
(NULL,23,'assets/pictures/men/oxford-wingtip-life-cigar-brown/oxford-wingtip-life-cigar-brown.jpg'),
(NULL,24,'assets/pictures/men/oxford-wingtip-life-fire-brown/oxford-wingtip-life-fire-brown-1.jpg'),
(NULL,24,'assets/pictures/men/oxford-wingtip-life-fire-brown/oxford-wingtip-life-fire-brown-2.jpg'),
(NULL,24,'assets/pictures/men/oxford-wingtip-life-fire-brown/oxford-wingtip-life-fire-brown-3.jpg'),
(NULL,24,'assets/pictures/men/oxford-wingtip-life-fire-brown/oxford-wingtip-life-fire-brown.jpg'),
(NULL,25,'assets/pictures/men/oxford-wingtip-life-whiskey/oxford-wingtip-life-whiskey-1.jpg'),
(NULL,25,'assets/pictures/men/oxford-wingtip-life-whiskey/oxford-wingtip-life-whiskey-2.jpg'),
(NULL,25,'assets/pictures/men/oxford-wingtip-life-whiskey/oxford-wingtip-life-whiskey-3.jpg'),
(NULL,25,'assets/pictures/men/oxford-wingtip-life-whiskey/oxford-wingtip-life-whiskey-4.jpg'),
(NULL,25,'assets/pictures/men/oxford-wingtip-life-whiskey/oxford-wingtip-life-whiskey.jpg'),
(NULL,26,'assets/pictures/men/oxford-wingtip-life-wolf-grey/oxford-wing-tip-life-wolf-grey-1.jpg'),
(NULL,26,'assets/pictures/men/oxford-wingtip-life-wolf-grey/oxford-wing-tip-life-wolf-grey-2.jpg'),
(NULL,26,'assets/pictures/men/oxford-wingtip-life-wolf-grey/oxford-wing-tip-life-wolf-grey-3.jpg'),
(NULL,26,'assets/pictures/men/oxford-wingtip-life-wolf-grey/oxford-wing-tip-life-wolf-grey-4.jpg'),
(NULL,26,'assets/pictures/men/oxford-wingtip-life-wolf-grey/oxford-wing-tip-life-wolf-grey.jpg'),
(NULL,27,'assets/pictures/men/oxfors-captoe-life-black-natural-sole/oxford-captoe-life-black-natural-sole-1.jpg'),
(NULL,27,'assets/pictures/men/oxfors-captoe-life-black-natural-sole/oxford-captoe-life-black-natural-sole-2.jpg'),
(NULL,27,'assets/pictures/men/oxfors-captoe-life-black-natural-sole/oxford-captoe-life-black-natural-sole-3.jpg'),
(NULL,27,'assets/pictures/men/oxfors-captoe-life-black-natural-sole/oxford-captoe-life-black-natural-sole-4.jpg'),
(NULL,27,'assets/pictures/men/oxfors-captoe-life-black-natural-sole/oxford-captoe-life-black-natural-sole.jpg'),
(NULL,28,'assets/pictures/women/billy-short-black/billy-short-black-1.jpg'),
(NULL,28,'assets/pictures/women/billy-short-black/billy-short-black-2.jpg'),
(NULL,28,'assets/pictures/women/billy-short-black/billy-short-black-3.jpg'),
(NULL,28,'assets/pictures/women/billy-short-black/billy-short-black-4.jpg'),
(NULL,28,'assets/pictures/women/billy-short-black/billy-short-black.jpg'),
(NULL,29,'assets/pictures/women/billy-short-cognac/billy-short-cognac-1.jpg'),
(NULL,29,'assets/pictures/women/billy-short-cognac/billy-short-cognac-2.jpg'),
(NULL,29,'assets/pictures/women/billy-short-cognac/billy-short-cognac-3.jpg'),
(NULL,29,'assets/pictures/women/billy-short-cognac/billy-short-cognac-4.jpg'),
(NULL,29,'assets/pictures/women/billy-short-cognac/billy-short-cognac.jpg'),
(NULL,30,'assets/pictures/women/elyssa-oxford-black/elyssa-oxford-black-1.jpg'),
(NULL,30,'assets/pictures/women/elyssa-oxford-black/elyssa-oxford-black-2.jpg'),
(NULL,30,'assets/pictures/women/elyssa-oxford-black/elyssa-oxford-black-3.jpg'),
(NULL,30,'assets/pictures/women/elyssa-oxford-black/elyssa-oxford-black-4.jpg'),
(NULL,30,'assets/pictures/women/elyssa-oxford-black/elyssa-oxford-black.jpg'),
(NULL,31,'assets/pictures/women/elyssa-oxford-cognac/elyssa-oxford-cognac-1.jpg'),
(NULL,31,'assets/pictures/women/elyssa-oxford-cognac/elyssa-oxford-cognac-2.jpg'),
(NULL,31,'assets/pictures/women/elyssa-oxford-cognac/elyssa-oxford-cognac-3.jpg'),
(NULL,31,'assets/pictures/women/elyssa-oxford-cognac/elyssa-oxford-cognac-4.jpg'),
(NULL,31,'assets/pictures/women/elyssa-oxford-cognac/elyssa-oxford-cognac.jpg'),
(NULL,32,'assets/pictures/women/elyssa-oxford-silver/elyssa-oxford-silver-1.jpg'),
(NULL,32,'assets/pictures/women/elyssa-oxford-silver/elyssa-oxford-silver-2.jpg'),
(NULL,32,'assets/pictures/women/elyssa-oxford-silver/elyssa-oxford-silver-3.jpg'),
(NULL,32,'assets/pictures/women/elyssa-oxford-silver/elyssa-oxford-silver-4.jpg'),
(NULL,32,'assets/pictures/women/elyssa-oxford-silver/elyssa-oxford-silver.jpg'),
(NULL,33,'assets/pictures/women/kelly-cvo-oxford-black/kelly-cvo-oxford-black-1.jpg'),
(NULL,33,'assets/pictures/women/kelly-cvo-oxford-black/kelly-cvo-oxford-black-2.jpg'),
(NULL,33,'assets/pictures/women/kelly-cvo-oxford-black/kelly-cvo-oxford-black-3.jpg'),
(NULL,33,'assets/pictures/women/kelly-cvo-oxford-black/kelly-cvo-oxford-black-4.jpg'),
(NULL,33,'assets/pictures/women/kelly-cvo-oxford-black/kelly-cvo-oxford-black.jpg'),
(NULL,34,'assets/pictures/women/kelly-cvo-oxford-grey/kelly-cvo-oxford-grey-1.jpg'),
(NULL,34,'assets/pictures/women/kelly-cvo-oxford-grey/kelly-cvo-oxford-grey-2.jpg'),
(NULL,34,'assets/pictures/women/kelly-cvo-oxford-grey/kelly-cvo-oxford-grey-3.jpg'),
(NULL,34,'assets/pictures/women/kelly-cvo-oxford-grey/kelly-cvo-oxford-grey-4.jpg'),
(NULL,34,'assets/pictures/women/kelly-cvo-oxford-grey/kelly-cvo-oxford-grey.jpg'),
(NULL,35,'assets/pictures/women/kenzie-venetian-black/kenzie-venetian-black-1.jpg'),
(NULL,35,'assets/pictures/women/kenzie-venetian-black/kenzie-venetian-black-2.jpg'),
(NULL,35,'assets/pictures/women/kenzie-venetian-black/kenzie-venetian-black-3.jpg'),
(NULL,35,'assets/pictures/women/kenzie-venetian-black/kenzie-venetian-black-4.jpg'),
(NULL,35,'assets/pictures/women/kenzie-venetian-black/kenzie-venetian-black.jpg'),
(NULL,36,'assets/pictures/women/kenzie-venetian-red/kenzie-venetian-red-1.jpg'),
(NULL,36,'assets/pictures/women/kenzie-venetian-red/kenzie-venetian-red-2.jpg'),
(NULL,36,'assets/pictures/women/kenzie-venetian-red/kenzie-venetian-red-3.jpg'),
(NULL,36,'assets/pictures/women/kenzie-venetian-red/kenzie-venetian-red-4.jpg'),
(NULL,36,'assets/pictures/women/kenzie-venetian-red/kenzie-venetian-red.jpg'),
(NULL,37,'assets/pictures/women/ray-mule-black/ray-mule-black-1.jpg'),
(NULL,37,'assets/pictures/women/ray-mule-black/ray-mule-black-2.jpg'),
(NULL,37,'assets/pictures/women/ray-mule-black/ray-mule-black-3.jpg'),
(NULL,37,'assets/pictures/women/ray-mule-black/ray-mule-black-4.jpg'),
(NULL,37,'assets/pictures/women/ray-mule-black/ray-mule-black.jpg'),
(NULL,38,'assets/pictures/women/ray-mule-cognac/ray-mule-cognac-1.jpg'),
(NULL,38,'assets/pictures/women/ray-mule-cognac/ray-mule-cognac-2.jpg'),
(NULL,38,'assets/pictures/women/ray-mule-cognac/ray-mule-cognac-3.jpg'),
(NULL,38,'assets/pictures/women/ray-mule-cognac/ray-mule-cognac-4.jpg'),
(NULL,38,'assets/pictures/women/ray-mule-cognac/ray-mule-cognac.jpg'),
(NULL,39,'assets/pictures/women/sienna-ballet-black/sienna-ballet-black-1.jpg'),
(NULL,39,'assets/pictures/women/sienna-ballet-black/sienna-ballet-black-2.jpg'),
(NULL,39,'assets/pictures/women/sienna-ballet-black/sienna-ballet-black-3.jpg'),
(NULL,39,'assets/pictures/women/sienna-ballet-black/sienna-ballet-black-4.jpg'),
(NULL,39,'assets/pictures/women/sienna-ballet-black/sienna-ballet-black.jpg'),
(NULL,40,'assets/pictures/women/sienna-ballet-red/sienna-ballet-red-1.jpg'),
(NULL,40,'assets/pictures/women/sienna-ballet-red/sienna-ballet-red-2.jpg'),
(NULL,40,'assets/pictures/women/sienna-ballet-red/sienna-ballet-red-3.jpg'),
(NULL,40,'assets/pictures/women/sienna-ballet-red/sienna-ballet-red-4.jpg'),
(NULL,40,'assets/pictures/women/sienna-ballet-red/sienna-ballet-red.jpg'),
(NULL,41,'assets/pictures/women/sienna-ballet-saddle/sienna-ballet-saddle-1.jpg'),
(NULL,41,'assets/pictures/women/sienna-ballet-saddle/sienna-ballet-saddle-2.jpg'),
(NULL,41,'assets/pictures/women/sienna-ballet-saddle/sienna-ballet-saddle-3.jpg'),
(NULL,41,'assets/pictures/women/sienna-ballet-saddle/sienna-ballet-saddle-4.jpg'),
(NULL,41,'assets/pictures/women/sienna-ballet-saddle/sienna-ballet-saddle.jpg'),
(NULL,42,'assets/pictures/women/terri-penny-cognac/terri-penny-cognac-1.jpg'),
(NULL,42,'assets/pictures/women/terri-penny-cognac/terri-penny-cognac-2.jpg'),
(NULL,42,'assets/pictures/women/terri-penny-cognac/terri-penny-cognac-3.jpg'),
(NULL,42,'assets/pictures/women/terri-penny-cognac/terri-penny-cognac-4.jpg'),
(NULL,42,'assets/pictures/women/terri-penny-cognac/terri-penny-cognac.jpg'),
(NULL,43,'assets/pictures/women/terri-penny-loafer-black/terri-penny-loafer-black-1.jpg'),
(NULL,43,'assets/pictures/women/terri-penny-loafer-black/terri-penny-loafer-black-2.jpg'),
(NULL,43,'assets/pictures/women/terri-penny-loafer-black/terri-penny-loafer-black-3.jpg'),
(NULL,43,'assets/pictures/women/terri-penny-loafer-black/terri-penny-loafer-black-4.jpg'),
(NULL,43,'assets/pictures/women/terri-penny-loafer-black/terri-penny-loafer-black.jpg'),
(NULL,44,'assets/pictures/women/terri-zip-ankle-bootie-black/terri-zip-ankle-bootie-black-1.jpg'),
(NULL,44,'assets/pictures/women/terri-zip-ankle-bootie-black/terri-zip-ankle-bootie-black-2.jpg'),
(NULL,44,'assets/pictures/women/terri-zip-ankle-bootie-black/terri-zip-ankle-bootie-black-3.jpg'),
(NULL,44,'assets/pictures/women/terri-zip-ankle-bootie-black/terri-zip-ankle-bootie-black-4.jpg'),
(NULL,44,'assets/pictures/women/terri-zip-ankle-bootie-black/terri-zip-ankle-bootie-black.jpg'),
(NULL,45,'assets/pictures/women/terri-zip-ankle-bootie-cognac/terri-zip-ankle-bootie-cognac-1.jpg'),
(NULL,45,'assets/pictures/women/terri-zip-ankle-bootie-cognac/terri-zip-ankle-bootie-cognac-2.jpg'),
(NULL,45,'assets/pictures/women/terri-zip-ankle-bootie-cognac/terri-zip-ankle-bootie-cognac-3.jpg'),
(NULL,45,'assets/pictures/women/terri-zip-ankle-bootie-cognac/terri-zip-ankle-bootie-cognac-4.jpg'),
(NULL,45,'assets/pictures/women/terri-zip-ankle-bootie-cognac/terri-zip-ankle-bootie-cognac.jpg'),
(NULL,46,'assets/pictures/women/terri-zip-ankle-bootie-grey/terri-zip-ankle-bootie-grey-1.jpg'),
(NULL,46,'assets/pictures/women/terri-zip-ankle-bootie-grey/terri-zip-ankle-bootie-grey-2.jpg'),
(NULL,46,'assets/pictures/women/terri-zip-ankle-bootie-grey/terri-zip-ankle-bootie-grey-3.jpg'),
(NULL,46,'assets/pictures/women/terri-zip-ankle-bootie-grey/terri-zip-ankle-bootie-grey-4.jpg'),
(NULL,46,'assets/pictures/women/terri-zip-ankle-bootie-grey/terri-zip-ankle-bootie-grey.jpg'),
(NULL,47,'assets/pictures/women/veronica-bootie-black/veronica-bootie-black-1.jpg'),
(NULL,47,'assets/pictures/women/veronica-bootie-black/veronica-bootie-black-2.jpg'),
(NULL,47,'assets/pictures/women/veronica-bootie-black/veronica-bootie-black-3.jpg'),
(NULL,47,'assets/pictures/women/veronica-bootie-black/veronica-bootie-black-4.jpg'),
(NULL,47,'assets/pictures/women/veronica-bootie-black/veronica-bootie-black.jpg'),
(NULL,48,'assets/pictures/women/veronica-bootie-redwood/veronica-bootie-redwood-1.jpg'),
(NULL,48,'assets/pictures/women/veronica-bootie-redwood/veronica-bootie-redwood-2.jpg'),
(NULL,48,'assets/pictures/women/veronica-bootie-redwood/veronica-bootie-redwood-3.jpg'),
(NULL,48,'assets/pictures/women/veronica-bootie-redwood/veronica-bootie-redwood-4.jpg'),
(NULL,48,'assets/pictures/women/veronica-bootie-redwood/veronica-bootie-redwood.jpg'),
(NULL,49,'assets/pictures/women/veronica-bootie-tan/veronica-bootie-tan-1.jpg'),
(NULL,49,'assets/pictures/women/veronica-bootie-tan/veronica-bootie-tan-2.jpg'),
(NULL,49,'assets/pictures/women/veronica-bootie-tan/veronica-bootie-tan-3.jpg'),
(NULL,49,'assets/pictures/women/veronica-bootie-tan/veronica-bootie-tan-4.jpg'),
(NULL,49,'assets/pictures/women/veronica-bootie-tan/veronica-bootie-tan.jpg');
INSERT INTO inventory(id,productID,size,stock) VALUES (1,1,38,97);
INSERT INTO inventory(id,productID,size,stock) VALUES (2,1,39,93);
INSERT INTO inventory(id,productID,size,stock) VALUES (3,1,40,100);
INSERT INTO inventory(id,productID,size,stock) VALUES (4,1,41,9);
INSERT INTO inventory(id,productID,size,stock) VALUES (5,1,42,77);
INSERT INTO inventory(id,productID,size,stock) VALUES (6,1,43,52);
INSERT INTO inventory(id,productID,size,stock) VALUES (7,1,44,58);
INSERT INTO inventory(id,productID,size,stock) VALUES (8,2,38,74);
INSERT INTO inventory(id,productID,size,stock) VALUES (9,2,39,74);
INSERT INTO inventory(id,productID,size,stock) VALUES (10,2,40,88);
INSERT INTO inventory(id,productID,size,stock) VALUES (11,2,41,45);
INSERT INTO inventory(id,productID,size,stock) VALUES (12,2,42,87);
INSERT INTO inventory(id,productID,size,stock) VALUES (13,2,43,69);
INSERT INTO inventory(id,productID,size,stock) VALUES (14,2,44,59);
INSERT INTO inventory(id,productID,size,stock) VALUES (15,3,38,7);
INSERT INTO inventory(id,productID,size,stock) VALUES (16,3,39,50);
INSERT INTO inventory(id,productID,size,stock) VALUES (17,3,40,94);
INSERT INTO inventory(id,productID,size,stock) VALUES (18,3,41,16);
INSERT INTO inventory(id,productID,size,stock) VALUES (19,3,42,83);
INSERT INTO inventory(id,productID,size,stock) VALUES (20,3,43,6);
INSERT INTO inventory(id,productID,size,stock) VALUES (21,3,44,42);
INSERT INTO inventory(id,productID,size,stock) VALUES (22,4,38,33);
INSERT INTO inventory(id,productID,size,stock) VALUES (23,4,39,11);
INSERT INTO inventory(id,productID,size,stock) VALUES (24,4,40,50);
INSERT INTO inventory(id,productID,size,stock) VALUES (25,4,41,60);
INSERT INTO inventory(id,productID,size,stock) VALUES (26,4,42,18);
INSERT INTO inventory(id,productID,size,stock) VALUES (27,4,43,65);
INSERT INTO inventory(id,productID,size,stock) VALUES (28,4,44,66);
INSERT INTO inventory(id,productID,size,stock) VALUES (29,5,38,82);
INSERT INTO inventory(id,productID,size,stock) VALUES (30,5,39,91);
INSERT INTO inventory(id,productID,size,stock) VALUES (31,5,40,3);
INSERT INTO inventory(id,productID,size,stock) VALUES (32,5,41,16);
INSERT INTO inventory(id,productID,size,stock) VALUES (33,5,42,65);
INSERT INTO inventory(id,productID,size,stock) VALUES (34,5,43,78);
INSERT INTO inventory(id,productID,size,stock) VALUES (35,5,44,73);
INSERT INTO inventory(id,productID,size,stock) VALUES (36,6,38,40);
INSERT INTO inventory(id,productID,size,stock) VALUES (37,6,39,44);
INSERT INTO inventory(id,productID,size,stock) VALUES (38,6,40,71);
INSERT INTO inventory(id,productID,size,stock) VALUES (39,6,41,61);
INSERT INTO inventory(id,productID,size,stock) VALUES (40,6,42,15);
INSERT INTO inventory(id,productID,size,stock) VALUES (41,6,43,66);
INSERT INTO inventory(id,productID,size,stock) VALUES (42,6,44,80);
INSERT INTO inventory(id,productID,size,stock) VALUES (50,7,38,94);
INSERT INTO inventory(id,productID,size,stock) VALUES (51,7,39,7);
INSERT INTO inventory(id,productID,size,stock) VALUES (52,7,40,4);
INSERT INTO inventory(id,productID,size,stock) VALUES (53,7,41,19);
INSERT INTO inventory(id,productID,size,stock) VALUES (54,7,42,75);
INSERT INTO inventory(id,productID,size,stock) VALUES (55,7,43,99);
INSERT INTO inventory(id,productID,size,stock) VALUES (56,7,44,6);
INSERT INTO inventory(id,productID,size,stock) VALUES (57,8,38,43);
INSERT INTO inventory(id,productID,size,stock) VALUES (58,8,39,89);
INSERT INTO inventory(id,productID,size,stock) VALUES (59,8,40,92);
INSERT INTO inventory(id,productID,size,stock) VALUES (60,8,41,4);
INSERT INTO inventory(id,productID,size,stock) VALUES (61,8,42,41);
INSERT INTO inventory(id,productID,size,stock) VALUES (62,8,43,60);
INSERT INTO inventory(id,productID,size,stock) VALUES (63,8,44,22);
INSERT INTO inventory(id,productID,size,stock) VALUES (64,9,38,13);
INSERT INTO inventory(id,productID,size,stock) VALUES (65,9,39,24);
INSERT INTO inventory(id,productID,size,stock) VALUES (66,9,40,98);
INSERT INTO inventory(id,productID,size,stock) VALUES (67,9,41,49);
INSERT INTO inventory(id,productID,size,stock) VALUES (68,9,42,3);
INSERT INTO inventory(id,productID,size,stock) VALUES (69,9,43,87);
INSERT INTO inventory(id,productID,size,stock) VALUES (70,9,44,88);
INSERT INTO inventory(id,productID,size,stock) VALUES (71,10,38,66);
INSERT INTO inventory(id,productID,size,stock) VALUES (72,10,39,32);
INSERT INTO inventory(id,productID,size,stock) VALUES (73,10,40,41);
INSERT INTO inventory(id,productID,size,stock) VALUES (74,10,41,92);
INSERT INTO inventory(id,productID,size,stock) VALUES (75,10,42,65);
INSERT INTO inventory(id,productID,size,stock) VALUES (76,10,43,67);
INSERT INTO inventory(id,productID,size,stock) VALUES (77,10,44,73);
INSERT INTO inventory(id,productID,size,stock) VALUES (78,11,38,58);
INSERT INTO inventory(id,productID,size,stock) VALUES (79,11,39,52);
INSERT INTO inventory(id,productID,size,stock) VALUES (80,11,40,54);
INSERT INTO inventory(id,productID,size,stock) VALUES (81,11,41,63);
INSERT INTO inventory(id,productID,size,stock) VALUES (82,11,42,49);
INSERT INTO inventory(id,productID,size,stock) VALUES (83,11,43,86);
INSERT INTO inventory(id,productID,size,stock) VALUES (84,11,44,48);
INSERT INTO inventory(id,productID,size,stock) VALUES (85,12,38,38);
INSERT INTO inventory(id,productID,size,stock) VALUES (86,12,39,50);
INSERT INTO inventory(id,productID,size,stock) VALUES (87,12,40,2);
INSERT INTO inventory(id,productID,size,stock) VALUES (88,12,41,39);
INSERT INTO inventory(id,productID,size,stock) VALUES (89,12,42,79);
INSERT INTO inventory(id,productID,size,stock) VALUES (90,12,43,68);
INSERT INTO inventory(id,productID,size,stock) VALUES (91,12,44,57);
INSERT INTO inventory(id,productID,size,stock) VALUES (92,13,38,46);
INSERT INTO inventory(id,productID,size,stock) VALUES (93,13,39,51);
INSERT INTO inventory(id,productID,size,stock) VALUES (94,13,40,2);
INSERT INTO inventory(id,productID,size,stock) VALUES (95,13,41,6);
INSERT INTO inventory(id,productID,size,stock) VALUES (96,13,42,77);
INSERT INTO inventory(id,productID,size,stock) VALUES (97,13,43,18);
INSERT INTO inventory(id,productID,size,stock) VALUES (98,13,44,79);
INSERT INTO inventory(id,productID,size,stock) VALUES (99,14,38,62);
INSERT INTO inventory(id,productID,size,stock) VALUES (100,14,39,99);
INSERT INTO inventory(id,productID,size,stock) VALUES (101,14,40,28);
INSERT INTO inventory(id,productID,size,stock) VALUES (102,14,41,63);
INSERT INTO inventory(id,productID,size,stock) VALUES (103,14,42,22);
INSERT INTO inventory(id,productID,size,stock) VALUES (104,14,43,41);
INSERT INTO inventory(id,productID,size,stock) VALUES (105,14,44,10);
INSERT INTO inventory(id,productID,size,stock) VALUES (106,15,38,42);
INSERT INTO inventory(id,productID,size,stock) VALUES (107,15,39,53);
INSERT INTO inventory(id,productID,size,stock) VALUES (108,15,40,35);
INSERT INTO inventory(id,productID,size,stock) VALUES (109,15,41,10);
INSERT INTO inventory(id,productID,size,stock) VALUES (110,15,42,91);
INSERT INTO inventory(id,productID,size,stock) VALUES (111,15,43,4);
INSERT INTO inventory(id,productID,size,stock) VALUES (112,15,44,27);
INSERT INTO inventory(id,productID,size,stock) VALUES (113,16,38,51);
INSERT INTO inventory(id,productID,size,stock) VALUES (114,16,39,60);
INSERT INTO inventory(id,productID,size,stock) VALUES (115,16,40,46);
INSERT INTO inventory(id,productID,size,stock) VALUES (116,16,41,85);
INSERT INTO inventory(id,productID,size,stock) VALUES (117,16,42,57);
INSERT INTO inventory(id,productID,size,stock) VALUES (118,16,43,69);
INSERT INTO inventory(id,productID,size,stock) VALUES (119,16,44,71);
INSERT INTO inventory(id,productID,size,stock) VALUES (120,17,38,30);
INSERT INTO inventory(id,productID,size,stock) VALUES (121,17,39,3);
INSERT INTO inventory(id,productID,size,stock) VALUES (122,17,40,3);
INSERT INTO inventory(id,productID,size,stock) VALUES (123,17,41,14);
INSERT INTO inventory(id,productID,size,stock) VALUES (124,17,42,83);
INSERT INTO inventory(id,productID,size,stock) VALUES (125,17,43,58);
INSERT INTO inventory(id,productID,size,stock) VALUES (126,17,44,82);
INSERT INTO inventory(id,productID,size,stock) VALUES (127,18,38,48);
INSERT INTO inventory(id,productID,size,stock) VALUES (128,18,39,15);
INSERT INTO inventory(id,productID,size,stock) VALUES (129,18,40,21);
INSERT INTO inventory(id,productID,size,stock) VALUES (130,18,41,81);
INSERT INTO inventory(id,productID,size,stock) VALUES (131,18,42,46);
INSERT INTO inventory(id,productID,size,stock) VALUES (132,18,43,46);
INSERT INTO inventory(id,productID,size,stock) VALUES (133,18,44,64);
INSERT INTO inventory(id,productID,size,stock) VALUES (134,19,38,4);
INSERT INTO inventory(id,productID,size,stock) VALUES (135,19,39,62);
INSERT INTO inventory(id,productID,size,stock) VALUES (136,19,40,66);
INSERT INTO inventory(id,productID,size,stock) VALUES (137,19,41,41);
INSERT INTO inventory(id,productID,size,stock) VALUES (138,19,42,5);
INSERT INTO inventory(id,productID,size,stock) VALUES (139,19,43,97);
INSERT INTO inventory(id,productID,size,stock) VALUES (140,19,44,84);
INSERT INTO inventory(id,productID,size,stock) VALUES (141,20,38,10);
INSERT INTO inventory(id,productID,size,stock) VALUES (142,20,39,16);
INSERT INTO inventory(id,productID,size,stock) VALUES (143,20,40,20);
INSERT INTO inventory(id,productID,size,stock) VALUES (144,20,41,94);
INSERT INTO inventory(id,productID,size,stock) VALUES (145,20,42,3);
INSERT INTO inventory(id,productID,size,stock) VALUES (146,20,43,15);
INSERT INTO inventory(id,productID,size,stock) VALUES (147,20,44,9);
INSERT INTO inventory(id,productID,size,stock) VALUES (148,21,38,28);
INSERT INTO inventory(id,productID,size,stock) VALUES (149,21,39,75);
INSERT INTO inventory(id,productID,size,stock) VALUES (150,21,40,36);
INSERT INTO inventory(id,productID,size,stock) VALUES (151,21,41,22);
INSERT INTO inventory(id,productID,size,stock) VALUES (152,21,42,11);
INSERT INTO inventory(id,productID,size,stock) VALUES (153,21,43,80);
INSERT INTO inventory(id,productID,size,stock) VALUES (154,21,44,93);
INSERT INTO inventory(id,productID,size,stock) VALUES (155,22,38,31);
INSERT INTO inventory(id,productID,size,stock) VALUES (156,22,39,22);
INSERT INTO inventory(id,productID,size,stock) VALUES (157,22,40,18);
INSERT INTO inventory(id,productID,size,stock) VALUES (158,22,41,5);
INSERT INTO inventory(id,productID,size,stock) VALUES (159,22,42,47);
INSERT INTO inventory(id,productID,size,stock) VALUES (160,22,43,53);
INSERT INTO inventory(id,productID,size,stock) VALUES (161,22,44,41);
INSERT INTO inventory(id,productID,size,stock) VALUES (162,23,38,65);
INSERT INTO inventory(id,productID,size,stock) VALUES (163,23,39,91);
INSERT INTO inventory(id,productID,size,stock) VALUES (164,23,40,90);
INSERT INTO inventory(id,productID,size,stock) VALUES (165,23,41,27);
INSERT INTO inventory(id,productID,size,stock) VALUES (166,23,42,4);
INSERT INTO inventory(id,productID,size,stock) VALUES (167,23,43,39);
INSERT INTO inventory(id,productID,size,stock) VALUES (168,23,44,46);
INSERT INTO inventory(id,productID,size,stock) VALUES (169,24,38,54);
INSERT INTO inventory(id,productID,size,stock) VALUES (170,24,39,34);
INSERT INTO inventory(id,productID,size,stock) VALUES (171,24,40,18);
INSERT INTO inventory(id,productID,size,stock) VALUES (172,24,41,57);
INSERT INTO inventory(id,productID,size,stock) VALUES (173,24,42,88);
INSERT INTO inventory(id,productID,size,stock) VALUES (174,24,43,7);
INSERT INTO inventory(id,productID,size,stock) VALUES (175,24,44,95);
INSERT INTO inventory(id,productID,size,stock) VALUES (176,25,38,47);
INSERT INTO inventory(id,productID,size,stock) VALUES (177,25,39,34);
INSERT INTO inventory(id,productID,size,stock) VALUES (178,25,40,30);
INSERT INTO inventory(id,productID,size,stock) VALUES (179,25,41,91);
INSERT INTO inventory(id,productID,size,stock) VALUES (180,25,42,76);
INSERT INTO inventory(id,productID,size,stock) VALUES (181,25,43,70);
INSERT INTO inventory(id,productID,size,stock) VALUES (182,25,44,100);
INSERT INTO inventory(id,productID,size,stock) VALUES (183,26,38,11);
INSERT INTO inventory(id,productID,size,stock) VALUES (184,26,39,6);
INSERT INTO inventory(id,productID,size,stock) VALUES (185,26,40,3);
INSERT INTO inventory(id,productID,size,stock) VALUES (186,26,41,87);
INSERT INTO inventory(id,productID,size,stock) VALUES (187,26,42,31);
INSERT INTO inventory(id,productID,size,stock) VALUES (188,26,43,13);
INSERT INTO inventory(id,productID,size,stock) VALUES (189,26,44,12);
INSERT INTO inventory(id,productID,size,stock) VALUES (190,27,38,2);
INSERT INTO inventory(id,productID,size,stock) VALUES (191,27,39,21);
INSERT INTO inventory(id,productID,size,stock) VALUES (192,27,40,99);
INSERT INTO inventory(id,productID,size,stock) VALUES (193,27,41,75);
INSERT INTO inventory(id,productID,size,stock) VALUES (194,27,42,81);
INSERT INTO inventory(id,productID,size,stock) VALUES (195,27,43,18);
INSERT INTO inventory(id,productID,size,stock) VALUES (196,27,44,56);

INSERT INTO inventory(id,productID,size,stock) VALUES (197,28,36,77);
INSERT INTO inventory(id,productID,size,stock) VALUES (198,28,37,29);
INSERT INTO inventory(id,productID,size,stock) VALUES (199,28,38,42);
INSERT INTO inventory(id,productID,size,stock) VALUES (200,28,39,14);
INSERT INTO inventory(id,productID,size,stock) VALUES (201,28,40,21);
INSERT INTO inventory(id,productID,size,stock) VALUES (202,28,41,47);
INSERT INTO inventory(id,productID,size,stock) VALUES (203,28,42,53);
INSERT INTO inventory(id,productID,size,stock) VALUES (204,29,36,31);
INSERT INTO inventory(id,productID,size,stock) VALUES (205,29,37,70);
INSERT INTO inventory(id,productID,size,stock) VALUES (206,29,38,36);
INSERT INTO inventory(id,productID,size,stock) VALUES (207,29,39,10);
INSERT INTO inventory(id,productID,size,stock) VALUES (208,29,40,53);
INSERT INTO inventory(id,productID,size,stock) VALUES (209,29,41,91);
INSERT INTO inventory(id,productID,size,stock) VALUES (210,29,42,73);
INSERT INTO inventory(id,productID,size,stock) VALUES (211,30,36,12);
INSERT INTO inventory(id,productID,size,stock) VALUES (212,30,37,74);
INSERT INTO inventory(id,productID,size,stock) VALUES (213,30,38,99);
INSERT INTO inventory(id,productID,size,stock) VALUES (214,30,39,20);
INSERT INTO inventory(id,productID,size,stock) VALUES (215,30,40,67);
INSERT INTO inventory(id,productID,size,stock) VALUES (216,30,41,1);
INSERT INTO inventory(id,productID,size,stock) VALUES (217,30,42,37);
INSERT INTO inventory(id,productID,size,stock) VALUES (218,31,36,72);
INSERT INTO inventory(id,productID,size,stock) VALUES (219,31,37,36);
INSERT INTO inventory(id,productID,size,stock) VALUES (220,31,38,94);
INSERT INTO inventory(id,productID,size,stock) VALUES (221,31,39,87);
INSERT INTO inventory(id,productID,size,stock) VALUES (222,31,40,36);
INSERT INTO inventory(id,productID,size,stock) VALUES (223,31,41,53);
INSERT INTO inventory(id,productID,size,stock) VALUES (224,31,42,27);
INSERT INTO inventory(id,productID,size,stock) VALUES (225,32,36,18);
INSERT INTO inventory(id,productID,size,stock) VALUES (226,32,37,22);
INSERT INTO inventory(id,productID,size,stock) VALUES (227,32,38,16);
INSERT INTO inventory(id,productID,size,stock) VALUES (228,32,39,86);
INSERT INTO inventory(id,productID,size,stock) VALUES (229,32,40,7);
INSERT INTO inventory(id,productID,size,stock) VALUES (230,32,41,28);
INSERT INTO inventory(id,productID,size,stock) VALUES (231,32,42,36);
INSERT INTO inventory(id,productID,size,stock) VALUES (232,33,36,88);
INSERT INTO inventory(id,productID,size,stock) VALUES (233,33,37,41);
INSERT INTO inventory(id,productID,size,stock) VALUES (234,33,38,6);
INSERT INTO inventory(id,productID,size,stock) VALUES (235,33,39,43);
INSERT INTO inventory(id,productID,size,stock) VALUES (236,33,40,57);
INSERT INTO inventory(id,productID,size,stock) VALUES (237,33,41,60);
INSERT INTO inventory(id,productID,size,stock) VALUES (238,33,42,85);
INSERT INTO inventory(id,productID,size,stock) VALUES (239,34,36,33);
INSERT INTO inventory(id,productID,size,stock) VALUES (240,34,37,93);
INSERT INTO inventory(id,productID,size,stock) VALUES (241,34,38,83);
INSERT INTO inventory(id,productID,size,stock) VALUES (242,34,39,76);
INSERT INTO inventory(id,productID,size,stock) VALUES (243,34,40,56);
INSERT INTO inventory(id,productID,size,stock) VALUES (244,34,41,88);
INSERT INTO inventory(id,productID,size,stock) VALUES (245,34,42,73);
INSERT INTO inventory(id,productID,size,stock) VALUES (246,35,36,80);
INSERT INTO inventory(id,productID,size,stock) VALUES (247,35,37,15);
INSERT INTO inventory(id,productID,size,stock) VALUES (248,35,38,43);
INSERT INTO inventory(id,productID,size,stock) VALUES (249,35,39,24);
INSERT INTO inventory(id,productID,size,stock) VALUES (250,35,40,78);
INSERT INTO inventory(id,productID,size,stock) VALUES (251,35,41,55);
INSERT INTO inventory(id,productID,size,stock) VALUES (252,35,42,15);
INSERT INTO inventory(id,productID,size,stock) VALUES (253,36,36,67);
INSERT INTO inventory(id,productID,size,stock) VALUES (254,36,37,78);
INSERT INTO inventory(id,productID,size,stock) VALUES (255,36,38,21);
INSERT INTO inventory(id,productID,size,stock) VALUES (256,36,39,86);
INSERT INTO inventory(id,productID,size,stock) VALUES (257,36,40,35);
INSERT INTO inventory(id,productID,size,stock) VALUES (258,36,41,33);
INSERT INTO inventory(id,productID,size,stock) VALUES (259,36,42,29);
INSERT INTO inventory(id,productID,size,stock) VALUES (260,37,36,91);
INSERT INTO inventory(id,productID,size,stock) VALUES (261,37,37,9);
INSERT INTO inventory(id,productID,size,stock) VALUES (262,37,38,93);
INSERT INTO inventory(id,productID,size,stock) VALUES (263,37,39,79);
INSERT INTO inventory(id,productID,size,stock) VALUES (264,37,40,49);
INSERT INTO inventory(id,productID,size,stock) VALUES (265,37,41,2);
INSERT INTO inventory(id,productID,size,stock) VALUES (266,37,42,87);
INSERT INTO inventory(id,productID,size,stock) VALUES (267,38,36,46);
INSERT INTO inventory(id,productID,size,stock) VALUES (268,38,37,48);
INSERT INTO inventory(id,productID,size,stock) VALUES (269,38,38,87);
INSERT INTO inventory(id,productID,size,stock) VALUES (270,38,39,69);
INSERT INTO inventory(id,productID,size,stock) VALUES (271,38,40,39);
INSERT INTO inventory(id,productID,size,stock) VALUES (272,38,41,7);
INSERT INTO inventory(id,productID,size,stock) VALUES (273,38,42,1);
INSERT INTO inventory(id,productID,size,stock) VALUES (274,39,36,49);
INSERT INTO inventory(id,productID,size,stock) VALUES (275,39,37,32);
INSERT INTO inventory(id,productID,size,stock) VALUES (276,39,38,60);
INSERT INTO inventory(id,productID,size,stock) VALUES (277,39,39,45);
INSERT INTO inventory(id,productID,size,stock) VALUES (278,39,40,80);
INSERT INTO inventory(id,productID,size,stock) VALUES (279,39,41,52);
INSERT INTO inventory(id,productID,size,stock) VALUES (280,39,42,76);
INSERT INTO inventory(id,productID,size,stock) VALUES (281,40,36,10);
INSERT INTO inventory(id,productID,size,stock) VALUES (282,40,37,73);
INSERT INTO inventory(id,productID,size,stock) VALUES (283,40,38,97);
INSERT INTO inventory(id,productID,size,stock) VALUES (284,40,39,69);
INSERT INTO inventory(id,productID,size,stock) VALUES (285,40,40,48);
INSERT INTO inventory(id,productID,size,stock) VALUES (286,40,41,6);
INSERT INTO inventory(id,productID,size,stock) VALUES (287,40,42,42);
INSERT INTO inventory(id,productID,size,stock) VALUES (288,41,36,19);
INSERT INTO inventory(id,productID,size,stock) VALUES (289,41,37,32);
INSERT INTO inventory(id,productID,size,stock) VALUES (290,41,38,69);
INSERT INTO inventory(id,productID,size,stock) VALUES (291,41,39,80);
INSERT INTO inventory(id,productID,size,stock) VALUES (292,41,40,63);
INSERT INTO inventory(id,productID,size,stock) VALUES (293,41,41,74);
INSERT INTO inventory(id,productID,size,stock) VALUES (294,41,42,62);
INSERT INTO inventory(id,productID,size,stock) VALUES (295,42,36,61);
INSERT INTO inventory(id,productID,size,stock) VALUES (296,42,37,53);
INSERT INTO inventory(id,productID,size,stock) VALUES (297,42,38,63);
INSERT INTO inventory(id,productID,size,stock) VALUES (298,42,39,58);
INSERT INTO inventory(id,productID,size,stock) VALUES (299,42,40,20);
INSERT INTO inventory(id,productID,size,stock) VALUES (300,42,41,6);
INSERT INTO inventory(id,productID,size,stock) VALUES (301,42,42,57);
INSERT INTO inventory(id,productID,size,stock) VALUES (302,43,36,6);
INSERT INTO inventory(id,productID,size,stock) VALUES (303,43,37,76);
INSERT INTO inventory(id,productID,size,stock) VALUES (304,43,38,75);
INSERT INTO inventory(id,productID,size,stock) VALUES (305,43,39,94);
INSERT INTO inventory(id,productID,size,stock) VALUES (306,43,40,63);
INSERT INTO inventory(id,productID,size,stock) VALUES (307,43,41,87);
INSERT INTO inventory(id,productID,size,stock) VALUES (308,43,42,62);
INSERT INTO inventory(id,productID,size,stock) VALUES (309,44,36,71);
INSERT INTO inventory(id,productID,size,stock) VALUES (310,44,37,65);
INSERT INTO inventory(id,productID,size,stock) VALUES (311,44,38,64);
INSERT INTO inventory(id,productID,size,stock) VALUES (312,44,39,96);
INSERT INTO inventory(id,productID,size,stock) VALUES (313,44,40,39);
INSERT INTO inventory(id,productID,size,stock) VALUES (314,44,41,25);
INSERT INTO inventory(id,productID,size,stock) VALUES (315,44,42,35);
INSERT INTO inventory(id,productID,size,stock) VALUES (316,45,36,71);
INSERT INTO inventory(id,productID,size,stock) VALUES (317,45,37,16);
INSERT INTO inventory(id,productID,size,stock) VALUES (318,45,38,12);
INSERT INTO inventory(id,productID,size,stock) VALUES (319,45,39,5);
INSERT INTO inventory(id,productID,size,stock) VALUES (320,45,40,94);
INSERT INTO inventory(id,productID,size,stock) VALUES (321,45,41,79);
INSERT INTO inventory(id,productID,size,stock) VALUES (322,45,42,90);
INSERT INTO inventory(id,productID,size,stock) VALUES (323,46,36,62);
INSERT INTO inventory(id,productID,size,stock) VALUES (324,46,37,34);
INSERT INTO inventory(id,productID,size,stock) VALUES (325,46,38,16);
INSERT INTO inventory(id,productID,size,stock) VALUES (326,46,39,59);
INSERT INTO inventory(id,productID,size,stock) VALUES (327,46,40,60);
INSERT INTO inventory(id,productID,size,stock) VALUES (328,46,41,51);
INSERT INTO inventory(id,productID,size,stock) VALUES (329,46,42,52);
INSERT INTO inventory(id,productID,size,stock) VALUES (330,47,36,35);
INSERT INTO inventory(id,productID,size,stock) VALUES (331,47,37,100);
INSERT INTO inventory(id,productID,size,stock) VALUES (332,47,38,44);
INSERT INTO inventory(id,productID,size,stock) VALUES (333,47,39,82);
INSERT INTO inventory(id,productID,size,stock) VALUES (334,47,40,45);
INSERT INTO inventory(id,productID,size,stock) VALUES (335,47,41,97);
INSERT INTO inventory(id,productID,size,stock) VALUES (336,47,42,32);
INSERT INTO inventory(id,productID,size,stock) VALUES (337,48,36,83);
INSERT INTO inventory(id,productID,size,stock) VALUES (338,48,37,39);
INSERT INTO inventory(id,productID,size,stock) VALUES (339,48,38,37);
INSERT INTO inventory(id,productID,size,stock) VALUES (340,48,39,14);
INSERT INTO inventory(id,productID,size,stock) VALUES (341,48,40,54);
INSERT INTO inventory(id,productID,size,stock) VALUES (342,48,41,67);
INSERT INTO inventory(id,productID,size,stock) VALUES (343,48,42,89);
INSERT INTO inventory(id,productID,size,stock) VALUES (344,49,36,10);
INSERT INTO inventory(id,productID,size,stock) VALUES (345,49,37,64);
INSERT INTO inventory(id,productID,size,stock) VALUES (346,49,38,52);
INSERT INTO inventory(id,productID,size,stock) VALUES (347,49,39,5);
INSERT INTO inventory(id,productID,size,stock) VALUES (348,49,40,71);
INSERT INTO inventory(id,productID,size,stock) VALUES (349,49,41,10);
INSERT INTO inventory(id,productID,size,stock) VALUES (350,49,42,69);




















INSERT INTO specifications(id,productID,specification) VALUES (NULL,1,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,2,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,3,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,4,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,5,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,6,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,7,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,8,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,9,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,10,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,11,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,12,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,13,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,14,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,15,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,16,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,17,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,18,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,19,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,20,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,21,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,22,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,23,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,24,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,25,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,26,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,27,'Genuine crazy horse leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,1,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,2,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,3,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,4,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,5,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,6,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,7,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,8,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,9,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,10,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,11,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,12,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,13,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,14,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,15,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,16,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,17,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,18,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,19,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,20,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,21,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,22,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,23,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,24,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,25,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,26,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,27,'Neoprene lining');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,1,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,2,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,3,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,4,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,5,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,6,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,7,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,8,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,9,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,10,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,11,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,12,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,13,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,14,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,15,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,16,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,17,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,18,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,19,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,20,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,21,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,22,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,23,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,24,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,25,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,26,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,27,'Handpunch perforated brogues');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,1,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,2,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,3,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,4,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,5,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,6,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,7,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,8,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,9,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,10,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,11,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,12,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,13,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,14,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,15,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,16,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,17,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,18,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,19,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,20,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,21,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,22,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,23,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,24,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,25,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,26,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,27,'Cementing construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,1,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,2,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,3,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,4,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,5,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,6,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,7,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,8,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,9,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,10,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,11,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,12,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,13,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,14,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,15,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,16,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,17,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,18,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,19,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,20,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,21,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,22,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,23,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,24,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,25,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,26,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,27,'Cork insole with memory foam');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,1,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,2,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,3,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,4,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,5,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,6,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,7,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,8,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,9,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,10,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,11,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,12,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,13,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,14,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,15,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,16,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,17,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,18,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,19,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,20,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,21,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,22,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,23,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,24,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,25,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,26,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,27,'Handsewn moc toe');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,28,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,29,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,30,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,31,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,32,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,33,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,34,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,35,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,36,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,37,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,38,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,39,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,40,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,41,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,42,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,43,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,44,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,45,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,46,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,47,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,48,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,49,'Italian leather');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,28,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,29,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,30,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,31,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,32,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,33,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,34,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,35,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,36,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,37,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,38,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,39,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,40,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,41,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,42,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,43,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,44,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,45,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,46,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,47,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,48,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,49,'Leather linen');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,28,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,29,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,30,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,31,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,32,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,33,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,34,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,35,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,36,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,37,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,38,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,39,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,40,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,41,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,42,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,43,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,44,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,45,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,46,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,47,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,48,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,49,'Leather outsole');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,28,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,29,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,30,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,31,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,32,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,33,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,34,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,35,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,36,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,37,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,38,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,39,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,40,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,41,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,42,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,43,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,44,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,45,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,46,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,47,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,48,'Goodyear welt construction');
INSERT INTO specifications(id,productID,specification) VALUES (NULL,49,'Goodyear welt construction');


<<<<<<< HEAD
-- Initialize transactions table
=======

-- Initialize orders table
>>>>>>> f52ef68d997d2dd8dd23c1cb15256eaf1de4a16d

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

INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,1,'Lucy','Fleming','930 Pitkin Avenue #8-105, Singapore',937662,'94874223', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,2,'Hart','Kerr','359 Engert Avenue #19-186, Singapore',235461,'49474219', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,3,'Mara','Potter','391 Hubbard Place #6-166, Singapore',327591,'61983059', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,4,'Petty','Dawson','319 Crooke Avenue #20-165, Singapore',703944,'51630353', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,5,'Barnett','Townsend','640 Juliana Place #17-170, Singapore',439592,'90881180', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,6,'Adams','Burgess','948 Claver Place #49-155, Singapore',327821,'87121854', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,7,'Howe','Valdez','853 Hunterfly Place #50-176, Singapore',780768,'57190222', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,8,'Magdalena','Cash','752 McKibben Street #34-140, Singapore',217825,'94226689', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,9,'Eleanor','Armstrong','366 Powell Street #14-170, Singapore',533098,'89812833', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,10,'Jessica','Atkins','779 Jay Street #1-144, Singapore',352832,'74441368', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,11,'Obrien','Hyde','669 Doughty Street #14-136, Singapore',779711,'87341266', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,12,'Cooley','Rhodes','727 Hopkins Street #29-157, Singapore',424188,'37304333', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,13,'Roseann','Tanner','186 Hanson Place #12-159, Singapore',205945,'33807242', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,14,'Liliana','Blanchard','392 Campus Road #50-155, Singapore',910503,'94963074', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,15,'Maricela','Drake','609 Essex Street #35-132, Singapore',961792,'99412666', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,16,'Hill','George','592 Elm Avenue #16-160, Singapore',358571,'30049063', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,17,'Jeanne','Graham','683 Lefferts Place #23-168, Singapore',726919,'86889977', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,18,'Mable','Donaldson','379 Liberty Avenue #46-104, Singapore',254850,'64250128', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,19,'Angel','Hayes','677 Morgan Avenue #19-199, Singapore',785742,'44706740', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,20,'Vang','Calhoun','533 Seagate Avenue #19-131, Singapore',869246,'37200453', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,21,'Patsy','Osborn','761 Bliss Terrace #24-173, Singapore',728610,'99479970', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,22,'Ursula','Cohen','493 Baughman Place #2-136, Singapore',900635,'41270928', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,23,'Stella','Duran','502 Wogan Terrace #33-133, Singapore',940943,'44453821', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,24,'Mayer','Hinton','961 Kossuth Place #37-131, Singapore',311526,'81128207', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,25,'Sophie','Guerra','896 Hart Street #50-191, Singapore',181045,'46539923', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,26,'Susie','Dunlap','525 Schenck Place #1-116, Singapore',325455,'88688073', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,27,'Alyssa','Meyers','955 Irvington Place #17-197, Singapore',239038,'70447685', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,28,'Ellen','Sanford','217 Oriental Boulevard #41-103, Singapore',700145,'42067250', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,29,'Zimmerman','Burris','223 Ebony Court #2-187, Singapore',133516,'95954239', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,30,'Gaines','Sandoval','262 Cambridge Place #34-193, Singapore',590950,'80317714', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,31,'Morgan','Nicholson','678 Aster Court #37-172, Singapore',777756,'52014649', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,32,'Kelley','Gregory','399 Mersereau Court #32-183, Singapore',911296,'42360011', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,33,'Mason','Rogers','979 Huron Street #49-165, Singapore',588008,'59785089', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,34,'Johnnie','Black','549 Menahan Street #31-150, Singapore',765771,'56283790', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,35,'Bright','Foley','339 Suydam Street #29-165, Singapore',287780,'99608105', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,36,'Kelli','Ewing','628 Quincy Street #38-111, Singapore',202614,'47105714', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,37,'Jacqueline','Knight','557 Interborough Parkway #45-163, Singapore',435059,'89300999', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,38,'Jacquelyn','Craig','769 Fenimore Street #48-115, Singapore',739651,'52210694', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,39,'Robbie','Graves','122 Clymer Street #21-200, Singapore',436896,'34497535', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,40,'Jody','Holcomb','462 Montague Street #27-163, Singapore',189271,'94522745', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,41,'Becker','Oliver','398 Williamsburg Street #42-128, Singapore',245733,'72192920', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,42,'Chang','Ferguson','993 Taaffe Place #35-191, Singapore',953056,'81816443', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,43,'Anna','Spears','875 Cedar Street #26-177, Singapore',710819,'72642299', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,44,'Bettye','Mann','470 Seigel Street #37-110, Singapore',979894,'64878421', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,45,'Tamara','Vaughan','161 Colin Place #24-143, Singapore',562305,'35639231', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,46,'Dona','Mcconnell','750 Monitor Street #45-107, Singapore',358637,'96206427', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,47,'Burton','Jarvis','753 Clinton Avenue #5-139, Singapore',241058,'80509818', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,48,'Thornton','Frye','997 Times Placez #28-121, Singapore',261224,'37309048', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,49,'Jones','Bartlett','127 Fleet Street #16-103, Singapore',826579,'81424273', 100);
INSERT INTO transactions(id,customerID,firstname,lastname,address,zipCode,phone,totalPrice) VALUES (NULL,50,'Valerie','Stanton','586 Malbone Street #36-172, Singapore',958144,'65718414', 100);

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

INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,1,46,'2018-06-12T08:39:27',3,42);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,2,10,'2018-09-24T09:24:30',12,39);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,3,29,'2018-04-17T05:41:23',4,39);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,4,30,'2018-09-13T07:51:43',10,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,5,17,'2018-10-09T02:50:55',4,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,6,22,'2018-03-19T03:40:29',5,39);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,7,13,'2018-08-15T08:41:28',7,42);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,8,31,'2018-10-15T04:34:21',11,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,9,4,'2018-09-23T09:45:19',11,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,10,36,'2018-04-06T06:45:48',4,39);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,11,37,'2018-04-30T02:49:45',1,41);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,12,16,'2018-08-14T03:37:13',11,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,13,15,'2018-06-11T08:04:14',6,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,14,38,'2018-08-18T06:57:43',12,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,15,12,'2018-06-30T02:26:24',12,41);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,16,23,'2018-06-05T05:32:17',1,42);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,17,10,'2018-08-22T10:52:11',6,41);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,18,11,'2018-04-23T03:02:45',3,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,19,45,'2018-06-06T11:36:23',3,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,20,36,'2018-08-07T01:41:04',12,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,21,34,'2018-09-16T07:45:41',10,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,22,16,'2018-04-18T01:18:20',6,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,23,19,'2018-06-17T04:26:41',1,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,24,47,'2018-10-15T11:22:25',7,42);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,25,42,'2018-04-22T10:07:59',5,42);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,26,22,'2018-03-07T06:28:49',10,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,27,22,'2018-09-05T12:42:47',4,39);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,28,37,'2018-10-22T06:24:31',1,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,29,31,'2018-10-11T11:09:11',7,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,30,11,'2018-07-30T06:44:24',12,41);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,31,44,'2018-08-10T06:57:27',5,41);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,32,32,'2018-08-04T06:11:44',4,42);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,33,32,'2018-09-28T07:49:15',12,41);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,34,12,'2018-09-21T06:34:21',9,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,35,42,'2018-04-22T11:48:11',5,39);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,36,35,'2018-09-16T06:04:22',2,39);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,37,14,'2018-06-21T08:10:33',9,41);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,38,3,'2018-05-28T03:53:31',6,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,39,25,'2018-10-23T12:35:07',12,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,40,47,'2018-06-10T05:28:29',8,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,41,43,'2018-05-01T11:39:55',3,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,42,41,'2018-07-28T08:16:18',12,41);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,43,49,'2018-09-18T12:41:51',8,39);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,44,10,'2018-04-22T05:26:43',6,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,45,11,'2018-04-09T09:21:03',5,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,46,19,'2018-06-04T07:54:14',2,38);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,47,34,'2018-07-29T08:20:39',9,42);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,48,40,'2018-07-01T10:19:08',11,40);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,49,6,'2018-09-02T03:57:41',4,42);
INSERT INTO orders(id,transactionID,productID,dateOrder,quantity,size) VALUES (NULL,50,25,'2018-09-22T08:41:12',12,40);
