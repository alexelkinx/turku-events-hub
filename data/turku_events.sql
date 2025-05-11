-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Created: Apr 18, 2024 at 03:32
-- Server version: 5.7.39
-- PHP version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turku_events`
--

-- --------------------------------------------------------

--
-- Table structure for table `concert`
--

CREATE TABLE `concert` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `genre` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `event_type` varchar(255) NOT NULL DEFAULT 'Concert'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `concert`
--

INSERT INTO `concert` (`id`, `title`, `description`, `genre`, `views`, `image`, `location`, `event_type`) VALUES
('concert_01', 'Truckfighters', 'Truckfighters are a Swedish rock band from Örebro, formed in 2001. The band\'s current lineup comprises founding members Oskar \"Ozo\" Cedermalm and Niklas \"Dango\" Källgren, and Johan \"Toro\" Marberg. Truckfighters have released five studio albums.', 'Rock, Metal', 3, 'truck fighters', 'Utopia Club', 'Concert'),
('concert_02', 'VILLE VALO', 'The debut album Neon Noir composed, written, played, sung, produced and recorded by Valo, released worldwide in January 2023, received a wonderful reception from fans and critics alike.', 'Rock', 2, 'ville valo', 'Logomo Oy – Turku', 'Concert'),
('concert_03', 'THE VOICE OF FINLAND 2024: SEMI-FINAL', 'The Voice of Finland, which gives birth to new singers in the Finnish starry sky, will land again in Turku\'s Logomo in April. Logomo is filled with skillful performances and the tingling atmosphere of live broadcasts. Skilled singers create chills, tears of emotion and a holistic experience. Finland\'s foremost musicians play in The Voice of Finland\'s band.', 'Singing', 1, 'voice_of_finland', 'Logomo Oy – Turku', 'Concert'),
('concert_04', 'THE VOICE OF FINLAND 2024: FINAL', 'The Voice of Finland, which gives birth to new singers in the Finnish starry sky, will land again in Turku\'s Logomo in April. Logomo is filled with skillful performances and the tingling atmosphere of live broadcasts. Skilled singers create chills, tears of emotion and a holistic experience. Finland\'s foremost musicians play in The Voice of Finland\'s band.', 'Singing', 0, 'voice_of_finland', 'Logomo Oy – Turku', 'Concert'),
('concert_05', 'FLAME JAZZ: MIKKO SARVANNE GARDEN', 'Well, now it explodes! Explosives from a long time at a gig! Tiikeri and Tarkkis provide the initial explosions of the gig! Will the blast be mentioned again with exclamation marks? Well of course, EXPLODE!!!', 'Techno', 1, 'tiger', 'Utopia Club', 'Concert'),
('concert_06', 'Ursus Factory, Cat', 'Ursus Factory, which has recently sold out at Helsinki Cable Factory, will arrive at Logomo Teatro on Saturday, April 20, 2024. The second performer of the evening will be the rock band Kissa, which combines big guitar waltzes with fresh synasounds', '70s pop', 0, 'ursus_factory_cat', 'Logomo Oy – Turku', 'Concert'),
('concert_07', 'KPC X TURKU: Lyttä & Dr. Getto, Are & Kriso, Shakkii', 'KPC X TURKU, Playing In UTOPIA', 'Rock, Jazz, Tecnho', 0, 'KPC', 'Utopia Club', 'Concert');

-- --------------------------------------------------------

--
-- Table structure for table `event_date`
--

CREATE TABLE `event_date` (
  `id` int(11) NOT NULL,
  `event_id` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_date`
--

