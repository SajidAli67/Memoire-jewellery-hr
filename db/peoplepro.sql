-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2023 at 04:43 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peoplepro`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` varchar(40) DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appraisals`
--

CREATE TABLE `appraisals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `customer_experience` varchar(191) NOT NULL,
  `marketing` varchar(191) DEFAULT NULL,
  `administration` varchar(191) DEFAULT NULL,
  `professionalism` varchar(191) DEFAULT NULL,
  `integrity` varchar(191) DEFAULT NULL,
  `attendance` varchar(191) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `date` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_name` varchar(50) NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `asset_code` varchar(80) NOT NULL,
  `assets_category_id` bigint(20) UNSIGNED NOT NULL,
  `Asset_note` mediumtext DEFAULT NULL,
  `manufacturer` varchar(191) NOT NULL,
  `serial_number` varchar(191) NOT NULL,
  `invoice_number` varchar(191) NOT NULL,
  `asset_image` varchar(191) DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `warranty_date` date NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_categories`
--

CREATE TABLE `asset_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` date NOT NULL,
  `clock_in` varchar(191) NOT NULL,
  `clock_in_ip` varchar(45) NOT NULL,
  `clock_out` varchar(191) NOT NULL,
  `clock_out_ip` varchar(45) NOT NULL,
  `clock_in_out` tinyint(4) NOT NULL,
  `time_late` varchar(191) NOT NULL DEFAULT '00:00',
  `early_leaving` varchar(191) NOT NULL DEFAULT '00:00',
  `overtime` varchar(191) NOT NULL DEFAULT '00:00',
  `total_work` varchar(191) NOT NULL DEFAULT '00:00',
  `total_rest` varchar(191) NOT NULL DEFAULT '00:00',
  `attendance_status` varchar(191) NOT NULL DEFAULT 'present'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `award_information` mediumtext DEFAULT NULL,
  `award_date` date NOT NULL,
  `gift` varchar(40) DEFAULT NULL,
  `cash` varchar(40) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `award_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `award_photo` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_types`
--

CREATE TABLE `award_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `award_name` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendarables`
--

CREATE TABLE `calendarables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_interview`
--

CREATE TABLE `candidate_interview` (
  `interview_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_no` varchar(15) NOT NULL,
  `username` varchar(64) NOT NULL,
  `profile` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `website` varchar(40) DEFAULT NULL,
  `address1` mediumtext DEFAULT NULL,
  `address2` mediumtext DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `country` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `company_type` varchar(191) NOT NULL,
  `trading_name` varchar(191) DEFAULT NULL,
  `registration_no` varchar(191) DEFAULT NULL,
  `contact_no` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `tax_no` varchar(191) DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_logo` varchar(191) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `complaint_title` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `complaint_from` bigint(20) UNSIGNED NOT NULL,
  `complaint_against` bigint(20) UNSIGNED NOT NULL,
  `complaint_date` date NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecudaor'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People\'s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'KW', 'Kuwait'),
(116, 'KG', 'Kyrgyzstan'),
(117, 'LA', 'Lao People\'s Democratic Republic'),
(118, 'LV', 'Latvia'),
(119, 'LB', 'Lebanon'),
(120, 'LS', 'Lesotho'),
(121, 'LR', 'Liberia'),
(122, 'LY', 'Libyan Arab Jamahiriya'),
(123, 'LI', 'Liechtenstein'),
(124, 'LT', 'Lithuania'),
(125, 'LU', 'Luxembourg'),
(126, 'MO', 'Macau'),
(127, 'MK', 'Macedonia'),
(128, 'MG', 'Madagascar'),
(129, 'MW', 'Malawi'),
(130, 'MY', 'Malaysia'),
(131, 'MV', 'Maldives'),
(132, 'ML', 'Mali'),
(133, 'MT', 'Malta'),
(134, 'MH', 'Marshall Islands'),
(135, 'MQ', 'Martinique'),
(136, 'MR', 'Mauritania'),
(137, 'MU', 'Mauritius'),
(138, 'TY', 'Mayotte'),
(139, 'MX', 'Mexico'),
(140, 'FM', 'Micronesia, Federated States of'),
(141, 'MD', 'Moldova, Republic of'),
(142, 'MC', 'Monaco'),
(143, 'MN', 'Mongolia'),
(144, 'MS', 'Montserrat'),
(145, 'MA', 'Morocco'),
(146, 'MZ', 'Mozambique'),
(147, 'MM', 'Myanmar'),
(148, 'NA', 'Namibia'),
(149, 'NR', 'Nauru'),
(150, 'NP', 'Nepal'),
(151, 'NL', 'Netherlands'),
(152, 'AN', 'Netherlands Antilles'),
(153, 'NC', 'New Caledonia'),
(154, 'NZ', 'New Zealand'),
(155, 'NI', 'Nicaragua'),
(156, 'NE', 'Niger'),
(157, 'NG', 'Nigeria'),
(158, 'NU', 'Niue'),
(159, 'NF', 'Norfork Island'),
(160, 'MP', 'Northern Mariana Islands'),
(161, 'NO', 'Norway'),
(162, 'OM', 'Oman'),
(163, 'PK', 'Pakistan'),
(164, 'PW', 'Palau'),
(165, 'PA', 'Panama'),
(166, 'PG', 'Papua New Guinea'),
(167, 'PY', 'Paraguay'),
(168, 'PE', 'Peru'),
(169, 'PH', 'Philippines'),
(170, 'PN', 'Pitcairn'),
(171, 'PL', 'Poland'),
(172, 'PT', 'Portugal'),
(173, 'PR', 'Puerto Rico'),
(174, 'QA', 'Qatar'),
(175, 'RE', 'Reunion'),
(176, 'RO', 'Romania'),
(177, 'RU', 'Russian Federation'),
(178, 'RW', 'Rwanda'),
(179, 'KN', 'Saint Kitts and Nevis'),
(180, 'LC', 'Saint Lucia'),
(181, 'VC', 'Saint Vincent and the Grenadines'),
(182, 'WS', 'Samoa'),
(183, 'SM', 'San Marino'),
(184, 'ST', 'Sao Tome and Principe'),
(185, 'SA', 'Saudi Arabia'),
(186, 'SN', 'Senegal'),
(187, 'SC', 'Seychelles'),
(188, 'SL', 'Sierra Leone'),
(189, 'SG', 'Singapore'),
(190, 'SK', 'Slovakia'),
(191, 'SI', 'Slovenia'),
(192, 'SB', 'Solomon Islands'),
(193, 'SO', 'Somalia'),
(194, 'ZA', 'South Africa'),
(195, 'GS', 'South Georgia South Sandwich Islands'),
(196, 'ES', 'Spain'),
(197, 'LK', 'Sri Lanka'),
(198, 'SH', 'St. Helena'),
(199, 'PM', 'St. Pierre and Miquelon'),
(200, 'SD', 'Sudan'),
(201, 'SR', 'Suriname'),
(202, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(203, 'SZ', 'Swaziland'),
(204, 'SE', 'Sweden'),
(205, 'CH', 'Switzerland'),
(206, 'SY', 'Syrian Arab Republic'),
(207, 'TW', 'Taiwan'),
(208, 'TJ', 'Tajikistan'),
(209, 'TZ', 'Tanzania, United Republic of'),
(210, 'TH', 'Thailand'),
(211, 'TG', 'Togo'),
(212, 'TK', 'Tokelau'),
(213, 'TO', 'Tonga'),
(214, 'TT', 'Trinidad and Tobago'),
(215, 'TN', 'Tunisia'),
(216, 'TR', 'Turkey'),
(217, 'TM', 'Turkmenistan'),
(218, 'TC', 'Turks and Caicos Islands'),
(219, 'TV', 'Tuvalu'),
(220, 'UG', 'Uganda'),
(221, 'UA', 'Ukraine'),
(222, 'AE', 'United Arab Emirates'),
(223, 'GB', 'United Kingdom'),
(224, 'UM', 'United States minor outlying islands'),
(225, 'UY', 'Uruguay'),
(226, 'UZ', 'Uzbekistan'),
(227, 'VU', 'Vanuatu'),
(228, 'VA', 'Vatican City State'),
(229, 'VE', 'Venezuela'),
(230, 'VN', 'Vietnam'),
(231, 'VG', 'Virigan Islands (British)'),
(232, 'VI', 'Virgin Islands (U.S.)'),
(233, 'WF', 'Wallis and Futuna Islands'),
(234, 'EH', 'Western Sahara'),
(235, 'YE', 'Yemen'),
(236, 'YU', 'Yugoslavia'),
(237, 'ZR', 'Zaire'),
(238, 'ZM', 'Zambia'),
(239, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `c_m_s`
--

CREATE TABLE `c_m_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `home` longtext DEFAULT NULL,
  `about` longtext DEFAULT NULL,
  `contact` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(191) NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_head` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `designation_name` varchar(191) NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `staff_id` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `office_shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_users_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `exit_date` date DEFAULT NULL,
  `marital_status` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `zip_code` varchar(24) DEFAULT NULL,
  `cv` varchar(64) DEFAULT NULL,
  `skype_id` varchar(64) DEFAULT NULL,
  `fb_id` varchar(64) DEFAULT NULL,
  `twitter_id` varchar(64) DEFAULT NULL,
  `linkedIn_id` varchar(64) DEFAULT NULL,
  `whatsapp_id` varchar(64) DEFAULT NULL,
  `basic_salary` double DEFAULT 0,
  `payslip_type` varchar(191) DEFAULT NULL,
  `attendance_type` varchar(191) DEFAULT NULL,
  `pension_type` varchar(50) DEFAULT NULL,
  `pension_amount` double(8,2) DEFAULT 0.00,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_bank_accounts`
--

CREATE TABLE `employee_bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `account_title` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `bank_name` varchar(191) NOT NULL,
  `bank_code` varchar(191) NOT NULL,
  `bank_branch` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_contacts`
--

CREATE TABLE `employee_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `relation` varchar(50) NOT NULL,
  `is_primary` tinyint(4) DEFAULT 0,
  `is_dependent` tinyint(4) DEFAULT 0,
  `contact_name` varchar(191) NOT NULL,
  `work_phone` varchar(191) DEFAULT NULL,
  `work_phone_ext` varchar(191) DEFAULT NULL,
  `personal_phone` varchar(191) DEFAULT NULL,
  `home_phone` varchar(191) DEFAULT NULL,
  `work_email` varchar(191) DEFAULT NULL,
  `personal_email` varchar(191) DEFAULT NULL,
  `address1` varchar(191) DEFAULT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_title` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `document_file` varchar(191) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_immigrations`
--

CREATE TABLE `employee_immigrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_number` varchar(191) NOT NULL,
  `document_file` varchar(191) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `eligible_review_date` date DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_interview`
--

CREATE TABLE `employee_interview` (
  `interview_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave_type_details`
--

CREATE TABLE `employee_leave_type_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `leave_type_detail` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_meeting`
--

CREATE TABLE `employee_meeting` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `meeting_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_project`
--

CREATE TABLE `employee_project` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_qualificaitons`
--

CREATE TABLE `employee_qualificaitons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `education_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `institution_name` varchar(191) NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `language_skill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `general_skill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_support_ticket`
--

CREATE TABLE `employee_support_ticket` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_task`
--

CREATE TABLE `employee_task` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_training_list`
--

CREATE TABLE `employee_training_list` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `training_list_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_work_experience`
--

CREATE TABLE `employee_work_experience` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `from_year` date DEFAULT NULL,
  `to_year` date DEFAULT NULL,
  `post` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `event_title` varchar(191) NOT NULL,
  `event_note` mediumtext NOT NULL,
  `event_date` date NOT NULL,
  `event_time` varchar(191) NOT NULL,
  `status` varchar(30) NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_managers`
--

CREATE TABLE `file_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(191) NOT NULL,
  `file_size` varchar(191) DEFAULT NULL,
  `file_extension` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_manager_settings`
--

CREATE TABLE `file_manager_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `allowed_extensions` mediumtext NOT NULL,
  `max_file_size` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_bank_cashes`
--

CREATE TABLE `finance_bank_cashes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `account_balance` varchar(191) NOT NULL,
  `initial_balance` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `branch_code` varchar(191) NOT NULL,
  `bank_branch` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_deposits`
--

CREATE TABLE `finance_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deposit_reference` varchar(191) NOT NULL,
  `deposit_file` varchar(191) DEFAULT NULL,
  `deposit_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_expenses`
--

CREATE TABLE `finance_expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(30) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_reference` varchar(191) NOT NULL,
  `expense_file` varchar(191) DEFAULT NULL,
  `expense_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_payees`
--

CREATE TABLE `finance_payees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payee_name` varchar(50) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_payers`
--

CREATE TABLE `finance_payers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payer_name` varchar(50) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_transactions`
--

CREATE TABLE `finance_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_reference` varchar(191) DEFAULT NULL,
  `expense_file` varchar(191) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `deposit_reference` varchar(191) DEFAULT NULL,
  `deposit_file` varchar(191) DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_transfers`
--

CREATE TABLE `finance_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` varchar(30) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) NOT NULL,
  `site_logo` varchar(191) DEFAULT NULL,
  `time_zone` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `currency_format` varchar(191) DEFAULT NULL,
  `default_payment_bank` varchar(191) DEFAULT NULL,
  `date_format` varchar(191) DEFAULT NULL,
  `theme` varchar(191) DEFAULT NULL,
  `footer` varchar(191) DEFAULT NULL,
  `footer_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `time_zone`, `currency`, `currency_format`, `default_payment_bank`, `date_format`, `theme`, `footer`, `footer_link`, `created_at`, `updated_at`) VALUES
