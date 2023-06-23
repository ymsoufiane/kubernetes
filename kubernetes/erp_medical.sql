-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 06 juin 2023 à 15:34
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `erp_medical`
--

-- --------------------------------------------------------

--
-- Structure de la table `account_types`
--

CREATE TABLE `account_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `account_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `account_types`
--

INSERT INTO `account_types` (`id`, `created_at`, `updated_at`, `deleted_at`, `account_type`) VALUES
(1, NULL, NULL, NULL, 'Doctor'),
(2, NULL, NULL, NULL, 'Admin'),
(3, NULL, NULL, NULL, 'Receptionist');

-- --------------------------------------------------------

--
-- Structure de la table `allergies`
--

CREATE TABLE `allergies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `allergy_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `allergies`
--

INSERT INTO `allergies` (`id`, `created_at`, `updated_at`, `deleted_at`, `allergy_name`, `description`) VALUES
(1, '2023-05-23 15:00:45.898', '2023-05-23 15:00:45.898', NULL, 'Latex', 'Contact dermatitis, hypersensitivity'),
(2, '2023-05-23 15:01:13.955', '2023-05-23 15:01:13.955', NULL, 'Buckwheat', 'Allergenicity is highest in Japan and Korea'),
(3, '2023-05-23 15:01:31.961', '2023-05-23 15:01:31.961', NULL, 'Egg', '	Anaphylaxis, swelling, sometimes'),
(4, '2023-05-23 15:01:47.309', '2023-05-23 15:01:47.309', NULL, 'Fish', 'Respiratory reactions, Anaphylaxis, oral allergy syndrome, sometimes vomiting');

-- --------------------------------------------------------

--
-- Structure de la table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `start_hour` longtext NOT NULL,
  `end_hour` longtext DEFAULT NULL,
  `etat` enum('pending','confirmed','canceled','absent') NOT NULL DEFAULT 'pending',
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` bigint(20) UNSIGNED DEFAULT NULL,
  `room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prestation_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `appointments`
--

INSERT INTO `appointments` (`id`, `created_at`, `updated_at`, `deleted_at`, `start_hour`, `end_hour`, `etat`, `date`, `description`, `doctor_id`, `patient_id`, `room_id`, `prestation_id`) VALUES
(1, '2023-05-29 18:26:00.450', '2023-05-29 18:27:39.455', NULL, '08:00', '08:10', 'confirmed', '2023-05-30', '', 4, 1, 7, 3),
(2, '2023-05-29 18:26:40.949', '2023-05-29 18:27:42.557', NULL, '08:20', '08:30', 'canceled', '2023-05-30', '', 4, 2, 1, 1),
(3, '2023-05-29 18:27:29.161', '2023-05-29 18:27:29.161', NULL, '08:15', '08:20', 'pending', '2023-05-30', '', 4, 3, 8, 3),
(4, '2023-05-29 18:28:35.802', '2023-05-29 18:28:35.802', NULL, '08:35', '08:40', 'pending', '2023-05-30', '', 4, 2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `departement` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `created_at`, `updated_at`, `deleted_at`, `departement`) VALUES
(1, NULL, NULL, NULL, 'departement1'),
(2, NULL, NULL, NULL, 'Cardiologists'),
(3, NULL, NULL, NULL, 'Allergists'),
(4, NULL, NULL, NULL, 'Departement2');

-- --------------------------------------------------------

--
-- Structure de la table `doctor_prestation`
--