INSERT INTO `event_date` (`id`, `event_id`, `date`) VALUES
(1, 'theatre_01', '2025-01-30'),
(5, 'theatre_01', '2025-01-31'),
(6, 'theatre_01', '2025-02-07'),
(7, 'theatre_02', '2025-01-30'),
(8, 'theatre_02', '2025-01-31'),
(9, 'theatre_02', '2025-02-06'),
(10, 'theatre_02', '2025-02-07'),
(11, 'theatre_02', '2025-02-08'),
(12, 'theatre_03', '2025-01-30'),
(13, 'theatre_03', '2025-02-06'),
(14, 'theatre_03', '2025-02-07'),
(15, 'theatre_04', '2025-01-30'),
(16, 'theatre_04', '2025-01-31'),
(17, 'theatre_05', '2025-02-01'),
(18, 'theatre_05', '2025-02-05'),
(19, 'theatre_06', '2025-02-08'),
(20, 'theatre_07', '2025-01-30'),
(21, 'theatre_08', '2025-01-31'),
(22, 'theatre_08', '2025-02-01'),
(23, 'theatre_09', '2025-02-06'),
(24, 'theatre_09', '2025-02-11'),
(25, 'theatre_10', '2025-02-07'),
(26, 'theatre_10', '2025-02-08'),
(27, 'sport_01', '2025-01-30'),
(28, 'concert_01', '2025-01-30'),
(29, 'theatre_01', '2025-01-31'),
(30, 'movie_01', '2025-01-30'),
(31, 'movie_01', '2025-01-31'),
(32, 'movie_01', '2025-02-01'),
(33, 'movie_01', '2025-02-02'),
(34, 'movie_01', '2025-02-03'),
(35, 'movie_01', '2025-02-04'),
(36, 'movie_01', '2025-02-05'),
(37, 'movie_01', '2025-02-06'),
(46, 'movie_02', '2025-01-30'),
(47, 'movie_02', '2025-01-31'),
(48, 'movie_02', '2025-02-01'),
(49, 'movie_02', '2025-02-02'),
(50, 'movie_02', '2025-02-03'),
(51, 'movie_02', '2025-02-04'),
(52, 'movie_02', '2025-02-05'),
(53, 'movie_02', '2025-02-06'),
(54, 'movie_03', '2025-01-30'),
(55, 'movie_03', '2025-01-31'),
(56, 'movie_03', '2025-02-01'),
(57, 'movie_03', '2025-02-02'),
(58, 'movie_03', '2025-02-03'),
(59, 'movie_03', '2025-02-04'),
(60, 'movie_03', '2025-02-05'),
(61, 'movie_03', '2025-02-06'),
(62, 'movie_04', '2025-01-30'),
(63, 'movie_04', '2025-01-31'),
(64, 'movie_04', '2025-02-01'),
(65, 'movie_04', '2025-02-02'),
(66, 'movie_04', '2025-02-03'),
(67, 'movie_04', '2025-02-05'),
(68, 'movie_05', '2025-01-30'),
(69, 'movie_05', '2025-01-31'),
(70, 'movie_05', '2025-02-02'),
(71, 'movie_05', '2025-02-03'),
(72, 'movie_05', '2025-02-04'),
(73, 'movie_05', '2025-02-05'),
(74, 'sport_02', '2025-01-31'),
(75, 'sport_02', '2025-02-07'),
(76, 'sport_03', '2025-02-01'),
(77, 'sport_04', '2025-02-15'),
(78, 'sport_05', '2025-02-15'),
(79, 'concert_02', '2025-02-05'),
(80, 'concert_03', '2025-01-31'),
(81, 'concert_04', '2025-02-07'),
(82, 'concert_05', '2025-01-31'),
(83, 'concert_06', '2025-02-01'),
(84, 'concert_07', '2025-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `event_time`
--

CREATE TABLE `event_time` (
  `id` int(11) NOT NULL,
  `date_id` int(11) NOT NULL,
  `time` time NOT NULL,
  `url` varchar(510) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event_time`
--

INSERT INTO `event_time` (`id`, `date_id`, `time`, `url`) VALUES
(7, 1, '14:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-taeydellinen-lauantai-turku-turun kaupunginteatteri-17749329/'),
(9, 1, '19:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-taeydellinen-lauantai-turku-turun-kaupunginteatteri-17749320/'),
(11, 5, '13:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-taeydellinen-lauantai-turku-turun-kaupunginteatteri-17749330/'),
(12, 5, '18:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-taeydellinen-lauantai-turku-turun-kaupunginteatteri-17749321/'),
(13, 6, '14:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-taeydellinen-lauantai-turku-turun-kaupunginteatteri-17749331/'),
(14, 6, '19:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-taeydellinen-lauantai-turku-turun-kaupunginteatteri-17749322/'),
(15, 7, '18:30:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-ihminen-parhaan-kykynsae-mukaan-turun-kaupunginteatteri-17820623/'),
(16, 8, '18:30:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-ihminen-parhaan-kykynsae-mukaan-turun-kaupunginteatteri-17820624/'),
(17, 9, '18:30:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-ihminen-parhaan-kykynsae-mukaan-turun-kaupunginteatteri-17820625/'),
(18, 10, '18:30:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-ihminen-parhaan-kykynsae-mukaan-turun-kaupunginteatteri-17820626/'),
(19, 11, '13:30:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-ihminen-parhaan-kykynsae-mukaan-turun-kaupunginteatteri-17820627/'),
(20, 12, '19:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-veden-varaan-turun-kaupunginteatteri-17820568/'),
(21, 13, '19:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-veden-varaan-turun-kaupunginteatteri-17820569/'),
(22, 14, '19:00:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-veden-varaan-turun-kaupunginteatteri-17820570/'),
(23, 15, '19:00:00', 'https://www.lippu.fi/event/bunker-kiev-kiovan-pommisuojissa-taiteen-talo-18320384/'),
(24, 16, '18:00:00', 'https://www.lippu.fi/event/bunker-kiev-kiovan-pommisuojissa-taiteen-talo-18320385/'),
(25, 17, '13:30:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-lou-salome-turun-kaupunginteatteri-17749301/'),
(26, 18, '18:30:00', 'https://www.lippu.fi/event/turun-kaupunginteatteri-lou-salome-turun-kaupunginteatteri-17749295/'),
(27, 19, '18:30:00', 'https://tkt.lippu.fi/webshop/webticket/seatmap?eventId=6821'),
(28, 20, '19:00:00', 'https://ticket.linnateatteri.fi/en/buyingflow/tickets/12378/'),
(29, 21, '19:00:00', 'https://ticket.linnateatteri.fi/en/buyingflow/tickets/12380/'),
(30, 22, '18:00:00', 'https://ticket.linnateatteri.fi/en/buyingflow/tickets/12380/'),
(31, 23, '19:00:00', 'https://ticket.linnateatteri.fi/en/buyingflow/tickets/12388/'),
(32, 24, '19:00:00', 'https://ticket.linnateatteri.fi/en/buyingflow/tickets/12388/'),
(33, 25, '19:00:00', 'https://ticket.linnateatteri.fi/en/buyingflow/tickets/12379/'),
(34, 26, '19:00:00', 'https://ticket.linnateatteri.fi/en/buyingflow/tickets/12379/'),
(35, 27, '17:00:00', 'https://kalenteri.turku.fi/fi-FI/page/6603c3abcd2ad427fe79b8d3?count=24&sort=creationDate&reverse=true'),
(36, 28, '19:00:00', 'https://utopiaclub.fi/tapahtumat/truckfighters-swe-1/#tribe-tickets__tickets-form'),
(37, 30, '14:30:00', 'https://www.finnkino.fi/en/websales/show/2039525/'),
(38, 30, '17:15:00', 'https://www.finnkino.fi/en/websales/show/2039526/'),
(39, 31, '14:30:00', 'https://www.finnkino.fi/en/websales/show/2041983/?dt=19.04.2024'),
(40, 31, '17:30:00', 'https://www.finnkino.fi/en/websales/show/2041978/?dt=19.04.2024'),
(41, 32, '13:20:00', 'https://www.finnkino.fi/en/websales/show/2042120/?dt=20.04.2024'),
(42, 32, '19:45:00', 'https://www.finnkino.fi/en/websales/show/2042121/?dt=20.04.2024'),
(43, 33, '13:30:00', 'https://www.finnkino.fi/en/websales/show/2042117/?dt=21.04.2024'),
(44, 33, '17:00:00', 'https://www.finnkino.fi/en/websales/show/2042118/?dt=21.04.2024'),
(45, 34, '14:30:00', 'https://www.finnkino.fi/en/websales/show/2042228/?dt=22.04.2024'),
(46, 34, '18:00:00', 'https://www.finnkino.fi/en/websales/show/2042227/?dt=22.04.2024'),
(47, 35, '14:30:00', 'https://www.finnkino.fi/en/websales/show/2042219/?dt=23.04.2024'),
(48, 35, '16:30:00', 'https://www.finnkino.fi/en/websales/show/2042220/?dt=23.04.2024'),
(49, 36, '14:20:00', 'https://www.finnkino.fi/en/websales/show/2042221/?dt=24.04.2024'),
(50, 36, '17:00:00', 'https://www.finnkino.fi/en/websales/show/2042222/?dt=24.04.2024'),
(51, 37, '14:30:00', 'https://www.finnkino.fi/en/websales/show/2042451/?dt=25.04.2024'),
(52, 37, '17:15:00', 'https://www.finnkino.fi/en/websales/show/2042452/?dt=25.04.2024'),
(53, 46, '15:00:00', 'https://www.finnkino.fi/en/websales/show/2039425/'),
(54, 47, '17:00:00', 'https://www.finnkino.fi/en/websales/show/2041939/?dt=19.04.2024'),
(55, 48, '14:00:00', 'https://www.finnkino.fi/en/websales/show/2042164/?dt=20.04.2024'),
(56, 48, '18:10:00', 'https://www.finnkino.fi/en/websales/show/2042050/?dt=20.04.2024'),
(57, 49, '18:05:00', 'https://www.finnkino.fi/en/websales/show/2042161/?dt=21.04.2024'),
(58, 50, '14:45:00', 'https://www.finnkino.fi/en/websales/show/2042323/?dt=22.04.2024'),
(59, 51, '17:00:00', 'https://www.finnkino.fi/en/websales/show/2042326/?dt=23.04.2024'),
(60, 52, '14:30:00', 'https://www.finnkino.fi/en/websales/show/2042327/?dt=24.04.2024'),
(61, 53, '15:00:00', 'https://www.finnkino.fi/en/websales/show/2042506/?dt=25.04.2024'),
(62, 53, '17:30:00', 'https://www.finnkino.fi/en/websales/show/2042508/?dt=25.04.2024'),
(63, 54, '20:00:00', 'https://www.finnkino.fi/en/websales/show/2039350/'),
(64, 55, '14:25:00', 'https://www.finnkino.fi/en/websales/show/2042032/?dt=19.04.2024'),
(65, 56, '13:55:00', 'https://www.finnkino.fi/en/websales/show/2042025/?dt=20.04.2024'),
(66, 56, '16:15:00', 'https://www.finnkino.fi/en/websales/show/2042026/?dt=20.04.2024'),
(67, 57, '13:40:00', 'https://www.finnkino.fi/en/websales/show/2042146/?dt=21.04.2024'),
(68, 57, '21:00:00', 'https://www.finnkino.fi/en/websales/show/2044767/?dt=21.04.2024'),
(69, 58, '17:00:00', 'https://www.finnkino.fi/en/websales/show/2042295/?dt=22.04.2024'),
(70, 59, '14:45:00', 'https://www.finnkino.fi/en/websales/show/2042290/?dt=23.04.2024'),
(71, 60, '18:00:00', 'https://www.finnkino.fi/en/websales/show/2042291/?dt=24.04.2024'),
(72, 61, '17:15:00', 'https://www.finnkino.fi/en/websales/show/2042485/?dt=25.04.2024'),
(73, 61, '20:15:00', 'https://www.finnkino.fi/en/websales/show/2042502/?dt=25.04.2024'),
(74, 62, '14:30:00', 'https://www.finnkino.fi/en/websales/show/2039493/'),
(75, 63, '14:50:00', 'https://www.finnkino.fi/en/websales/show/2042089/?dt=19.04.2024'),
(76, 64, '16:45:00', 'https://www.finnkino.fi/en/websales/show/2042090/?dt=20.04.2024'),
(77, 65, '17:00:00', 'https://www.finnkino.fi/en/event/304563/title/the_promised_land'),
(78, 66, '19:30:00', 'https://www.finnkino.fi/en/websales/show/2042391/?dt=22.04.2024'),
(79, 67, '14:45:00', 'https://www.finnkino.fi/en/websales/show/2042392/?dt=24.04.2024'),
(80, 68, '14:20:00', 'https://www.finnkino.fi/en/websales/show/2039518/'),
(81, 69, '14:45:00', 'https://www.finnkino.fi/en/websales/show/2042084/?dt=19.04.2024'),
(82, 70, '15:30:00', 'https://www.finnkino.fi/en/websales/show/2042188/?dt=21.04.2024'),
(83, 71, '14:20:00', 'https://www.finnkino.fi/en/websales/show/2042381/?dt=22.04.2024'),
(84, 72, '17:00:00', 'https://www.finnkino.fi/en/websales/show/2042379/?dt=23.04.2024'),
(85, 73, '15:20:00', 'https://www.finnkino.fi/en/websales/show/2042380/?dt=24.04.2024'),
(86, 74, '18:30:00', 'https://harrastukset.turku.fi/en-FI/page/657c2b191211b77b4eb04546?count=24&sort=creationDate&reverse=true'),
(87, 75, '18:30:00', 'https://harrastukset.turku.fi/en-FI/page/657c2d23a092296542167f0a?count=24&sort=creationDate&reverse=true'),
(88, 76, '16:00:00', 'https://kalenteri.turku.fi/en-FI/page/65cb3b2911a03042d02237e6?count=24&sort=creationDate&reverse=true'),
(89, 77, '18:00:00', 'https://kalenteri.turku.fi/en-FI/page/6577e4b24921d33b283115f0?count=24&sort=creationDate&reverse=true'),
(90, 78, '16:00:00', 'https://kalenteri.turku.fi/en-FI/page/65cb3ce899981105bd7581a9?count=24&sort=creationDate&reverse=true'),
(91, 79, '20:00:00', 'https://www.songkick.com/concerts/41421412-vv-ville-valo-at-logomo-oy'),
(93, 80, '19:30:00', 'https://logomo.fi/tapahtuma/the-voice-of-finland-2024-semifinaali-2'),
(94, 81, '19:30:00', 'https://logomo.fi/tapahtuma/the-voice-of-finland-2024-finaali'),
(95, 82, '22:00:00', 'https://utopiaclub.fi/tapahtumat/rajayttajat-tiikeri-karmes/'),
(96, 83, '20:30:00', 'https://logomo.fi/tapahtuma/ursus-factory-kissa'),
(97, 83, '22:00:00', 'https://utopiaclub.fi/tapahtumat/kpc-x-turku-lytta-tohtori-getto-are-kriso-shakkii/');

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `event_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `director` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `cast` text NOT NULL,
  `genre` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `event_type` varchar(255) NOT NULL DEFAULT 'Movie',
  `url` varchar(510) DEFAULT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `title`, `description`, `director`, `duration`, `cast`, `genre`, `views`, `image`, `event_type`, `url`, `location`) VALUES
('movie_01', 'Myrskyluodon Maija', 'Myrskyluodon Maija is a touching story of a strong woman and the challenges she faces on a stormy island. Based on Anni Blomqvist\'s Myrskyluoto series of books, the film is set in coastal Finland in the 19th century. Young 17-year-old Maija marries Janne, a fisherman, against her will. Her life on Myrskyluoto is full of challenges and adversity: as a fisherman\'s wife, she has to cope with her husband\'s long absences at sea and look after her family alone. But Maija has grown into a strong-willed and independent woman, unafraid to take on the harsh archipelago. Maija and Janne share a strong bond and a love that has deepened over time. Janne supports his wife in her endeavours and understands that the strength of a family comes from joint efforts. Maija is a story of will, strength and love.', 'Tiina Lymi', '2 h 44 min', 'Amanda Jansson, Linus Troedsson, Jonna Järnefelt, Tobias Ziliacus, Amanda Kilpeläinen Arvidsson, Desmond Eastwood, Tony Doyle', 'Drama, Domestic, History', 5, 'myrskyluodon-maija', 'Movie', 'https://www.finnkino.fi/en/event/304378/title/stormskerry_maja/', 'Kinopalatsi - Turku'),
('movie_02', 'One Life', 'The incredible true story of Sir Nicholas \"Nicky\" Winton, who one day before the Second World War saved over six hundred children from destruction at the hands of the Nazis. Nicky thought of himself as a banker, not a humanitarian, but on a visit to Prague in 1938 he saw the plight of fleeing Jewish refugees. He did what he believed was right - what anyone would do - and dedicated himself to the cause. War was approaching, and the race against time began. How many children could he free before time ran out? Fifty years later, it is 1988 and Nicky is still haunted by the fate of the children he was unable to help. It was only when he was surprised by survivors on live television that he was able to accept that saving even one life is a victory when faced with crushing crimes against humanity. The British people learned the truth about a hero in their midst.', 'James Hawes', '1 h 49 min', 'Anthony Hopkins, Johnny Flynn, Helena Bonham Carter, Jonathan Pryce, Lena Olin', 'Drama, Biography, History', 2, 'onelife', 'Movie', 'https://www.finnkino.fi/en/event/304515/title/one_life', 'Kinopalatsi - Turku'),
('movie_03', 'Kung Fu Panda 4', 'This spring, for the first time in almost a decade, comedy icon Jack Black returns to his role as Po, the world’s most unlikely kung fu master, with a hilarious, butt-kicking new chapter in DreamWorks Animation’s beloved action-comedy franchise: Kung Fu Panda 4. After three death-defying adventures defeating world-class villains with his unmatched courage and mad martial arts skills, Po, the Dragon Warrior (Golden Globe nominee Jack Black), is called upon by destiny to … give it a rest already. More specifically, he’s tapped to become the Spiritual Leader of the Valley of Peace. That poses a couple of obvious problems. First, Po knows as much about spiritual leadership as he does about the paleo diet, and second, he needs to quickly find and train a new Dragon Warrior before he can assume his new lofty position. ', 'Mike Mitchell, Stephanie Ma Stine', '1 h 34 min', 'Jack Black, Awkwafina, Viola Davis, Dustin Hoffman, James Hong, Bryan Cranston, Ian McShane, Ke Huy Quan', 'Family, Animation', 1, 'kungfu-panda-4', 'Movie', 'https://www.finnkino.fi/en/event/304522/title/kung_fu_panda_4', 'Kinopalatsi - Turku'),
('movie_04', 'The Promised Land', 'In 1755, poor soldier Ludvig Kahlen (Mads Mikkelsen) arrives on the barren Jutland moors and makes a deal with the king: if he succeeds in taming the harsh moors into farmland, he will be rewarded with a peerage. But Frederik de Schinkel, the ruthless local ruler and landowner, believes the land belongs to him and shows no mercy to Kahlen, who is not only clearing the land, but has formed an apparently close relationship with both de Schinkel\'s sister and his servants. With unwavering fury, the righteous Kahlen takes up the fight against an overwhelming enemy, risking not only his own life but also the lives of those he has come to love.', 'Nikolaj Arcel', '2 h 8 min', 'Mads Mikkelsen, Amanda Collin, Simon Bennebjerg, Kristine Kujath Thorp, Gustav Lindh', 'Drama, History', 1, 'the-promised-land', 'Movie', 'https://www.finnkino.fi/en/event/304563/title/the_promised_land', 'Kinopalatsi - Turku'),
('movie_05', 'Four Daughters', 'Between light and darkness stands Olfa, a Tunisian woman and the mother of four daughters. One day, her two older daughters disappear. To fill in their absence, the filmmaker Kaouther Ben Hania invites professional actresses and invents a unique cinema experience that will lift the veil on Olfa and her daughters\' life stories. An intimate journey of hope, rebellion, violence, transmission and sisterhood that will question the very foundations of our societies.', 'Kaouther Ben Hania', '1 h 47 min', 'Nour Karoui, Zine El-Abidine Ben Ali, Ichraq Matar, Hind Sabri', 'Documentary', 2, 'four-daughters', 'Movie', 'https://www.finnkino.fi/en/event/304503/title/four_daughters', 'Kinopalatsi - Turku');

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

CREATE TABLE `sport` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `event_type` varchar(255) NOT NULL DEFAULT 'Sport'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`id`, `title`, `description`, `type`, `views`, `image`, `location`, `event_type`) VALUES
('sport_01', 'Cross-country championship competition', 'It\'s time to dust off your running shoes because Naantalin Löyly, in collaboration with the City of Naantali, is organizing the city-wide cross-country championship competition on Thursday, April 18, 2024, at Kuparivuori!\r\n\r\nThe competition is open and free for all residents of Naantali as well as members of Naantalin Löyly. There are categories for participants aged 3 and above, all the way up to adults.', 'Running', 6, 'maasto', 'Naantali', 'Sport'),
('sport_02', 'Couple Dances & Dance Course', 'Dance course and dances at the same price! Fusk dance course at 6:30 PM and dances at 8:00 PM. At the beginning of the dances, there will be a bus stop where everyone can start dancing. The dance style learned in the courses will also be played frequently during the dances. Price for members is 15€, non-members 17€, under 25 years old 6€, price includes the course, dances, and cloakroom!', 'Dance', 1, 'dance', 'Pyrkivä Sports Hall', 'Sport'),
('sport_03', 'TPS-MP, League', 'TPS Football Club\'s men\'s representative team will face Mikkelin Palloilijat in a Ykkönen League match. Welcome to the stands at Kupittaa\'s Veritas Stadium!', 'Football', 0, 'tps-mp', 'Veritas Stadion', 'Sport'),
('sport_04', 'Hamara MMA Vol.5', 'Professional mixed martial arts (MMA) fight at Kupittaan ball sports hall.', 'Martial Arts', 0, 'hamara-mma', 'Kupittaa ball hall', 'Sport'),
('sport_05', 'FC TPS - KÄPA, League', 'FC TPS\'s men\'s representative team will face Käpylän Pallo in a Ykkönen League match. Welcome to the stands at Kupittaan Veritas Stadion!', 'Football', 0, 'tps-mp', 'Veritas Stadion', 'Sport');