(1, 'PeoplePro', 'logo.png', 'Asia/Dhaka', '$', 'prefix', '1', 'd-m-Y', 'default.css', 'LionCoders', 'https://www.lion-coders.com', '2020-07-25 20:00:00', '2023-05-10 11:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `goal_trackings`
--

CREATE TABLE `goal_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `goal_type_id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `target_achievement` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` varchar(191) NOT NULL,
  `end_date` varchar(191) NOT NULL,
  `progress` int(11) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goal_types`
--

CREATE TABLE `goal_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `goal_type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_publish` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE `indicators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `customer_experience` varchar(191) NOT NULL,
  `marketing` varchar(191) NOT NULL,
  `administrator` varchar(191) NOT NULL,
  `professionalism` varchar(191) NOT NULL,
  `integrity` varchar(191) NOT NULL,
  `attendance` varchar(191) NOT NULL,
  `added_by` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(191) NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `invoice_due_date` date NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `invoice_note` mediumtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) NOT NULL,
  `item_tax_type` varchar(191) NOT NULL,
  `item_tax_rate` varchar(191) NOT NULL,
  `item_qty` bigint(20) NOT NULL DEFAULT 0,
  `item_unit_price` bigint(20) NOT NULL,
  `item_sub_total` double NOT NULL,
  `sub_total` double NOT NULL,
  `discount_type` tinyint(4) DEFAULT NULL,
  `discount_figure` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_discount` double NOT NULL,
  `grand_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ip_settings`
--

CREATE TABLE `ip_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `ip_address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_candidates`
--

CREATE TABLE `job_candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` text DEFAULT NULL,
  `cover_letter` longtext NOT NULL,
  `fb_id` varchar(191) DEFAULT NULL,
  `linkedin_id` varchar(191) DEFAULT NULL,
  `cv` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `remarks` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_category` mediumtext NOT NULL,
  `url` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_interviews`
--

CREATE TABLE `job_interviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `interview_place` varchar(191) NOT NULL,
  `interview_date` date NOT NULL,
  `interview_time` time NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_posts`
--

CREATE TABLE `job_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `job_category_id` bigint(20) UNSIGNED NOT NULL,
  `job_title` varchar(191) NOT NULL,
  `job_type` varchar(191) NOT NULL,
  `no_of_vacancy` int(11) NOT NULL,
  `job_url` varchar(191) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `min_experience` varchar(20) NOT NULL,
  `short_description` mediumtext NOT NULL,
  `long_description` longtext NOT NULL,
  `closing_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_featured` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `language` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `leave_reason` mediumtext DEFAULT NULL,
  `remarks` varchar(191) DEFAULT NULL,
  `status` varchar(40) NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `allocated_day` int(11) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `leave_type`, `allocated_day`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Others', 0, 0, '2023-05-17 08:31:44', '2023-05-17 08:31:44');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_name` varchar(191) NOT NULL,
  `location_head` bigint(20) UNSIGNED DEFAULT NULL,
  `address1` varchar(191) DEFAULT NULL,
  `address2` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` int(10) UNSIGNED DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `meeting_title` varchar(191) NOT NULL,
  `meeting_note` mediumtext NOT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` varchar(191) NOT NULL,
  `status` varchar(30) NOT NULL,
  `is_notify` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_08_29_200844_create_languages_table', 1),