CREATE TABLE `doctor_prestation` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `prestation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `doctor_prestation`
--

INSERT INTO `doctor_prestation` (`user_id`, `prestation_id`) VALUES
(4, 1),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `employe_work_times`
--

CREATE TABLE `employe_work_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `employe_id` bigint(20) UNSIGNED NOT NULL,
  `work_time_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `employe_work_times`
--

INSERT INTO `employe_work_times` (`id`, `created_at`, `updated_at`, `deleted_at`, `employe_id`, `work_time_id`, `date`, `room_id`) VALUES
(1, NULL, NULL, NULL, 4, 1, '2023-05-30', 1),
(2, NULL, NULL, NULL, 4, 1, '2023-05-31', 1),
(3, NULL, NULL, NULL, 4, 1, '2023-06-01', 1),
(4, NULL, NULL, NULL, 4, 1, '2023-06-02', 1),
(5, NULL, NULL, NULL, 4, 1, '2023-06-03', 1),
(6, NULL, NULL, NULL, 4, 1, '2023-06-04', 1),
(7, NULL, NULL, NULL, 4, 1, '2023-06-05', 1),
(8, NULL, NULL, NULL, 4, 1, '2023-06-06', 1),
(9, NULL, NULL, NULL, 4, 1, '2023-06-07', 1),
(10, NULL, NULL, NULL, 4, 1, '2023-06-08', 1),
(11, NULL, NULL, NULL, 4, 1, '2023-06-09', 1),
(12, NULL, NULL, NULL, 4, 1, '2023-06-10', 1),
(13, NULL, NULL, NULL, 4, 1, '2023-06-11', 1),
(14, NULL, NULL, NULL, 4, 1, '2023-06-12', 1),
(15, NULL, NULL, NULL, 4, 1, '2023-06-13', 1),
(16, NULL, NULL, NULL, 4, 1, '2023-06-14', 1),
(17, NULL, NULL, NULL, 4, 1, '2023-06-15', 1),
(18, NULL, NULL, NULL, 4, 1, '2023-06-16', 1),
(19, NULL, NULL, NULL, 4, 1, '2023-06-17', 1),
(20, NULL, NULL, NULL, 4, 1, '2023-06-18', 1),
(21, NULL, NULL, NULL, 4, 1, '2023-06-19', 1),
(22, NULL, NULL, NULL, 4, 1, '2023-06-20', 1),
(23, NULL, NULL, NULL, 4, 1, '2023-06-21', 1),
(24, NULL, NULL, NULL, 4, 1, '2023-06-22', 1),
(25, NULL, NULL, NULL, 4, 1, '2023-06-23', 1),
(26, NULL, NULL, NULL, 4, 1, '2023-06-24', 1);

-- --------------------------------------------------------

--
-- Structure de la table `medications`
--

CREATE TABLE `medications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `medication_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `medications`
--

INSERT INTO `medications` (`id`, `created_at`, `updated_at`, `deleted_at`, `medication_name`, `description`) VALUES
(1, '2023-05-23 15:05:35.592', '2023-05-23 15:05:35.592', NULL, 'pracetemol', 'Wallace Roberts'),
(2, '2023-05-23 15:05:49.906', '2023-05-23 15:05:49.906', NULL, 'pillk', 'Cheryl Mcclure'),
(3, '2023-05-23 15:06:04.016', '2023-05-23 15:06:04.016', NULL, 'Panadol', 'Test Demo'),
(4, '2023-05-23 15:06:18.613', '2023-05-23 15:06:18.613', NULL, 'Augmentin', 'Test Demo'),
(5, '2023-05-23 15:06:33.159', '2023-05-23 15:06:33.159', NULL, 'Ifeoma Kramer', 'Wallace Roberts'),
(6, '2023-05-23 15:06:46.614', '2023-05-23 15:06:46.614', NULL, 'dolo 650', 'Test Demo');

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `addresse` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `alt_phone_number` varchar(15) DEFAULT NULL,
  `email_addresse` varchar(100) NOT NULL,
  `preferred_contact_method` longtext DEFAULT NULL,
  `emergency_contact_name` varchar(100) DEFAULT NULL,
  `emergency_contact_relationship` varchar(50) DEFAULT NULL,
  `emergency_contact_phone_number` varchar(15) DEFAULT NULL,
  `insurance_provider` varchar(100) NOT NULL,
  `insurance_number` varchar(50) NOT NULL,
  `insurance_group_number` varchar(50) DEFAULT NULL,
  `insurance_plan_name` varchar(100) DEFAULT NULL,
  `primary_care_physician` varchar(100) DEFAULT NULL,
  `referring_physician` varchar(100) DEFAULT NULL,
  `medical_record_number` varchar(50) DEFAULT NULL,
  `social_security_number` varchar(15) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `employer` varchar(100) DEFAULT NULL,
  `marital_status` longtext DEFAULT NULL,
  `medical_conditions` text DEFAULT NULL,
  `past_surgeries` text DEFAULT NULL,
  `family_medical_history` text DEFAULT NULL,
  `smoking_status` longtext DEFAULT NULL,
  `alcohol_consumption` longtext DEFAULT NULL,
  `height` longtext DEFAULT NULL,
  `wight` longtext DEFAULT NULL,
  `blood_type` longtext DEFAULT NULL,
  `date_of_last_visit` date DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`id`, `created_at`, `updated_at`, `deleted_at`, `last_name`, `first_name`, `middle_name`, `date_of_birth`, `gender`, `addresse`, `city`, `state`, `zip_code`, `country`, `phone_number`, `alt_phone_number`, `email_addresse`, `preferred_contact_method`, `emergency_contact_name`, `emergency_contact_relationship`, `emergency_contact_phone_number`, `insurance_provider`, `insurance_number`, `insurance_group_number`, `insurance_plan_name`, `primary_care_physician`, `referring_physician`, `medical_record_number`, `social_security_number`, `occupation`, `employer`, `marital_status`, `medical_conditions`, `past_surgeries`, `family_medical_history`, `smoking_status`, `alcohol_consumption`, `height`, `wight`, `blood_type`, `date_of_last_visit`, `notes`) VALUES
(1, '2023-05-23 14:55:05.746', '2023-05-23 14:55:05.746', NULL, 'p', 'patient1', '', '2000-05-11', 'Male', 'dradeb 12 bakkali', 'tanger', 'tanger', '90040', 'Maroc', '0621500095', '+212', 'soufiane2000yemlahi@gmail.com', 'Email', 'soufiane yemlahi', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'A+', '2023-05-23', ''),
(2, '2023-05-23 14:56:11.672', '2023-05-23 14:56:11.672', NULL, 'p2', 'patient2', '', '2000-05-05', 'Female', 'dradeb 12 bakkali', 'tanger', 'tanger', '90040', 'Maroc', '0643619770', '+212', 'ymsoufiane@gmail.com', 'Email', 'soufiane test form tabs yemlahi', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2023-05-23', ''),
(3, '2023-05-23 14:57:20.129', '2023-05-23 15:00:01.588', NULL, 'p3', 'patient3', '', '2000-07-07', 'Male', 'dradeb 13 test', 'tanger', 'tttt', '90040', 'Maroc', '0621500095', '+212', 'soufiane2000yemlahi@gmail.com', 'Phone', 'soufiane yemlahi', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2023-05-23', '');

-- --------------------------------------------------------

--
-- Structure de la table `prestations`
--

CREATE TABLE `prestations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `taxe` double NOT NULL,
  `room_type` enum('all','special_rooms') NOT NULL DEFAULT 'all',
  `prestation_categorie_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prestations`
