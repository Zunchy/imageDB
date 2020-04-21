-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2020 at 07:33 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imagedb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `post_comments` (IN `post` INT(6))  begin
	SELECT users.userName, comments.dateTime, comments.text from comments natural join users where comments.postID = post;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `post_likes` (IN `post` INT(6))  begin
	SELECT users.userName from likes natural join users where postID = post;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `user_followers` (`user_id` INT(6))  begin
	SELECT users.userName from (SELECT users.userName, follows.followerID from users join follows on users.userID = follows.followerID where user_id = follows.followedID) as followingUsers;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `user_following` (`user_id` INT(6))  begin
	SELECT users.userName from (SELECT users.userName, follows.followedID from users join follows on users.userID = follows.followedID where user_id = follows.followerID) as followedUsers;
end$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `post_like_count` (`post` INT(6)) RETURNS INT(11) begin
declare result int;
	SELECT COUNT(userID) into result from likes where postID = post;
    return result;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `user_follower_count` (`user_id` INT(6)) RETURNS INT(11) begin
declare result int;
	SELECT COUNT(follows.followerID) into result from follows where follows.followedID = user_id;
    return result;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `user_following_count` (`user_id` INT(6)) RETURNS INT(11) begin
declare result int;
	SELECT COUNT(follows.followerID) into result from follows where follows.followerID = user_id;
    return result;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `userID` int(6) NOT NULL,
  `postID` int(6) NOT NULL,
  `dateTime` datetime NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`userID`, `postID`, `dateTime`, `text`) VALUES
(2, 1, '2020-04-21 13:24:06', 'Nice Duck.'),
(2, 1, '2020-04-22 13:24:06', 'I take it back the duck is only okay');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `followerID` int(6) NOT NULL,
  `followedID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`followerID`, `followedID`) VALUES
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `userID` int(6) NOT NULL,
  `postID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`userID`, `postID`) VALUES
(2, 1),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(6) NOT NULL,
  `userID` int(6) NOT NULL,
  `dateTime` datetime NOT NULL,
  `file_location` text NOT NULL,
  `view_count` int(10) UNSIGNED NOT NULL,
  `tag_name` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `userID`, `dateTime`, `file_location`, `view_count`, `tag_name`) VALUES
(1, 2, '2020-04-21 13:14:08', 'images/duck.png', 0, 'wildlife'),
(2, 3, '2020-04-20 13:14:08', 'images/skull.png', 0, 'spooky');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_name` varchar(24) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_name`, `description`) VALUES
('spooky', 'That which lurks in the night.'),
('wildlife', 'Ducks, dogs, deer, and any other form of wildlife worth seeing pictures of.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(6) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userName`, `password`) VALUES
(2, 'kyle1413', '12341234'),
(3, 'tim1234', '34563456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`userID`,`postID`,`dateTime`),
  ADD KEY `comments_ibfk_1` (`postID`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD UNIQUE KEY `followerID_2` (`followerID`,`followedID`),
  ADD KEY `followedID` (`followedID`),
  ADD KEY `followerID` (`followerID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD UNIQUE KEY `userID_2` (`userID`,`postID`),
  ADD KEY `postID` (`postID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `posts_ibfk_1` (`tag_name`),
  ADD KEY `posts_ibfk_2` (`userID`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`followedID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`followerID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`tag_name`) REFERENCES `tags` (`tag_name`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
