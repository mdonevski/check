-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: readinglog
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `readinglog`
--

DROP TABLE IF EXISTS `readinglog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readinglog` (
  `idreadinglog` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `isbn` char(13) DEFAULT NULL,
  `author` varchar(70) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idreadinglog`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readinglog`
--

LOCK TABLES `readinglog` WRITE;
/*!40000 ALTER TABLE `readinglog` DISABLE KEYS */;
INSERT INTO `readinglog` VALUES (3,3,'9781743216774','Lonely Planet','Lonely Planet South India & Kerala',NULL,'2017-11-11'),(4,3,'9780316445122','Sarah Knight','Get Your Sh*t Together',NULL,'2017-12-11'),(5,3,'9781626726390','R. A. Spratt','No Rules: A Friday Barnes Mystery',NULL,'2017-12-11'),(6,3,'9781583333396','Lou Schuler','The New Rules of Lifting for Women',NULL,'2017-12-11'),(7,1,'9780545918169','Peter Raymundo','Third Grade Mermaid',NULL,'2017-12-13'),(8,1,'9780545851022','Sarah Mlynowski','Genie in a Bottle (Whatever After #9)',NULL,'2017-12-13'),(9,1,'9781442481244','Wanda Coven','Heidi Heckelbeck and the Christmas Surprise',NULL,'2017-12-13'),(10,1,'9781442435674','Wanda Coven','Heidi Heckelbeck Casts a Spell',NULL,'2017-12-13'),(11,1,'9780439935340','Daisy Meadows','Lucy the Diamond Fairy',NULL,'2017-12-13'),(12,1,'9780688220150','Beverly Cleary','Ramona the Brave',NULL,'2017-12-13'),(13,1,'9780688221140','Beverly Cleary','Ramona and Her Father',NULL,'2017-12-13'),(14,1,'9780062307453','Jane O\'Connor','Fancy Nancy - Fanciest Doll in the Universe',NULL,'2017-12-13'),(15,1,'9781449483593','Dana Simpson','Phoebe and Her Unicorn in the Magic Storm (Phoebe and Her Unicorn Series Book 6)',NULL,'2017-12-13'),(16,1,'9781449446208','Dana Simpson','Phoebe and Her Unicorn',NULL,'2017-12-13'),(17,1,'9781449493240','Dana Simpson','Unicorn vs. Goblins (Phoebe and Her Unicorn Series Book 3)',NULL,'2017-12-13'),(18,1,'9781449483579','Dana Simpson','Unicorn Crossing',NULL,'2017-12-13'),(20,3,'9780439935340','Daisy Meadows','Lucy the Diamond Fairy',NULL,'2017-12-13'),(24,3,'9781551526898','Marcelino Truong','Saigon Calling',NULL,'2017-12-17'),(27,3,'9780385542364','Colson Whitehead','The Underground Railroad',NULL,'2017-12-17'),(28,6,NULL,'Dr. Seuss','Green Eggs and Ham',NULL,'2017-12-17'),(29,6,NULL,'Boris Pasternak','Doctor Zhivago',NULL,'2017-12-17'),(31,6,'9781626726390','R. A. Spratt','No Rules: A Friday Barnes Mystery',NULL,'2017-12-17'),(34,1,'9780062307453','Jane O\'Connor','Fancy Nancy: Stellar Stargazer!',NULL,'2017-12-18'),(35,1,'9780545088381','Daisy Meadows','The Jewel Fairies Collection',NULL,'2017-12-18'),(36,1,NULL,'Mo Willems','Knuffle Bunny Too',NULL,'2017-12-18'),(37,1,'9780545941891','Jane Clarke','Nutmeg the Guinea Pig (Dr. Kittycat #5)',NULL,'2017-12-18'),(38,1,'9781596436060','Lane Smith','It\'s a Book',NULL,'2017-12-18'),(39,1,'9781338054958','Daisy Meadows','Elle the Thumbelina Fairy: A Rainbow Magic Book (Storybook Fairies #1)',NULL,'2017-12-18'),(40,1,NULL,'Dr. Seuss','Green eggs and Ham ',NULL,'2017-12-18'),(41,1,NULL,'Dr. Seuss ','Hop on pop',NULL,'2017-12-18'),(42,1,'9781554534043','Mélanie Watt','Scaredy Squirrel',NULL,'2017-12-18'),(45,1,'9780920303740','Robert N. Munsch','I Have to Go!',NULL,'2017-12-18'),(46,1,NULL,'Robert Munsch','Pigs',NULL,'2017-12-18'),(47,1,NULL,'Robert Munsch','The Paper Bag Princess',NULL,'2017-12-18'),(48,1,'9780920303337','Robert N. Munsch','Thomas\' Snowsuit',NULL,'2017-12-18'),(50,1,NULL,'Shel Silverstein','The Giving Tree',NULL,'2017-12-18'),(51,1,'9780399255373','Drew Daywalt','The Day the Crayons Quit',NULL,'2017-12-18'),(52,1,'9780545523745','Joan Holub','The Gingerbread Kid Goes to School',NULL,'2017-12-21'),(53,1,'9781443113175','Robert N. Munsch','Finding Christmas',NULL,'2017-12-21'),(54,1,NULL,'Lisa Campbell Ernst','The Gingerbread Girl',NULL,'2017-12-21'),(55,1,NULL,'Marie-Louise Gay','Stella Queen of the Snow',NULL,'2017-12-21'),(56,1,'9781443124713','Clement Clarke Moore','The Night Before Christmas',NULL,'2017-12-21'),(57,1,'9780545523745','Joan Holub','The Gingerbread Kid Goes to School',NULL,'2017-12-22'),(58,1,'9781443113175','Robert N. Munsch','Finding Christmas',NULL,'2017-12-22'),(59,1,'9780545061605','Lisa Campbell Ernst','The Gingerbread Girl',NULL,'2017-12-22'),(60,1,'9781443124713','Clement Clarke Moore','The Night Before Christmas',NULL,'2017-12-22'),(61,6,'9781551526898','Marcelino Truong','Saigon Calling',NULL,'2017-12-22'),(63,1,'9780439955904','Michael Martchenko','The Sandcastle Contest',NULL,'2017-12-22'),(64,3,'9781551526898','Marcelino Truong','Saigon Calling',NULL,'2017-12-22'),(65,1,'9781479597772','Jessica Young','Original Recipe',NULL,'2017-12-27'),(66,3,'9780385542364','Colson Whitehead','The Underground Railroad',NULL,'2017-12-27'),(67,3,'9781551526898','Marcelino Truong','Saigon Calling',NULL,'2017-12-27'),(68,1,'9780062658395','Herman Parish','Amelia Bedelia Chapter Book #11: Amelia Bedelia Makes a Splash',NULL,'2018-01-06'),(69,1,'9780545308779','Daisy Meadows','Cara the Camp Fairy',NULL,'2018-01-06'),(70,1,NULL,'Gill Lewis','Puppy Academy: Pip and the Paw of Friendship',NULL,'2018-01-06'),(71,1,'9780545603812','Ellen Miles','Zipper',NULL,'2018-01-06'),(72,1,NULL,'Wendy Orr','Missing A Cat Called Buster ',NULL,'2018-01-06'),(73,1,'9781627791427','Lily Small','Bella the Bunny',NULL,'2018-01-06'),(74,1,'9781627791410','Lily Small','Chloe the Kitten',NULL,'2018-01-06'),(75,1,'9781442453036','Helen Perelman','Frozen Treats',NULL,'2018-01-23'),(76,1,'9780545746601','Sarah Mlynowski','Once Upon a Frog',NULL,'2018-01-27'),(77,1,'9780439814324','Robin Epstein','Pranks a Lot',NULL,'2018-01-27'),(78,1,'9781101918296','Ben Clanton','Super Narwhal and Jelly Jolt (a Narwhal and Jelly Book #2)',NULL,'2018-01-27'),(79,1,'9781481406161','Helen Perelman','The Coconut Clue',NULL,'2018-01-27'),(80,1,NULL,'Lisa Shea','Littlest Pet Shop: Sugar and Spice',NULL,'2018-01-27'),(81,1,NULL,'G. M. Berrow','Pinkie Pie and the Rockin Ponypalooza Party!',NULL,'2018-01-27'),(82,1,NULL,'Paula Harrison','Rescue Princesses: The Moonlight Mystery',NULL,'2018-01-27'),(83,1,NULL,'Sarah Mlynowski','Whatever After: Dream On',NULL,'2018-01-27'),(84,1,NULL,'Sarah Mlynowski','Whatever After: Fairest of All',NULL,'2018-01-27'),(85,1,NULL,'Robin Epstein ','Sleepover Suprise: A Twin-sational Birthday',NULL,'2018-01-27'),(86,1,NULL,'Laura Ingalls','Little House in the Big Woods',NULL,'2018-01-27'),(87,1,NULL,'Wanda Coven','Heidi Heckelbeck Makes A Wish',NULL,'2018-01-31'),(88,1,NULL,'Wanda Coven','Heidi Heckelbeck and the Secret Admirer',NULL,'2018-01-31'),(90,1,NULL,'Catherine Hapka','No Time for Hallie',NULL,'2018-01-31'),(91,1,NULL,'Catherine Hapka','A New Home for Truman',NULL,'2018-01-31'),(92,1,NULL,'Mary Hershey','Love and Hollywogs from Camp Calamity',NULL,'2018-01-31'),(93,1,NULL,'Margaret McNamara','The Fair Bell Sisters: Rosy and the Secret Friend',NULL,'2018-02-04'),(94,1,NULL,'Wanda Coven','Heidi Heckelbeck Makes a Wish',NULL,'2018-02-04'),(95,1,NULL,'Courtney Sheinmel','Stella Batts: Something Blue',NULL,'2018-02-04'),(96,1,NULL,'Daisy Meadows','Grace Woollyhop s Musical Mystery',NULL,'2018-02-04'),(97,1,NULL,'Hilary McKay','Lulu and the Cat in the Bag',NULL,'2018-02-04');
/*!40000 ALTER TABLE `readinglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` char(60) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Rachel',NULL),(2,'Tegan',NULL),(3,'Richard',NULL),(4,'Dylan',NULL),(5,'Jeff',NULL),(6,'Marek',NULL),(7,'Mrs. M. Ricalis',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-12  0:15:37