--

INSERT INTO `prestations` (`id`, `created_at`, `updated_at`, `deleted_at`, `label`, `description`, `price`, `taxe`, `room_type`, `prestation_categorie_id`) VALUES
(1, '2023-05-23 15:15:53.872', '2023-05-23 15:15:53.872', NULL, 'Routine check-ups and physical examinations', 'Regular comprehensive health assessments to monitor overall well-being and detect any potential health issues', 150, 20, 'all', 1),
(2, '2023-05-23 15:18:50.209', '2023-05-23 15:18:50.209', NULL, 'Vaccinations and immunizations', 'Administration of vaccines to prevent infectious diseases and boost immunity.', 200, 20, 'all', 1),
(3, '2023-05-23 15:19:22.401', '2023-05-23 15:19:22.401', NULL, 'Diagnosis and treatment of common illnesses and injuries', 'Evaluation and management of common conditions such as colds, flu, minor injuries, and infections', 100, 10, 'special_rooms', 1);

-- --------------------------------------------------------

--
-- Structure de la table `prestation_categories`
--

CREATE TABLE `prestation_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prestation_categories`
--

INSERT INTO `prestation_categories` (`id`, `created_at`, `updated_at`, `deleted_at`, `label`, `description`) VALUES
(1, '2023-05-23 15:08:41.599', '2023-05-23 15:08:41.599', NULL, 'Primary Care Services', 'Services provided by general practitioners, family physicians, and internists for routine medical care, preventive services, and initial diagnosis.'),
(2, '2023-05-23 15:08:56.333', '2023-05-23 15:08:56.333', NULL, 'Specialty Care Services', ' Services provided by medical specialists in specific fields such as cardiology, dermatology, gastroenterology, neurology, orthopedics, etc., for advanced diagnosis and treatment'),
(3, '2023-05-23 15:09:11.943', '2023-05-23 15:09:11.943', NULL, 'Emergency Medical Services', 'Immediate medical care provided in emergency situations, including ambulance services, emergency room care, and trauma services.'),
(4, '2023-05-23 15:09:27.033', '2023-05-23 15:09:27.033', NULL, 'Surgical Services', ' Medical procedures performed by surgeons, including both elective and emergency surgeries.'),
(5, '2023-05-23 15:09:42.684', '2023-05-23 15:09:42.684', NULL, 'Diagnostic Services', 'Services aimed at diagnosing diseases or conditions, such as laboratory tests, imaging studies (X-rays, CT scans, MRI), and pathology examinations');

