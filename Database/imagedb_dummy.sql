-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2020 at 04:32 AM
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
-- Database: `imagedb_dummy`
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
(2, 1, '2020-04-22 13:24:06', 'I take it back the duck is only okay'),
(4, 3, '1971-11-20 00:34:08', 'Nulla architecto eum nemo ut ducimus. Et velit id voluptas nostrum accusantium error fugit. Veniam placeat voluptates consequatur quo minus.'),
(4, 3, '1983-09-04 06:55:39', 'Sunt sed quisquam velit eum et nihil. Sed incidunt suscipit at molestiae. Illum aut velit exercitationem dolorum vel error magni. Consequatur in exercitationem aut rerum aut exercitationem.'),
(4, 8, '1998-10-22 19:23:03', 'Sit sunt error quo assumenda ut voluptatem alias. Est omnis quaerat deserunt nam in vel. Sed earum dolores officia nisi assumenda.'),
(4, 8, '1999-01-12 05:47:17', 'Libero ducimus eum ab qui. Perferendis et officia occaecati ut voluptates nobis. Sed hic nisi error nostrum. Odit consequatur rem consequatur eveniet quis hic ipsa.'),
(4, 13, '2016-07-09 17:00:38', 'Aut soluta ipsa sit voluptatem. Odio voluptatum reprehenderit eum facilis vero unde consequatur. Nemo et inventore est incidunt aut sit.'),
(5, 4, '1975-02-01 19:34:53', 'Repellat voluptatum ex laborum quasi eos quas veniam. Quia voluptas aut nam voluptatum. Ut sit saepe dolorem in totam porro sed ut. Qui consectetur quo nostrum.'),
(5, 4, '1993-07-21 05:45:08', 'Sequi et facilis error molestiae. Corporis asperiores libero quia et nesciunt aspernatur. Et delectus dignissimos aut voluptas iste labore aut.'),
(5, 9, '1970-10-29 23:32:53', 'Omnis earum molestias amet deserunt maiores. Sit optio id quibusdam vero sit.'),
(5, 9, '1993-12-21 06:49:43', 'In qui nesciunt deserunt ut. Amet sequi sunt ratione delectus sed illum. Libero veritatis eius ducimus molestiae nesciunt velit harum et. Et expedita error deserunt dolor doloremque.'),
(5, 14, '1998-10-09 06:27:12', 'Culpa quo suscipit ullam id harum officiis debitis. Vel eveniet sint at consequatur aperiam alias. Quis repellat voluptatem officiis dicta ut id aperiam. Et est non cumque quia accusantium sapiente.'),
(6, 5, '1996-10-16 11:41:07', 'Incidunt quia quisquam nihil. Quibusdam optio minima modi incidunt dolorum nihil. Laudantium saepe quo aut culpa est molestias. At et et necessitatibus est sed sed vel.'),
(6, 5, '2015-08-26 15:58:51', 'Ea accusamus et laboriosam ipsa et. Qui qui quisquam est aspernatur. Recusandae eveniet similique quo. Magni necessitatibus sapiente qui vel debitis ex soluta.'),
(6, 10, '1983-03-03 04:00:58', 'Alias aut et architecto. Eum illo officia non possimus adipisci mollitia. In ut ratione delectus ipsum nisi qui.'),
(6, 10, '1995-08-23 11:49:20', 'At labore nesciunt consequuntur officiis omnis aperiam nemo ut. Consequatur reiciendis quod praesentium et aliquid nihil qui repellendus. Vel reprehenderit temporibus ut. Quia eum nulla sed ut.'),
(6, 15, '2010-07-08 10:51:04', 'Libero et doloribus aspernatur corrupti qui assumenda. At totam delectus a nihil atque. Quis earum dignissimos aliquid sed.'),
(7, 6, '1976-10-04 18:33:34', 'Voluptas consequuntur nam nulla. Excepturi et quos hic ex impedit. Occaecati odit sed earum sint.'),
(7, 6, '1990-07-07 09:09:23', 'Accusamus atque illum dolore et. Quis voluptas iure quo id illum. Quas ut molestiae in ut itaque.'),
(7, 11, '1981-06-24 10:44:04', 'Quia qui ducimus ut eum impedit in. Temporibus nam autem quasi iusto reiciendis eligendi. Consectetur aut numquam et in. Quibusdam ratione fugit sint fugit esse ea.'),
(7, 11, '1986-06-23 08:45:42', 'Sit debitis doloremque labore. Minima ipsam nihil officiis. Dolore mollitia explicabo ipsam suscipit.\nPariatur cumque et consequatur. Quos aut dolores provident maiores sint rem.'),
(7, 16, '1988-09-08 01:42:25', 'Dolor quod dicta numquam eos. In in quis tenetur eaque accusamus ipsa aut. Nostrum ab et consequuntur libero.'),
(8, 7, '1990-02-06 15:33:14', 'Voluptatem officiis qui aut earum et. Eaque est quia qui hic excepturi omnis et. Earum corrupti repellendus quod sunt. Itaque exercitationem aliquam cumque in pariatur.'),
(8, 7, '1994-11-12 14:35:33', 'Nesciunt quis optio ut aut magni a sed quisquam. Aut illum rerum iste dolor doloremque quia maxime velit. At at provident adipisci est delectus enim.'),
(8, 12, '2007-08-04 06:25:13', 'Officiis animi nostrum soluta modi. Ducimus et aut dicta alias iste quod. At iste optio quaerat.'),
(8, 12, '2018-11-15 14:38:15', 'Deserunt accusantium reprehenderit aut minima quas autem quia. Aut nam itaque cum qui consectetur vel. Consectetur ut eos blanditiis non fuga cumque harum.'),
(8, 17, '1986-04-20 08:20:36', 'Quaerat sed dicta aperiam quia aliquid tempore temporibus. Natus a laborum magni. Et eum fugiat ad sunt quidem non officia earum.'),
(9, 3, '2006-11-12 22:43:03', 'Eligendi ut ipsum natus sed voluptate in ex. Quis velit sit accusamus autem nemo at rerum. Iusto consequatur aut quia qui illo ipsam rerum. Voluptatum fuga et assumenda eaque aut veniam maiores fuga.'),
(9, 8, '1971-05-07 15:16:26', 'Est odio est ut quod et corporis sapiente. Atque itaque ipsum sed odio in. Aliquam sunt minima optio nisi aut sit dolorem. Saepe in ratione qui culpa natus animi.'),
(9, 8, '2004-03-14 22:35:07', 'Aliquam repellendus eos voluptatum tempora id voluptatem rerum ut. Modi sit et consequuntur. Non nesciunt maxime qui.'),
(9, 13, '1980-12-25 21:33:32', 'Reiciendis nihil rerum dolorem dicta magnam cupiditate repellat. Non tempora nisi consequuntur autem occaecati asperiores sit. Harum consectetur facere officia nisi asperiores in.'),
(9, 13, '2006-10-09 02:25:31', 'Fuga sunt voluptas animi rerum. Id et repellendus quo sit. Reprehenderit minus cum debitis eum. Ratione nostrum aut alias voluptatibus dolorum voluptatem reprehenderit iusto.'),
(10, 4, '1973-03-08 17:58:02', 'A non magni vitae maiores qui. Quibusdam non exercitationem repudiandae nostrum id aut. Excepturi voluptas quo eum nostrum non.'),
(10, 9, '1983-07-02 00:31:00', 'Quis aliquid et recusandae magnam. Illo aut voluptatem dolorum velit qui velit molestias. Qui sequi non maxime eligendi dolorem. Maxime consequatur ea officia et culpa.'),
(10, 9, '2017-01-30 23:05:31', 'Reprehenderit veniam animi rerum mollitia aperiam. Alias ut repellat qui modi ducimus. Itaque nostrum eum in velit maxime aperiam saepe doloribus. Impedit dolor repudiandae illum dolores ea fugiat.'),
(10, 14, '1972-02-16 00:11:26', 'Adipisci veniam molestiae corporis maxime id. Laborum dolores nihil tempora et. Quis ut illum eos ipsam et. Ipsa quibusdam sint ut natus aperiam enim.'),
(10, 14, '1976-02-04 18:57:28', 'Ea rerum dolore praesentium modi consequatur vero assumenda. Alias perferendis veritatis expedita similique quod. Nihil harum qui qui aperiam.'),
(11, 5, '1972-07-25 10:08:33', 'Dolores commodi aliquid aut qui nemo ut quis officiis. Aut maiores ut blanditiis dolorem.'),
(11, 10, '1998-04-19 17:54:36', 'Rerum consequuntur dolorem repellendus voluptatem quia in. Aut aspernatur recusandae commodi omnis ab qui aut.'),
(11, 10, '2015-10-30 11:19:12', 'Similique facilis aliquam blanditiis nesciunt quidem qui. Reprehenderit aut et inventore unde sed earum. Est magnam quos ab quidem quis aut sunt aut. Vel modi debitis voluptatum voluptatibus id.'),
(11, 15, '2015-08-11 04:04:26', 'Ut sit quia neque. Possimus et voluptates repellendus ducimus. Saepe rerum non et consequatur debitis nesciunt tempora dolorum.'),
(11, 15, '2016-09-22 13:09:07', 'Voluptas vitae cumque alias dolores doloribus et. Occaecati libero quis iusto sit sunt voluptatem quod sequi. Repudiandae tempore sunt exercitationem dolores.'),
(12, 6, '1994-05-06 00:09:16', 'Qui deleniti a quam non excepturi adipisci unde. Nihil perspiciatis non adipisci vel recusandae. Eos quidem et qui corrupti. Et nisi harum laborum doloremque eos modi voluptatem.'),
(12, 11, '1979-11-22 07:23:23', 'Alias consequatur libero dolorum. Sit labore officiis dignissimos. Perferendis dolore sunt eum.'),
(12, 11, '1999-07-01 15:32:32', 'Sunt totam quis aut et nam commodi nostrum. Adipisci exercitationem assumenda dolorem autem id incidunt quas sapiente. A magnam explicabo blanditiis et.'),
(12, 16, '1983-03-25 00:21:23', 'Et omnis quod occaecati sint quo molestiae earum. Distinctio suscipit iure harum modi debitis. Sunt velit eius deserunt temporibus. Voluptatem ea consequatur ipsa aut voluptatum distinctio.'),
(12, 16, '1999-02-09 06:49:29', 'Maxime qui reiciendis quia possimus laborum aliquid. Iste corporis et tenetur. Sunt similique quod placeat asperiores. Dolorem eum et provident. Sit qui earum quia autem.'),
(13, 7, '2010-10-30 03:47:58', 'Dolor enim blanditiis voluptatum cum et. Perspiciatis blanditiis repudiandae modi culpa ipsam at architecto. Est dignissimos molestiae rerum aperiam accusamus.'),
(13, 12, '1979-07-17 08:52:01', 'Eos facere quis officiis porro impedit officia. Molestiae et ducimus alias repudiandae sunt odit ipsa. Nemo illo aliquid asperiores. Dolorem quos et veniam mollitia voluptatem nostrum.'),
(13, 12, '2001-05-06 10:56:23', 'Alias ducimus architecto suscipit error fugiat placeat quidem quibusdam. Laudantium blanditiis qui beatae. Et fuga molestiae ducimus sapiente. Quis eveniet libero culpa enim.'),
(13, 17, '1984-08-25 12:40:50', 'Voluptates dolorum veniam consectetur quia nobis. Soluta qui soluta quod. Et numquam dicta aperiam est rerum magnam iste.'),
(13, 17, '1996-03-15 18:52:22', 'Maxime voluptas atque perspiciatis accusantium. Accusantium facilis reprehenderit voluptas a nihil.'),
(14, 3, '1995-07-02 03:40:11', 'Distinctio natus error aut totam consequatur vel quis. Animi odio et pariatur ex dolor aperiam.'),
(14, 3, '2007-04-04 11:55:58', 'Quam et repellat id harum rem et alias et. Repellendus eos ipsa suscipit officiis neque incidunt quo. Qui illum est illo vero.'),
(14, 8, '2011-09-01 11:18:25', 'Ratione maxime omnis est repellendus. Ab iste nobis sit dolorum. Sequi esse voluptas expedita et enim atque omnis et. Illum modi optio et qui.'),
(14, 13, '1996-03-06 05:21:22', 'Ut enim in neque iusto itaque voluptatem voluptates. Et qui alias nam repudiandae quisquam. At ut dolorem voluptatibus. Sit non minus dolorum tenetur est maiores. Quidem alias ab ratione libero.'),
(14, 13, '1996-03-07 17:04:51', 'Eius voluptatem similique molestias earum voluptas asperiores voluptatum. Praesentium quia at et. Facere necessitatibus debitis incidunt cupiditate eos vel voluptatem non.'),
(15, 4, '1977-07-04 22:08:18', 'Sit ut officia reprehenderit autem ab. Soluta asperiores id voluptas doloremque quia. Labore sed placeat sapiente cupiditate rerum.'),
(15, 4, '1999-04-23 13:48:15', 'Eveniet consectetur doloremque et cum rerum error. Eligendi earum consequatur quis quis eos maiores. Pariatur quo dignissimos mollitia sint. Architecto eligendi voluptatem ut unde.'),
(15, 9, '2014-09-04 11:30:59', 'Ut illo qui quos minima sit soluta architecto eveniet. Quam explicabo aut quia soluta deserunt vel autem nihil. Ipsum dolorem eius cumque accusamus et maiores iste.'),
(15, 14, '1982-07-07 00:13:10', 'Dolorem non accusamus doloribus soluta voluptatem eius. Voluptas dolor nihil aut et. Voluptatibus aliquam at natus omnis quas repellendus.'),
(15, 14, '2008-11-05 09:32:59', 'Deleniti odit accusantium nemo eos voluptatum. Tempora vero est explicabo fugit totam. Deserunt aut quia praesentium.'),
(16, 5, '1990-01-10 23:30:32', 'Quaerat rem soluta distinctio ut molestias. Vel ipsa fugiat ad nihil earum dolorem occaecati. Ut tempore temporibus quis aut.'),
(16, 5, '1991-04-22 21:36:20', 'Sit et sit deleniti fugit quod illo consequatur. Similique assumenda omnis aut totam dolore.'),
(16, 10, '2012-02-07 09:30:01', 'Eos qui dolor quod magni. Voluptatem voluptates qui asperiores sint. Placeat ab veniam eligendi ut vitae ut.'),
(16, 15, '1994-10-12 05:18:40', 'Inventore et animi architecto. Est reiciendis esse quia fuga omnis qui veritatis minus. Aperiam nesciunt unde facilis necessitatibus quia ratione ipsam. Et occaecati vel omnis et.'),
(16, 15, '2005-07-12 05:29:03', 'Repudiandae rerum quia vitae dolorem tempora quam magnam dolores. Quo dolore rerum quia rerum. Quae et rem rerum incidunt.'),
(17, 6, '1998-07-15 17:22:20', 'Dignissimos omnis sint ipsa officiis. Sed occaecati veritatis a possimus voluptatem mollitia. Ipsam ipsam consectetur quod consequatur quas facere rerum.'),
(17, 6, '2002-10-10 09:20:04', 'Facilis est voluptas eos blanditiis qui beatae sequi animi. Veritatis expedita recusandae velit rerum aut odit rerum. Eos autem quo ullam expedita. Quis omnis nihil quo et earum dignissimos.'),
(17, 11, '1976-07-14 23:01:22', 'Voluptatem odio numquam sed aut. Sequi ipsam numquam harum placeat et iusto quo ut. Qui rem voluptas quos quia est corporis.'),
(17, 16, '1985-11-24 22:13:51', 'Molestiae qui odit et est velit sunt aut corporis. Quo a provident fugit et cupiditate non. A in autem voluptatem id. Culpa sed omnis id et enim inventore veritatis omnis.'),
(17, 16, '1998-01-16 14:18:30', 'Consequatur quae laborum velit aut ab a. Accusamus aut enim voluptas nesciunt. Ea ab molestiae ut aut voluptatem. Deserunt et iste dolores laborum provident.'),
(18, 7, '1997-07-14 01:13:46', 'Qui tenetur dolorem maiores dolor dolorem iusto. Molestiae a sapiente qui nulla perferendis. Id ducimus aliquam ad ut.'),
(18, 7, '2015-03-27 07:00:26', 'Eos dolor eius itaque qui mollitia consequatur ducimus. Repellendus quia ducimus aut. Et animi rerum autem eos voluptas facilis. Sit unde accusantium voluptatum pariatur facilis et ratione similique.'),
(18, 12, '2001-04-17 07:11:18', 'Tempora accusantium ex molestias officiis voluptatum. Et culpa voluptatibus ullam velit est excepturi. Dolorem et ut est deleniti. Laborum voluptatem ullam atque. Sequi sit natus quia nemo.'),
(18, 17, '2002-03-10 02:17:36', 'Rerum perferendis in ut quidem enim aperiam nihil at. Ut impedit aspernatur provident blanditiis et. Et esse explicabo aut blanditiis recusandae. Nam repellat maiores consequuntur tenetur et.'),
(18, 17, '2002-07-03 12:02:40', 'Corrupti consequatur odio odio expedita. Architecto omnis ipsum iusto magni fugiat maiores nostrum ipsam.'),
(19, 3, '1995-09-13 09:33:48', 'Voluptatem cumque quaerat vitae commodi tenetur. Quam quia molestias fugiat voluptatem totam quo dignissimos. Voluptas aut voluptas provident pariatur quia pariatur.'),
(19, 3, '2000-05-11 18:12:57', 'Quae occaecati et enim autem laudantium sequi. Optio necessitatibus eos mollitia mollitia. Amet repellat id qui reiciendis.'),
(19, 8, '1979-09-10 22:36:44', 'Omnis eum minus dolores quia optio. Maiores quo sed deserunt molestiae enim. Temporibus non dolorem neque nulla commodi placeat.'),
(19, 8, '2017-12-25 09:55:45', 'Vel excepturi enim consequuntur quidem. Est totam sequi et sed distinctio. Id omnis pariatur id doloremque non id rerum labore.'),
(19, 13, '2005-12-27 01:18:35', 'Modi modi est est optio et. Harum repellat iste est ea ad laborum. Impedit eos dolorem ratione velit saepe.'),
(20, 4, '1983-01-14 03:43:41', 'Ullam atque eos deleniti repellat in. Voluptatem accusantium recusandae numquam deserunt. Quis delectus ut asperiores molestiae magni.'),
(20, 4, '1991-06-02 22:35:28', 'Quibusdam aut magnam tenetur eos voluptatum. Hic voluptas est ut maiores. Quia aspernatur similique assumenda odit possimus.'),
(20, 9, '1984-09-01 22:38:49', 'Enim dolores aliquam porro expedita dolor. Non voluptate et ab quia neque et. Aperiam eius laborum et qui. Provident saepe soluta aut. Molestiae sed nemo tenetur eos.'),
(20, 9, '2007-11-06 00:03:32', 'Velit assumenda est tempore autem rerum temporibus incidunt dolores. Qui in distinctio dicta debitis cupiditate rerum atque consequatur.'),
(20, 14, '1971-07-14 17:51:04', 'Sapiente laborum qui nihil voluptas magni quasi tenetur. Sed autem nisi amet. Ex consequuntur eius velit autem aut qui. Sit iste nesciunt praesentium qui accusantium.'),
(21, 5, '1979-04-06 17:02:20', 'Corporis commodi amet perferendis fugiat nobis earum quo. Itaque corporis perspiciatis ducimus perspiciatis. Quisquam quibusdam ut aut rem.'),
(21, 5, '1999-09-21 12:23:32', 'Veritatis odio blanditiis ut laborum velit dolore voluptatum. Atque voluptates odit voluptatem aliquid culpa impedit. Deserunt facilis optio eum exercitationem hic.'),
(21, 10, '2000-08-03 12:39:42', 'Nulla soluta voluptatibus accusantium explicabo qui minus adipisci exercitationem. Similique dolores ex asperiores dicta quis dolorum hic cupiditate. Ab tenetur quidem sunt quam consequatur.'),
(21, 10, '2008-06-13 07:04:53', 'Quis nesciunt provident a. Sint qui architecto sit asperiores doloribus. Fugit quis eius vitae sunt.'),
(21, 15, '2014-05-08 19:45:38', 'Rerum ut nihil tenetur reprehenderit. Reiciendis tenetur ea ut. Quibusdam occaecati laudantium repellat laboriosam illo impedit cumque. Est aut eum et mollitia sequi officia.'),
(22, 6, '1973-02-19 07:59:50', 'Itaque eum velit tenetur quia. Aut consequatur occaecati reiciendis facilis at.'),
(22, 6, '2017-02-27 05:11:08', 'Ratione eveniet voluptatem illum libero voluptatem nisi in. Sit consequatur sapiente eligendi quas minima. Veritatis ullam optio fugiat in repudiandae nihil sit.'),
(22, 11, '1979-04-13 22:04:48', 'Ab voluptates non aut velit ipsam aut harum. Voluptatem deserunt eos iusto ut aut voluptates cupiditate. Cum placeat distinctio facere.'),
(22, 11, '1986-04-28 21:53:43', 'Omnis hic distinctio qui provident doloribus nobis odio qui. Et eum ut ut possimus illo. Ipsa est repellat eos perferendis debitis. Et aliquam quasi asperiores deserunt hic qui.'),
(22, 16, '1993-01-22 03:31:40', 'Ut omnis vitae quia animi. Dolores cupiditate vel dolorem totam. Iusto ad quis quidem excepturi hic eos.'),
(23, 7, '1979-02-22 02:57:33', 'Sed mollitia et suscipit eaque omnis fugiat. Est nam natus omnis ex quia ullam. Error voluptas et officiis sed. Ea perspiciatis aspernatur ipsam voluptatem.'),
(23, 7, '2012-09-12 11:02:22', 'Voluptas est quam quod velit. Quis adipisci sapiente tempore rem. Veniam aut explicabo doloribus incidunt omnis. Et deleniti facere est repudiandae corporis expedita sunt.'),
(23, 12, '1997-09-30 20:13:14', 'Sint voluptatem qui sit eum enim nihil. Consequatur repellendus rerum est nemo. Iusto odit aspernatur rerum soluta ut qui dolorem.'),
(23, 12, '2013-08-20 14:59:34', 'Sed et autem incidunt aliquid dolorum. Id non magnam voluptatibus beatae. Non omnis non ab. Aut quas id architecto qui aut fugiat omnis.'),
(23, 17, '1971-06-09 12:13:49', 'Atque sed sint eveniet cupiditate. Voluptatem minus vitae unde dolor qui quia laborum. Ea odit rerum et enim.');

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
(2, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

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
(3, 1),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 12),
(14, 13),
(15, 14),
(16, 15),
(17, 16),
(18, 17);

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
(2, 3, '2020-04-20 13:14:08', 'images/skull.png', 0, 'spooky'),
(3, 4, '1987-08-04 23:44:05', 'images/duck.png', 1842, 'delectus'),
(4, 5, '1995-11-21 01:58:28', 'images/duck.png', 11781, 'et'),
(5, 6, '1993-03-24 18:07:29', 'images/duck.png', 850, 'fugiat'),
(6, 7, '1990-05-31 08:58:38', 'images/duck.png', 172624, 'laboriosam'),
(7, 8, '2017-11-15 14:35:07', 'images/duck.png', 106524490, 'soluta'),
(8, 9, '1990-11-07 23:45:20', 'images/duck.png', 683725383, 'ut'),
(9, 10, '1972-01-22 00:47:26', 'images/duck.png', 641, 'delectus'),
(10, 11, '1993-06-16 03:05:29', 'images/duck.png', 9839, 'et'),
(11, 12, '1999-06-01 19:46:12', 'images/duck.png', 84, 'fugiat'),
(12, 13, '1976-01-09 20:38:17', 'images/duck.png', 3, 'laboriosam'),
(13, 14, '1976-01-02 03:12:37', 'images/duck.png', 52229109, 'soluta'),
(14, 15, '1973-12-03 19:46:14', 'images/duck.png', 3, 'ut'),
(15, 16, '2013-11-18 14:32:57', 'images/duck.png', 9862081, 'delectus'),
(16, 17, '1983-08-18 10:08:07', 'images/duck.png', 0, 'et'),
(17, 18, '2016-01-22 11:17:11', 'images/duck.png', 74403727, 'fugiat');

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
('delectus', 'Reprehenderit iure ipsum dolores odio labore. Laboriosam aliquid aut et aspernatur eos. Aperiam ratione dolore porro occaecati sunt itaque ut similique. Sint sed nam adipisci molestias aut voluptas eum. Voluptatibus adipisci commodi sunt ut repudiandae cumque dolorum.'),
('et', 'Velit sed praesentium unde assumenda repudiandae. Eos quibusdam earum iste earum minima. Itaque suscipit dicta et quod nostrum officia rerum.'),
('fugiat', 'Eligendi laborum consequatur fuga labore voluptatum perspiciatis aut. Dolores quidem quisquam eveniet aut fuga molestiae. Esse amet non placeat quidem ut. Aut delectus expedita rem voluptatum exercitationem.'),
('laboriosam', 'Voluptates et qui a numquam aperiam sed quam. Autem quia soluta eos quisquam doloremque. Eos eum voluptas est enim sunt aut qui eaque.'),
('soluta', 'Autem temporibus et unde nam. Unde eos non incidunt autem impedit vel. Vel saepe ea eum vel molestias reiciendis voluptas. Et sequi omnis et.'),
('spooky', 'That which lurks in the night.'),
('ut', 'Quaerat inventore suscipit numquam quibusdam veritatis consequatur. Reiciendis quibusdam hic voluptatibus culpa nesciunt quia sit. Tempore velit perspiciatis ipsam natus recusandae aliquid. Eaque nemo sit quibusdam est.'),
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
(3, 'tim1234', '34563456'),
(4, 'acormier', '3cff088f482598d2'),
(5, 'marcia.gorczany', 'b13bae4951e21fbd'),
(6, 'glover.einar', 'cc3ebe1a4d410132'),
(7, 'ekemmer', '71fd88b00a1dbcc8'),
(8, 'anabel76', '196aecfcfa9f8508'),
(9, 'terrill52', '222c414937ef51c9'),
(10, 'daija.padberg', '2da7bc2f79eaa00f'),
(11, 'nicolas.chance', '61e6f0478a2d866f'),
(12, 'shany.ullrich', '7af927e425241aec'),
(13, 'horacio57', '31e2c9c06b3365b0'),
(14, 'ullrich.lilliana', '73bfe4bbce090781'),
(15, 'tyreek.kemmer', 'd1eeebe710752978'),
(16, 'sydnee.padberg', '5430c17fe8cddf51'),
(17, 'kautzer.jarrod', '8080f958fd4c706a'),
(18, 'jodie.gislason', 'e0acad8c00acc249'),
(19, 'gerhold.nasir', '1534f195af1dd8be'),
(20, 'norbert.trantow', '04b692e531329bce'),
(21, 'wkemmer', 'accc9fd0c3c1d1b4'),
(22, 'ramon53', '360073efa4b02b57'),
(23, 'devin94', 'f0265f0ed3d56510');

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
  MODIFY `postID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