(2, '2018_08_29_205156_create_translations_table', 1),
(3, '2023_05_06_053210_create_countries_table', 2),
(4, '2023_05_06_053211_create_locations_table', 2),
(5, '2023_05_06_053212_create_companies_table', 2),
(6, '2023_05_06_053213_create_departments_table', 2),
(7, '2023_05_06_053214_create_designations_table', 2),
(8, '2023_05_06_053215_create_roles_table', 2),
(9, '2023_05_06_053217_create_users_table', 2),
(10, '2023_05_06_053218_create_office_shifts_table', 2),
(11, '2023_05_06_053219_create_statuses_table', 2),
(12, '2023_05_06_053220_create_employees_table', 2),
(13, '2023_05_06_053221_create_announcements_table', 2),
(14, '2023_05_06_053222_create_appraisals_table', 2),
(15, '2023_05_06_053223_create_asset_categories_table', 2),
(16, '2023_05_06_053224_create_assets_table', 2),
(17, '2023_05_06_053225_create_attendances_table', 2),
(18, '2023_05_06_053226_create_award_types_table', 2),
(19, '2023_05_06_053227_create_awards_table', 2),
(20, '2023_05_06_053228_create_c_m_s_table', 2),
(21, '2023_05_06_053229_create_calendarables_table', 2),
(22, '2023_05_06_053231_create_clients_table', 2),
(23, '2023_05_06_053232_create_complaints_table', 2),
(24, '2023_05_06_053233_create_document_types_table', 2),
(25, '2023_05_06_053234_create_employee_bank_accounts_table', 2),
(26, '2023_05_06_053235_create_employee_contacts_table', 2),
(27, '2023_05_06_053236_create_employee_documents_table', 2),
(28, '2023_05_06_053237_create_employee_immigrations_table', 2),
(29, '2023_05_06_053238_create_employee_leave_type_details_table', 2),
(30, '2023_05_06_053239_create_job_categories_table', 2),
(31, '2023_05_06_053240_create_job_posts_table', 2),
(32, '2023_05_06_053241_create_job_interviews_table', 2),
(33, '2023_05_06_053242_create_employee_interview_table', 2),
(34, '2023_05_06_053243_create_meetings_table', 2),
(35, '2023_05_06_053244_create_employee_meeting_table', 2),
(36, '2023_05_06_053245_create_projects_table', 2),
(37, '2023_05_06_053246_create_employee_project_table', 2),
(38, '2023_05_06_053247_create_qualification_languages_table', 2),
(39, '2023_05_06_053248_create_qualification_skills_table', 2),
(40, '2023_05_06_053249_create_qualification_education_levels_table', 2),
(41, '2023_05_06_053250_create_employee_qualificaitons_table', 2),
(42, '2023_05_06_053251_create_support_tickets_table', 2),
(43, '2023_05_06_053252_create_employee_support_ticket_table', 2),
(44, '2023_05_06_053253_create_tasks_table', 2),
(45, '2023_05_06_053254_create_employee_task_table', 2),
(46, '2023_05_06_053255_create_trainers_table', 2),
(47, '2023_05_06_053256_create_training_types_table', 2),
(48, '2023_05_06_053257_create_training_lists_table', 2),
(49, '2023_05_06_053258_create_employee_training_list_table', 2),
(50, '2023_05_06_053259_create_employee_work_experience_table', 2),
(51, '2023_05_06_053260_create_events_table', 2),
(52, '2023_05_06_053261_create_expense_types_table', 2),
(53, '2023_05_06_053262_create_failed_jobs_table', 2),
(54, '2023_05_06_053263_create_file_manager_settings_table', 2),
(55, '2023_05_06_053265_create_file_managers_table', 2),
(56, '2023_05_06_053265_create_finance_bank_cashes_table', 2),
(57, '2023_05_06_053266_create_finance_payers_table', 2),
(58, '2023_05_06_053267_create_payment_methods_table', 2),
(59, '2023_05_06_053268_create_finance_deposits_table', 2),
(60, '2023_05_06_053269_create_finance_payees_table', 2),
(61, '2023_05_06_053270_create_finance_expenses_table', 2),
(62, '2023_05_06_053271_create_finance_transactions_table', 2),
(63, '2023_05_06_053272_create_finance_transfers_table', 2),
(64, '2023_05_06_053273_create_general_settings_table', 2),
(65, '2023_05_06_053274_create_goal_types_table', 2),
(66, '2023_05_06_053275_create_goal_trackings_table', 2),
(67, '2023_05_06_053276_create_holidays_table', 2),
(68, '2023_05_06_053277_create_indicators_table', 2),
(69, '2023_05_06_053278_create_invoices_table', 2),
(70, '2023_05_06_053279_create_invoice_items_table', 2),
(71, '2023_05_06_053280_create_ip_settings_table', 2),
(72, '2023_05_06_053281_create_job_candidates_table', 2),
(73, '2023_05_06_053282_create_leave_types_table', 2),
(74, '2023_05_06_053283_create_leaves_table', 2),
(75, '2023_05_06_053284_create_permissions_table', 2),
(76, '2023_05_06_053285_create_model_has_permissions_table', 2),
(77, '2023_05_06_053287_create_model_has_roles_table', 2),
(78, '2023_05_06_053288_create_notifications_table', 2),
(79, '2023_05_06_053289_create_official_documents_table', 2),
(80, '2023_05_06_053290_create_password_resets_table', 2),
(81, '2023_05_06_053291_create_payslips_table', 2),
(82, '2023_05_06_053292_create_policies_table', 2),
(83, '2023_05_06_053293_create_project_bugs_table', 2),
(84, '2023_05_06_053294_create_project_discussions_table', 2),
(85, '2023_05_06_053295_create_project_files_table', 2),
(86, '2023_05_06_053296_create_promotions_table', 2),
(87, '2023_05_06_053297_create_resignations_table', 2),
(88, '2023_05_06_053298_create_role_has_permissions_table', 2),
(89, '2023_05_06_053299_create_salary_allowances_table', 2),
(90, '2023_05_06_053300_create_salary_basics_table', 2),
(91, '2023_05_06_053301_create_salary_commissions_table', 2),
(92, '2023_05_06_053302_create_salary_deductions_table', 2),
(93, '2023_05_06_053303_create_salary_loans_table', 2),
(94, '2023_05_06_053304_create_salary_other_payments_table', 2),
(95, '2023_05_06_053305_create_salary_overtimes_table', 2),
(96, '2023_05_06_053306_create_task_discussions_table', 2),
(97, '2023_05_06_053307_create_task_files_table', 2),
(98, '2023_05_06_053308_create_tax_types_table', 2),
(99, '2023_05_06_053309_create_termination_types_table', 2),
(100, '2023_05_06_053310_create_terminations_table', 2),
(101, '2023_05_06_053311_create_ticket_comments_table', 2),
(102, '2023_05_06_053312_create_transfers_table', 2),
(103, '2023_05_06_053313_create_travel_types_table', 2),
(104, '2023_05_06_053314_create_travels_table', 2),
(105, '2023_05_06_053315_create_warnings_type_table', 2),
(106, '2023_05_06_053316_create_warnings_table', 2),
(107, '2023_05_06_053317_create_candidate_interview_table', 2),
(108, '2023_05_06_151650_delete_column_from_document_types_table', 3),
(109, '2023_05_06_153653_update_foreign_key_to_employees_table', 3),
(110, '2023_05_07_163304_update_foreign_key_to_projects_table', 3),
(111, '2023_05_08_004033_update_foreign_key_to_support_tickets_table', 3),
(112, '2023_05_08_094247_update_foreign_key_to_tasks_table', 3),
(113, '2023_05_08_101326_add_foreign_key_to_training_types_table', 4),
(114, '2023_05_08_152355_update_foreign_key_to_file_managers_table', 4),
(115, '2023_05_08_165246_update_foreign_key_to_payment_methods_table', 4),
(116, '2023_05_08_165419_update_foreign_key_to_finance_deposits_table', 4),
(117, '2023_05_09_112302_update_foreign_key_to_finance_expenses_table', 4),
(118, '2023_05_09_115226_update_foreign_key_to_finance_transactions_table', 4),
(119, '2023_05_09_122727_update_foreign_key_to_finance_transfers_table', 4),
(120, '2023_05_09_130054_add_foreign_key_to_goal_trackings_table', 4),
(121, '2023_05_09_134538_update_foreign_key_to_holidays_table', 4),
(122, '2023_05_09_134626_add_foreign_key_to_indicators_table', 4),
(123, '2023_05_09_134702_update_foreign_key_to_invoices_table', 4),
(124, '2023_05_09_134831_update_foreign_key_to_invoice_items_table', 4),
(125, '2023_05_09_162641_update_foreign_key_to_leaves_table', 4),
(126, '2023_05_09_181324_update_foreign_key_to_official_documents_table', 4),
(127, '2023_05_09_190434_update_foreign_key_to_policies_table', 4),
(128, '2023_05_09_193007_update_foreign_key_to_terminations_table', 4),
(129, '2023_05_09_195431_update_foreign_key_to_travel_types_table', 4),
(130, '2023_05_09_195925_update_foreign_key_to_travels_table', 4),
(131, '2023_05_09_200229_update_foreign_key_to_warnings_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 8),
(1, 'App\\User', 28),
(1, 'App\\User', 29),
(1, 'App\\User', 30),
(1, 'App\\User', 31),
(1, 'App\\User', 36),
(1, 'App\\User', 40),
(1, 'App\\User', 44),
(1, 'App\\User', 46),
(1, 'App\\User', 47),
(1, 'App\\User', 48),
(1, 'App\\User', 51),
(1, 'App\\User', 60),
(1, 'App\\User', 61),
(1, 'App\\User', 62),
(1, 'App\\User', 66),
(1, 'App\\User', 67),
(1, 'App\\User', 68),
(2, 'App\\User', 9),
(2, 'App\\User', 12),
(2, 'App\\User', 13),
(2, 'App\\User', 14),
(2, 'App\\User', 15),
(2, 'App\\User', 24),
(2, 'App\\User', 25),
(2, 'App\\User', 27),
(2, 'App\\User', 32),
(2, 'App\\User', 33),
(2, 'App\\User', 34),
(2, 'App\\User', 37),
(2, 'App\\User', 38),
(2, 'App\\User', 41),
(2, 'App\\User', 42),
(2, 'App\\User', 43),
(2, 'App\\User', 49),
(2, 'App\\User', 50),
(2, 'App\\User', 54),
(2, 'App\\User', 56),
(2, 'App\\User', 57),
(2, 'App\\User', 58),
(2, 'App\\User', 59),
(3, 'App\\User', 39),
(3, 'App\\User', 52),
(3, 'App\\User', 53),
(4, 'App\\User', 11),
(4, 'App\\User', 23),
(4, 'App\\User', 26),
(4, 'App\\User', 45),
(5, 'App\\User', 21),
(5, 'App\\User', 22),
(6, 'App\\User', 10);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `office_shifts`
--

CREATE TABLE `office_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shift_name` varchar(191) NOT NULL,
  `default_shift` varchar(191) DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `sunday_in` varchar(191) DEFAULT NULL,
  `sunday_out` varchar(191) DEFAULT NULL,
  `saturday_in` varchar(191) DEFAULT NULL,
  `saturday_out` varchar(191) DEFAULT NULL,
  `friday_in` varchar(191) DEFAULT NULL,
  `friday_out` varchar(191) DEFAULT NULL,
  `thursday_in` varchar(191) DEFAULT NULL,
  `thursday_out` varchar(191) DEFAULT NULL,
  `wednesday_in` varchar(191) DEFAULT NULL,
  `wednesday_out` varchar(191) DEFAULT NULL,
  `tuesday_in` varchar(191) DEFAULT NULL,
  `tuesday_out` varchar(191) DEFAULT NULL,
  `monday_in` varchar(191) DEFAULT NULL,
  `monday_out` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `official_documents`
--

CREATE TABLE `official_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `document_title` varchar(191) NOT NULL,
  `identification_number` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `document_file` varchar(191) DEFAULT NULL,
  `expiry_date` date NOT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('new@gmail.com', '$2y$10$day4AQ4g8sFvMwhMrTxpJuLXZCpVF2IK9kVS.6qZxeR6b7CVt2eGy', '2020-10-06 05:22:35'),
('irfanchowdhury80@gmail.com', '$2y$10$V9HsEG5w4mzfDA3IDyLbPeEiXnlnNI97uZNdFb.kSC6uiYS6ZuiRu', '2023-01-03 08:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `method_name` varchar(40) NOT NULL,
  `payment_percentage` varchar(100) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payslips`
--

CREATE TABLE `payslips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payslip_key` char(36) NOT NULL,
  `payslip_number` varchar(191) DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` varchar(191) NOT NULL,
  `basic_salary` double NOT NULL,
  `net_salary` double NOT NULL,
  `allowances` text NOT NULL,
  `commissions` text NOT NULL,
  `loans` text NOT NULL,
  `deductions` text NOT NULL,
  `overtimes` text NOT NULL,
  `other_payments` text NOT NULL,
  `pension_type` varchar(50) DEFAULT NULL,
  `pension_amount` double NOT NULL,
  `hours_worked` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `month_year` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'view-user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'edit-user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'delete-user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'last-login-user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'role-access-user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'details-employee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'view-details-employee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'store-details-employee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'modify-details-employee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'customize-setting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'role-access', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'general-setting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'view-general-setting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'store-general-setting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'mail-setting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'view-mail-setting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'store-mail-setting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'language-setting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'core_hr', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'view-calendar', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'promotion', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'view-promotion', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'store-promotion', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'edit-promotion', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'delete-promotion', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'award', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'view-award', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'store-award', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'edit-award', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'delete-award', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'view-transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'store-transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'edit-transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'delete-transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'travel', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'view-travel', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'store-travel', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'edit-travel', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'delete-travel', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'resignation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'view-resignation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'store-resignation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'edit-resignation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'delete-resignation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'complaint', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'view-complaint', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'store-complaint', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'edit-complaint', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'delete-complaint', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'warning', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'view-warning', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'store-warning', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'edit-warning', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'delete-warning', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'termination', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'view-termination', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'store-termination', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'edit-termination', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'delete-termination', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'timesheet', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'attendance', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'view-attendance', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'edit-attendance', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'office_shift', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'view-office_shift', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'store-office_shift', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'edit-office_shift', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'delete-office_shift', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'view-holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'store-holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'edit-holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'delete-holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'leave', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'view-holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'store-holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'edit-holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'delete-holiday', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'payment-module', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'view-payslip', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'make-payment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'make-bulk_payment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'view-paylist', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'set-salary', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'hr_report', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'report-payslip', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'report-attendance', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'report-training', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'report-project', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'report-task', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'report-employee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'report-account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'report-deposit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'report-expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'report-transaction', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'recruitment', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'job_employer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'view-job_employer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'store-job_employer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'edit-job_employer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'delete-job_employer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'job_post', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'view-job_post', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'store-job_post', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'edit-job_post', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'delete-job_post', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'job_candidate', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'view-job_candidate', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'store-job_candidate', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'delete-job_candidate', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'job_interview', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'view-job_interview', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'store-job_interview', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'delete-job_interview', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'project-management', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'project', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'view-project', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'store-project', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'edit-project', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'delete-project', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'task', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'view-task', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'store-task', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'edit-task', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'delete-task', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'client', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'view-client', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'store-client', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'edit-client', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'delete-client', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'view-invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'store-invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'edit-invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'delete-invoice', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'ticket', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'view-ticket', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'store-ticket', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'edit-ticket', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'delete-ticket', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'import-module', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'import-attendance', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'import-employee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'file_module', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'file_manager', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'view-file_manager', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'store-file_manager', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'edit-file_manager', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'delete-file_manager', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'view-file_config', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'official_document', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'view-official_document', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'store-official_document', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'edit-official_document', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'delete-official_document', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'event-meeting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'meeting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'view-meeting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'store-meeting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'edit-meeting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'delete-meeting', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'event', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'view-event', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'store-event', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'edit-event', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'delete-event', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'view-role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'store-role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'edit-role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'delete-role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'assign-module', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'assign-role', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'assign-ticket', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'assign-project', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'assign-task', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'finance', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'view-account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'store-account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'edit-account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'delete-account', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'view-transaction', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'view-balance_transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'store-balance_transfer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'view-expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'store-expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'edit-expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'delete-expense', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'deposit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'view-deposit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'store-deposit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'edit-deposit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'delete-deposit', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'payer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'view-payer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'store-payer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'edit-payer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'delete-payer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'payee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'view-payee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'store-payee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'edit-payee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'delete-payee', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'training_module', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'trainer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'view-trainer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'store-trainer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'edit-trainer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'delete-trainer', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'training', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'view-training', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'store-training', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'edit-training', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'delete-training', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'access-module', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'access-variable_type', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'access-variable_method', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'access-language', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'announcement', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'store-announcement', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'edit-announcement', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'delete-announcement', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'company', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'view-company', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'store-company', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'edit-company', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'delete-company', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'department', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'view-department', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'store-department', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'edit-department', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'delete-department', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'designation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'view-designation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'store-designation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'edit-designation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'delete-designation', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'location', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'view-location', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'store-location', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'edit-location', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'delete-location', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'policy', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'store-policy', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'edit-policy', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'delete-policy', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'view-cms', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'store-cms', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'store-user', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'delete-attendance', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'view-leave', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'store-leave', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'edit-leave', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'delete-leave', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'cms', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'performance', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'goal-type', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'view-goal-type', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'store-goal-type', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'edit-goal-type', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'delete-goal-type', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'goal-tracking', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'view-goal-tracking', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'store-goal-tracking', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'edit-goal-tracking', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'delete-goal-tracking', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'indicator', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'view-indicator', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'store-indicator', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'edit-indicator', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'delete-indicator', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'appraisal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'view-appraisal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'store-appraisal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'edit-appraisal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'delete-appraisal', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'assets-and-category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'view-assets-category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'store-assets-category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'edit-assets-category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'delete-assets-category', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'view-assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'store-assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'edit-assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'delete-assets', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'daily-attendances', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'date-wise-attendances', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'monthly-attendances', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'set-permission', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'get-leave-notification', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'report-pension', 'web', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `project_priority` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `summary` mediumtext DEFAULT NULL,
  `project_status` varchar(40) NOT NULL DEFAULT 'not started',
  `project_note` longtext DEFAULT NULL,
  `project_progress` varchar(191) DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_bugs`
--

CREATE TABLE `project_bugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` mediumtext NOT NULL,
  `bug_attachment` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_discussions`
--

CREATE TABLE `project_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `project_discussion` mediumtext NOT NULL,
  `discussion_attachment` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_title` varchar(191) NOT NULL,
  `file_attachment` varchar(191) NOT NULL,
  `file_description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_title` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `promotion_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification_education_levels`
--

CREATE TABLE `qualification_education_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification_languages`
--

CREATE TABLE `qualification_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualification_skills`
--

CREATE TABLE `qualification_skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resignations`
--

CREATE TABLE `resignations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `resignation_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', 'Can access and change everything', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'employee', 'web', 'Default access', 1, '2020-07-26 14:50:45', '2020-07-26 14:50:45'),
(3, 'client', 'web', 'When you create a client, this role and associated.', 1, '2020-10-08 04:10:23', '2020-10-08 04:10:23'),
(4, 'Manager', 'web', 'Can Manage', 1, '2021-02-24 11:24:58', '2021-02-24 11:24:58'),
(5, 'Editor', 'web', 'Custom access', 1, '2021-02-24 11:24:58', '2021-02-24 11:24:58'),
(6, 'HR', 'web', '', 1, '2021-09-05 04:12:28', '2021-09-05 04:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 5),
(1, 6),
(2, 5),
(2, 6),
(3, 5),
(3, 6),
(4, 5),
(4, 6),
(5, 5),
(5, 6),
(6, 5),
(6, 6),
(7, 5),
(7, 6),
(8, 5),
(8, 6),
(9, 5),
(9, 6),
(10, 5),
(10, 6),
(11, 5),
(11, 6),
(13, 5),
(13, 6),
(14, 5),
(14, 6),
(15, 5),
(15, 6),
(16, 5),
(16, 6),
(17, 5),
(17, 6),
(18, 5),
(18, 6),
(20, 5),
(21, 5),
(22, 5),
(23, 5),
(24, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(37, 5),
(38, 5),
(39, 5),
(41, 5),
(42, 5),
(43, 5),
(44, 5),
(46, 5),
(47, 5),
(48, 5),
(49, 5),
(50, 5),
(51, 5),
(52, 5),
(53, 5),
(54, 5),
(55, 5),
(56, 5),
(57, 5),
(58, 5),
(59, 5),
(60, 5),
(61, 5),
(62, 5),
(63, 5),
(64, 5),
(65, 5),
(66, 5),
(67, 5),
(68, 5),
(69, 5),
(70, 5),
(71, 5),
(72, 5),
(73, 5),
(74, 5),
(75, 5),
(76, 5),
(81, 5),
(81, 6),
(82, 5),
(82, 6),
(83, 5),
(83, 6),
(84, 5),
(84, 6),
(85, 5),
(85, 6),
(86, 5),
(86, 6),
(87, 5),
(87, 6),
(90, 5),
(90, 6),
(91, 5),
(91, 6),
(92, 5),
(92, 6),
(93, 5),
(93, 6),
(94, 5),
(94, 6),
(95, 5),
(95, 6),
(96, 5),
(96, 6),
(97, 5),
(97, 6),
(98, 5),
(104, 5),
(105, 5),
(106, 5),
(107, 5),
(108, 5),
(109, 5),
(110, 5),
(112, 5),
(113, 5),
(114, 5),
(115, 5),
(116, 5),
(117, 5),
(118, 5),
(119, 5),
(120, 5),
(121, 5),
(122, 5),
(123, 5),
(124, 5),
(125, 5),
(126, 5),
(127, 5),
(128, 5),
(129, 5),
(130, 5),
(131, 5),
(132, 5),
(133, 5),
(134, 5),
(135, 5),
(136, 5),
(137, 5),
(138, 5),
(139, 5),
(140, 5),
(141, 5),
(142, 5),
(144, 5),
(145, 5),
(145, 6),
(146, 5),
(147, 5),
(148, 5),
(149, 5),
(150, 5),
(151, 5),
(152, 5),
(153, 5),
(154, 5),
(156, 5),
(157, 5),
(158, 5),
(159, 5),
(160, 5),
(161, 5),
(162, 5),
(163, 5),
(164, 5),
(165, 5),
(166, 5),
(167, 5),
(168, 5),
(169, 5),
(169, 6),
(170, 5),
(170, 6),
(171, 5),
(171, 6),
(172, 5),
(172, 6),
(173, 5),
(173, 6),
(176, 5),
(177, 5),
(178, 5),
(179, 5),
(179, 6),
(180, 5),
(180, 6),
(181, 5),
(181, 6),
(182, 5),
(182, 6),
(183, 5),
(183, 6),
(184, 5),
(184, 6),
(185, 5),
(185, 6),
(186, 5),
(186, 6),
(187, 5),
(187, 6),
(188, 5),
(188, 6),
(189, 5),
(189, 6),
(190, 5),
(190, 6),
(191, 5),
(191, 6),
(192, 5),
(192, 6),
(193, 5),
(193, 6),
(194, 5),
(194, 6),
(195, 5),
(195, 6),
(196, 5),
(196, 6),
(197, 5),
(197, 6),
(198, 5),
(198, 6),
(199, 5),
(199, 6),
(200, 5),
(200, 6),
(201, 5),
(201, 6),
(202, 5),
(202, 6),
(203, 5),
(203, 6),
(204, 5),
(204, 6),
(205, 5),
(205, 6),
(206, 5),
(206, 6),
(207, 5),
(207, 6),
(208, 5),
(209, 5),
(210, 5),
(211, 5),
(212, 5),
(213, 5),
(214, 5),
(215, 5),
(216, 5),
(217, 5),
(218, 5),
(220, 5),
(220, 6),
(221, 5),
(221, 6),
(222, 5),
(222, 6),
(223, 5),
(224, 5),
(225, 5),
(226, 5),
(227, 5),
(228, 5),
(229, 5),
(230, 5),
(231, 5),
(232, 5),
(233, 5),
(234, 5),
(235, 5),
(236, 5),
(237, 5),
(238, 5),
(239, 5),
(240, 5),
(241, 5),
(242, 5),
(243, 5),
(244, 5),
(245, 5),
(246, 5),
(247, 5),
(248, 5),
(249, 5),
(250, 5),
(251, 5),
(252, 5),
(253, 5),
(253, 6),
(254, 5),
(255, 5),
(256, 5),
(257, 5),
(258, 5),
(259, 5),
(260, 5),
(261, 5),
(262, 5),
(263, 5),
(264, 5),
(265, 5),
(266, 5),
(267, 5),
(268, 5),
(269, 5),
(270, 5),
(271, 5),
(272, 5),
(273, 5),
(274, 5),
(275, 5),
(276, 5),
(277, 5),
(278, 5),
(279, 5),
(280, 5),
(281, 5),
(282, 5),
(283, 5),
(284, 5),
(285, 5),
(286, 5),
(287, 5),
(288, 5),
(289, 5),
(290, 5),
(291, 5),
(292, 5),
(292, 6),
(293, 5),
(293, 6),
(294, 5),
(294, 6),
(295, 5),
(295, 6),
(296, 5),
(297, 5),
(297, 6);

-- --------------------------------------------------------

--
-- Table structure for table `salary_allowances`
--

CREATE TABLE `salary_allowances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(191) NOT NULL,
  `first_date` date DEFAULT NULL,
  `allowance_title` varchar(191) NOT NULL,
  `allowance_amount` varchar(191) NOT NULL,
  `is_taxable` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_basics`
--

CREATE TABLE `salary_basics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(191) NOT NULL,
  `first_date` date DEFAULT NULL,
  `payslip_type` varchar(191) NOT NULL,
  `basic_salary` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_commissions`
--

CREATE TABLE `salary_commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(191) NOT NULL,
  `commission_title` varchar(191) NOT NULL,
  `first_date` date DEFAULT NULL,
  `commission_amount` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_deductions`
--

CREATE TABLE `salary_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL,
  `first_date` date DEFAULT NULL,
  `deduction_title` varchar(191) NOT NULL,
  `deduction_amount` varchar(191) NOT NULL,
  `deduction_type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_loans`
--

CREATE TABLE `salary_loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL,
  `first_date` date DEFAULT NULL,
  `loan_title` varchar(191) NOT NULL,
  `loan_amount` varchar(191) NOT NULL,
  `loan_type` varchar(191) NOT NULL,
  `loan_time` varchar(191) NOT NULL,
  `amount_remaining` varchar(191) NOT NULL,
  `time_remaining` varchar(191) NOT NULL,
  `monthly_payable` varchar(50) NOT NULL,
  `reason` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_other_payments`
--

CREATE TABLE `salary_other_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL DEFAULT '',
  `first_date` date DEFAULT NULL,
  `other_payment_title` varchar(191) NOT NULL,
  `other_payment_amount` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_overtimes`
--

CREATE TABLE `salary_overtimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `month_year` varchar(50) NOT NULL,
  `first_date` date DEFAULT NULL,
  `overtime_title` varchar(191) NOT NULL,
  `no_of_days` varchar(191) NOT NULL,
  `overtime_hours` varchar(191) NOT NULL,
  `overtime_rate` varchar(191) NOT NULL,
  `overtime_amount` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ticket_code` varchar(15) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `ticket_priority` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `ticket_remarks` mediumtext DEFAULT NULL,
  `ticket_status` varchar(40) NOT NULL,
  `ticket_note` varchar(191) DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `ticket_attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_name` varchar(191) NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `task_hour` varchar(40) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `task_status` varchar(40) NOT NULL DEFAULT 'not started',
  `task_note` mediumtext DEFAULT NULL,
  `task_progress` varchar(191) DEFAULT NULL,
  `is_notify` tinyint(4) DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_discussions`
--

CREATE TABLE `task_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `task_discussion` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_files`
--

CREATE TABLE `task_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_title` varchar(191) NOT NULL,
  `file_attachment` varchar(191) NOT NULL,
  `file_description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_types`
--

CREATE TABLE `tax_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminations`
--

CREATE TABLE `terminations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `terminated_employee` bigint(20) UNSIGNED NOT NULL,
  `termination_type` bigint(20) UNSIGNED DEFAULT NULL,
  `termination_date` date NOT NULL,
  `notice_date` date NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `termination_types`
--

CREATE TABLE `termination_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `termination_title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ticket_comments` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `expertise` mediumtext NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_lists`
--

CREATE TABLE `training_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `training_cost` varchar(191) NOT NULL,
  `status` varchar(30) NOT NULL,
  `remarks` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `trainer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `training_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_types`
--

CREATE TABLE `training_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transfer_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) DEFAULT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travels`
--

CREATE TABLE `travels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `travel_type` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `purpose_of_visit` varchar(191) DEFAULT NULL,
  `place_of_visit` varchar(191) DEFAULT NULL,
  `expected_budget` varchar(20) DEFAULT NULL,
  `actual_budget` varchar(20) DEFAULT NULL,
  `travel_mode` varchar(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travel_types`
--

CREATE TABLE `travel_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `arrangement_type` varchar(191) NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `profile_photo` varchar(191) DEFAULT NULL,
  `profile_bg` varchar(191) DEFAULT NULL,
  `role_users_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `contact_no` varchar(15) NOT NULL,
  `last_login_ip` varchar(32) DEFAULT NULL,
  `last_login_date` timestamp(2) NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `email_verified_at`, `password`, `profile_photo`, `profile_bg`, `role_users_id`, `is_active`, `contact_no`, `last_login_ip`, `last_login_date`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Irfan', 'Chowdhury', 'admin', 'irfanchowdhury80@gmail.com', '0000-00-00 00:00:00', '$2y$10$WcnC16AXG/mNrVBWQGjfoegFO.1wjiIiBv5LxEHR6uQaJYVciYCOa', 'admin_1639557363.jpg', '', 1, 1, '1234', '::1', '2023-07-26 15:17:08.00', 'l2dFU5ugiSRaEVEvLxqSsbkU1xki89XMwKoB6kvG5jl21nRrWOhYHAiDE2T8', '0000-00-00 00:00:00', '2022-06-05 09:00:06', '0000-00-00 00:00:00'),
(9, 'Sahiba', 'Khatun', 'staff', 'irfanchowdhury80@gmail.com', '0000-00-00 00:00:00', '$2y$10$49e7SL6g37nIubrws03uJOTMRJHdL.7HIG/UhjJoHSQcRLSfwFt3e', 'staff_1616582111.jpg', '', 2, 1, '387292822', '127.0.0.1', '2023-02-22 07:38:48.00', '', '2020-07-26 20:51:54', '2023-04-15 09:10:18', '0000-00-00 00:00:00'),
(10, 'John', 'Cena', 'cena11', 'johncena@hotmail.com', '0000-00-00 00:00:00', '$2y$10$8dFCpYwVXgTo2/RFP4z3ZOV9HWygsx/wxLkqVKMgDaYVPXT2RPnSe', '', '', 6, 0, '456372794', '::1', '2021-09-05 04:14:05.00', '', '2020-07-26 21:01:39', '2021-09-20 11:46:35', '0000-00-00 00:00:00'),
(11, 'Neo', 'Dezhi', 'neo22', 'irfanchowdhury434@gmail.com', '0000-00-00 00:00:00', '$2y$10$fyGur3PCDC5Mi3IeBs3vEe9xDXkGX.jZc..v29W72PSJ.Vk7C4ltC', 'neo22_1684299998.jpeg', '', 4, 1, '67278232', '127.0.0.1', '2023-05-17 06:07:44.00', '', '2020-07-26 21:03:25', '2023-05-17 06:06:38', '0000-00-00 00:00:00'),
(12, 'Bob', 'Hobart', 'bob05', 'bob@ymail.com', '0000-00-00 00:00:00', '$2y$10$6RcsgFVg1PLJOY8n3VbFAe7oqV/d7.0nqkLdljT0YRnLTlw5/QI9u', '', '', 2, 1, '4678292', '127.0.0.1', '2021-11-15 05:12:50.00', '', '2020-07-27 05:26:35', '2021-09-05 04:17:40', '0000-00-00 00:00:00'),
(13, 'Alice', 'Patrica', 'alicehh4', 'alicehh4@newmail.com', '0000-00-00 00:00:00', '$2y$10$etAwdCPWrPMv09LylKoLke5YxWZ4aIS9CgDW9Z8ZmL0Jr.TNcCFF.', '', '', 2, 1, '8765445698', '::1', '2021-06-24 17:07:06.00', '', '2020-07-27 05:28:16', '2021-06-24 17:06:50', '0000-00-00 00:00:00'),
(14, 'Mayank', 'Agarwal', 'mayank06', 'mayank@gmail.com', '0000-00-00 00:00:00', '$2y$10$U2jCXdu6YztlaHf/./nbf.mPHDy7gYfK5bhAT8wfu4I7to3SKwX.e', '', '', 2, 1, '746389982', '', '0000-00-00 00:00:00.00', '', '2020-07-27 05:31:24', '2021-04-15 10:19:08', '0000-00-00 00:00:00'),
(15, 'Mansoor', 'Ahmed', 'mansoor', 'mansoor@yahoo.com', '0000-00-00 00:00:00', '$2y$10$MyFyjN2K1QFL89eKuZQHF.xZ17vl0YviZ1q9d4eIORmMmS0gQs2IK', '', '', 2, 1, '67638299', '', '0000-00-00 00:00:00.00', '', '2020-07-27 05:33:54', '2021-04-15 10:20:00', '0000-00-00 00:00:00'),
(16, 'Shadat', 'Ashraf', 'client', 'shahadatashraf10@gmail.com', '0000-00-00 00:00:00', '$2y$10$Cf7ZWz1sJJhWu1C30vOJDO7Y9BQ5f.8Wi2NYV9ITs9f0q9zLY3EbW', 'client_1623747532.png', '', 3, 1, '67651', '127.0.0.1', '2023-02-19 07:07:30.00', '', '2020-07-28 15:41:31', '2022-10-02 10:21:02', '0000-00-00 00:00:00'),
(27, 'Junayet', 'Istius', 'junayet95', 'junayet@gmail.com', '0000-00-00 00:00:00', '$2y$10$Enzuol2OzlDVbP6qa9SMTuXFkQynA0lA0oBrtD0RaBnvwGoBPfZvG', '', '', 2, 1, '01829496534', '::1', '2021-10-04 05:07:23.00', '', '2021-03-12 11:47:47', '2021-10-04 01:59:52', '0000-00-00 00:00:00'),
(34, 'Amzad', 'Hossain', 'amzad95', 'amzad@gmail.com', '0000-00-00 00:00:00', '$2y$10$XwP9HJYYQCYqKZGgvGOH/.d6UjwnGE./LNxJmE8Iw9iynnhvwv67W', '', '', 2, 1, '01521225124', '127.0.0.1', '2021-03-28 07:28:36.00', '', '2021-03-28 06:53:57', '2021-03-28 18:29:20', '0000-00-00 00:00:00'),
(38, 'Anisul', 'Islam', 'anis95', 'anis95@gmail.com', '0000-00-00 00:00:00', '$2y$10$L0rV6308zcY.h5hccqw1he3yhTCzXm9oxRtmKVpygk2XM3t1D0tHK', '', '', 2, 1, '01521222842', '::1', '2023-01-02 07:44:31.00', '', '2021-03-28 18:35:27', '2021-03-28 18:35:27', '0000-00-00 00:00:00'),
(39, 'Kaden', 'Porter', 'kaden95', 'kaden@mailinator.com', '0000-00-00 00:00:00', '$2y$10$v0ppHd14bDVJKi1.Lgm5qes2H9XkkQEl5Lmdw/lRk.zNtKzYTZ4we', 'kaden95_1623747054.jpg', '', 3, 1, '441234874', '127.0.0.1', '2021-03-30 02:45:13.00', '', '2021-03-30 02:42:31', '2021-06-15 06:50:54', '0000-00-00 00:00:00'),
(45, 'Promi', 'Chy', 'promi98', 'promi98@gmail.com', '0000-00-00 00:00:00', '$2y$10$x.6xRw4Tv7u6wezVJSWcPuUx7elTP1SSY1DbiBgsQ5DQxotMgO11K', '', '', 4, 1, '423213234', '', '0000-00-00 00:00:00.00', '', '2021-06-29 18:16:33', '2021-06-30 01:27:38', '0000-00-00 00:00:00'),
(49, 'Sahiba', 'Chowdhury', 'sahiba95', 'sahiba95@gmail.com', '0000-00-00 00:00:00', '$2y$10$q24PhrX6QJjYxlf/vij7cuwMR7g3LKncZUFabDmGCQ00iwmU4DWA2', '', '', 2, 1, '01829640631', '', '0000-00-00 00:00:00.00', '', '2022-02-26 06:00:02', '2022-02-26 06:01:28', '0000-00-00 00:00:00'),
(51, 'Lacey', 'Wood', 'gosofunab', 'myjof@mailinator.com', '0000-00-00 00:00:00', '$2y$10$eoqfN2lGpBHXWtj.WztEM.FLLTH0ofOoAWXERZSHC9mwEaf1NXVc6', 'gosofunab_1648442766.jpg', '', 1, 1, '1211334234', '', '0000-00-00 00:00:00.00', '', '2022-03-28 05:46:07', '2022-05-24 08:08:37', '0000-00-00 00:00:00'),
(52, 'Alyssa', 'Schwartz', 'test123', 'dacuzej@mailinator.com', '0000-00-00 00:00:00', '$2y$10$RfHfGxADH7F5wxIO5bLBBuP5YVSDOMDhC7RboEbo9.3VIDzqTTes2', '', '', 3, 1, '43222232123', '', '0000-00-00 00:00:00.00', '', '2022-12-18 08:10:18', '2022-12-18 08:10:18', '0000-00-00 00:00:00'),
(53, 'Ingrid', 'Craft', 'test987', 'foziwafub@mailinator.com', '0000-00-00 00:00:00', '$2y$10$gZP0hd4GW/ip.N120sgxDuTyID6DqbXXhYKwH3N81jj/os3tmOCjS', '', '', 3, 1, '26', '', '0000-00-00 00:00:00.00', '', '2022-12-18 08:45:03', '2022-12-18 08:45:03', '0000-00-00 00:00:00'),
(54, 'Test', 'Chowdhury', 'irfan90', 'irfanchowdhury123@gmail.com', '0000-00-00 00:00:00', '$2y$10$nw5zvB5JSSFv9D3P4TrEieqvXsJFKQ3lDva485V15CKI3xLZVYYHu', '', '', 2, 1, '+8801829498634', '', '0000-00-00 00:00:00.00', '', '2023-01-23 08:39:56', '2023-02-14 08:27:03', '0000-00-00 00:00:00'),
(57, 'Charissa', 'David', 'nocelud', 'shamim804@gmail.com', '0000-00-00 00:00:00', '$2y$10$/Jl6PFLhk3m0RVWjtCcoK.c4VQX7yxKZNKkVe7GWLLqGovSmH73dC', '', '', 2, 1, '43454', '', '0000-00-00 00:00:00.00', '', '2023-04-19 23:25:46', '2023-04-19 23:25:46', '0000-00-00 00:00:00'),
(59, 'test', 'User 987', 'testuser987', 'test987@gmail.com', '0000-00-00 00:00:00', '$2y$10$DKRW/NnmpmGvPoUBVktKueNF7Pd1MIC0c1a6P/aIpDlhWG92UGGtm', '', '', 2, 1, '4536267', '', '0000-00-00 00:00:00.00', '', '2023-05-16 10:33:31', '2023-05-16 10:35:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `warnings`
--

CREATE TABLE `warnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `warning_to` bigint(20) UNSIGNED NOT NULL,
  `warning_type` bigint(20) UNSIGNED DEFAULT NULL,
  `warning_date` date NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warnings_type`
--

CREATE TABLE `warnings_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warning_title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_company_id_foreign` (`company_id`),
  ADD KEY `announcements_department_id_foreign` (`department_id`);

--
-- Indexes for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appraisals_company_id_foreign` (`company_id`),
  ADD KEY `appraisals_employee_id_foreign` (`employee_id`),
  ADD KEY `appraisals_department_id_foreign` (`department_id`),
  ADD KEY `appraisals_designation_id_foreign` (`designation_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_company_id_foreign` (`company_id`),
  ADD KEY `assets_employee_id_foreign` (`employee_id`),
  ADD KEY `assets_assets_category_id_foreign` (`assets_category_id`);

--
-- Indexes for table `asset_categories`
--
ALTER TABLE `asset_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_company_id_foreign` (`company_id`),
  ADD KEY `awards_department_id_foreign` (`department_id`),
  ADD KEY `awards_employee_id_foreign` (`employee_id`),
  ADD KEY `awards_award_type_id_foreign` (`award_type_id`);

--
-- Indexes for table `award_types`
--
ALTER TABLE `award_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendarables`
--
ALTER TABLE `calendarables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_interview`
--
ALTER TABLE `candidate_interview`
  ADD PRIMARY KEY (`interview_id`,`candidate_id`),
  ADD KEY `candidate_interview_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_location_id_foreign` (`location_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaints_company_id_foreign` (`company_id`),
  ADD KEY `complaints_complaint_from_foreign` (`complaint_from`),
  ADD KEY `complaints_complaint_against_foreign` (`complaint_against`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `c_m_s`
--
ALTER TABLE `c_m_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departments_company_id_foreign` (`company_id`),
  ADD KEY `departments_department_head_foreign` (`department_head`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_company_id_foreign` (`company_id`),
  ADD KEY `designations_department_id_foreign` (`department_id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_office_shift_id_foreign` (`office_shift_id`),
  ADD KEY `employees_company_id_foreign` (`company_id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_designation_id_foreign` (`designation_id`),
  ADD KEY `employees_location_id_foreign` (`location_id`),
  ADD KEY `employees_role_users_id_foreign` (`role_users_id`),
  ADD KEY `employees_status_id_foreign` (`status_id`);

--
-- Indexes for table `employee_bank_accounts`
--
ALTER TABLE `employee_bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_bank_accounts_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_contacts_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_documents_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_documents_document_type_id_foreign` (`document_type_id`);

--
-- Indexes for table `employee_immigrations`
--
ALTER TABLE `employee_immigrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_immigrations_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_immigrations_document_type_id_foreign` (`document_type_id`);

--
-- Indexes for table `employee_interview`
--
ALTER TABLE `employee_interview`
  ADD PRIMARY KEY (`interview_id`,`employee_id`),
  ADD KEY `employee_interview_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_leave_type_details`
--
ALTER TABLE `employee_leave_type_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_leave_type_details_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_meeting`
--
ALTER TABLE `employee_meeting`
  ADD PRIMARY KEY (`employee_id`,`meeting_id`),
  ADD KEY `employee_meeting_meeting_id_foreign` (`meeting_id`);

--
-- Indexes for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD PRIMARY KEY (`employee_id`,`project_id`),
  ADD KEY `employee_project_project_id_foreign` (`project_id`);

--
-- Indexes for table `employee_qualificaitons`
--
ALTER TABLE `employee_qualificaitons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_qualificaitons_employee_id_foreign` (`employee_id`),
  ADD KEY `employee_qualificaitons_education_level_id_foreign` (`education_level_id`),
  ADD KEY `employee_qualificaitons_language_skill_id_foreign` (`language_skill_id`),
  ADD KEY `employee_qualificaitons_general_skill_id_foreign` (`general_skill_id`);

--
-- Indexes for table `employee_support_ticket`
--
ALTER TABLE `employee_support_ticket`
  ADD PRIMARY KEY (`employee_id`,`support_ticket_id`),
  ADD KEY `employee_support_ticket_support_ticket_id_foreign` (`support_ticket_id`);

--
-- Indexes for table `employee_task`
--
ALTER TABLE `employee_task`
  ADD PRIMARY KEY (`employee_id`,`task_id`),
  ADD KEY `employee_task_task_id_foreign` (`task_id`);

--
-- Indexes for table `employee_training_list`
--
ALTER TABLE `employee_training_list`
  ADD PRIMARY KEY (`employee_id`,`training_list_id`),
  ADD KEY `employee_training_list_training_list_id_foreign` (`training_list_id`);

--
-- Indexes for table `employee_work_experience`
--
ALTER TABLE `employee_work_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_work_experience_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_company_id_foreign` (`company_id`),
  ADD KEY `events_department_id_foreign` (`department_id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_managers`
--
ALTER TABLE `file_managers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_managers_department_id_foreign` (`department_id`),
  ADD KEY `file_managers_added_by_foreign` (`added_by`);

--
-- Indexes for table `file_manager_settings`
--
ALTER TABLE `file_manager_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_bank_cashes`
--
ALTER TABLE `finance_bank_cashes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_deposits`
--
ALTER TABLE `finance_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_deposits_company_id_foreign` (`company_id`),
  ADD KEY `finance_deposits_account_id_foreign` (`account_id`),
  ADD KEY `finance_deposits_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `finance_deposits_payer_id_foreign` (`payer_id`);

--
-- Indexes for table `finance_expenses`
--
ALTER TABLE `finance_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_expenses_company_id_foreign` (`company_id`),
  ADD KEY `finance_expenses_account_id_foreign` (`account_id`),
  ADD KEY `finance_expenses_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `finance_expenses_payee_id_foreign` (`payee_id`),
  ADD KEY `finance_expenses_category_id_foreign` (`category_id`);

--
-- Indexes for table `finance_payees`
--
ALTER TABLE `finance_payees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_payers`
--
ALTER TABLE `finance_payers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_transactions`
--
ALTER TABLE `finance_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_transactions_company_id_foreign` (`company_id`),
  ADD KEY `finance_transactions_account_id_foreign` (`account_id`),
  ADD KEY `finance_transactions_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `finance_transactions_payee_id_foreign` (`payee_id`),
  ADD KEY `finance_transactions_payer_id_foreign` (`payer_id`),
  ADD KEY `finance_transactions_category_id_foreign` (`category_id`);

--
-- Indexes for table `finance_transfers`
--
ALTER TABLE `finance_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_transfers_company_id_foreign` (`company_id`),
  ADD KEY `finance_transfers_from_account_id_foreign` (`from_account_id`),
  ADD KEY `finance_transfers_to_account_id_foreign` (`to_account_id`),
  ADD KEY `finance_transfers_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goal_trackings_company_id_foreign` (`company_id`),
  ADD KEY `goal_trackings_goal_type_id_foreign` (`goal_type_id`);

--
-- Indexes for table `goal_types`
--
ALTER TABLE `goal_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_company_id_foreign` (`company_id`),
  ADD KEY `holidays_department_id_foreign` (`department_id`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicators_company_id_foreign` (`company_id`),
  ADD KEY `indicators_department_id_foreign` (`department_id`),
  ADD KEY `indicators_designation_id_foreign` (`designation_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_project_id_foreign` (`project_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_project_id_foreign` (`project_id`);

--
-- Indexes for table `ip_settings`
--
ALTER TABLE `ip_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_candidates`
--
ALTER TABLE `job_candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_candidates_job_id_foreign` (`job_id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_interviews`
--
ALTER TABLE `job_interviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_interviews_job_id_foreign` (`job_id`),
  ADD KEY `job_interviews_added_by_foreign` (`added_by`);

--
-- Indexes for table `job_posts`
--
ALTER TABLE `job_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_posts_job_category_id_foreign` (`job_category_id`),
  ADD KEY `job_posts_company_id_foreign` (`company_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_company_id_foreign` (`company_id`),
  ADD KEY `leaves_employee_id_foreign` (`employee_id`),
  ADD KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leaves_department_id_foreign` (`department_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_location_head_foreign` (`location_head`),
  ADD KEY `locations_country_foreign` (`country`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meetings_company_id_foreign` (`company_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `office_shifts`
--
ALTER TABLE `office_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `office_shifts_company_id_foreign` (`company_id`);

--
-- Indexes for table `official_documents`
--
ALTER TABLE `official_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `official_documents_company_id_foreign` (`company_id`),
  ADD KEY `official_documents_document_type_id_foreign` (`document_type_id`),
  ADD KEY `official_documents_added_by_foreign` (`added_by`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_company_id_foreign` (`company_id`);

--
-- Indexes for table `payslips`
--
ALTER TABLE `payslips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payslips_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `policies_company_id_foreign` (`company_id`),
  ADD KEY `policies_added_by_foreign` (`added_by`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_company_id_foreign` (`company_id`),
  ADD KEY `projects_added_by_foreign` (`added_by`);

--
-- Indexes for table `project_bugs`
--
ALTER TABLE `project_bugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_bugs_user_id_foreign` (`user_id`),
  ADD KEY `project_bugs_project_id_foreign` (`project_id`);

--
-- Indexes for table `project_discussions`
--
ALTER TABLE `project_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_discussions_user_id_foreign` (`user_id`),
  ADD KEY `project_discussions_project_id_foreign` (`project_id`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_files_user_id_foreign` (`user_id`),
  ADD KEY `project_files_project_id_foreign` (`project_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotions_company_id_foreign` (`company_id`),
  ADD KEY `promotions_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `qualification_education_levels`
--
ALTER TABLE `qualification_education_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qualification_education_levels_company_id_foreign` (`company_id`);

--
-- Indexes for table `qualification_languages`
--
ALTER TABLE `qualification_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qualification_languages_company_id_foreign` (`company_id`);

--
-- Indexes for table `qualification_skills`
--
ALTER TABLE `qualification_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qualification_skills_company_id_foreign` (`company_id`);

--
-- Indexes for table `resignations`
--
ALTER TABLE `resignations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resignations_company_id_foreign` (`company_id`),
  ADD KEY `resignations_department_id_foreign` (`department_id`),
  ADD KEY `resignations_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `salary_allowances`
--
ALTER TABLE `salary_allowances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_allowances_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_basics`
--
ALTER TABLE `salary_basics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_basics_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_commissions`
--
ALTER TABLE `salary_commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_commissions_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_deductions`
--
ALTER TABLE `salary_deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_deductions_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_loans`
--
ALTER TABLE `salary_loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_loans_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_other_payments`
--
ALTER TABLE `salary_other_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_other_payments_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `salary_overtimes`
--
ALTER TABLE `salary_overtimes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_overtimes_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `support_tickets_ticket_code_unique` (`ticket_code`),
  ADD KEY `support_tickets_company_id_foreign` (`company_id`),
  ADD KEY `support_tickets_department_id_foreign` (`department_id`),
  ADD KEY `support_tickets_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_company_id_foreign` (`company_id`),
  ADD KEY `tasks_added_by_foreign` (`added_by`);

--
-- Indexes for table `task_discussions`
--
ALTER TABLE `task_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_discussions_user_id_foreign` (`user_id`),
  ADD KEY `task_discussions_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_files`
--
ALTER TABLE `task_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_files_user_id_foreign` (`user_id`),
  ADD KEY `task_files_task_id_foreign` (`task_id`);

--
-- Indexes for table `tax_types`
--
ALTER TABLE `tax_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terminations`
--
ALTER TABLE `terminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `terminations_company_id_foreign` (`company_id`),
  ADD KEY `terminations_terminated_employee_foreign` (`terminated_employee`),
  ADD KEY `terminations_termination_type_foreign` (`termination_type`);

--
-- Indexes for table `termination_types`
--
ALTER TABLE `termination_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trainers_company_id_foreign` (`company_id`);

--
-- Indexes for table `training_lists`
--
ALTER TABLE `training_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_lists_company_id_foreign` (`company_id`),
  ADD KEY `training_lists_trainer_id_foreign` (`trainer_id`),
  ADD KEY `training_lists_training_type_id_foreign` (`training_type_id`);

--
-- Indexes for table `training_types`
--
ALTER TABLE `training_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_company_id_foreign` (`company_id`),
  ADD KEY `transfers_from_department_id_foreign` (`from_department_id`),
  ADD KEY `transfers_to_department_id_foreign` (`to_department_id`),
  ADD KEY `transfers_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travels_company_id_foreign` (`company_id`),
  ADD KEY `travels_employee_id_foreign` (`employee_id`),
  ADD KEY `travels_travel_type_foreign` (`travel_type`);

--
-- Indexes for table `travel_types`
--
ALTER TABLE `travel_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `travel_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_users_id_foreign` (`role_users_id`);

--
-- Indexes for table `warnings`
--
ALTER TABLE `warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warnings_company_id_foreign` (`company_id`),
  ADD KEY `warnings_warning_to_foreign` (`warning_to`),
  ADD KEY `warnings_warning_type_foreign` (`warning_type`);

--
-- Indexes for table `warnings_type`
--
ALTER TABLE `warnings_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appraisals`
--
ALTER TABLE `appraisals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_categories`
--
ALTER TABLE `asset_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award_types`
--
ALTER TABLE `award_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendarables`
--
ALTER TABLE `calendarables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `c_m_s`
--
ALTER TABLE `c_m_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_bank_accounts`
--
ALTER TABLE `employee_bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_immigrations`
--
ALTER TABLE `employee_immigrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_leave_type_details`
--
ALTER TABLE `employee_leave_type_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_qualificaitons`
--
ALTER TABLE `employee_qualificaitons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_work_experience`
--
ALTER TABLE `employee_work_experience`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_managers`
--
ALTER TABLE `file_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_manager_settings`
--
ALTER TABLE `file_manager_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_bank_cashes`
--
ALTER TABLE `finance_bank_cashes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_deposits`
--
ALTER TABLE `finance_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_expenses`
--
ALTER TABLE `finance_expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_payees`
--
ALTER TABLE `finance_payees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_payers`
--
ALTER TABLE `finance_payers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_transactions`
--
ALTER TABLE `finance_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_transfers`
--
ALTER TABLE `finance_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goal_types`
--
ALTER TABLE `goal_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_settings`
--
ALTER TABLE `ip_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_candidates`
--
ALTER TABLE `job_candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_interviews`
--
ALTER TABLE `job_interviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_posts`
--
ALTER TABLE `job_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `office_shifts`
--
ALTER TABLE `office_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `official_documents`
--
ALTER TABLE `official_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslips`
--
ALTER TABLE `payslips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_bugs`
--
ALTER TABLE `project_bugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_discussions`
--
ALTER TABLE `project_discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification_education_levels`
--
ALTER TABLE `qualification_education_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification_languages`
--
ALTER TABLE `qualification_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualification_skills`
--
ALTER TABLE `qualification_skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resignations`
--
ALTER TABLE `resignations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `salary_allowances`
--
ALTER TABLE `salary_allowances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_basics`
--
ALTER TABLE `salary_basics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_commissions`
--
ALTER TABLE `salary_commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_deductions`
--
ALTER TABLE `salary_deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_loans`
--
ALTER TABLE `salary_loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_other_payments`
--
ALTER TABLE `salary_other_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_overtimes`
--
ALTER TABLE `salary_overtimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_discussions`
--
ALTER TABLE `task_discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_files`
--
ALTER TABLE `task_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_types`
--
ALTER TABLE `tax_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terminations`
--
ALTER TABLE `terminations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `termination_types`
--
ALTER TABLE `termination_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_lists`
--
ALTER TABLE `training_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_types`
--
ALTER TABLE `training_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travels`
--
ALTER TABLE `travels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travel_types`
--
ALTER TABLE `travel_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `warnings`
--
ALTER TABLE `warnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warnings_type`
--
ALTER TABLE `warnings_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcements_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `appraisals`
--
ALTER TABLE `appraisals`
  ADD CONSTRAINT `appraisals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appraisals_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appraisals_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appraisals_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_assets_category_id_foreign` FOREIGN KEY (`assets_category_id`) REFERENCES `asset_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `asset_categories`
--
ALTER TABLE `asset_categories`
  ADD CONSTRAINT `asset_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_award_type_id_foreign` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `awards_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `awards_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_interview`
--
ALTER TABLE `candidate_interview`
  ADD CONSTRAINT `candidate_interview_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `job_candidates` (`id`),
  ADD CONSTRAINT `candidate_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complaints_complaint_against_foreign` FOREIGN KEY (`complaint_against`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complaints_complaint_from_foreign` FOREIGN KEY (`complaint_from`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `departments_department_head_foreign` FOREIGN KEY (`department_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `designations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employees_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_office_shift_id_foreign` FOREIGN KEY (`office_shift_id`) REFERENCES `office_shifts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employees_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `employee_bank_accounts`
--
ALTER TABLE `employee_bank_accounts`
  ADD CONSTRAINT `employee_bank_accounts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_contacts`
--
ALTER TABLE `employee_contacts`
  ADD CONSTRAINT `employee_contacts_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `employee_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_immigrations`
--
ALTER TABLE `employee_immigrations`
  ADD CONSTRAINT `employee_immigrations_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_immigrations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_interview`
--
ALTER TABLE `employee_interview`
  ADD CONSTRAINT `employee_interview_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employee_interview_interview_id_foreign` FOREIGN KEY (`interview_id`) REFERENCES `job_interviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_leave_type_details`
--
ALTER TABLE `employee_leave_type_details`
  ADD CONSTRAINT `employee_leave_type_details_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_meeting`
--
ALTER TABLE `employee_meeting`
  ADD CONSTRAINT `employee_meeting_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_meeting_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD CONSTRAINT `employee_project_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_project_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_qualificaitons`
--
ALTER TABLE `employee_qualificaitons`
  ADD CONSTRAINT `employee_qualificaitons_education_level_id_foreign` FOREIGN KEY (`education_level_id`) REFERENCES `qualification_education_levels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_qualificaitons_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_qualificaitons_general_skill_id_foreign` FOREIGN KEY (`general_skill_id`) REFERENCES `qualification_skills` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `employee_qualificaitons_language_skill_id_foreign` FOREIGN KEY (`language_skill_id`) REFERENCES `qualification_languages` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `employee_support_ticket`
--
ALTER TABLE `employee_support_ticket`
  ADD CONSTRAINT `employee_support_ticket_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_support_ticket_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_task`
--
ALTER TABLE `employee_task`
  ADD CONSTRAINT `employee_task_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_task_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_training_list`
--
ALTER TABLE `employee_training_list`
  ADD CONSTRAINT `employee_training_list_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_training_list_training_list_id_foreign` FOREIGN KEY (`training_list_id`) REFERENCES `training_lists` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_work_experience`
--
ALTER TABLE `employee_work_experience`
  ADD CONSTRAINT `employee_work_experience_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD CONSTRAINT `expense_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `file_managers`
--
ALTER TABLE `file_managers`
  ADD CONSTRAINT `file_managers_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `file_managers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_deposits`
--
ALTER TABLE `finance_deposits`
  ADD CONSTRAINT `finance_deposits_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_deposits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_deposits_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_expenses`
--
ALTER TABLE `finance_expenses`
  ADD CONSTRAINT `finance_expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_expenses_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_transactions`
--
ALTER TABLE `finance_transactions`
  ADD CONSTRAINT `finance_transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_payee_id_foreign` FOREIGN KEY (`payee_id`) REFERENCES `finance_payees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_payer_id_foreign` FOREIGN KEY (`payer_id`) REFERENCES `finance_payers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transactions_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_transfers`
--
ALTER TABLE `finance_transfers`
  ADD CONSTRAINT `finance_transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transfers_from_account_id_foreign` FOREIGN KEY (`from_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transfers_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `finance_transfers_to_account_id_foreign` FOREIGN KEY (`to_account_id`) REFERENCES `finance_bank_cashes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `goal_trackings`
--
ALTER TABLE `goal_trackings`
  ADD CONSTRAINT `goal_trackings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `goal_trackings_goal_type_id_foreign` FOREIGN KEY (`goal_type_id`) REFERENCES `goal_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `holidays_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indicators`
--
ALTER TABLE `indicators`
  ADD CONSTRAINT `indicators_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicators_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicators_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_candidates`
--
ALTER TABLE `job_candidates`
  ADD CONSTRAINT `job_candidates_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`);

--
-- Constraints for table `job_interviews`
--
ALTER TABLE `job_interviews`
  ADD CONSTRAINT `job_interviews_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `job_interviews_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `job_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_posts`
--
ALTER TABLE `job_posts`
  ADD CONSTRAINT `job_posts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_posts_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_country_foreign` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `locations_location_head_foreign` FOREIGN KEY (`location_head`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `office_shifts`
--
ALTER TABLE `office_shifts`
  ADD CONSTRAINT `office_shifts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `official_documents`
--
ALTER TABLE `official_documents`
  ADD CONSTRAINT `official_documents_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `official_documents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `official_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payslips`
--
ALTER TABLE `payslips`
  ADD CONSTRAINT `payslips_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `policies`
--
ALTER TABLE `policies`
  ADD CONSTRAINT `policies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_bugs`
--
ALTER TABLE `project_bugs`
  ADD CONSTRAINT `project_bugs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_bugs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `project_discussions`
--
ALTER TABLE `project_discussions`
  ADD CONSTRAINT `project_discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `project_files`
--
ALTER TABLE `project_files`
  ADD CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qualification_education_levels`
--
ALTER TABLE `qualification_education_levels`
  ADD CONSTRAINT `qualification_education_levels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qualification_languages`
--
ALTER TABLE `qualification_languages`
  ADD CONSTRAINT `qualification_languages_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `qualification_skills`
--
ALTER TABLE `qualification_skills`
  ADD CONSTRAINT `qualification_skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `resignations`
--
ALTER TABLE `resignations`
  ADD CONSTRAINT `resignations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resignations_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resignations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_allowances`
--
ALTER TABLE `salary_allowances`
  ADD CONSTRAINT `salary_allowances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_basics`
--
ALTER TABLE `salary_basics`
  ADD CONSTRAINT `salary_basics_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_commissions`
--
ALTER TABLE `salary_commissions`
  ADD CONSTRAINT `salary_commissions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_deductions`
--
ALTER TABLE `salary_deductions`
  ADD CONSTRAINT `salary_deductions_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_loans`
--
ALTER TABLE `salary_loans`
  ADD CONSTRAINT `salary_loans_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_other_payments`
--
ALTER TABLE `salary_other_payments`
  ADD CONSTRAINT `salary_other_payments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `salary_overtimes`
--
ALTER TABLE `salary_overtimes`
  ADD CONSTRAINT `salary_overtimes_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_tickets_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `task_discussions`
--
ALTER TABLE `task_discussions`
  ADD CONSTRAINT `task_discussions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `task_files`
--
ALTER TABLE `task_files`
  ADD CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `terminations`
--
ALTER TABLE `terminations`
  ADD CONSTRAINT `terminations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `terminations_terminated_employee_foreign` FOREIGN KEY (`terminated_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `terminations_termination_type_foreign` FOREIGN KEY (`termination_type`) REFERENCES `termination_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `trainers`
--
ALTER TABLE `trainers`
  ADD CONSTRAINT `trainers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `training_lists`
--
ALTER TABLE `training_lists`
  ADD CONSTRAINT `training_lists_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `training_lists_trainer_id_foreign` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `training_lists_training_type_id_foreign` FOREIGN KEY (`training_type_id`) REFERENCES `training_types` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `training_types`
--
ALTER TABLE `training_types`
  ADD CONSTRAINT `training_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_from_department_id_foreign` FOREIGN KEY (`from_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_to_department_id_foreign` FOREIGN KEY (`to_department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `travels`
--
ALTER TABLE `travels`
  ADD CONSTRAINT `travels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `travels_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `travels_travel_type_foreign` FOREIGN KEY (`travel_type`) REFERENCES `travel_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `travel_types`
--
ALTER TABLE `travel_types`
  ADD CONSTRAINT `travel_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_users_id_foreign` FOREIGN KEY (`role_users_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `warnings`
--
ALTER TABLE `warnings`
  ADD CONSTRAINT `warnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warnings_warning_to_foreign` FOREIGN KEY (`warning_to`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warnings_warning_type_foreign` FOREIGN KEY (`warning_type`) REFERENCES `warnings_type` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