-- --------------------------------------------------------

--
-- Structure de la table `priviliges`
--

CREATE TABLE `priviliges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `privilige` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `priviliges`
--

INSERT INTO `priviliges` (`id`, `created_at`, `updated_at`, `deleted_at`, `privilige`, `description`) VALUES
(1, NULL, NULL, NULL, 'admin', 'this privilige  access to all routes'),
(2, NULL, NULL, NULL, 'manage_users', 'this privilige for add update,show , users '),
(3, NULL, NULL, NULL, 'show_users_info', 'description'),
(4, NULL, NULL, NULL, 'manage_roles', 'this privilige for add ,update show roles'),
(5, NULL, NULL, NULL, 'show_roles_info', 'description'),
(6, NULL, NULL, NULL, 'patient_manager', 'this privilige for add,update info patient'),
(7, NULL, NULL, NULL, 'show_patient_info', 'this privilige can access to patient info'),
(8, NULL, NULL, NULL, 'allergy_manager', 'this privilige for (add,update) allergy'),
(9, NULL, NULL, NULL, 'show_allergy_list', 'this privilige for show allergy list'),
(10, NULL, NULL, NULL, 'medication_manager', 'this privilige for (add,update) medication'),
(11, NULL, NULL, NULL, 'show_medication_list', 'this privilige for show medications list'),
(12, NULL, NULL, NULL, 'prestation_manager', 'this privilige for (add,update,show) list prestation and prestation categorie'),
(13, NULL, NULL, NULL, 'show_prestations_list', 'description'),
(14, NULL, NULL, NULL, 'show_prestation_info', 'description'),
(15, NULL, NULL, NULL, 'appointment_manager', 'description');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `etat` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `deleted_at`, `role_name`, `description`, `etat`) VALUES
(1, NULL, NULL, NULL, 'admin', 'this role have all priviliges', 1),
(2, '2023-05-22 14:47:00.827', '2023-05-23 14:50:25.541', NULL, 'doctor', 'this role for doctors', 1),
(3, '2023-05-23 15:52:59.169', '2023-05-23 16:02:06.685', NULL, 'receptionist', 'description receptionist role', 1),
(4, '2023-05-29 15:10:28.205', '2023-05-29 15:10:28.205', NULL, 'rol1', 'description role1', 1),
(5, '2023-05-29 15:10:48.042', '2023-05-29 15:10:48.042', NULL, 'role2', 'description role2', 1),
(6, '2023-05-29 15:11:09.132', '2023-05-29 15:11:09.132', NULL, 'role3', 'description role3', 1),
(7, '2023-05-29 15:11:31.678', '2023-05-29 15:11:31.678', NULL, 'role4', 'description role4', 1),
(8, '2023-05-29 15:11:58.462', '2023-05-29 15:11:58.462', NULL, 'role 5', 'description role5', 1),
(9, '2023-05-29 15:12:15.359', '2023-05-29 15:12:15.359', NULL, 'role6', 'description role6', 1),
(10, '2023-05-29 15:12:52.158', '2023-05-29 15:12:52.158', NULL, 'role7', 'description role7', 1),
(11, '2023-05-29 15:13:00.761', '2023-05-29 15:13:00.761', NULL, 'role8', 'description role8', 1);

-- --------------------------------------------------------

--
-- Structure de la table `role_priviliges`
--

CREATE TABLE `role_priviliges` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `privilige_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role_priviliges`
--

INSERT INTO `role_priviliges` (`role_id`, `privilige_id`) VALUES
(1, 1),
(2, 6),
(2, 7),
(2, 9),
(2, 11),
(2, 13),
(2, 14),
(3, 7),
(3, 9),
(3, 11),
(3, 13),
(3, 14),
(3, 15),
(4, 2),
(4, 3),
(4, 7),
(5, 3),
(6, 2),
(6, 6),
(7, 1),
(8, 4),
(9, 3),
(9, 15),
(10, 13),
(10, 15);

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `type` enum('prestation','emplWorkTime') NOT NULL DEFAULT 'emplWorkTime',
  `departement_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id`, `created_at`, `updated_at`, `deleted_at`, `label`, `type`, `departement_id`) VALUES
(1, NULL, NULL, NULL, 'room1', 'emplWorkTime', 3),
(2, NULL, NULL, NULL, 'room2', 'emplWorkTime', 3),
(3, NULL, NULL, NULL, 'room3', 'emplWorkTime', 3),
(4, NULL, NULL, NULL, 'room4', 'emplWorkTime', 3),
(5, NULL, NULL, NULL, 'room5', 'emplWorkTime', 3),
(6, NULL, NULL, NULL, 'room6', 'emplWorkTime', 3),
(7, NULL, NULL, NULL, 'sp_room1', 'prestation', 3),
(8, NULL, NULL, NULL, 'sp_room2', 'prestation', 3);

-- --------------------------------------------------------

--
-- Structure de la table `room_prestation`
--

CREATE TABLE `room_prestation` (
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `prestation_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `room_prestation`
--