-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE `theatre` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `director` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `cast` text NOT NULL,
  `genre` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `event_type` varchar(255) NOT NULL DEFAULT 'Theatre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`id`, `title`, `description`, `director`, `duration`, `cast`, `genre`, `views`, `image`, `location`, `event_type`) VALUES
('theatre_01', 'Täydellinen lauantai', 'The situation is familiar to everyone in the hustle and bustle of everyday life: If only I could just have some peace. At least with this one thing. At least once. But after this comedy of errors, one\'s own life may once again feel quite peaceful.', 'Florian Zeller', '2 h 5 min', 'Jaakko Saariluoma, Jenni Kokander, Tom Petäjä, Minna Hämäläinen, Markus Ilkka Uolevi, Kimmo Rasila, Mika Kujala', 'Comedy', 13, 'taydellinen-lauantai', 'Turku City Theatre', 'Theatre'),
('theatre_02', 'Ihminen parhaan kykynsä mukaan', 'Ihminen parhaan kykynsä mukaan is a love story between a man and a woman, but without the traditional romance. It is also a story about the courage it takes to reveal oneself. The story is inside a young man\'s head, mired in memories and uncertain thoughts. He is encouraged and supported in building a life of his own by a woman who is more than just a friend.', 'Pertti Sveholm', '1 h', 'Waltteri Torikka, Pihla Penttinen, Marko Hilpo', 'Opera', 5, 'ihminen-parhaan', 'Turku City Theatre', 'Theatre'),
('theatre_03', 'Veden varaan', 'A wave of disappearances in the city triggers private detective Janatuinen\'s old trauma over his own mother\'s disappearance. Helena, the detective she\'s working with to solve a criminal case, also threatens to disappear, but not into the deep end, but into her own problems. Which of the events are real and which are fantasies woven in Janatuinen\'s mind?', 'Mikko Kouki', '2 h 30 min', 'Mauno Terävä, Linda Hämäläinen, Markus Ilkka Uolevi, Ulla Reinikainen, Stefan Karlsson, Mika Kujala, Inkeri Hyvönen, Miska Kaukonen, Emma Kilpimaa, Viljo Kouvonen, Lauri Bergman', 'Drama', 201, 'veden-varaan', 'Turku City Theatre', 'Theatre'),
('theatre_04', 'Kiovan pommisuojissa', 'Written by Tony Award-winning playwright Stefano Massin for his Lehman trilogy, Kiovan pommisuojissa (Bunker Kiev) is a moving account of what it is like to go to and stay in a bomb shelter during a bombing raid, based on the first-hand experiences of Ukrainians and eyewitness accounts. The performance takes the audience into a bunker, where a strong text resonates with the audience in a real way, making them empathise with what life is like for people in the middle of war.', 'Satu Rasila', '40 min', 'Minna Hämäläinen, Kimmo Rasila, Ulla Reinikainen, Riitta Salminen, Markus Ilkka Uolevi, Sofia Carlsson', 'Drama', 3, 'kiovan', 'Taiteen talo', 'Theatre'),
('theatre_05', 'Lou Salomé', 'It\'s all about the woman, they say. And at least the ideas of Nietzsche, Freud, Réé and Rilke are all written by the same woman: Lou Salomé (1861-1937) was a radical thinker of her time, a philosopher, psychoanalyst and writer who chose her own way of life and made her way into intellectual circles. But while her contemporaries reaped the glory, she remained an enigma to posterity, silenced. Lou Salomé\'s life was a dialogue of brilliant intellect and passion. Written by Aina Bergroth, the play spotlights a pioneer forgotten by history. The title role is played by Linda Hämäläinen.', 'Liisa Mustonen', '2 h 20 min', 'Linda Hämäläinen, Stefan Karlsson, Riitta Salminen, Ulla Reinikainen, Tomi Alatalo, Toni Harjajärvi', 'Drama', 0, 'lou-salome', 'Turku City Theatre', 'Theatre'),
('theatre_06', 'Stand up teatteri', 'W&T Comedy, which brings professional comedians to the stage, offers hard-hitting stand-up comedy every month at Turku City Theatre\'s Small Stage and Sopukka. The traditional Stand up, Turku! festival ensures that the year starts with a laugh. The age limit for all comedy clubs on the Small Stage is K18, as the auditorium is a licensed area. The new Sopukkasolo in early spring will bring the professional comedians\' show to a more intimate space. There is also a ticket package available for Sopukkasolo, which allows you to see all four solo shows at a reduced price. The Soprano Solos are aimed at adults, but there is no age limit. Changes and surprises to the performers are possible. You can find more information about the performers at the bottom of the page.', 'W&T Comedy', '2 h', 'Antti Haapala, Johanna Tohni, Paul Westlake, Anne Rimpelä', 'Stand Up', 1, 'stand-up-teatteri', 'Turku City Theatre', 'Theatre'),
('theatre_07', 'Murha kahdelle', 'When famous author Arthur Whitney is shot dead at his birthday party, the world\'s best detectives have a case to solve. The only problem is, they\'re all out of town. That\'s where local cop Marcus Moscowicz steps in, dreaming of bigger boots. To prove himself, Marcus must solve the case before the actual detective arrives. The clock is ticking and suspicions are growing, but who will they finally target? The play grips the audience and carries them through the murder mystery at a breathtaking pace. Who has the most gruesome motive? Who is lying? The denouement may surprise you.', 'Chris Whittaker', '2 h', 'Joel Mäkinen, Juha Pulli', 'Musical', 0, 'murha-kahdelle', 'Linnateatteri', 'Theatre'),
('theatre_08', 'Likapyykkiä', 'The play is an exhilarating portrayal of how a man and a woman manage to diverge in almost everything. After all the years spent together, both are naturally searching for themselves, but will their needs meet again and can the relationship be saved? In the play, Henri and Liisa go away for a weekend together with the intention of finding each other again. At their hotel they take a Naughty Naughty book with them, which contains exercises to help them get closer. They both have hopes but very different intentions. Likapyykkiä balances between the extremes of lightness and seriousness. It is an emotional musical comedy, but it is the humour that comes out of identification that comes out on top. ', 'Olka Horila', '2 h', 'Lari Halme, Nina Tapio', 'Musical, Comedy', 4, 'likapyykkia', 'Linnateatteri', 'Theatre'),
('theatre_09', 'Semiseco', 'In the spring of 2024, the Linnateatteri Theatre will pop a bottle or two when the ripe grapes of Teatteri Terve Tyttö (Theatre Healthy Girl) roll onto the stage of the Teatteriravintola (Theatre Restaurant). There will be a dazzling array of music, sketches and musical sketches. The trio of Emmi Lovén, Laura Hurme and Kati Urho will provide a suitably acidic stage entertainment. Topical humour, diamond-cut songs and professional performers who put themselves on the line guarantee an evening that will be talked about for a long time to come. A bubbly show by Teatteri Terve Tyttö hits you right in the humour room and gives a great start to the festive season.', '-', '2 h', 'Emmi Lovén, Laura Hurme, Kati Urho', 'Musical, Comedy', 2, 'semiseco', 'Linnateatteri', 'Theatre'),
('theatre_10', 'Vaimoni on toista maata', 'Risto\'s girlfriend Veera is upset during the drive to the party and refuses to say anything during the evening. From this, the other couple deduces that Veera is a foreigner who doesn\'t understand Finnish. The spiral of misunderstandings is complete and the pace picks up as the evening progresses. What was supposed to be a pleasant evening turns chaotic and during the course of the evening, both relationship problems and prejudices erupt. What is Hanistan like and how quickly can you learn the language? Vaimoni on toista maata (My wife is from another country) is a classic example of farce that plays with timing, gestures and emotions. The play, which has been performed on summer theatre stages, is brought to the stage of the Linnateatteri, where it fits like a glove.', 'Mikko Kivinen', '1 h 50 min', 'Vuokko Hovatta, Maija Siljander, Ilkka Forss, Antti Peltola', 'Comedy', 1, 'vaimoni', 'Linnateatteri', 'Theatre');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_email` varchar(255) NOT NULL,
  `pass_hash` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes of saved tables
--

--
-- Indexes for table `concert`
--
ALTER TABLE `concert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_date`
--
ALTER TABLE `event_date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_time`
--
ALTER TABLE `event_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_id` (`date_id`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theatre`
--
ALTER TABLE `theatre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_email`);

--
-- AUTO_INCREMENT value for table of saved tables
--

--
-- AUTO_INCREMENT value for table `event_date`
--
ALTER TABLE `event_date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT value for table `event_time`
--
ALTER TABLE `event_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT value for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
