-- Use this SQL to create the tables and populate the first quiz with sample questions and answers

--
-- Database: `simplequiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `id` int(11) NOT NULL auto_increment,
  `quizid` int(11) NOT NULL default '0',
  `result` int(3) NOT NULL default '0',
  `IP` varchar(16) NOT NULL default '',
  `ts` timestamp(14) NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM ;

-- --------------------------------------------------------

--
-- Table structure for table `pqa`
--

CREATE TABLE IF NOT EXISTS `pqa` (
  `id` int(11) NOT NULL auto_increment,
  `quizid` int(11) NOT NULL default '0',
  `order` int(3) NOT NULL default '0',
  `question` varchar(255) NOT NULL default '',
  `answer` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pqa`
--

INSERT INTO `pqa` (`id`, `quizid`, `order`, `question`, `answer`) VALUES
(1, 1, 0, 'You prefer to eat off of', 'a:3:{i:0;s:5:"paper";i:1;s:7:"plastic";i:2;s:10:"fine china";}'),
(2, 1, 1, 'You always bbq with', 'a:3:{i:0;s:8:"charcoal";i:1;s:4:"wood";i:2;s:9:"gas grill";}'),
(3, 1, 2, 'Your longest relationship lasted', 'a:3:{i:0;s:19:"Three weeks at best";i:1;s:39:"Three of the happiest months of my life";i:2;s:18:"Still going strong";}');

-- --------------------------------------------------------

--
-- Table structure for table `presults`
--

CREATE TABLE IF NOT EXISTS `presults` (
  `id` int(11) NOT NULL auto_increment,
  `quizid` int(11) NOT NULL default '0',
  `order` int(3) NOT NULL default '0',
  `title` varchar(128) NOT NULL default '',
  `description` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

--
-- Dumping data for table `presults`
--

INSERT INTO `presults` (`id`, `quizid`, `order`, `title`, `description`) VALUES
(1, 1, 0, 'The Straw Pig', 'Life''s too short! You don''t have time to slow down enough to get settled. There''s so much to do and so much to see!'),
(2, 1, 1, 'The Sticks Pig', 'There will be plenty of time later to get it right. It''s good enough for now.'),
(3, 1, 2, 'The Bricks Pig', 'Built to last! There''s no point in doing it if it isn''t done right.');

-- --------------------------------------------------------

--
-- Table structure for table `quizconfig`
--

CREATE TABLE IF NOT EXISTS `quizconfig` (
  `id` int(11) NOT NULL auto_increment,
  `hash` varchar(64) NOT NULL default '',
  `title` varchar(128) NOT NULL default '',
  `email` varchar(64) NOT NULL default '',
  `intro` tinytext NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

--
-- Dumping data for table `quizconfig`
--

INSERT INTO `quizconfig` (`id`, `hash`, `title`, `email`, `intro`) VALUES
(1, 'ff50cbd1bee22cbdfa821037a91ee8ef', 'Which little pig are you?', 'marc@marcgottlieb.com', 'We all know the story. Three pigs go out to make their way in the world. Which pig do you see yourself as?');