INSERT INTO `room_prestation` (`room_id`, `prestation_id`) VALUES
(7, 3),
(8, 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `prefixe_phone_number` varchar(5) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT 1,
  `account_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `departement_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `deleted_at`, `username`, `last_name`, `first_name`, `email`, `password`, `phone_number`, `prefixe_phone_number`, `etat`, `account_type_id`, `departement_id`) VALUES
(3, '2023-05-22 14:27:53.484', '2023-05-22 14:27:53.484', NULL, 'admin', 'admin', 'admin', 'admin@gmail.com', '$2a$14$ZGaWn91Clbl3MW.5tSLFOurQgHJwauhO5o6YZyhlbMbGc23BdIDSm', '0628587964', '', 1, 2, NULL),
(4, '2023-05-22 14:46:32.909', '2023-05-22 14:47:10.432', NULL, 'doctor1', 'jilali', 'doctor1', 'doctor1@gmail.com', '$2a$14$YhMwaL/9x2EluOFutg29zuDYspjnEMygGj3wnPnaVaHphoDvc8cvq', '0628587965', '', 1, 1, 3),
(5, '2023-05-22 14:48:43.711', '2023-05-22 14:48:43.711', NULL, 'doctor2', 'menan', 'doctor2', 'doctor2@gmail.com', '$2a$14$PmNoNj4rnm.4nnQXEuHdveinmutAwzRsnR/B43NFddndewLxUTt2S', '0628587966', '', 1, 1, 3),
(6, '2023-05-22 14:49:39.495', '2023-05-22 14:49:39.495', NULL, 'doctor3', 'dkflala', 'doctor3', 'doctor3@gmail.com', '$2a$14$j0hxWDkX2bORchYiQUJEb.6z1m6ANPEtPk4sC8Op5vwbrs80.4RB6', '0628587967', '', 1, 1, 3),
(7, '2023-05-23 15:53:52.601', '2023-05-23 15:53:52.601', NULL, 'receptionist1', 'r1', 'receptionist1', 'receptionist@demo.com', '$2a$14$1pfYOCZXtDCpotixFWsefuH60b7mfi1yBxtAILAwL5BS5NRGgNnMC', '0621500096', '', 1, 3, NULL),
(8, '2023-05-23 15:54:38.849', '2023-05-23 15:54:38.849', NULL, 'receptionist2', 'rr1', 'receptionist2', 'receptionist2@demo.com', '$2a$14$I4cjRBJaG7KBC9VuRaZoh..FLrnWDOdk1tGUVWwyW0ETMSwyN842.', '0622500099', '', 1, 3, NULL),
(9, '2023-05-29 14:02:28.896', '2023-05-29 14:02:28.896', NULL, 'admin2', 'ad2', 'admin2', 'admin2@gmail.com', '$2a$14$/kDrmYMSN3WhFlw005sl0.Ohu/ODsA47V8I8zIeLAkNBcjcKFuq4u', '06828556', '', 1, 2, NULL),
(10, '2023-05-29 14:04:19.376', '2023-05-29 14:04:19.376', NULL, 'admin3', 'ad3', 'admin3', 'admin3@gmail.com', '$2a$14$T1nuMM7lk/e9sjvB0J1jaO3gqcpMgn4HBmB4bNccaZAo01PmsmcEW', '0621500086', '', 1, 2, NULL),
(11, '2023-05-29 14:08:35.161', '2023-05-29 14:30:41.697', NULL, 'admin4', 'yemlahi', 'soufiane', 'soufiane2000yemlahi@gmail.com', '$2a$14$lqpFltE3TW8cVzaIXBzqCuzQE0dw94.jb7/rTOmv4UvhU7KZN3RI2', '06215000988', '', 1, 2, NULL),
(12, '2023-05-29 14:09:58.371', '2023-05-29 14:09:58.371', NULL, 'admin5', 'ad5', 'admin5', 'admin5@gmail.com', '$2a$14$zd3y0gzOIhHapqXfR9HTW..OK2UdMkQdkC.56aGP9O8QtTmHuQRwG', '0621500099', '', 1, 2, NULL),
(13, '2023-05-29 14:12:51.392', '2023-05-29 14:12:51.392', NULL, 'admin6', 'ad5', 'admin6', 'admin6@gmail.com', '$2a$14$hoT7rCSXghHGq5rCSdqhke8qddTYsbKqjkP9JDz9Vn4H1z65KPunK', '0643619778', '', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1);

