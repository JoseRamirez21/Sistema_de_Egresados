/*
Navicat MySQL Data Transfer

Source Server         : conex 3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : sistema_egresado_huanta

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-11-14 16:40:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for carrera
-- ----------------------------
DROP TABLE IF EXISTS `carrera`;
CREATE TABLE `carrera` (
  `id_carrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carrera
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `ape_paterno` varchar(255) DEFAULT NULL,
  `ape_materno` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of usuario
-- ----------------------------

-- ----------------------------
-- Table structure for modulo
-- ----------------------------
DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo` (
  `id_modulo` bigint(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) DEFAULT '',
  `nombre` varchar(255) DEFAULT NULL,
  `carrera` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modulo`),
  KEY `fk20` (`carrera`),
  CONSTRAINT `fk20` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of modulo
-- ----------------------------

-- ----------------------------
-- Table structure for semestre
-- ----------------------------
DROP TABLE IF EXISTS `semestre`;
CREATE TABLE `semestre` (
  `id_semestre` int(11) NOT NULL AUTO_INCREMENT,
  `semestre` varchar(255) NOT NULL,
  `año` varchar(50) NOT NULL,
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of semestre
-- ----------------------------


-- ----------------------------
-- Table structure for estudiante
-- ----------------------------
DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `apellido_materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `carrera` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trabajo_actual` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `clave` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `foto` longblob DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcarrera` (`carrera`),
  CONSTRAINT `FKcarrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of estudiante
-- ----------------------------



-- ----------------------------
-- Table structure for constancia
-- ----------------------------
DROP TABLE IF EXISTS `constancia`;
CREATE TABLE `constancia` (
  `id_constancia` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_estudiante` bigint(11) NOT NULL,
  `id_modulo` bigint(11) NOT NULL,
  `anio` varchar(50) DEFAULT NULL,
  `imagen` longblob DEFAULT NULL,
  PRIMARY KEY (`id_constancia`),
  KEY `fk14` (`id_estudiante`),
  KEY `fk16` (`id_modulo`),
  CONSTRAINT `fk14` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk16` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of constancia
-- ----------------------------


-- ----------------------------
-- Table structure for unidades
-- ----------------------------
DROP TABLE IF EXISTS `unidades`;
CREATE TABLE `unidades` (
  `id_unidades` int(11) NOT NULL AUTO_INCREMENT,
  `carrera` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `credito` varchar(255) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_unidades`),
  KEY `FKcarreraUni` (`carrera`),
  KEY `FKsemestreUni` (`semestre`),
  CONSTRAINT `FKcarreraUni` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKsemestreUni` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for nota
-- ----------------------------
DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante` bigint(20) DEFAULT NULL,
  `unidad` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `nota` int(10) DEFAULT 0,
  `puntaje` int(255) DEFAULT 0,
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `fk10` (`unidad`),
  KEY `fk11` (`semestre`),
  KEY `fk15_idx` (`estudiante`),
  CONSTRAINT `fk10` FOREIGN KEY (`unidad`) REFERENCES `unidades` (`id_unidades`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk11` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk15` FOREIGN KEY (`estudiante`) REFERENCES `estudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for certificado
-- ----------------------------
DROP TABLE IF EXISTS `certificado`;
CREATE TABLE `certificado` (
  `id_certificado` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_estudiante` bigint(11) NOT NULL,
  `id_modulo` bigint(11) NOT NULL,
  `anio` varchar(50) DEFAULT NULL,
  `imagen` longblob DEFAULT NULL,
  PRIMARY KEY (`id_certificado`),
  KEY `fk12` (`id_estudiante`),
  KEY `fk13` (`id_modulo`),
  CONSTRAINT `fk12` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk13` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;


INSERT INTO `usuario` VALUES ('1', '73984214', 'Bruno', 'Perez', 'Farfan', 'brunoperezfarfan@gmail.com', 'bruno', '202cb962ac59075b964b07152d234b70');