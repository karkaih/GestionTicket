-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 06:11 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `tickets`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
                         `id` bigint(20) NOT NULL,
                         `nom` varchar(255) DEFAULT NULL,
                         `prenom` varchar(255) DEFAULT NULL,
                         `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nom`, `prenom`, `username`) VALUES
    (1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
                          `id` bigint(20) NOT NULL,
                          `nom` varchar(255) DEFAULT NULL,
                          `prenom` varchar(255) DEFAULT NULL,
                          `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `username`) VALUES
    (1, 'client', 'client', 'client');

-- --------------------------------------------------------

--
-- Table structure for table `developpeur`
--

CREATE TABLE `developpeur` (
                               `id` bigint(20) NOT NULL,
                               `nom` varchar(255) DEFAULT NULL,
                               `prenom` varchar(255) DEFAULT NULL,
                               `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `developpeur`
--

INSERT INTO `developpeur` (`id`, `nom`, `prenom`, `username`) VALUES
                                                                  (1, 'zakar', 'mourad', 'dev'),
                                                                  (2, 'karkaih', 'achraf', 'deve');

-- --------------------------------------------------------

--
-- Table structure for table `developpeur_tickets`
--

CREATE TABLE `developpeur_tickets` (
                                       `developpeur_id` bigint(20) NOT NULL,
                                       `tickets_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
                        `id` bigint(20) NOT NULL,
                        `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `nom`) VALUES
                                     (1, 'ADMIN'),
                                     (2, 'CLIENT'),
                                     (3, 'DEV');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
                          `id` bigint(20) NOT NULL,
                          `description` varchar(255) DEFAULT NULL,
                          `environnement` varchar(255) DEFAULT NULL,
                          `logiciel` varchar(255) DEFAULT NULL,
                          `statut` varchar(255) DEFAULT NULL,
                          `urgence` varchar(255) DEFAULT NULL,
                          `client_id` bigint(20) DEFAULT NULL,
                          `developpeur_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `description`, `environnement`, `logiciel`, `statut`, `urgence`, `client_id`, `developpeur_id`) VALUES
    (3, 'description', 'env', 'logiciel', 'Résolu', 'Critique', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
                        `id` bigint(20) NOT NULL,
                        `enabled` bit(1) NOT NULL,
                        `password` varchar(255) DEFAULT NULL,
                        `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `enabled`, `password`, `username`) VALUES
                                                                 (1, b'1', '$2a$10$6ZmVwdJNXB9vZlCmE6KKB.X9Biz9qTyFmswRC33Zeox7LdzSqn6sy', 'admin'),
                                                                 (2, b'1', '$2a$10$6ZmVwdJNXB9vZlCmE6KKB.X9Biz9qTyFmswRC33Zeox7LdzSqn6sy', 'client'),
                                                                 (3, b'1', '$2a$10$6ZmVwdJNXB9vZlCmE6KKB.X9Biz9qTyFmswRC33Zeox7LdzSqn6sy', 'dev');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
                               `user_id` bigint(20) NOT NULL,
                               `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
                                                     (1, 1),
                                                     (2, 2),
                                                     (3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `developpeur`
--
ALTER TABLE `developpeur`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `developpeur_tickets`
--
ALTER TABLE `developpeur_tickets`
    ADD UNIQUE KEY `UK_26131f9so3tdaw1nytdgc7kow` (`tickets_id`),
    ADD KEY `FKpkpitnoh9qk2xhdhp4i0i962y` (`developpeur_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
    ADD PRIMARY KEY (`id`),
  ADD KEY `FKj2rjr6m31hp7m00tm1hdxckov` (`client_id`),
  ADD KEY `FK9rpp3f3h5b8621urjqe5knxgv` (`developpeur_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
    ADD KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  ADD KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `developpeur`
--
ALTER TABLE `developpeur`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `developpeur_tickets`
--
ALTER TABLE `developpeur_tickets`
    ADD CONSTRAINT `FK3fdo9ivv9chgcr5yav24s9o5p` FOREIGN KEY (`tickets_id`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `FKpkpitnoh9qk2xhdhp4i0i962y` FOREIGN KEY (`developpeur_id`) REFERENCES `developpeur` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
    ADD CONSTRAINT `FK9rpp3f3h5b8621urjqe5knxgv` FOREIGN KEY (`developpeur_id`) REFERENCES `developpeur` (`id`),
  ADD CONSTRAINT `FKj2rjr6m31hp7m00tm1hdxckov` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
    ADD CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;