-- --------------------------------------------------------

--
-- Structure de la table `work_times`
--

CREATE TABLE `work_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `start_hour` varchar(5) NOT NULL,
  `end_hour` varchar(5) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `work_times`
--

INSERT INTO `work_times` (`id`, `created_at`, `updated_at`, `deleted_at`, `start_hour`, `end_hour`, `description`) VALUES
(1, NULL, NULL, NULL, '08:00', '16:00', NULL),
(2, NULL, NULL, NULL, '16:00', '00:00', NULL),
(3, NULL, NULL, NULL, '00:00', '08:00', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_account_types_deleted_at` (`deleted_at`);

--
-- Index pour la table `allergies`
--
ALTER TABLE `allergies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_allergies_deleted_at` (`deleted_at`);

--
-- Index pour la table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_appointments_deleted_at` (`deleted_at`),
  ADD KEY `fk_appointments_prestation` (`prestation_id`),
  ADD KEY `fk_appointments_room` (`room_id`),
  ADD KEY `fk_appointments_doctor` (`doctor_id`),
  ADD KEY `fk_appointments_patient` (`patient_id`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_departements_deleted_at` (`deleted_at`);

--
-- Index pour la table `doctor_prestation`
--
ALTER TABLE `doctor_prestation`
  ADD PRIMARY KEY (`user_id`,`prestation_id`),
  ADD KEY `fk_doctor_prestation_prestation` (`prestation_id`);

--
-- Index pour la table `employe_work_times`
--
ALTER TABLE `employe_work_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_employe_work_times_deleted_at` (`deleted_at`),
  ADD KEY `fk_employe_work_times_work_time` (`work_time_id`),
  ADD KEY `fk_employe_work_times_employe` (`employe_id`),
  ADD KEY `fk_employe_work_times_room` (`room_id`);

--
-- Index pour la table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_medications_deleted_at` (`deleted_at`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_patients_deleted_at` (`deleted_at`);

--
-- Index pour la table `prestations`
--
ALTER TABLE `prestations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_prestations_deleted_at` (`deleted_at`),
  ADD KEY `fk_prestation_categories_prestations` (`prestation_categorie_id`);

--
-- Index pour la table `prestation_categories`
--
ALTER TABLE `prestation_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_prestation_categories_deleted_at` (`deleted_at`);

--
-- Index pour la table `priviliges`
--
ALTER TABLE `priviliges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `privilige` (`privilige`),
  ADD KEY `idx_priviliges_deleted_at` (`deleted_at`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_name` (`role_name`),
  ADD KEY `idx_roles_deleted_at` (`deleted_at`);

--
-- Index pour la table `role_priviliges`
--
ALTER TABLE `role_priviliges`
  ADD PRIMARY KEY (`role_id`,`privilige_id`),
  ADD KEY `fk_role_priviliges_privilige` (`privilige_id`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rooms_deleted_at` (`deleted_at`),
  ADD KEY `fk_rooms_departement` (`departement_id`);

--
-- Index pour la table `room_prestation`
--
ALTER TABLE `room_prestation`
  ADD PRIMARY KEY (`room_id`,`prestation_id`),
  ADD KEY `fk_room_prestation_prestation` (`prestation_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `idx_users_deleted_at` (`deleted_at`),
  ADD KEY `fk_departements_users` (`departement_id`),
  ADD KEY `fk_account_types_users` (`account_type_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `fk_user_roles_role` (`role_id`);

--
-- Index pour la table `work_times`
--
ALTER TABLE `work_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_work_times_deleted_at` (`deleted_at`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `allergies`
--
ALTER TABLE `allergies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `employe_work_times`
--
ALTER TABLE `employe_work_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `medications`
--
ALTER TABLE `medications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `prestations`
--
ALTER TABLE `prestations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `prestation_categories`
--
ALTER TABLE `prestation_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `priviliges`
--
ALTER TABLE `priviliges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `work_times`
--
ALTER TABLE `work_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointments_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_appointments_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `fk_appointments_prestation` FOREIGN KEY (`prestation_id`) REFERENCES `prestations` (`id`),
  ADD CONSTRAINT `fk_appointments_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Contraintes pour la table `doctor_prestation`
--
ALTER TABLE `doctor_prestation`
  ADD CONSTRAINT `fk_doctor_prestation_prestation` FOREIGN KEY (`prestation_id`) REFERENCES `prestations` (`id`),
  ADD CONSTRAINT `fk_doctor_prestation_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `employe_work_times`
--
ALTER TABLE `employe_work_times`
  ADD CONSTRAINT `fk_employe_work_times_employe` FOREIGN KEY (`employe_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_employe_work_times_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `fk_employe_work_times_work_time` FOREIGN KEY (`work_time_id`) REFERENCES `work_times` (`id`);

--
-- Contraintes pour la table `prestations`
--
ALTER TABLE `prestations`
  ADD CONSTRAINT `fk_prestation_categories_prestations` FOREIGN KEY (`prestation_categorie_id`) REFERENCES `prestation_categories` (`id`);

--
-- Contraintes pour la table `role_priviliges`
--
ALTER TABLE `role_priviliges`
  ADD CONSTRAINT `fk_role_priviliges_privilige` FOREIGN KEY (`privilige_id`) REFERENCES `priviliges` (`id`),
  ADD CONSTRAINT `fk_role_priviliges_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `fk_rooms_departement` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`);

--
-- Contraintes pour la table `room_prestation`
--
ALTER TABLE `room_prestation`
  ADD CONSTRAINT `fk_room_prestation_prestation` FOREIGN KEY (`prestation_id`) REFERENCES `prestations` (`id`),
  ADD CONSTRAINT `fk_room_prestation_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_account_types_users` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  ADD CONSTRAINT `fk_departements_users` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `fk_user_roles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `fk_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
