/*
Navicat MySQL Data Transfer

Source Server         : saplocal
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : sapnaval

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-02-25 13:44:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for administrativo
-- ----------------------------
DROP TABLE IF EXISTS `administrativo`;
CREATE TABLE `administrativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(255) DEFAULT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_administrativo_fuente1_idx` (`fuente_id`),
  KEY `fk_administrativo_programa1_idx` (`programa_id`),
  KEY `fk_administrativo_persona1_idx` (`persona_id`),
  CONSTRAINT `fk_administrativo_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_administrativo_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_administrativo_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrativo
-- ----------------------------

-- ----------------------------
-- Table structure for agenciagubernamental
-- ----------------------------
DROP TABLE IF EXISTS `agenciagubernamental`;
CREATE TABLE `agenciagubernamental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(500) DEFAULT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agenciagubernamental_fuente1_idx` (`fuente_id`),
  KEY `fk_agenciagubernamental_persona1_idx` (`persona_id`),
  CONSTRAINT `fk_agenciagubernamental_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agenciagubernamental_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agenciagubernamental
-- ----------------------------

-- ----------------------------
-- Table structure for asignacionencuesta
-- ----------------------------
DROP TABLE IF EXISTS `asignacionencuesta`;
CREATE TABLE `asignacionencuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fuente_id` int(11) NOT NULL,
  `encuesta_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asignacionencuesta_fuente1_idx` (`fuente_id`),
  KEY `fk_asignacionencuesta_encuesta1_idx` (`encuesta_id`),
  KEY `fk_asignacionencuesta_modelo1` (`modelo_id`),
  CONSTRAINT `fk_asignacionencuesta_encuesta1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacionencuesta_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignacionencuesta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asignacionencuesta
-- ----------------------------

-- ----------------------------
-- Table structure for caracteristica
-- ----------------------------
DROP TABLE IF EXISTS `caracteristica`;
CREATE TABLE `caracteristica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `factor_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_caracteristica_factor1_idx` (`factor_id`),
  KEY `fk_caracteristica_modelo1` (`modelo_id`),
  CONSTRAINT `fk_caracteristica_factor1` FOREIGN KEY (`factor_id`) REFERENCES `factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caracteristica_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caracteristica
-- ----------------------------
INSERT INTO `caracteristica` VALUES ('1', '1', 'Coherencia y pertinencia de la Misión', '1', '1');
INSERT INTO `caracteristica` VALUES ('2', '2', 'Orientaciones y estrategias del Proyecto Institucional', '1', '1');
INSERT INTO `caracteristica` VALUES ('3', '3', 'Formación integral y construcción de la comunidad académica en el Proyecto Institucional', '1', '1');
INSERT INTO `caracteristica` VALUES ('4', '4', 'Deberes y derechos de los estudiantes', '2', '1');
INSERT INTO `caracteristica` VALUES ('5', '5', 'Admisión y permanencia de estudiantes', '2', '1');
INSERT INTO `caracteristica` VALUES ('6', '6', 'Sistemas de estímulos y créditos para estudiantes', '2', '1');
INSERT INTO `caracteristica` VALUES ('7', '7', 'Deberes y derechos del profesorado', '3', '1');
INSERT INTO `caracteristica` VALUES ('8', '8', 'Planta profesoral', '3', '1');
INSERT INTO `caracteristica` VALUES ('9', '9', 'Carrera docente', '3', '1');
INSERT INTO `caracteristica` VALUES ('10', '10', 'Desarrollo profesoral', '3', '1');
INSERT INTO `caracteristica` VALUES ('11', '11', 'Interacción académica de los profesores', '3', '1');
INSERT INTO `caracteristica` VALUES ('12', '12', 'Políticas académicas', '4', '1');
INSERT INTO `caracteristica` VALUES ('13', '13', 'Pertinencia académica y relevancia social', '4', '1');
INSERT INTO `caracteristica` VALUES ('14', '14', 'Procesos de creación, modificación y extensión de programas académicos', '4', '1');
INSERT INTO `caracteristica` VALUES ('15', '15', 'Inserción de la institución en contextos académicos nacionales e internacionales', '5', '1');
INSERT INTO `caracteristica` VALUES ('16', '16', 'Relaciones externas de profesores y estudiantes', '5', '1');
INSERT INTO `caracteristica` VALUES ('17', '17', 'Formación para la investigación', '6', '1');
INSERT INTO `caracteristica` VALUES ('18', '18', 'Investigación', '6', '1');
INSERT INTO `caracteristica` VALUES ('19', '19', 'Institución y entorno', '7', '1');
INSERT INTO `caracteristica` VALUES ('20', '20', 'Graduados e institución', '7', '1');
INSERT INTO `caracteristica` VALUES ('21', '21', 'Sistemas de autoevaluación', '8', '1');
INSERT INTO `caracteristica` VALUES ('22', '22', 'Sistemas de información', '8', '1');
INSERT INTO `caracteristica` VALUES ('23', '23', 'Evaluación de directivas, profesores y personal administrativo', '8', '1');
INSERT INTO `caracteristica` VALUES ('24', '24', 'Estructura y funcionamiento del bienestar institucional', '9', '1');
INSERT INTO `caracteristica` VALUES ('25', '25', 'Administración y gestión', '10', '1');
INSERT INTO `caracteristica` VALUES ('26', '26', 'Procesos de comunicación', '10', '1');
INSERT INTO `caracteristica` VALUES ('27', '27', 'Capacidad de gestión', '10', '1');
INSERT INTO `caracteristica` VALUES ('28', '28', 'Recursos de apoyo académico', '11', '1');
INSERT INTO `caracteristica` VALUES ('29', '29', 'Infraestructura física', '11', '1');
INSERT INTO `caracteristica` VALUES ('30', '30', 'Recursos, presupuesto y gestión financiera', '12', '1');

-- ----------------------------
-- Table structure for condicion
-- ----------------------------
DROP TABLE IF EXISTS `condicion`;
CREATE TABLE `condicion` (
  `idcondicion` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta_condicionadora` int(11) NOT NULL,
  `pregunta_condicionada` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `respuesta_idrespuesta` int(11) NOT NULL,
  PRIMARY KEY (`idcondicion`),
  KEY `fk_condicion_pregunta1_idx` (`pregunta_condicionadora`),
  KEY `fk_condicion_pregunta2_idx` (`pregunta_condicionada`),
  KEY `fk_condicion_respuesta1_idx` (`respuesta_idrespuesta`),
  CONSTRAINT `fk_condicion_pregunta1` FOREIGN KEY (`pregunta_condicionadora`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_condicion_pregunta2` FOREIGN KEY (`pregunta_condicionada`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_condicion_respuesta1` FOREIGN KEY (`respuesta_idrespuesta`) REFERENCES `respuesta` (`idrespuesta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of condicion
-- ----------------------------

-- ----------------------------
-- Table structure for directorprograma
-- ----------------------------
DROP TABLE IF EXISTS `directorprograma`;
CREATE TABLE `directorprograma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_directorprograma_fuente1_idx` (`fuente_id`),
  KEY `fk_directorprograma_programa1_idx` (`programa_id`),
  KEY `fk_directorprograma_persona1_idx` (`persona_id`),
  CONSTRAINT `fk_directorprograma_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_directorprograma_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_directorprograma_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of directorprograma
-- ----------------------------

-- ----------------------------
-- Table structure for docente
-- ----------------------------
DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_docente_fuente1_idx` (`fuente_id`),
  KEY `fk_docente_programa1_idx` (`programa_id`),
  KEY `fk_docente_persona1_idx` (`persona_id`),
  CONSTRAINT `fk_docente_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docente
-- ----------------------------

-- ----------------------------
-- Table structure for egresado
-- ----------------------------
DROP TABLE IF EXISTS `egresado`;
CREATE TABLE `egresado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_egresado_fuente1_idx` (`fuente_id`),
  KEY `fk_egresado_programa1_idx` (`programa_id`),
  KEY `fk_egresado_persona1_idx` (`persona_id`),
  CONSTRAINT `fk_egresado_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresado_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_egresado_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of egresado
-- ----------------------------

-- ----------------------------
-- Table structure for empleador
-- ----------------------------
DROP TABLE IF EXISTS `empleador`;
CREATE TABLE `empleador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleador_fuente1_idx` (`fuente_id`),
  KEY `fk_empleador_persona1_idx` (`persona_id`),
  KEY `fk_empleador_programa1` (`programa_id`),
  CONSTRAINT `fk_empleador_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleador_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleador_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empleador
-- ----------------------------

-- ----------------------------
-- Table structure for encabezado
-- ----------------------------
DROP TABLE IF EXISTS `encabezado`;
CREATE TABLE `encabezado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  `proceso_id` int(11) NOT NULL,
  `encuesta_id` int(11) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `comentarios` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_encabezado_proceso1_idx` (`proceso_id`),
  KEY `fk_encabezado_encuesta1_idx` (`encuesta_id`),
  KEY `fk_encabezado_fuente1_idx` (`fuente_id`),
  KEY `fk_encabezado_muestrapersona1` (`muestrapersona_id`),
  CONSTRAINT `fk_encabezado_encuesta1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_encabezado_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_encabezado_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_encabezado_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of encabezado
-- ----------------------------

-- ----------------------------
-- Table structure for encuesta
-- ----------------------------
DROP TABLE IF EXISTS `encuesta`;
CREATE TABLE `encuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `objetivo` varchar(1000) NOT NULL,
  `instrucciones` varchar(1000) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  `version` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_encuesta_modelo1` (`modelo_id`),
  CONSTRAINT `fk_encuesta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of encuesta
-- ----------------------------
INSERT INTO `encuesta` VALUES ('1', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A ESTUDIANTES DE PREGRADO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('2', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A ESTUDIANTES DE MAESTRÍA Y DOCTORADO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('3', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A ESTUDIANTES DE ESPECIALIZACIÓN', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('4', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES DE PLANTA', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('5', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES DE CATEDRA', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('6', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL DIRECTIVO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('7', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL ADMINISTRATIVO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('8', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EGRESADOS DE PREGRADO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('9', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EGRESADOS DE ESPECIALIZACIONES', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('10', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EGRESADOS DE MAESTRIA Y DOCTORADO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('11', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EMPLEADORES', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('12', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A ESTUDIANTES DE PREGRADO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '2', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('13', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES DE PLANTA', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '2', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('14', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES DE CATEDRA', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '2', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('15', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL DIRECTIVO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '2', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('16', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL ADMINISTRATIVO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '2', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('17', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EGRESADOS DE PREGRADO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '2', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('18', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A ESTUDIANTES DE MAESTRÍA Y DOCTORADO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '3', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('19', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES DE PLANTA', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '3', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('20', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES DE CATEDRA', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '3', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('21', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL DIRECTIVO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '3', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('22', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL ADMINISTRATIVO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '3', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('23', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EGRESADOS DE MAESTRIA Y DOCTORADO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '3', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('24', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A ESTUDIANTES DE ESPECIALIZACIÓN', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '4', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('26', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES DE PLANTA', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '4', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('27', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES DE CATEDRA', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '4', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('28', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL DIRECTIVO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '4', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('29', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL ADMINISTRATIVO', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '4', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('30', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EGRESADOS DE ESPECIALIZACIONES', 'Actualmente la ESCUELA NAVAL DE CADETES \"ALMIRANTE PADILLA\"  se encuentra en proceso de autoevaluación con el fin de obtener la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '4', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');

-- ----------------------------
-- Table structure for encuestahaspregunta
-- ----------------------------
DROP TABLE IF EXISTS `encuestahaspregunta`;
CREATE TABLE `encuestahaspregunta` (
  `encuesta_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  PRIMARY KEY (`encuesta_id`,`pregunta_id`),
  KEY `fk_encuesta_has_pregunta_pregunta1` (`pregunta_id`),
  KEY `fk_encuesta_has_pregunta_encuesta1` (`encuesta_id`),
  CONSTRAINT `fk_encuesta_has_pregunta_encuesta1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_encuesta_has_pregunta_pregunta1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of encuestahaspregunta
-- ----------------------------
INSERT INTO `encuestahaspregunta` VALUES ('1', '1');
INSERT INTO `encuestahaspregunta` VALUES ('2', '1');
INSERT INTO `encuestahaspregunta` VALUES ('3', '1');
INSERT INTO `encuestahaspregunta` VALUES ('4', '1');
INSERT INTO `encuestahaspregunta` VALUES ('5', '1');
INSERT INTO `encuestahaspregunta` VALUES ('6', '1');
INSERT INTO `encuestahaspregunta` VALUES ('7', '1');
INSERT INTO `encuestahaspregunta` VALUES ('8', '1');
INSERT INTO `encuestahaspregunta` VALUES ('9', '1');
INSERT INTO `encuestahaspregunta` VALUES ('10', '1');
INSERT INTO `encuestahaspregunta` VALUES ('12', '1');
INSERT INTO `encuestahaspregunta` VALUES ('13', '1');
INSERT INTO `encuestahaspregunta` VALUES ('14', '1');
INSERT INTO `encuestahaspregunta` VALUES ('15', '1');
INSERT INTO `encuestahaspregunta` VALUES ('16', '1');
INSERT INTO `encuestahaspregunta` VALUES ('17', '1');
INSERT INTO `encuestahaspregunta` VALUES ('18', '1');
INSERT INTO `encuestahaspregunta` VALUES ('19', '1');
INSERT INTO `encuestahaspregunta` VALUES ('20', '1');
INSERT INTO `encuestahaspregunta` VALUES ('21', '1');
INSERT INTO `encuestahaspregunta` VALUES ('22', '1');
INSERT INTO `encuestahaspregunta` VALUES ('23', '1');
INSERT INTO `encuestahaspregunta` VALUES ('24', '1');
INSERT INTO `encuestahaspregunta` VALUES ('26', '1');
INSERT INTO `encuestahaspregunta` VALUES ('27', '1');
INSERT INTO `encuestahaspregunta` VALUES ('28', '1');
INSERT INTO `encuestahaspregunta` VALUES ('29', '1');
INSERT INTO `encuestahaspregunta` VALUES ('30', '1');
INSERT INTO `encuestahaspregunta` VALUES ('12', '2');
INSERT INTO `encuestahaspregunta` VALUES ('13', '2');
INSERT INTO `encuestahaspregunta` VALUES ('14', '2');
INSERT INTO `encuestahaspregunta` VALUES ('15', '2');
INSERT INTO `encuestahaspregunta` VALUES ('16', '2');
INSERT INTO `encuestahaspregunta` VALUES ('18', '2');
INSERT INTO `encuestahaspregunta` VALUES ('19', '2');
INSERT INTO `encuestahaspregunta` VALUES ('20', '2');
INSERT INTO `encuestahaspregunta` VALUES ('21', '2');
INSERT INTO `encuestahaspregunta` VALUES ('22', '2');
INSERT INTO `encuestahaspregunta` VALUES ('24', '2');
INSERT INTO `encuestahaspregunta` VALUES ('26', '2');
INSERT INTO `encuestahaspregunta` VALUES ('27', '2');
INSERT INTO `encuestahaspregunta` VALUES ('28', '2');
INSERT INTO `encuestahaspregunta` VALUES ('29', '2');
INSERT INTO `encuestahaspregunta` VALUES ('12', '3');
INSERT INTO `encuestahaspregunta` VALUES ('13', '3');
INSERT INTO `encuestahaspregunta` VALUES ('14', '3');
INSERT INTO `encuestahaspregunta` VALUES ('12', '4');
INSERT INTO `encuestahaspregunta` VALUES ('12', '5');
INSERT INTO `encuestahaspregunta` VALUES ('1', '6');
INSERT INTO `encuestahaspregunta` VALUES ('2', '6');
INSERT INTO `encuestahaspregunta` VALUES ('3', '6');
INSERT INTO `encuestahaspregunta` VALUES ('12', '6');
INSERT INTO `encuestahaspregunta` VALUES ('18', '6');
INSERT INTO `encuestahaspregunta` VALUES ('24', '6');
INSERT INTO `encuestahaspregunta` VALUES ('1', '7');
INSERT INTO `encuestahaspregunta` VALUES ('2', '7');
INSERT INTO `encuestahaspregunta` VALUES ('3', '7');
INSERT INTO `encuestahaspregunta` VALUES ('4', '7');
INSERT INTO `encuestahaspregunta` VALUES ('5', '7');
INSERT INTO `encuestahaspregunta` VALUES ('6', '7');
INSERT INTO `encuestahaspregunta` VALUES ('12', '7');
INSERT INTO `encuestahaspregunta` VALUES ('13', '7');
INSERT INTO `encuestahaspregunta` VALUES ('14', '7');
INSERT INTO `encuestahaspregunta` VALUES ('15', '7');
INSERT INTO `encuestahaspregunta` VALUES ('13', '8');
INSERT INTO `encuestahaspregunta` VALUES ('14', '8');
INSERT INTO `encuestahaspregunta` VALUES ('15', '8');
INSERT INTO `encuestahaspregunta` VALUES ('26', '8');
INSERT INTO `encuestahaspregunta` VALUES ('27', '8');
INSERT INTO `encuestahaspregunta` VALUES ('28', '8');
INSERT INTO `encuestahaspregunta` VALUES ('4', '9');
INSERT INTO `encuestahaspregunta` VALUES ('5', '9');
INSERT INTO `encuestahaspregunta` VALUES ('6', '9');
INSERT INTO `encuestahaspregunta` VALUES ('13', '9');
INSERT INTO `encuestahaspregunta` VALUES ('14', '9');
INSERT INTO `encuestahaspregunta` VALUES ('15', '9');
INSERT INTO `encuestahaspregunta` VALUES ('26', '9');
INSERT INTO `encuestahaspregunta` VALUES ('27', '9');
INSERT INTO `encuestahaspregunta` VALUES ('28', '9');
INSERT INTO `encuestahaspregunta` VALUES ('13', '10');
INSERT INTO `encuestahaspregunta` VALUES ('14', '10');
INSERT INTO `encuestahaspregunta` VALUES ('15', '10');
INSERT INTO `encuestahaspregunta` VALUES ('26', '10');
INSERT INTO `encuestahaspregunta` VALUES ('27', '10');
INSERT INTO `encuestahaspregunta` VALUES ('28', '10');
INSERT INTO `encuestahaspregunta` VALUES ('1', '11');
INSERT INTO `encuestahaspregunta` VALUES ('2', '11');
INSERT INTO `encuestahaspregunta` VALUES ('3', '11');
INSERT INTO `encuestahaspregunta` VALUES ('4', '11');
INSERT INTO `encuestahaspregunta` VALUES ('5', '11');
INSERT INTO `encuestahaspregunta` VALUES ('6', '11');
INSERT INTO `encuestahaspregunta` VALUES ('12', '11');
INSERT INTO `encuestahaspregunta` VALUES ('13', '11');
INSERT INTO `encuestahaspregunta` VALUES ('14', '11');
INSERT INTO `encuestahaspregunta` VALUES ('15', '11');
INSERT INTO `encuestahaspregunta` VALUES ('18', '11');
INSERT INTO `encuestahaspregunta` VALUES ('19', '11');
INSERT INTO `encuestahaspregunta` VALUES ('20', '11');
INSERT INTO `encuestahaspregunta` VALUES ('21', '11');
INSERT INTO `encuestahaspregunta` VALUES ('24', '11');
INSERT INTO `encuestahaspregunta` VALUES ('26', '11');
INSERT INTO `encuestahaspregunta` VALUES ('27', '11');
INSERT INTO `encuestahaspregunta` VALUES ('28', '11');
INSERT INTO `encuestahaspregunta` VALUES ('4', '12');
INSERT INTO `encuestahaspregunta` VALUES ('13', '12');
INSERT INTO `encuestahaspregunta` VALUES ('4', '13');
INSERT INTO `encuestahaspregunta` VALUES ('5', '13');
INSERT INTO `encuestahaspregunta` VALUES ('13', '13');
INSERT INTO `encuestahaspregunta` VALUES ('14', '13');
INSERT INTO `encuestahaspregunta` VALUES ('4', '14');
INSERT INTO `encuestahaspregunta` VALUES ('13', '14');
INSERT INTO `encuestahaspregunta` VALUES ('13', '15');
INSERT INTO `encuestahaspregunta` VALUES ('12', '16');
INSERT INTO `encuestahaspregunta` VALUES ('13', '17');
INSERT INTO `encuestahaspregunta` VALUES ('14', '17');
INSERT INTO `encuestahaspregunta` VALUES ('1', '18');
INSERT INTO `encuestahaspregunta` VALUES ('2', '18');
INSERT INTO `encuestahaspregunta` VALUES ('3', '18');
INSERT INTO `encuestahaspregunta` VALUES ('4', '18');
INSERT INTO `encuestahaspregunta` VALUES ('5', '18');
INSERT INTO `encuestahaspregunta` VALUES ('1', '19');
INSERT INTO `encuestahaspregunta` VALUES ('2', '19');
INSERT INTO `encuestahaspregunta` VALUES ('3', '19');
INSERT INTO `encuestahaspregunta` VALUES ('4', '19');
INSERT INTO `encuestahaspregunta` VALUES ('5', '19');
INSERT INTO `encuestahaspregunta` VALUES ('12', '19');
INSERT INTO `encuestahaspregunta` VALUES ('13', '19');
INSERT INTO `encuestahaspregunta` VALUES ('14', '19');
INSERT INTO `encuestahaspregunta` VALUES ('18', '19');
INSERT INTO `encuestahaspregunta` VALUES ('19', '19');
INSERT INTO `encuestahaspregunta` VALUES ('20', '19');
INSERT INTO `encuestahaspregunta` VALUES ('24', '19');
INSERT INTO `encuestahaspregunta` VALUES ('26', '19');
INSERT INTO `encuestahaspregunta` VALUES ('27', '19');
INSERT INTO `encuestahaspregunta` VALUES ('12', '20');
INSERT INTO `encuestahaspregunta` VALUES ('13', '20');
INSERT INTO `encuestahaspregunta` VALUES ('14', '20');
INSERT INTO `encuestahaspregunta` VALUES ('15', '20');
INSERT INTO `encuestahaspregunta` VALUES ('18', '20');
INSERT INTO `encuestahaspregunta` VALUES ('19', '20');
INSERT INTO `encuestahaspregunta` VALUES ('20', '20');
INSERT INTO `encuestahaspregunta` VALUES ('21', '20');
INSERT INTO `encuestahaspregunta` VALUES ('24', '20');
INSERT INTO `encuestahaspregunta` VALUES ('26', '20');
INSERT INTO `encuestahaspregunta` VALUES ('27', '20');
INSERT INTO `encuestahaspregunta` VALUES ('28', '20');
INSERT INTO `encuestahaspregunta` VALUES ('12', '21');
INSERT INTO `encuestahaspregunta` VALUES ('13', '21');
INSERT INTO `encuestahaspregunta` VALUES ('14', '21');
INSERT INTO `encuestahaspregunta` VALUES ('15', '21');
INSERT INTO `encuestahaspregunta` VALUES ('18', '21');
INSERT INTO `encuestahaspregunta` VALUES ('19', '21');
INSERT INTO `encuestahaspregunta` VALUES ('20', '21');
INSERT INTO `encuestahaspregunta` VALUES ('21', '21');
INSERT INTO `encuestahaspregunta` VALUES ('24', '21');
INSERT INTO `encuestahaspregunta` VALUES ('26', '21');
INSERT INTO `encuestahaspregunta` VALUES ('27', '21');
INSERT INTO `encuestahaspregunta` VALUES ('28', '21');
INSERT INTO `encuestahaspregunta` VALUES ('1', '22');
INSERT INTO `encuestahaspregunta` VALUES ('2', '22');
INSERT INTO `encuestahaspregunta` VALUES ('3', '22');
INSERT INTO `encuestahaspregunta` VALUES ('4', '22');
INSERT INTO `encuestahaspregunta` VALUES ('5', '22');
INSERT INTO `encuestahaspregunta` VALUES ('6', '22');
INSERT INTO `encuestahaspregunta` VALUES ('12', '22');
INSERT INTO `encuestahaspregunta` VALUES ('13', '22');
INSERT INTO `encuestahaspregunta` VALUES ('14', '22');
INSERT INTO `encuestahaspregunta` VALUES ('15', '22');
INSERT INTO `encuestahaspregunta` VALUES ('24', '22');
INSERT INTO `encuestahaspregunta` VALUES ('26', '22');
INSERT INTO `encuestahaspregunta` VALUES ('27', '22');
INSERT INTO `encuestahaspregunta` VALUES ('28', '22');
INSERT INTO `encuestahaspregunta` VALUES ('12', '23');
INSERT INTO `encuestahaspregunta` VALUES ('24', '23');
INSERT INTO `encuestahaspregunta` VALUES ('18', '24');
INSERT INTO `encuestahaspregunta` VALUES ('13', '25');
INSERT INTO `encuestahaspregunta` VALUES ('14', '25');
INSERT INTO `encuestahaspregunta` VALUES ('26', '25');
INSERT INTO `encuestahaspregunta` VALUES ('27', '25');
INSERT INTO `encuestahaspregunta` VALUES ('4', '26');
INSERT INTO `encuestahaspregunta` VALUES ('1', '27');
INSERT INTO `encuestahaspregunta` VALUES ('2', '27');
INSERT INTO `encuestahaspregunta` VALUES ('3', '27');
INSERT INTO `encuestahaspregunta` VALUES ('4', '27');
INSERT INTO `encuestahaspregunta` VALUES ('5', '27');
INSERT INTO `encuestahaspregunta` VALUES ('6', '27');
INSERT INTO `encuestahaspregunta` VALUES ('12', '27');
INSERT INTO `encuestahaspregunta` VALUES ('13', '27');
INSERT INTO `encuestahaspregunta` VALUES ('14', '27');
INSERT INTO `encuestahaspregunta` VALUES ('15', '27');
INSERT INTO `encuestahaspregunta` VALUES ('1', '28');
INSERT INTO `encuestahaspregunta` VALUES ('4', '28');
INSERT INTO `encuestahaspregunta` VALUES ('5', '28');
INSERT INTO `encuestahaspregunta` VALUES ('6', '28');
INSERT INTO `encuestahaspregunta` VALUES ('1', '29');
INSERT INTO `encuestahaspregunta` VALUES ('4', '29');
INSERT INTO `encuestahaspregunta` VALUES ('5', '29');
INSERT INTO `encuestahaspregunta` VALUES ('6', '29');
INSERT INTO `encuestahaspregunta` VALUES ('8', '30');
INSERT INTO `encuestahaspregunta` VALUES ('9', '30');
INSERT INTO `encuestahaspregunta` VALUES ('10', '30');
INSERT INTO `encuestahaspregunta` VALUES ('11', '30');
INSERT INTO `encuestahaspregunta` VALUES ('17', '30');
INSERT INTO `encuestahaspregunta` VALUES ('23', '30');
INSERT INTO `encuestahaspregunta` VALUES ('30', '30');
INSERT INTO `encuestahaspregunta` VALUES ('11', '31');
INSERT INTO `encuestahaspregunta` VALUES ('1', '32');
INSERT INTO `encuestahaspregunta` VALUES ('2', '32');
INSERT INTO `encuestahaspregunta` VALUES ('3', '32');
INSERT INTO `encuestahaspregunta` VALUES ('4', '32');
INSERT INTO `encuestahaspregunta` VALUES ('5', '32');
INSERT INTO `encuestahaspregunta` VALUES ('12', '32');
INSERT INTO `encuestahaspregunta` VALUES ('13', '32');
INSERT INTO `encuestahaspregunta` VALUES ('14', '32');
INSERT INTO `encuestahaspregunta` VALUES ('24', '32');
INSERT INTO `encuestahaspregunta` VALUES ('26', '32');
INSERT INTO `encuestahaspregunta` VALUES ('27', '32');
INSERT INTO `encuestahaspregunta` VALUES ('4', '33');
INSERT INTO `encuestahaspregunta` VALUES ('5', '33');
INSERT INTO `encuestahaspregunta` VALUES ('12', '34');
INSERT INTO `encuestahaspregunta` VALUES ('13', '34');
INSERT INTO `encuestahaspregunta` VALUES ('14', '34');
INSERT INTO `encuestahaspregunta` VALUES ('15', '34');
INSERT INTO `encuestahaspregunta` VALUES ('18', '34');
INSERT INTO `encuestahaspregunta` VALUES ('19', '34');
INSERT INTO `encuestahaspregunta` VALUES ('20', '34');
INSERT INTO `encuestahaspregunta` VALUES ('21', '34');
INSERT INTO `encuestahaspregunta` VALUES ('24', '34');
INSERT INTO `encuestahaspregunta` VALUES ('26', '34');
INSERT INTO `encuestahaspregunta` VALUES ('27', '34');
INSERT INTO `encuestahaspregunta` VALUES ('28', '34');
INSERT INTO `encuestahaspregunta` VALUES ('1', '35');
INSERT INTO `encuestahaspregunta` VALUES ('2', '35');
INSERT INTO `encuestahaspregunta` VALUES ('3', '35');
INSERT INTO `encuestahaspregunta` VALUES ('4', '35');
INSERT INTO `encuestahaspregunta` VALUES ('5', '35');
INSERT INTO `encuestahaspregunta` VALUES ('6', '35');
INSERT INTO `encuestahaspregunta` VALUES ('12', '35');
INSERT INTO `encuestahaspregunta` VALUES ('13', '35');
INSERT INTO `encuestahaspregunta` VALUES ('14', '35');
INSERT INTO `encuestahaspregunta` VALUES ('15', '35');
INSERT INTO `encuestahaspregunta` VALUES ('18', '35');
INSERT INTO `encuestahaspregunta` VALUES ('19', '35');
INSERT INTO `encuestahaspregunta` VALUES ('20', '35');
INSERT INTO `encuestahaspregunta` VALUES ('21', '35');
INSERT INTO `encuestahaspregunta` VALUES ('24', '35');
INSERT INTO `encuestahaspregunta` VALUES ('26', '35');
INSERT INTO `encuestahaspregunta` VALUES ('27', '35');
INSERT INTO `encuestahaspregunta` VALUES ('28', '35');
INSERT INTO `encuestahaspregunta` VALUES ('12', '36');
INSERT INTO `encuestahaspregunta` VALUES ('1', '37');
INSERT INTO `encuestahaspregunta` VALUES ('2', '37');
INSERT INTO `encuestahaspregunta` VALUES ('3', '37');
INSERT INTO `encuestahaspregunta` VALUES ('4', '37');
INSERT INTO `encuestahaspregunta` VALUES ('5', '37');
INSERT INTO `encuestahaspregunta` VALUES ('18', '37');
INSERT INTO `encuestahaspregunta` VALUES ('19', '37');
INSERT INTO `encuestahaspregunta` VALUES ('20', '37');
INSERT INTO `encuestahaspregunta` VALUES ('21', '37');
INSERT INTO `encuestahaspregunta` VALUES ('24', '37');
INSERT INTO `encuestahaspregunta` VALUES ('26', '37');
INSERT INTO `encuestahaspregunta` VALUES ('27', '37');
INSERT INTO `encuestahaspregunta` VALUES ('18', '38');
INSERT INTO `encuestahaspregunta` VALUES ('19', '38');
INSERT INTO `encuestahaspregunta` VALUES ('20', '38');
INSERT INTO `encuestahaspregunta` VALUES ('21', '38');
INSERT INTO `encuestahaspregunta` VALUES ('1', '39');
INSERT INTO `encuestahaspregunta` VALUES ('8', '40');
INSERT INTO `encuestahaspregunta` VALUES ('9', '40');
INSERT INTO `encuestahaspregunta` VALUES ('10', '40');
INSERT INTO `encuestahaspregunta` VALUES ('17', '40');
INSERT INTO `encuestahaspregunta` VALUES ('23', '40');
INSERT INTO `encuestahaspregunta` VALUES ('30', '40');
INSERT INTO `encuestahaspregunta` VALUES ('18', '41');
INSERT INTO `encuestahaspregunta` VALUES ('19', '41');
INSERT INTO `encuestahaspregunta` VALUES ('20', '41');
INSERT INTO `encuestahaspregunta` VALUES ('21', '41');
INSERT INTO `encuestahaspregunta` VALUES ('4', '42');
INSERT INTO `encuestahaspregunta` VALUES ('6', '42');
INSERT INTO `encuestahaspregunta` VALUES ('10', '43');
INSERT INTO `encuestahaspregunta` VALUES ('18', '43');
INSERT INTO `encuestahaspregunta` VALUES ('19', '43');
INSERT INTO `encuestahaspregunta` VALUES ('23', '43');
INSERT INTO `encuestahaspregunta` VALUES ('1', '44');
INSERT INTO `encuestahaspregunta` VALUES ('2', '44');
INSERT INTO `encuestahaspregunta` VALUES ('3', '44');
INSERT INTO `encuestahaspregunta` VALUES ('4', '44');
INSERT INTO `encuestahaspregunta` VALUES ('5', '44');
INSERT INTO `encuestahaspregunta` VALUES ('6', '44');
INSERT INTO `encuestahaspregunta` VALUES ('7', '44');
INSERT INTO `encuestahaspregunta` VALUES ('12', '44');
INSERT INTO `encuestahaspregunta` VALUES ('13', '44');
INSERT INTO `encuestahaspregunta` VALUES ('14', '44');
INSERT INTO `encuestahaspregunta` VALUES ('15', '44');
INSERT INTO `encuestahaspregunta` VALUES ('16', '44');
INSERT INTO `encuestahaspregunta` VALUES ('18', '44');
INSERT INTO `encuestahaspregunta` VALUES ('19', '44');
INSERT INTO `encuestahaspregunta` VALUES ('20', '44');
INSERT INTO `encuestahaspregunta` VALUES ('21', '44');
INSERT INTO `encuestahaspregunta` VALUES ('22', '44');
INSERT INTO `encuestahaspregunta` VALUES ('24', '44');
INSERT INTO `encuestahaspregunta` VALUES ('26', '44');
INSERT INTO `encuestahaspregunta` VALUES ('27', '44');
INSERT INTO `encuestahaspregunta` VALUES ('28', '44');
INSERT INTO `encuestahaspregunta` VALUES ('29', '44');
INSERT INTO `encuestahaspregunta` VALUES ('1', '45');
INSERT INTO `encuestahaspregunta` VALUES ('2', '45');
INSERT INTO `encuestahaspregunta` VALUES ('3', '45');
INSERT INTO `encuestahaspregunta` VALUES ('4', '45');
INSERT INTO `encuestahaspregunta` VALUES ('5', '45');
INSERT INTO `encuestahaspregunta` VALUES ('6', '45');
INSERT INTO `encuestahaspregunta` VALUES ('7', '45');
INSERT INTO `encuestahaspregunta` VALUES ('12', '45');
INSERT INTO `encuestahaspregunta` VALUES ('13', '45');
INSERT INTO `encuestahaspregunta` VALUES ('14', '45');
INSERT INTO `encuestahaspregunta` VALUES ('15', '45');
INSERT INTO `encuestahaspregunta` VALUES ('16', '45');
INSERT INTO `encuestahaspregunta` VALUES ('18', '45');
INSERT INTO `encuestahaspregunta` VALUES ('19', '45');
INSERT INTO `encuestahaspregunta` VALUES ('20', '45');
INSERT INTO `encuestahaspregunta` VALUES ('21', '45');
INSERT INTO `encuestahaspregunta` VALUES ('22', '45');
INSERT INTO `encuestahaspregunta` VALUES ('24', '45');
INSERT INTO `encuestahaspregunta` VALUES ('26', '45');
INSERT INTO `encuestahaspregunta` VALUES ('27', '45');
INSERT INTO `encuestahaspregunta` VALUES ('28', '45');
INSERT INTO `encuestahaspregunta` VALUES ('29', '45');
INSERT INTO `encuestahaspregunta` VALUES ('16', '46');
INSERT INTO `encuestahaspregunta` VALUES ('7', '47');
INSERT INTO `encuestahaspregunta` VALUES ('12', '48');
INSERT INTO `encuestahaspregunta` VALUES ('13', '48');
INSERT INTO `encuestahaspregunta` VALUES ('14', '48');
INSERT INTO `encuestahaspregunta` VALUES ('1', '49');
INSERT INTO `encuestahaspregunta` VALUES ('2', '49');
INSERT INTO `encuestahaspregunta` VALUES ('3', '49');
INSERT INTO `encuestahaspregunta` VALUES ('4', '49');
INSERT INTO `encuestahaspregunta` VALUES ('5', '49');
INSERT INTO `encuestahaspregunta` VALUES ('6', '49');
INSERT INTO `encuestahaspregunta` VALUES ('7', '49');
INSERT INTO `encuestahaspregunta` VALUES ('12', '49');
INSERT INTO `encuestahaspregunta` VALUES ('13', '49');
INSERT INTO `encuestahaspregunta` VALUES ('14', '49');
INSERT INTO `encuestahaspregunta` VALUES ('15', '49');
INSERT INTO `encuestahaspregunta` VALUES ('16', '49');
INSERT INTO `encuestahaspregunta` VALUES ('18', '49');
INSERT INTO `encuestahaspregunta` VALUES ('19', '49');
INSERT INTO `encuestahaspregunta` VALUES ('20', '49');
INSERT INTO `encuestahaspregunta` VALUES ('21', '49');
INSERT INTO `encuestahaspregunta` VALUES ('22', '49');
INSERT INTO `encuestahaspregunta` VALUES ('24', '49');
INSERT INTO `encuestahaspregunta` VALUES ('26', '49');
INSERT INTO `encuestahaspregunta` VALUES ('27', '49');
INSERT INTO `encuestahaspregunta` VALUES ('28', '49');
INSERT INTO `encuestahaspregunta` VALUES ('29', '49');
INSERT INTO `encuestahaspregunta` VALUES ('12', '51');
INSERT INTO `encuestahaspregunta` VALUES ('13', '51');
INSERT INTO `encuestahaspregunta` VALUES ('14', '51');
INSERT INTO `encuestahaspregunta` VALUES ('8', '52');
INSERT INTO `encuestahaspregunta` VALUES ('17', '52');
INSERT INTO `encuestahaspregunta` VALUES ('11', '53');
INSERT INTO `encuestahaspregunta` VALUES ('8', '54');
INSERT INTO `encuestahaspregunta` VALUES ('9', '54');
INSERT INTO `encuestahaspregunta` VALUES ('10', '54');
INSERT INTO `encuestahaspregunta` VALUES ('17', '54');
INSERT INTO `encuestahaspregunta` VALUES ('19', '54');
INSERT INTO `encuestahaspregunta` VALUES ('23', '54');
INSERT INTO `encuestahaspregunta` VALUES ('30', '54');
INSERT INTO `encuestahaspregunta` VALUES ('13', '55');
INSERT INTO `encuestahaspregunta` VALUES ('15', '55');
INSERT INTO `encuestahaspregunta` VALUES ('19', '55');

-- ----------------------------
-- Table structure for estudiante
-- ----------------------------
DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante` (
  `id` varchar(25) NOT NULL,
  `semestre` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `anio` varchar(45) NOT NULL,
  `persona_id` varchar(25) NOT NULL,
  `fuente_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estudiante_fuente1_idx` (`fuente_id`),
  KEY `fk_estudiante_programa1_idx` (`programa_id`),
  KEY `fk_estudiante_persona1_idx` (`persona_id`),
  CONSTRAINT `fk_estudiante_fuente1` FOREIGN KEY (`fuente_id`) REFERENCES `fuente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudiante_persona1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudiante_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estudiante
-- ----------------------------

-- ----------------------------
-- Table structure for factor
-- ----------------------------
DROP TABLE IF EXISTS `factor`;
CREATE TABLE `factor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_factor_modelo1_idx` (`modelo_id`),
  CONSTRAINT `fk_factor_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factor
-- ----------------------------
INSERT INTO `factor` VALUES ('1', '1', 'Misión y Proyecto Institucional', '1');
INSERT INTO `factor` VALUES ('2', '2', 'Estudiantes', '1');
INSERT INTO `factor` VALUES ('3', '3', 'Profesores', '1');
INSERT INTO `factor` VALUES ('4', '4', 'Procesos Académicos', '1');
INSERT INTO `factor` VALUES ('5', '5', 'Visibilidad Nacional e Internacional', '1');
INSERT INTO `factor` VALUES ('6', '6', 'Investigación y Creación Artística', '1');
INSERT INTO `factor` VALUES ('7', '7', 'Pertinencia e Impacto Social', '1');
INSERT INTO `factor` VALUES ('8', '8', 'Procesos de Autoevaluación y Autorregulación', '1');
INSERT INTO `factor` VALUES ('9', '9', 'Bienestar Institucional', '1');
INSERT INTO `factor` VALUES ('10', '10', 'Organización, Gestión y Administración', '1');
INSERT INTO `factor` VALUES ('11', '11', 'Recursos de Apoyo Académico e Infraestructura Física', '1');
INSERT INTO `factor` VALUES ('12', '12', 'Recursos Financieros', '1');

-- ----------------------------
-- Table structure for facultad
-- ----------------------------
DROP TABLE IF EXISTS `facultad`;
CREATE TABLE `facultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facultad
-- ----------------------------
INSERT INTO `facultad` VALUES ('1', 'Facultad de Administración', 'Facultad de Administración');
INSERT INTO `facultad` VALUES ('2', 'Facultad de Oceanografía Física', 'Facultad de Oceanografía Física');
INSERT INTO `facultad` VALUES ('3', 'Facultad de Ciencias Navales', 'Facultad de Ciencias Navales');
INSERT INTO `facultad` VALUES ('4', 'Facultad de Infantería de Marina', 'Facultad de Infantería de Marina');
INSERT INTO `facultad` VALUES ('5', 'Facultad de Ingeniería', 'Facultad de Ingeniería');
INSERT INTO `facultad` VALUES ('100', 'INSTITUCIONAL', 'INSTITUCIONAL');

-- ----------------------------
-- Table structure for fuente
-- ----------------------------
DROP TABLE IF EXISTS `fuente`;
CREATE TABLE `fuente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fuente
-- ----------------------------
INSERT INTO `fuente` VALUES ('1', 'Estudiantes pregrado', 'Estudiantes pregrado');
INSERT INTO `fuente` VALUES ('2', 'Docentes planta', 'Docentes planta');
INSERT INTO `fuente` VALUES ('3', 'Administrativos', 'Administrativos');
INSERT INTO `fuente` VALUES ('4', 'Egresados pregrado', 'Egresados pregrado');
INSERT INTO `fuente` VALUES ('5', 'Directivos', 'Directivos');
INSERT INTO `fuente` VALUES ('6', 'Empleadores', 'Empleadores');
INSERT INTO `fuente` VALUES ('7', 'Estudiantes especialización', 'Estudiantes especialización');
INSERT INTO `fuente` VALUES ('8', 'Estudiantes maestria-doctorado', 'Estudiantes maestria-doctorado');
INSERT INTO `fuente` VALUES ('9', 'Egresados especializacion', 'Egresados especializacion');
INSERT INTO `fuente` VALUES ('10', 'Egresados maestria-doctorado', 'Egresados maestria-doctorado');
INSERT INTO `fuente` VALUES ('11', 'Docentes catedra', 'Docentes catedra');

-- ----------------------------
-- Table structure for glosario
-- ----------------------------
DROP TABLE IF EXISTS `glosario`;
CREATE TABLE `glosario` (
  `idglosario` int(11) NOT NULL AUTO_INCREMENT,
  `palabra` varchar(50) DEFAULT NULL,
  `significado` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idglosario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of glosario
-- ----------------------------

-- ----------------------------
-- Table structure for hallazgo
-- ----------------------------
DROP TABLE IF EXISTS `hallazgo`;
CREATE TABLE `hallazgo` (
  `idhallazgo` int(11) NOT NULL AUTO_INCREMENT,
  `hallazgo` varchar(3000) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `proceso_id` int(11) NOT NULL,
  `caracteristica_id` int(11) NOT NULL,
  PRIMARY KEY (`idhallazgo`),
  KEY `fk_hallazgo_proceso1` (`proceso_id`),
  KEY `fk_hallazgo_caracteristica1` (`caracteristica_id`),
  CONSTRAINT `fk_hallazgo_caracteristica1` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hallazgo_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hallazgo
-- ----------------------------

-- ----------------------------
-- Table structure for indicador
-- ----------------------------
DROP TABLE IF EXISTS `indicador`;
CREATE TABLE `indicador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(2000) NOT NULL,
  `caracteristica_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indicador_caracteristica1_idx` (`caracteristica_id`),
  KEY `fk_indicador_modelo1` (`modelo_id`),
  CONSTRAINT `fk_indicador_caracteristica1` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_indicador_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indicador
-- ----------------------------

-- ----------------------------
-- Table structure for instrumento
-- ----------------------------
DROP TABLE IF EXISTS `instrumento`;
CREATE TABLE `instrumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instrumento
-- ----------------------------

-- ----------------------------
-- Table structure for instrumentohasindicador
-- ----------------------------
DROP TABLE IF EXISTS `instrumentohasindicador`;
CREATE TABLE `instrumentohasindicador` (
  `instrumento_id` int(11) NOT NULL,
  `indicador_id` int(11) NOT NULL,
  PRIMARY KEY (`instrumento_id`,`indicador_id`),
  KEY `fk_instrumento_has_indicador_indicador1` (`indicador_id`),
  KEY `fk_instrumento_has_indicador_instrumento1` (`instrumento_id`),
  CONSTRAINT `fk_instrumento_has_indicador_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_instrumento_has_indicador_instrumento1` FOREIGN KEY (`instrumento_id`) REFERENCES `instrumento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instrumentohasindicador
-- ----------------------------

-- ----------------------------
-- Table structure for metas
-- ----------------------------
DROP TABLE IF EXISTS `metas`;
CREATE TABLE `metas` (
  `idmeta` int(11) NOT NULL AUTO_INCREMENT,
  `estrategia` varchar(2000) DEFAULT NULL,
  `meta` varchar(2000) DEFAULT NULL,
  `indicador_cumplimiento` varchar(2000) DEFAULT NULL,
  `responsable` varchar(2000) DEFAULT NULL,
  `financiacion` varchar(2000) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `porcentaje_cumplimiento` int(11) DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `estado_interno` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `fecha_seguimiento` date DEFAULT NULL,
  `correos` varchar(1000) DEFAULT NULL,
  `continuar_envio` varchar(45) DEFAULT NULL,
  `enviar_correo_cada` varchar(45) DEFAULT NULL,
  `objetivos_idobjetivos` int(11) NOT NULL,
  PRIMARY KEY (`idmeta`),
  KEY `fk_metas_objetivos1` (`objetivos_idobjetivos`),
  CONSTRAINT `fk_metas_objetivos1` FOREIGN KEY (`objetivos_idobjetivos`) REFERENCES `objetivos` (`idobjetivos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of metas
-- ----------------------------

-- ----------------------------
-- Table structure for modelo
-- ----------------------------
DROP TABLE IF EXISTS `modelo`;
CREATE TABLE `modelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fechaactualizacion` int(11) DEFAULT NULL,
  `fechacreacion` date NOT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modelo
-- ----------------------------
INSERT INTO `modelo` VALUES ('1', 'Modelo de Autoevaluación Institucional', 'Modelo de Autoevaluación Institucional de la Escuela Naval de Cadetes Almirante Padilla', null, '2016-01-15', null);
INSERT INTO `modelo` VALUES ('2', 'Modelo de Autoevaluación de Programas de Pregrado', 'Modelo de Autoevaluación de Programas de Pregrado de la Escuela Naval de Cadetes Almirante Padilla', null, '2016-01-15', '');
INSERT INTO `modelo` VALUES ('3', 'Modelo de Autoevaluación de Programas de MAESTRIA Y DOCTORADO', 'Modelo de Autoevaluación de Programas de MAESTRIA Y DOCTORADO de la Escuela Naval de Cadetes Almirante Padilla', null, '2016-01-15', '');
INSERT INTO `modelo` VALUES ('4', 'Modelo de Autoevaluación de Programas de ESPECIALIZACIÓN', 'Modelo de Autoevaluación de Programas de ESPECIALIZACIÓN de la Escuela Naval de Cadetes Almirante Padilla', null, '2016-01-15', '');

-- ----------------------------
-- Table structure for muestra
-- ----------------------------
DROP TABLE IF EXISTS `muestra`;
CREATE TABLE `muestra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formula` varchar(500) DEFAULT NULL,
  `proceso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestra_proceso1_idx` (`proceso_id`),
  CONSTRAINT `fk_muestra_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestra
-- ----------------------------

-- ----------------------------
-- Table structure for muestraadministrativo
-- ----------------------------
DROP TABLE IF EXISTS `muestraadministrativo`;
CREATE TABLE `muestraadministrativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) DEFAULT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraadministrativo_muestrapersona1` (`muestrapersona_id`),
  CONSTRAINT `fk_muestraadministrativo_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestraadministrativo
-- ----------------------------

-- ----------------------------
-- Table structure for muestraagencia
-- ----------------------------
DROP TABLE IF EXISTS `muestraagencia`;
CREATE TABLE `muestraagencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraagencia_muestrapersona1` (`muestrapersona_id`),
  CONSTRAINT `fk_muestraagencia_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestraagencia
-- ----------------------------

-- ----------------------------
-- Table structure for muestradirector
-- ----------------------------
DROP TABLE IF EXISTS `muestradirector`;
CREATE TABLE `muestradirector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestradirector_muestrapersona1` (`muestrapersona_id`),
  CONSTRAINT `fk_muestradirector_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestradirector
-- ----------------------------

-- ----------------------------
-- Table structure for muestradocente
-- ----------------------------
DROP TABLE IF EXISTS `muestradocente`;
CREATE TABLE `muestradocente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestradocente_muestrapersona1` (`muestrapersona_id`),
  CONSTRAINT `fk_muestradocente_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestradocente
-- ----------------------------

-- ----------------------------
-- Table structure for muestraegresado
-- ----------------------------
DROP TABLE IF EXISTS `muestraegresado`;
CREATE TABLE `muestraegresado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `muestrapersona_id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraegresado_muestrapersona1` (`muestrapersona_id`),
  CONSTRAINT `fk_muestraegresado_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestraegresado
-- ----------------------------

-- ----------------------------
-- Table structure for muestraempleador
-- ----------------------------
DROP TABLE IF EXISTS `muestraempleador`;
CREATE TABLE `muestraempleador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraempleador_muestrapersona1` (`muestrapersona_id`),
  CONSTRAINT `fk_muestraempleador_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestraempleador
-- ----------------------------

-- ----------------------------
-- Table structure for muestraestudiante
-- ----------------------------
DROP TABLE IF EXISTS `muestraestudiante`;
CREATE TABLE `muestraestudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `semestre` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `anio` varchar(45) NOT NULL,
  `muestrapersona_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestraestudiante_muestrapersona1` (`muestrapersona_id`),
  KEY `fk_muestraestudiante_programa1` (`programa_id`),
  CONSTRAINT `fk_muestraestudiante_muestrapersona1` FOREIGN KEY (`muestrapersona_id`) REFERENCES `muestrapersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_muestraestudiante_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestraestudiante
-- ----------------------------

-- ----------------------------
-- Table structure for muestrapersona
-- ----------------------------
DROP TABLE IF EXISTS `muestrapersona`;
CREATE TABLE `muestrapersona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `muestra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_muestrapersona_muestra1_idx` (`muestra_id`),
  CONSTRAINT `fk_muestrapersona_muestra1` FOREIGN KEY (`muestra_id`) REFERENCES `muestra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of muestrapersona
-- ----------------------------

-- ----------------------------
-- Table structure for numericadocumental
-- ----------------------------
DROP TABLE IF EXISTS `numericadocumental`;
CREATE TABLE `numericadocumental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(2000) DEFAULT NULL,
  `responsable` varchar(2000) DEFAULT NULL,
  `medio` varchar(2000) DEFAULT NULL,
  `lugar` varchar(2000) DEFAULT NULL,
  `evaluacion` int(11) DEFAULT NULL,
  `accion` varchar(2000) DEFAULT NULL,
  `proceso_id` int(11) NOT NULL,
  `instrumento_id` int(11) NOT NULL,
  `indicador_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_numericadocumental_proceso1_idx` (`proceso_id`),
  KEY `fk_numericadocumental_instrumento1` (`instrumento_id`),
  KEY `fk_numericadocumental_indicador1` (`indicador_id`),
  CONSTRAINT `fk_numericadocumental_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_numericadocumental_instrumento1` FOREIGN KEY (`instrumento_id`) REFERENCES `instrumento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_numericadocumental_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of numericadocumental
-- ----------------------------

-- ----------------------------
-- Table structure for objetivos
-- ----------------------------
DROP TABLE IF EXISTS `objetivos`;
CREATE TABLE `objetivos` (
  `idobjetivos` int(11) NOT NULL AUTO_INCREMENT,
  `objetivo` varchar(2000) DEFAULT NULL,
  `hallazgo_idhallazgo` int(11) NOT NULL,
  PRIMARY KEY (`idobjetivos`),
  KEY `fk_objetivos_hallazgo1` (`hallazgo_idhallazgo`),
  CONSTRAINT `fk_objetivos_hallazgo1` FOREIGN KEY (`hallazgo_idhallazgo`) REFERENCES `hallazgo` (`idhallazgo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of objetivos
-- ----------------------------

-- ----------------------------
-- Table structure for participante
-- ----------------------------
DROP TABLE IF EXISTS `participante`;
CREATE TABLE `participante` (
  `idparticipante` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) NOT NULL,
  PRIMARY KEY (`idparticipante`),
  KEY `fk_participante_proceso1_idx` (`proceso_id`),
  CONSTRAINT `fk_participante_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participante
-- ----------------------------
INSERT INTO `participante` VALUES ('5', '1');
INSERT INTO `participante` VALUES ('6', '1');
INSERT INTO `participante` VALUES ('7', '1');
INSERT INTO `participante` VALUES ('8', '1');

-- ----------------------------
-- Table structure for participante_has_rol
-- ----------------------------
DROP TABLE IF EXISTS `participante_has_rol`;
CREATE TABLE `participante_has_rol` (
  `participante_has_rolcol` int(11) NOT NULL AUTO_INCREMENT,
  `participante_idparticipante` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `programa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`participante_has_rolcol`),
  KEY `fk_participante_has_rol_rol1_idx` (`rol_id`),
  KEY `fk_participante_has_rol_participante1_idx` (`participante_idparticipante`),
  KEY `fk_participante_has_rol_programa1_idx` (`programa_id`),
  CONSTRAINT `fk_participante_has_rol_participante1` FOREIGN KEY (`participante_idparticipante`) REFERENCES `participante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participante_has_rol_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_participante_has_rol_rol1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participante_has_rol
-- ----------------------------
INSERT INTO `participante_has_rol` VALUES ('8', '5', '8', '731');
INSERT INTO `participante_has_rol` VALUES ('9', '5', '4', '721');
INSERT INTO `participante_has_rol` VALUES ('10', '6', '1', '721');
INSERT INTO `participante_has_rol` VALUES ('11', '7', '1', '720');
INSERT INTO `participante_has_rol` VALUES ('12', '8', '1', '721');

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id` varchar(25) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persona
-- ----------------------------

-- ----------------------------
-- Table structure for ponderacioncaracteristica
-- ----------------------------
DROP TABLE IF EXISTS `ponderacioncaracteristica`;
CREATE TABLE `ponderacioncaracteristica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivelimportancia` float NOT NULL,
  `ponderacion` double NOT NULL,
  `justificacion` varchar(2000) NOT NULL,
  `proceso_id` int(11) NOT NULL,
  `caracteristica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ponderacioncaracteristica_proceso1_idx` (`proceso_id`),
  KEY `fk_ponderacioncaracteristica_caracteristica1_idx` (`caracteristica_id`),
  CONSTRAINT `fk_ponderacioncaracteristica_caracteristica1` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ponderacioncaracteristica_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ponderacioncaracteristica
-- ----------------------------
INSERT INTO `ponderacioncaracteristica` VALUES ('1', '10', '2.67', 'x', '1', '1');
INSERT INTO `ponderacioncaracteristica` VALUES ('2', '10', '2.67', 'x', '1', '2');
INSERT INTO `ponderacioncaracteristica` VALUES ('3', '10', '2.67', 'x', '1', '3');
INSERT INTO `ponderacioncaracteristica` VALUES ('4', '10', '2.67', 'x', '1', '4');
INSERT INTO `ponderacioncaracteristica` VALUES ('5', '10', '2.67', 'x', '1', '5');
INSERT INTO `ponderacioncaracteristica` VALUES ('6', '10', '2.67', 'x', '1', '6');
INSERT INTO `ponderacioncaracteristica` VALUES ('7', '10', '1.6', 'x', '1', '7');
INSERT INTO `ponderacioncaracteristica` VALUES ('8', '10', '1.6', 'x', '1', '8');
INSERT INTO `ponderacioncaracteristica` VALUES ('9', '10', '1.6', 'x', '1', '9');
INSERT INTO `ponderacioncaracteristica` VALUES ('10', '10', '1.6', 'x', '1', '10');
INSERT INTO `ponderacioncaracteristica` VALUES ('11', '10', '1.6', 'x', '1', '11');
INSERT INTO `ponderacioncaracteristica` VALUES ('12', '10', '2.67', 'x', '1', '12');
INSERT INTO `ponderacioncaracteristica` VALUES ('13', '10', '2.67', 'x', '1', '13');
INSERT INTO `ponderacioncaracteristica` VALUES ('14', '10', '2.67', 'x', '1', '14');
INSERT INTO `ponderacioncaracteristica` VALUES ('15', '10', '4', 'x', '1', '15');
INSERT INTO `ponderacioncaracteristica` VALUES ('16', '10', '4', 'x', '1', '16');
INSERT INTO `ponderacioncaracteristica` VALUES ('17', '10', '4', 'x', '1', '17');
INSERT INTO `ponderacioncaracteristica` VALUES ('18', '10', '4', 'x', '1', '18');
INSERT INTO `ponderacioncaracteristica` VALUES ('19', '10', '4', 'x', '1', '19');
INSERT INTO `ponderacioncaracteristica` VALUES ('20', '10', '4', 'x', '1', '20');
INSERT INTO `ponderacioncaracteristica` VALUES ('21', '10', '2.67', 'x', '1', '21');
INSERT INTO `ponderacioncaracteristica` VALUES ('22', '10', '2.67', 'x', '1', '22');
INSERT INTO `ponderacioncaracteristica` VALUES ('23', '10', '2.67', 'x', '1', '23');
INSERT INTO `ponderacioncaracteristica` VALUES ('24', '10', '8', 'x', '1', '24');
INSERT INTO `ponderacioncaracteristica` VALUES ('25', '10', '2.67', 'x', '1', '25');
INSERT INTO `ponderacioncaracteristica` VALUES ('26', '10', '2.67', 'x', '1', '26');
INSERT INTO `ponderacioncaracteristica` VALUES ('27', '10', '2.67', 'x', '1', '27');
INSERT INTO `ponderacioncaracteristica` VALUES ('28', '10', '4', 'x', '1', '28');
INSERT INTO `ponderacioncaracteristica` VALUES ('29', '10', '4', 'x', '1', '29');
INSERT INTO `ponderacioncaracteristica` VALUES ('30', '10', '12', 'x', '1', '30');

-- ----------------------------
-- Table structure for ponderacionfactor
-- ----------------------------
DROP TABLE IF EXISTS `ponderacionfactor`;
CREATE TABLE `ponderacionfactor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ponderacion` double NOT NULL,
  `justificacion` varchar(2000) NOT NULL,
  `proceso_id` int(11) NOT NULL,
  `factor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ponderacionfactor_proceso1_idx` (`proceso_id`),
  KEY `fk_ponderacionfactor_factor1_idx` (`factor_id`),
  CONSTRAINT `fk_ponderacionfactor_factor1` FOREIGN KEY (`factor_id`) REFERENCES `factor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ponderacionfactor_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ponderacionfactor
-- ----------------------------
INSERT INTO `ponderacionfactor` VALUES ('1', '8', 'x', '1', '1');
INSERT INTO `ponderacionfactor` VALUES ('2', '8', 'x', '1', '2');
INSERT INTO `ponderacionfactor` VALUES ('3', '8', 'x', '1', '3');
INSERT INTO `ponderacionfactor` VALUES ('4', '8', 'x', '1', '4');
INSERT INTO `ponderacionfactor` VALUES ('5', '8', 'x', '1', '5');
INSERT INTO `ponderacionfactor` VALUES ('6', '8', 'x', '1', '6');
INSERT INTO `ponderacionfactor` VALUES ('7', '8', 'x', '1', '7');
INSERT INTO `ponderacionfactor` VALUES ('8', '8', 'x', '1', '8');
INSERT INTO `ponderacionfactor` VALUES ('9', '8', 'x', '1', '9');
INSERT INTO `ponderacionfactor` VALUES ('10', '8', 'x', '1', '10');
INSERT INTO `ponderacionfactor` VALUES ('11', '8', 'x', '1', '11');
INSERT INTO `ponderacionfactor` VALUES ('12', '12', 'x', '1', '12');

-- ----------------------------
-- Table structure for ponderacionindicador
-- ----------------------------
DROP TABLE IF EXISTS `ponderacionindicador`;
CREATE TABLE `ponderacionindicador` (
  `idponderacionindicador` int(11) NOT NULL AUTO_INCREMENT,
  `ponderacion` double DEFAULT NULL,
  `proceso_id` int(11) NOT NULL,
  `indicador_id` int(11) NOT NULL,
  PRIMARY KEY (`idponderacionindicador`),
  KEY `fk_ponderacionindicador_proceso1_idx` (`proceso_id`),
  KEY `fk_ponderacionindicador_indicador1_idx` (`indicador_id`),
  CONSTRAINT `fk_ponderacionindicador_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ponderacionindicador_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ponderacionindicador
-- ----------------------------

-- ----------------------------
-- Table structure for pregunta
-- ----------------------------
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) DEFAULT NULL,
  `pregunta` varchar(1000) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `indicador_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) DEFAULT NULL,
  `pregunta_padre` int(11) DEFAULT NULL,
  `repetir` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pregunta_indicador1_idx` (`indicador_id`),
  KEY `fk_pregunta_modelo1` (`modelo_id`),
  KEY `fk_pregunta_pregunta1_idx` (`pregunta_padre`),
  CONSTRAINT `fk_pregunta_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_pregunta1` FOREIGN KEY (`pregunta_padre`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pregunta
-- ----------------------------
INSERT INTO `pregunta` VALUES ('1', '1', 'El quehacer educativo de la Escuela Naval de Cadetes “Almirante Padilla” – ENAP, se enmarca en la visión y la misión de la Armada Nacional, que como Unidad integral de las Fuerzas Militares, su finalidad primordial es “la defensa de la soberanía, la independencia, la integridad del territorio nacional y del orden constitucional”.  La Escuela Naval de Cadetes “Almirante Padilla”, por su parte, como Unidad orgánica de la Armada Nacional, tiene la tarea primordial de contribuir al cumplimiento de la misión institucional mediante la Formación de Oficiales Navales, para lo cual se le ha asignado la función de “Formar integralmente a los Cadetes y capacitar a los Oficiales de la Armada Nacional y de la Marina Mercante, con el propósito de contribuir al cumplimiento de la misión institucional”. En qué grado califica la misión de la ENAP en cuanto a:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('2', '2', 'En qué grado califica el Proyecto Educativo o el Currículo del Programa en cuanto a:', '1', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('3', '3', 'En qué grado los siguientes aspectos  son tenidos en cuenta cuando se reciben estudiantes.', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('4', '4', 'En qué grado la ENAP favorece la participación de sus estudiantes en las  siguientes actividades:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('5', '5', 'Califique su nivel de satisfacción  en relación con las siguientes actividades complementarias de formación ofrecidas por la ENAP:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('6', '6', 'En qué grado el Reglamento de Estudiantes de la ENAP:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('7', '7', 'Califique su nivel de satisfacción con respecto a la participación de los estudiantes en los siguientes organismos:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('8', '8', 'Califique  su  nivel de satisfacción en cuanto a:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('9', '9', 'La Escuela Naval como Institución de Educación Superior de Régimen Especial, adscrita al Ministerio de Defensa Nacional, cuenta con una normatividad especial para el personal civil, \"que contiene entre otros, los siguientes aspectos: régimen de selección, vinculación, promoción, derechos, deberes, distinciones y estímulos; sistemas de evaluación de desempeño, régimen disciplinario y demás disposiciones administrativas\". En relación con esta normatividad califique su nivel de satisfacción en relación con:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('10', '10', 'Califique su nivel de satisfacción con respecto a la participación de los profesores en los siguientes organismos:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('11', '11', 'Cómo califica la calidad general de los profesores del programa en cuanto a:', '3', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('12', '12', 'Cuál es su nivel de satisfacción con respecto a Los criterios usados para la distribución de la carga académica', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('13', '13', 'El sistema de evaluación de los profesores :', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('14', '14', 'Cuál es su nivel de satisfacción sobre la calidad y pertinencia de los programas de desarrollo profesoral que brinda la ENAP:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('15', '15', 'Cuál es su nivel de satisfacción sobre los estímulos y reconocimientos otorgados por la ENAP relacionados con:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('16', '16', 'Cuál es el nivel de satisfacción en relación con el material de apoyo a la docencia (impreso, computarizado, audiovisual o de audio) elaborado o empleado por los profesores en cuanto a:', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('17', '17', 'La remuneración recibida  tiene en cuenta los siguientes aspectos:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('18', '18', 'En qué grado la ENAP ofrece los medios adecuados para permitir:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('19', '19', 'Cómo califica en general la calidad del programa académico ofrecido por ENAP en cuanto a:', '3', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('20', '20', 'Las metodologías empleadas por los profesores en el proceso de enseñanza-aprendizaje:', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('21', '21', 'En qué grado las condiciones y exigencias académicas de permanencia y graduación del programa, son acordes con la naturaleza del mismo?', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('22', '22', 'En que grado los métodos que utilizan los profesores para evaluar a los estudiantes:', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('23', '23', 'En qué grado el sistema de evaluación le ha permitido:', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('24', '24', 'Cómo califica la calidad del acompañamiento brindado por  los profesores o tutores del programa durante la tealización de los trabajos o tesis de grado.', '3', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('25', '25', '¿En qué grado  los trabajos realizados por los estudiantes tienen correspondencia con los objetivos de logro definidos?', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('26', '26', 'Como califica las orientaciones y mecanismos empleados por la ENAP para:', '3', null, null, null, null);
INSERT INTO `pregunta` VALUES ('27', '27', 'En qué grado los resultados de las autoevaluaciones y evaluaciones realizadas en la ENAP contribuyen al mejoramiento de la calidad académica de los programas.', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('28', '55', 'Considera que los siguientes procesos  de formación interactuan adecuadamente para fomentar en los estudiantes una formación integral.', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('29', '56', 'Considera que las siguientes estrategias contribuyen a una adecuada formación naval -militar enmarcada en los principios y valoares que la identifican:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('30', '28', 'En que grado califica:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('31', '29', 'Como califica el impacto de las acciones y proyectos de extensión o proyección social realizado por los profesores o estudiantes del programa:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('32', '30', 'En qué grado el material bibliográfico con que cuenta el programa es', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('33', '31', 'Califique el grado de participación del profesorado en la adquisición y  actualización del material bibliográfico.', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('34', '32', 'En qué grado los recursos informáticos y de comunicación con que cuenta el programa para el desarrollo de las actividades académicas.', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('35', '33', 'Evalúe la calidad de los siguientes recursos de apoyo a la docencia e investigación con que cuenta el programa para sus desarrollos académicos:', '3', null, null, null, null);
INSERT INTO `pregunta` VALUES ('36', '34', 'Evalúe la calidad de los siguientes recursos de apoyo a la docencia e investigación con que cuenta el programa para sus desarrollos académicos:', '3', null, null, null, null);
INSERT INTO `pregunta` VALUES ('37', '35', 'Evalúe en qué grado se dan las siguientes condiciones dentro del programa en cuanto a la  investigación:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('38', '36', 'Como califica las estrategias empleadas por la ENAP para articular las líneas de investigación de sus grupos con:', '3', null, null, null, null);
INSERT INTO `pregunta` VALUES ('39', '37', 'Califique la coherencia de las practicas realizadas durante el proceso de formación en relación con las necesidades de la institución y el sector externo.', '3', null, null, null, null);
INSERT INTO `pregunta` VALUES ('40', '38', 'Califique su nivel de satisfacción con los siguientes servicios prestados por la ENAP a sus egresados:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('41', '39', 'Califique el grado de relación que guardan:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('42', '40', 'En qué grado los procesos de autoevaluación y autorregulación de la ENAP permiten construir:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('43', '41', 'Califique el grado de efectividad de las siguientes estrategias empleadas por la ENAP para promover  las pasantías investigativas en el exterior:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('44', '42', 'En qué grado las políticas institucionales en materia de bienestar responden a las necesidades de la comunidad universitaria?', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('45', '43', 'Teniendo en cuenta los servicios y programas brindados por Bienestar Institucional, califique su nivel de satisfacción con respecto a:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('46', '45', 'En qué grado sus funciones y tareas administrativas guardan relación con las necesidades  del programa', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('47', '46', 'Cuál es su nivel de satisfacción con respecto a las políticas diseñadas por la ENAP para estimular y promover el personal administrativo?', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('48', '47', 'Califique el grado de eficacia de los procesos administrativos en el desarrollo de las funciones de:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('49', '48', 'Califique su grado de satisfacción en relación con la eficiencia de los sistemas y medios de información y comunicación:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('51', '50', 'En qué grado los directivos del programa:', '2', null, null, null, 'si');
INSERT INTO `pregunta` VALUES ('52', '51', 'Califique su grado de satisfacción en relación con los siguientes aspectos:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('53', '52', 'Califique su nivel de satisfacción en relación con  los egresados de la ENAP en:', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('54', '53', 'Califique su nivel de satisfacción sobre la efectividad del seguimiento de los egresados.', '1', null, null, null, null);
INSERT INTO `pregunta` VALUES ('55', '54', 'En qué grado se dan las siguientes condiciones en la ENAP:', '2', null, null, null, null);
INSERT INTO `pregunta` VALUES ('56', '', 'a. La apropiación de su enunciado (conoce, entiende y aplica).', '1', null, null, '1', null);
INSERT INTO `pregunta` VALUES ('57', '', 'b. La correspondencia con los procesos académicos y administrativos.', '1', null, null, '1', null);
INSERT INTO `pregunta` VALUES ('58', '', 'c.  Los medios empleados para difundirla.', '1', null, null, '1', null);
INSERT INTO `pregunta` VALUES ('59', '', 'd. Los mecanismos institucionales empleados para propiciar su cumplimiento.', '1', null, null, '1', null);
INSERT INTO `pregunta` VALUES ('60', '', 'a. Su conocimiento.', '1', null, null, '2', null);
INSERT INTO `pregunta` VALUES ('61', '', 'b. La coherencia entre los objetivos del programa y los desarrollos curriculares.', '1', null, null, '2', null);
INSERT INTO `pregunta` VALUES ('62', '', 'c. Los mecanismos empleados por la institución para su difusión.', '1', null, null, '2', null);
INSERT INTO `pregunta` VALUES ('63', '', 'd. La coherencia con la Misión institucional.', '1', null, null, '2', null);
INSERT INTO `pregunta` VALUES ('64', '', 'a. Número de Profesores', '2', null, null, '3', null);
INSERT INTO `pregunta` VALUES ('65', '', 'b. Disponibilidad de Recursos académicos', '2', null, null, '3', null);
INSERT INTO `pregunta` VALUES ('66', '', 'c. Disponibilidad de Recursos físicos', '2', null, null, '3', null);
INSERT INTO `pregunta` VALUES ('67', '', 'a. Actividades de formación naval -militar.', '1', null, null, '4', null);
INSERT INTO `pregunta` VALUES ('68', '', 'b. Cultura física (deportiva).', '1', null, null, '4', null);
INSERT INTO `pregunta` VALUES ('69', '', 'c. Artísticas (coro ENAP, grupo de teatro por compañía, banda de música).', '1', null, null, '4', null);
INSERT INTO `pregunta` VALUES ('70', '', 'd. Cultura Investigativa (feria de la ciencia y tecnología, semilleros de investigación).', '1', null, null, '4', null);
INSERT INTO `pregunta` VALUES ('71', '', 'e. Culturales (conferencias, cine, exposiciones artísticas, eventos culturales de la región).', '1', null, null, '4', null);
INSERT INTO `pregunta` VALUES ('72', '', 'a. Actividades de formación naval -militar.', '1', null, null, '5', null);
INSERT INTO `pregunta` VALUES ('73', '', 'b. Cultura física (deportiva).', '1', null, null, '5', null);
INSERT INTO `pregunta` VALUES ('74', '', 'c. Artísticas (coro ENAP, grupo de teatro por compañía, banda de música).', '1', null, null, '5', null);
INSERT INTO `pregunta` VALUES ('75', '', 'd. Cultura Investigativa (feria de la ciencia y tecnología, semilleros de investigación).', '1', null, null, '5', null);
INSERT INTO `pregunta` VALUES ('76', '', 'e. Culturales (conferencias, cine, exposiciones artísticas, eventos culturales de la región).', '1', null, null, '5', null);
INSERT INTO `pregunta` VALUES ('77', '', 'a. Es conocido por usted.', '2', null, null, '6', null);
INSERT INTO `pregunta` VALUES ('78', '', 'b. Garantiza el ejercicio de los derechos y deberes de los estudiantes.', '2', null, null, '6', null);
INSERT INTO `pregunta` VALUES ('79', '', 'c. Es aplicado con transparencia.', '2', null, null, '6', null);
INSERT INTO `pregunta` VALUES ('80', '', 'd. Es claro en cuanto a las disposiciones que regulan la actividad académica.', '2', null, null, '6', null);
INSERT INTO `pregunta` VALUES ('81', '', 'a. Consejo Académico.', '1', null, null, '7', null);
INSERT INTO `pregunta` VALUES ('82', '', 'b. Comité Curricular de Facultad.', '1', null, null, '7', null);
INSERT INTO `pregunta` VALUES ('83', '', 'a1. Las políticas de selección de los profesores: Su pertinencia', '1', null, null, '8', null);
INSERT INTO `pregunta` VALUES ('84', '', 'a2. Las políticas de selección de los profesores: Su Aplicación', '1', null, null, '8', null);
INSERT INTO `pregunta` VALUES ('85', '', 'b1. Las políticas de vinculación de los profesores: Su pertinencia', '1', null, null, '8', null);
INSERT INTO `pregunta` VALUES ('86', '', 'b2. Las políticas de vinculación de los profesores: Su Aplicación', '1', null, null, '8', null);
INSERT INTO `pregunta` VALUES ('87', '', 'c1. Las políticas de permanencia de los profesores: Su pertinencia', '1', null, null, '8', null);
INSERT INTO `pregunta` VALUES ('88', '', 'c2. Las políticas de permanencia de los profesores: Su Aplicación', '1', null, null, '8', null);
INSERT INTO `pregunta` VALUES ('89', '', 'a. El conocimiento de la misma', '1', null, null, '9', null);
INSERT INTO `pregunta` VALUES ('90', '', 'b. La pertinencia.', '1', null, null, '9', null);
INSERT INTO `pregunta` VALUES ('91', '', 'c. La aplicación.', '1', null, null, '9', null);
INSERT INTO `pregunta` VALUES ('92', '', 'a. Consejo Académico.', '2', null, null, '10', null);
INSERT INTO `pregunta` VALUES ('93', '', 'b. Comité curricular superior', '2', null, null, '10', null);
INSERT INTO `pregunta` VALUES ('94', '', 'c. Comité curricular de Facultad', '2', null, null, '10', null);
INSERT INTO `pregunta` VALUES ('95', '', 'a. Formación académica.  ', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('96', '', 'b. Trayectoria profesional y académica.', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('97', '', 'c. Competencias pedagógicas.', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('98', '', 'd. Claridad de métodos de calificación', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('99', '', 'e. Equidad en los métodos de calificación', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('100', '', 'f.  Mecanismos para la evaluación de los estudiantes', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('101', '', 'g.  Oportunidad en la entrega de calificaciones', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('102', '', 'h.  Aprovechamiento de las herramientas tecnológicas de apoyo a la docencia', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('103', '', 'i.  Respeto por el estudiante', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('104', '', 'j. Disposición para atender los estudiantes', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('105', '', 'k.  Compromiso con la investigación', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('106', '', 'l. Compromiso con la extensión o proyección social.', '3', null, null, '11', null);
INSERT INTO `pregunta` VALUES ('107', '', 'a. Evalúa de manera integral a los profesores.', '2', null, null, '13', null);
INSERT INTO `pregunta` VALUES ('108', '', 'b. Se aplica con transparencia y equidad.', '2', null, null, '13', null);
INSERT INTO `pregunta` VALUES ('109', '', 'c. Sus resultados son conocidos por los profesores.', '2', null, null, '13', null);
INSERT INTO `pregunta` VALUES ('110', '', 'd. De acuerdo con los resultados se establecen planes o propuestas de mejoramiento.', '2', null, null, '13', null);
INSERT INTO `pregunta` VALUES ('111', '', 'a. Formación en postgrado.  ', '2', null, null, '14', null);
INSERT INTO `pregunta` VALUES ('112', '', 'b. Formación pedagógica. ', '2', null, null, '14', null);
INSERT INTO `pregunta` VALUES ('113', '', 'c. Formación en investigación.    ', '2', null, null, '14', null);
INSERT INTO `pregunta` VALUES ('114', '', 'd.  Formación en segunda lengua.    ', '2', null, null, '14', null);
INSERT INTO `pregunta` VALUES ('115', '', 'e.  Asistencia a  eventos externos (Congresos, conferencias, etc.).', '2', null, null, '14', null);
INSERT INTO `pregunta` VALUES ('116', '', 'a. El ejercicio calificado de la docencia.', '2', null, null, '15', null);
INSERT INTO `pregunta` VALUES ('117', '', 'b. La investigación e innovación.', '2', null, null, '15', null);
INSERT INTO `pregunta` VALUES ('118', '', 'c. La extensión o proyección social. ', '2', null, null, '15', null);
INSERT INTO `pregunta` VALUES ('119', '', 'd. Los aportes técnicos y tecnológicos.', '2', null, null, '15', null);
INSERT INTO `pregunta` VALUES ('120', '', 'e. La cooperación internacional', '2', null, null, '15', null);
INSERT INTO `pregunta` VALUES ('121', '', 'a. La calidad', '2', null, null, '16', null);
INSERT INTO `pregunta` VALUES ('122', '', 'b. La pertinencia en relación con los objetivos y metodología del programa', '2', null, null, '16', null);
INSERT INTO `pregunta` VALUES ('123', '', 'c. La utilización ', '2', null, null, '16', null);
INSERT INTO `pregunta` VALUES ('124', '', 'a. La formación académica.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('125', '', 'b. La experiencia académica.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('126', '', 'c. La experiencia profesional.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('127', '', 'd. Los méritos académicos.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('128', '', 'e. Los méritos investigativos.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('129', '', 'a. La discusión abierta y critica.', '2', null, null, '18', null);
INSERT INTO `pregunta` VALUES ('130', '', 'b. El conocimiento de sus opiniones e inquietudes.', '2', null, null, '18', null);
INSERT INTO `pregunta` VALUES ('131', '', 'a. La forma cómo responde a las tendencias académicas en su área de conocimiento.', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('132', '', 'b. La calidad de las asignaturas o cursos impartidos. ', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('133', '', 'c. La profundidad de los temas tratados', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('134', '', 'd. Las estrategias empleadas para lograr una formación integral.', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('135', '', 'e. La flexibilidad del currículo.', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('136', '', 'f. La utilización de tecnologías de información y comunicación como apoyo a la docencia.', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('137', '', 'g. Las posibilidades para trabajar interdisciplinariamente', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('138', '', 'h. Las oportunidades de internacionalización del plan de estudios (intercambio de estudiantes, profesores visitantes, pasantías, prácticas fuera del país, cursos en inglés, entre otros) .', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('139', '', 'i. Las facilidades para participar en foros, seminarios y congresos dentro o fuera de la institución.', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('140', '', 'j. La calidad del acompañamiento de los docentes en el proceso de formación.', '3', null, null, '19', null);
INSERT INTO `pregunta` VALUES ('141', '', 'a.  Están en correspondencia con el desarrollo de los contenidos. ', '2', null, null, '20', null);
INSERT INTO `pregunta` VALUES ('142', '', 'b. Contribuyen al mejoramiento del proceso de formación.', '2', null, null, '20', null);
INSERT INTO `pregunta` VALUES ('143', '', 'a.  Tienen el propósito de mejorar procesos de enseñanza – aprendizaje.', '2', null, null, '22', null);
INSERT INTO `pregunta` VALUES ('144', '', 'b. Están en correspondencia con los contenidos temáticos desarrollados.', '2', null, null, '22', null);
INSERT INTO `pregunta` VALUES ('145', '', 'a. Ampliar sus conocimientos.', '2', null, null, '23', null);
INSERT INTO `pregunta` VALUES ('146', '', 'b. Desarrollar nuevas capacidades.', '2', null, null, '23', null);
INSERT INTO `pregunta` VALUES ('147', '', 'c. Fortalecer sus habilidades.', '2', null, null, '23', null);
INSERT INTO `pregunta` VALUES ('148', '', 'a.  La creación  de programas de pregrado y posgrado.', '3', null, null, '26', null);
INSERT INTO `pregunta` VALUES ('149', '', 'b. La evaluación de los currículos.', '3', null, null, '26', null);
INSERT INTO `pregunta` VALUES ('150', '', 'c. La reforma y actualización de los currículos. ', '3', null, null, '26', null);
INSERT INTO `pregunta` VALUES ('151', '', 'd. El aseguramiento de calidad en los programas de pregrado y posgrado', '3', null, null, '26', null);
INSERT INTO `pregunta` VALUES ('152', '', 'a.  Formación académica.', '1', null, null, '28', null);
INSERT INTO `pregunta` VALUES ('153', '', 'b. Formación naval-militar. ', '1', null, null, '28', null);
INSERT INTO `pregunta` VALUES ('154', '', 'c. Formación en principios y valores que se desarrollan en la ENAP.', '1', null, null, '28', null);
INSERT INTO `pregunta` VALUES ('155', '', 'a. El desarrollo de programas militares correpondientes a las singladuras.', '1', null, null, '29', null);
INSERT INTO `pregunta` VALUES ('156', '', 'b. El acompañamiento del cuerpo docente', '1', null, null, '29', null);
INSERT INTO `pregunta` VALUES ('157', '', 'c. El acompañamiento de los oficiales de planta', '1', null, null, '29', null);
INSERT INTO `pregunta` VALUES ('158', '', 'd. La existencia de políticas del \"Código de Honor del Cadete\".', '1', null, null, '29', null);
INSERT INTO `pregunta` VALUES ('159', '', 'e. Los sistemas de evaluación del desempeño académico.', '1', null, null, '29', null);
INSERT INTO `pregunta` VALUES ('160', '', 'f. Los sistemas de evaluación del desempeño naval - militar.', '1', null, null, '29', null);
INSERT INTO `pregunta` VALUES ('161', '', 'a. La pertinencia de los programas ofrecidos por la ENAP con las necesidades del entorno.', '1', null, null, '30', null);
INSERT INTO `pregunta` VALUES ('162', '', 'b. La calidad de los egresados de los diferentes programas de pregrado y posgrado ofrecidos por la ENAP', '1', null, null, '30', null);
INSERT INTO `pregunta` VALUES ('163', '', 'a. Actualizado.', '2', null, null, '32', null);
INSERT INTO `pregunta` VALUES ('164', '', 'b. Suficiente.', '2', null, null, '32', null);
INSERT INTO `pregunta` VALUES ('165', '', 'c. Pertinente.', '2', null, null, '32', null);
INSERT INTO `pregunta` VALUES ('166', '', 'a. Están actualizados.', '2', null, null, '34', null);
INSERT INTO `pregunta` VALUES ('167', '', 'b. Son suficientes.', '2', null, null, '34', null);
INSERT INTO `pregunta` VALUES ('168', '', 'c. Son pertinentes.', '2', null, null, '34', null);
INSERT INTO `pregunta` VALUES ('169', '', 'Biblioteca: 1)Capacidad de la salas de estudio', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('170', '', 'Biblioteca: 2)  Accesibilidad  a las salas de consulta', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('171', '', 'Biblioteca: 3)   Suficiencia de personal para la atención', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('172', '', 'Biblioteca: 4) Recursos bibliográficos: a) Colecciones', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('173', '', 'Biblioteca: 4) Recursos bibliográficos: b)Bases de datos y recursos electrónicos', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('174', '', 'Biblioteca: 5)Consulta en línea', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('175', '', 'Biblioteca: 6)Calidad del servicio prestado por el personal de la biblioteca', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('176', '', 'Biblioteca: 7) Mecanismos de actualización de las colecciones', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('177', '', 'Salones de clase: 1) Dotación', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('178', '', 'Salones de clase: 2) Funcionalidad', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('179', '', 'Salones de clase: 3) Mantenimiento', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('180', '', 'Laboratorios y Talleres: 1) Actualización', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('181', '', 'Laboratorios y Talleres: 2) Suficiencia', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('182', '', 'Laboratorios y Talleres: 3) Accesibilidad', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('183', '', 'Laboratorios y Talleres: 4) Mantenimiento', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('184', '', 'Laboratorios y Talleres: 5) Suficiencia de insumos y materiales', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('185', '', 'Laboratorios y Talleres: 6) Existencia de protocolos y guías para el desarrollo del trabajo.', '3', null, null, '35', null);
INSERT INTO `pregunta` VALUES ('186', '', 'Salas de cómputo: 1) Suficiencia de salas.', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('187', '', 'Salas de cómputo: 2) Actualización  del software', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('188', '', 'Salas de cómputo: 3) Actualización del hardware', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('189', '', 'Salas de cómputo: 4) Acceso a internet', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('190', '', 'Salas de cómputo: 5) Mantenimiento', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('191', '', 'Salas de cómputo: 6) Disponibilidad', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('192', '', 'Salas de cómputo: 7) Calidad en el servicio prestado', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('193', '', 'Practicas a bordo del ARC Gloria', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('194', '', 'Practicas a bordo de unidades de flote', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('195', '', 'Auditorios: 1) Dotación', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('196', '', 'Auditorios: 2)Funcionalidad', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('197', '', 'Auditorios: 3) Mantenimiento', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('198', '', 'Equipos audiovisuales (video beam etc.): 1) Disponibilidad', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('199', '', 'Equipos audiovisuales (video beam etc.): 2) Mantenimiento', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('200', '', 'Funcionalidad de redes Informáticas', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('201', '', 'Correo electrónico institucional', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('202', '', 'Acceso a internet inalámbrico', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('203', '', 'Página web', '3', null, null, '36', null);
INSERT INTO `pregunta` VALUES ('204', '', 'a. La ENAP tiene políticas claras para el fomento, apoyo y desarrollo de la investigación.', '2', null, null, '37', null);
INSERT INTO `pregunta` VALUES ('205', '', 'b. La ENAP tiene estrategias definidas para articular los trabajos que realizan los estudiantes con las líneas de investigación de los grupos de investigación.', '2', null, null, '37', null);
INSERT INTO `pregunta` VALUES ('206', '', 'c. Los estudiantes participan en las investigaciones que desarrollan los profesores.', '2', null, null, '37', null);
INSERT INTO `pregunta` VALUES ('207', '', 'd. La bibliografía que se proporciona, estimula el interés por la investigación.', '2', null, null, '37', null);
INSERT INTO `pregunta` VALUES ('208', '', 'e. Las actividades de docencia estimulan en los estudiantes la vocación hacia la investigación.', '2', null, null, '37', null);
INSERT INTO `pregunta` VALUES ('209', '', 'f. Se ofrece a los estudiantes la posibilidad de estar informados sobre las investigaciones que realizan los grupos de investigación.', '2', null, null, '37', null);
INSERT INTO `pregunta` VALUES ('210', '', 'g. La infraestructura prevista para la investigación es adecuada.', '2', null, null, '37', null);
INSERT INTO `pregunta` VALUES ('211', '', 'h. La gestión y apoyo financiero para el desarrollo de las investigaciones.', '2', null, null, '37', null);
INSERT INTO `pregunta` VALUES ('212', '', 'a. El proceso de formación de los estudiantes.', '3', null, null, '38', null);
INSERT INTO `pregunta` VALUES ('213', '', 'b. El trabajo investigativo de los grupos de investigación de otras universidades nacionales.', '3', null, null, '38', null);
INSERT INTO `pregunta` VALUES ('214', '', 'c. El trabajo investigativo de universidades extranjeras.', '3', null, null, '38', null);
INSERT INTO `pregunta` VALUES ('215', '', 'a. Prácticas académicas.', '3', null, null, '39', null);
INSERT INTO `pregunta` VALUES ('216', '', 'b. Prácticas militares', '3', null, null, '39', null);
INSERT INTO `pregunta` VALUES ('217', '', 'a. Apoyo para la vinculación laboral', '2', null, null, '40', null);
INSERT INTO `pregunta` VALUES ('218', '', 'b. Uso de recursos bibliográficos', '2', null, null, '40', null);
INSERT INTO `pregunta` VALUES ('219', '', 'c. Oferta de programas de posgrados', '2', null, null, '40', null);
INSERT INTO `pregunta` VALUES ('220', '', 'd. Información sobre becas y convenios', '2', null, null, '40', null);
INSERT INTO `pregunta` VALUES ('221', '', 'e. Noticias y novedades', '2', null, null, '40', null);
INSERT INTO `pregunta` VALUES ('222', '', 'a. Las líneas de investigación de los grupos con los problemas del país.', '1', null, null, '41', null);
INSERT INTO `pregunta` VALUES ('223', '', 'b. Los proyectos desarrollados en el programa con la solución de problemas sociales o productivos del entorno.', '1', null, null, '41', null);
INSERT INTO `pregunta` VALUES ('224', '', 'a. Estadísticas e indicadores de gestión que muestran la realidad de los programas y de la institución.', '2', null, null, '42', null);
INSERT INTO `pregunta` VALUES ('225', '', 'b. Estadísticas e indicadores de gestión, oportunos y de utilidad para la gestión de los programas y de la institución.', '2', null, null, '42', null);
INSERT INTO `pregunta` VALUES ('226', '', 'a. Convenios con instituciones o redes investigativas internacionales.', '2', null, null, '43', null);
INSERT INTO `pregunta` VALUES ('227', '', 'b. Apoyos administrativos para la movilidad internacional de estudiantes y profesores.', '2', null, null, '43', null);
INSERT INTO `pregunta` VALUES ('228', '', 'c. Apoyos financieros para para la movilidad internacional de estudiantes y profesores.', '2', null, null, '43', null);
INSERT INTO `pregunta` VALUES ('229', '', 'a. La amplitud de la oferta.', '2', null, null, '45', null);
INSERT INTO `pregunta` VALUES ('230', '', 'b. La calidad de la oferta. ', '2', null, null, '45', null);
INSERT INTO `pregunta` VALUES ('231', '', 'c. La pertinencia de la oferta con relación a las necesidades de la comunidad universitaria.', '2', null, null, '45', null);
INSERT INTO `pregunta` VALUES ('232', '', 'a. Docencia', '2', null, null, '48', null);
INSERT INTO `pregunta` VALUES ('233', '', 'b. Investigación', '2', null, null, '48', null);
INSERT INTO `pregunta` VALUES ('234', '', 'c. La relación con el sector externo (extensión, servicios, consultoría y/o programas con perspectiva social)', '2', null, null, '48', null);
INSERT INTO `pregunta` VALUES ('235', '', 'a. Intranet', '1', null, null, '49', null);
INSERT INTO `pregunta` VALUES ('236', '', 'b. Página Web', '1', null, null, '49', null);
INSERT INTO `pregunta` VALUES ('237', '', 'c. Sistema de manejo  académico (SMA)', '1', null, null, '49', null);
INSERT INTO `pregunta` VALUES ('238', '', 'd. Cartelera digital', '1', null, null, '49', null);
INSERT INTO `pregunta` VALUES ('239', '', 'e. Correo electrónico Institucional', '1', null, null, '49', null);
INSERT INTO `pregunta` VALUES ('240', '', 'a. Dan una orientación efectiva para el cumplimiento de los objetivos del programa.', '2', null, null, '51', null);
INSERT INTO `pregunta` VALUES ('241', '', 'B. Ejercen un liderazgo.', '2', null, null, '51', null);
INSERT INTO `pregunta` VALUES ('242', '', 'a. La formación recibida fue suficiente para enfrentar la vida militar.', '2', null, null, '52', null);
INSERT INTO `pregunta` VALUES ('243', '', 'b. La formación recibida fue suficiente para desempeñarse en el mundo laboral', '2', null, null, '52', null);
INSERT INTO `pregunta` VALUES ('244', '', 'c. La formación recibida cumplió con los objetivos del programa.', '2', null, null, '52', null);
INSERT INTO `pregunta` VALUES ('245', '', 'd. La formación recibida en la ENAP resultó pertinente.', '2', null, null, '52', null);
INSERT INTO `pregunta` VALUES ('246', '', 'a. Conocimientos teóricos de la profesión.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('247', '', 'b. Capacidad de análisis.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('248', '', 'c. Capacidad de aprendizaje.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('249', '', 'd. Capacidad de adaptación a los cambios.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('250', '', 'e. Capacidad de trabajar en equipo.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('251', '', 'f. Habilidades comunicativas orales.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('252', '', 'g. Habilidades comunicativas escritas.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('253', '', 'h. Capacidad para resolver problemas concretos.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('254', '', 'i. Capacidad para asumir responsabilidades.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('255', '', 'j. Capacidad para ejercer liderazgo.', '1', null, null, '53', null);
INSERT INTO `pregunta` VALUES ('256', '', 'a. Los recursos presupuestales asignados al programa son suficientes para mantenimiento de la calidad', '2', null, null, '55', null);
INSERT INTO `pregunta` VALUES ('257', '', 'b. Existe equidad en la asignación de recursos físicos y financieros para el desarrollo del programa.', '2', null, null, '55', null);

-- ----------------------------
-- Table structure for pregunta_has_caracteristica
-- ----------------------------
DROP TABLE IF EXISTS `pregunta_has_caracteristica`;
CREATE TABLE `pregunta_has_caracteristica` (
  `pregunta_id` int(11) NOT NULL,
  `caracteristica_id` int(11) NOT NULL,
  PRIMARY KEY (`pregunta_id`,`caracteristica_id`),
  KEY `fk_pregunta_has_caracteristica_caracteristica1_idx` (`caracteristica_id`),
  KEY `fk_pregunta_has_caracteristica_pregunta1_idx` (`pregunta_id`),
  CONSTRAINT `fk_pregunta_has_caracteristica_caracteristica1` FOREIGN KEY (`caracteristica_id`) REFERENCES `caracteristica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_has_caracteristica_pregunta1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pregunta_has_caracteristica
-- ----------------------------
INSERT INTO `pregunta_has_caracteristica` VALUES ('1', '1');
INSERT INTO `pregunta_has_caracteristica` VALUES ('6', '4');
INSERT INTO `pregunta_has_caracteristica` VALUES ('7', '4');
INSERT INTO `pregunta_has_caracteristica` VALUES ('9', '7');
INSERT INTO `pregunta_has_caracteristica` VALUES ('11', '8');
INSERT INTO `pregunta_has_caracteristica` VALUES ('12', '8');
INSERT INTO `pregunta_has_caracteristica` VALUES ('13', '9');
INSERT INTO `pregunta_has_caracteristica` VALUES ('14', '10');
INSERT INTO `pregunta_has_caracteristica` VALUES ('18', '12');
INSERT INTO `pregunta_has_caracteristica` VALUES ('19', '12');
INSERT INTO `pregunta_has_caracteristica` VALUES ('22', '12');
INSERT INTO `pregunta_has_caracteristica` VALUES ('26', '12');
INSERT INTO `pregunta_has_caracteristica` VALUES ('27', '12');
INSERT INTO `pregunta_has_caracteristica` VALUES ('28', '12');
INSERT INTO `pregunta_has_caracteristica` VALUES ('29', '12');
INSERT INTO `pregunta_has_caracteristica` VALUES ('30', '13');
INSERT INTO `pregunta_has_caracteristica` VALUES ('37', '17');
INSERT INTO `pregunta_has_caracteristica` VALUES ('39', '19');
INSERT INTO `pregunta_has_caracteristica` VALUES ('40', '20');
INSERT INTO `pregunta_has_caracteristica` VALUES ('54', '20');
INSERT INTO `pregunta_has_caracteristica` VALUES ('42', '22');
INSERT INTO `pregunta_has_caracteristica` VALUES ('44', '24');
INSERT INTO `pregunta_has_caracteristica` VALUES ('45', '24');
INSERT INTO `pregunta_has_caracteristica` VALUES ('47', '25');
INSERT INTO `pregunta_has_caracteristica` VALUES ('49', '26');
INSERT INTO `pregunta_has_caracteristica` VALUES ('32', '28');
INSERT INTO `pregunta_has_caracteristica` VALUES ('33', '28');
INSERT INTO `pregunta_has_caracteristica` VALUES ('35', '28');
INSERT INTO `pregunta_has_caracteristica` VALUES ('36', '28');

-- ----------------------------
-- Table structure for privilegio
-- ----------------------------
DROP TABLE IF EXISTS `privilegio`;
CREATE TABLE `privilegio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilegio
-- ----------------------------

-- ----------------------------
-- Table structure for proceso
-- ----------------------------
DROP TABLE IF EXISTS `proceso`;
CREATE TABLE `proceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechainicio` varchar(30) NOT NULL,
  `fechacierre` varchar(30) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `programa_id` int(11) NOT NULL,
  `modelo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proceso_programa1_idx` (`programa_id`),
  KEY `fk_proceso_modelo1` (`modelo_id`),
  CONSTRAINT `fk_proceso_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proceso
-- ----------------------------
INSERT INTO `proceso` VALUES ('1', '21/01/2016', '--', 'Proceso de Autoevaluación con fines de obtención de la acreditación institucional', '1', '1');

-- ----------------------------
-- Table structure for procesohasindicador
-- ----------------------------
DROP TABLE IF EXISTS `procesohasindicador`;
CREATE TABLE `procesohasindicador` (
  `proceso_id` int(11) NOT NULL,
  `indicador_id` int(11) NOT NULL,
  PRIMARY KEY (`proceso_id`,`indicador_id`),
  KEY `fk_proceso_has_indicador_indicador1` (`indicador_id`),
  KEY `fk_proceso_has_indicador_proceso1` (`proceso_id`),
  CONSTRAINT `fk_proceso_has_indicador_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_has_indicador_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procesohasindicador
-- ----------------------------

-- ----------------------------
-- Table structure for programa
-- ----------------------------
DROP TABLE IF EXISTS `programa`;
CREATE TABLE `programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `modalidad` varchar(255) DEFAULT NULL,
  `tipoformacion` varchar(255) DEFAULT NULL,
  `facultad_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programa_facultad1_idx` (`facultad_id`),
  CONSTRAINT `fk_programa_facultad1` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programa
-- ----------------------------
INSERT INTO `programa` VALUES ('1', 'INSTITUCIONAL', 'INSTITUCIONAL', 'Presencial', 'Institucional', '100');
INSERT INTO `programa` VALUES ('720', 'OCEANOGRAFÍA FÍSICA', 'OCEANOGRAFÍA FÍSICA', 'Presencial', 'Universitaria', '2');
INSERT INTO `programa` VALUES ('721', 'INGENIERÍA NAVAL', 'INGENIERÍA NAVAL', 'Presencial', 'Universitaria', '5');
INSERT INTO `programa` VALUES ('722', 'ADMINISTRACIÓN MARITIMA', 'ADMINISTRACION MARITIMA', 'Presencial', 'Universitaria', '1');
INSERT INTO `programa` VALUES ('723', 'CIENCIAS NAUTICAS PARA OFICIALES MERCANTES', 'CIENCIAS NAUTICAS PARA OFICIALES MERCANTES', 'Presencial', 'Universitaria', '3');
INSERT INTO `programa` VALUES ('724', 'CIENCIAS NAVALES PARA OFICIALES NAVALES', 'CIENCIAS NAVALES PARA OFICIALES NAVALES', 'Presencial', 'Universitaria', '3');
INSERT INTO `programa` VALUES ('725', 'CIENCIAS NAVALES PARA OFICIALES DE INFANTERIA DE MARINA', 'CIENCIAS NAVALES PARA OFICIALES DE INFANTERIA DE MARINA', 'Presencial', 'Universitaria', '4');
INSERT INTO `programa` VALUES ('726', 'INGENIERÍA ELECTRÓNICA', 'INGENIERÍA ELECTRÓNICA', 'Presencial', 'Universitaria', '5');
INSERT INTO `programa` VALUES ('727', 'ADMINISTRACIÓN', 'ADMINISTRACIÓN', 'Presencial', 'Universitaria', '1');
INSERT INTO `programa` VALUES ('728', 'ESPECIALIZACION EN LOGISTICA', 'ESPECIALIZACION EN LOGISTICA', 'Presencial', 'Especializacion', '1');
INSERT INTO `programa` VALUES ('729', 'MAESTRÍA EN GESTIÓN LOGISTICA', 'MAESTRÍA EN GESTIÓN LOGISTICA', 'Presencial', 'Maestria', '1');
INSERT INTO `programa` VALUES ('730', 'MAESTRIA EN OCEANOGRAFÍA', 'MAESTRIA EN OCEANOGRAFÍA', 'Presencial', 'Maestria', '2');
INSERT INTO `programa` VALUES ('731', 'MAESTRÍA EN INGENIERÍA NAVAL', 'MAESTRÍA EN INGENIERÍA NAVAL', 'Presencial', 'Maestria', '5');
INSERT INTO `programa` VALUES ('732', 'ESPECIALIZACIÓN EN POLÍTICA Y ESTRATEGIA MARÍTIMA', 'ESPECIALIZACIÓN EN POLÍTICA Y ESTRATEGIA MARÍTIMA', 'Presencial', 'Especializacion', '4');

-- ----------------------------
-- Table structure for programa_has_representante
-- ----------------------------
DROP TABLE IF EXISTS `programa_has_representante`;
CREATE TABLE `programa_has_representante` (
  `programa_id` int(11) NOT NULL,
  `representante_id` int(11) NOT NULL,
  PRIMARY KEY (`programa_id`,`representante_id`),
  KEY `fk_programa_has_representante_representante1` (`representante_id`),
  KEY `fk_programa_has_representante_programa1` (`programa_id`),
  CONSTRAINT `fk_programa_has_representante_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_programa_has_representante_representante1` FOREIGN KEY (`representante_id`) REFERENCES `representante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programa_has_representante
-- ----------------------------

-- ----------------------------
-- Table structure for representante
-- ----------------------------
DROP TABLE IF EXISTS `representante`;
CREATE TABLE `representante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of representante
-- ----------------------------
INSERT INTO `representante` VALUES ('123456', 'Javier', 'Rodriguez', '123456', 'Comite central', 'aspapen@enap.edu.co');

-- ----------------------------
-- Table structure for representantehasprivilegio
-- ----------------------------
DROP TABLE IF EXISTS `representantehasprivilegio`;
CREATE TABLE `representantehasprivilegio` (
  `representante_id` int(11) NOT NULL,
  `privilegio_id` int(11) NOT NULL,
  PRIMARY KEY (`representante_id`,`privilegio_id`),
  KEY `fk_representante_has_privilegio_privilegio1` (`privilegio_id`),
  KEY `fk_representante_has_privilegio_representante1` (`representante_id`),
  CONSTRAINT `fk_representante_has_privilegio_privilegio1` FOREIGN KEY (`privilegio_id`) REFERENCES `privilegio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_representante_has_privilegio_representante1` FOREIGN KEY (`representante_id`) REFERENCES `representante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of representantehasprivilegio
-- ----------------------------

-- ----------------------------
-- Table structure for respuesta
-- ----------------------------
DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE `respuesta` (
  `idrespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` varchar(45) DEFAULT NULL,
  `pregunta_id` int(11) NOT NULL,
  PRIMARY KEY (`idrespuesta`),
  KEY `fk_respuesta_pregunta1_idx` (`pregunta_id`),
  CONSTRAINT `fk_respuesta_pregunta1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of respuesta
-- ----------------------------

-- ----------------------------
-- Table structure for respuestas
-- ----------------------------
DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE `respuestas` (
  `idrespuestas` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(11) NOT NULL,
  `participante_idparticipante` int(11) NOT NULL,
  `respuesta` int(11) NOT NULL,
  `programa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrespuestas`),
  KEY `fk_respuestas_pregunta1_idx` (`pregunta_id`),
  KEY `fk_respuestas_participante1_idx` (`participante_idparticipante`),
  KEY `fk_respuestas_programa1_idx` (`programa_id`),
  CONSTRAINT `fk_respuestas_participante1` FOREIGN KEY (`participante_idparticipante`) REFERENCES `participante` (`idparticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuestas_pregunta1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuestas_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of respuestas
-- ----------------------------
INSERT INTO `respuestas` VALUES ('111', '56', '5', '1', null);
INSERT INTO `respuestas` VALUES ('112', '57', '5', '1', null);
INSERT INTO `respuestas` VALUES ('113', '58', '5', '1', null);
INSERT INTO `respuestas` VALUES ('114', '59', '5', '1', null);
INSERT INTO `respuestas` VALUES ('115', '60', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('116', '61', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('117', '62', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('118', '63', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('119', '77', '5', '2', null);
INSERT INTO `respuestas` VALUES ('120', '78', '5', '2', null);
INSERT INTO `respuestas` VALUES ('121', '79', '5', '2', null);
INSERT INTO `respuestas` VALUES ('122', '80', '5', '2', null);
INSERT INTO `respuestas` VALUES ('123', '81', '5', '2', null);
INSERT INTO `respuestas` VALUES ('124', '82', '5', '2', null);
INSERT INTO `respuestas` VALUES ('125', '95', '5', '2', '731');
INSERT INTO `respuestas` VALUES ('126', '96', '5', '2', '731');
INSERT INTO `respuestas` VALUES ('127', '97', '5', '2', '731');
INSERT INTO `respuestas` VALUES ('128', '98', '5', '2', '731');
INSERT INTO `respuestas` VALUES ('129', '99', '5', '2', '731');
INSERT INTO `respuestas` VALUES ('130', '100', '5', '2', '731');
INSERT INTO `respuestas` VALUES ('131', '101', '5', '2', '731');
INSERT INTO `respuestas` VALUES ('132', '102', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('133', '103', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('134', '104', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('135', '105', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('136', '106', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('137', '129', '5', '1', null);
INSERT INTO `respuestas` VALUES ('138', '130', '5', '1', null);
INSERT INTO `respuestas` VALUES ('139', '131', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('140', '132', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('141', '133', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('142', '134', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('143', '135', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('144', '136', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('145', '137', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('146', '138', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('147', '139', '5', '2', '731');
INSERT INTO `respuestas` VALUES ('148', '140', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('149', '141', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('150', '142', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('151', '21', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('152', '143', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('153', '144', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('154', '24', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('155', '27', '5', '1', null);
INSERT INTO `respuestas` VALUES ('156', '161', '5', '1', null);
INSERT INTO `respuestas` VALUES ('157', '162', '5', '1', null);
INSERT INTO `respuestas` VALUES ('158', '163', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('159', '164', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('160', '165', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('161', '166', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('162', '167', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('163', '168', '5', '1', '731');
INSERT INTO `respuestas` VALUES ('164', '169', '5', '1', null);
INSERT INTO `respuestas` VALUES ('165', '170', '5', '1', null);
INSERT INTO `respuestas` VALUES ('166', '171', '5', '1', null);
INSERT INTO `respuestas` VALUES ('167', '172', '5', '1', null);
INSERT INTO `respuestas` VALUES ('168', '173', '5', '1', null);
INSERT INTO `respuestas` VALUES ('169', '174', '5', '1', null);
INSERT INTO `respuestas` VALUES ('170', '175', '5', '1', null);
INSERT INTO `respuestas` VALUES ('171', '176', '5', '1', null);
INSERT INTO `respuestas` VALUES ('172', '177', '5', '1', null);
INSERT INTO `respuestas` VALUES ('173', '178', '5', '1', null);
INSERT INTO `respuestas` VALUES ('174', '179', '5', '1', null);
INSERT INTO `respuestas` VALUES ('175', '180', '5', '1', null);
INSERT INTO `respuestas` VALUES ('176', '181', '5', '1', null);
INSERT INTO `respuestas` VALUES ('177', '182', '5', '1', null);
INSERT INTO `respuestas` VALUES ('178', '183', '5', '1', null);
INSERT INTO `respuestas` VALUES ('179', '184', '5', '1', null);
INSERT INTO `respuestas` VALUES ('180', '185', '5', '1', null);
INSERT INTO `respuestas` VALUES ('181', '204', '5', '1', null);
INSERT INTO `respuestas` VALUES ('182', '205', '5', '1', null);
INSERT INTO `respuestas` VALUES ('183', '206', '5', '1', null);
INSERT INTO `respuestas` VALUES ('184', '207', '5', '1', null);
INSERT INTO `respuestas` VALUES ('185', '208', '5', '1', null);
INSERT INTO `respuestas` VALUES ('186', '209', '5', '1', null);
INSERT INTO `respuestas` VALUES ('187', '210', '5', '1', null);
INSERT INTO `respuestas` VALUES ('188', '211', '5', '1', null);
INSERT INTO `respuestas` VALUES ('189', '212', '5', '1', null);
INSERT INTO `respuestas` VALUES ('190', '213', '5', '1', null);
INSERT INTO `respuestas` VALUES ('191', '214', '5', '1', null);
INSERT INTO `respuestas` VALUES ('192', '217', '5', '1', null);
INSERT INTO `respuestas` VALUES ('193', '218', '5', '1', null);
INSERT INTO `respuestas` VALUES ('194', '219', '5', '1', null);
INSERT INTO `respuestas` VALUES ('195', '220', '5', '1', null);
INSERT INTO `respuestas` VALUES ('196', '221', '5', '1', null);
INSERT INTO `respuestas` VALUES ('197', '222', '5', '1', null);
INSERT INTO `respuestas` VALUES ('198', '223', '5', '1', null);
INSERT INTO `respuestas` VALUES ('199', '226', '5', '1', null);
INSERT INTO `respuestas` VALUES ('200', '227', '5', '1', null);
INSERT INTO `respuestas` VALUES ('201', '228', '5', '1', null);
INSERT INTO `respuestas` VALUES ('202', '44', '5', '1', null);
INSERT INTO `respuestas` VALUES ('203', '229', '5', '1', null);
INSERT INTO `respuestas` VALUES ('204', '230', '5', '1', null);
INSERT INTO `respuestas` VALUES ('205', '231', '5', '1', null);
INSERT INTO `respuestas` VALUES ('206', '235', '5', '1', null);
INSERT INTO `respuestas` VALUES ('207', '236', '5', '1', null);
INSERT INTO `respuestas` VALUES ('208', '237', '5', '1', null);
INSERT INTO `respuestas` VALUES ('209', '238', '5', '1', null);
INSERT INTO `respuestas` VALUES ('210', '239', '5', '1', null);
INSERT INTO `respuestas` VALUES ('211', '242', '5', '1', null);
INSERT INTO `respuestas` VALUES ('212', '243', '5', '3', null);
INSERT INTO `respuestas` VALUES ('213', '244', '5', '3', null);
INSERT INTO `respuestas` VALUES ('214', '245', '5', '3', null);
INSERT INTO `respuestas` VALUES ('215', '54', '5', '5', null);
INSERT INTO `respuestas` VALUES ('216', '56', '6', '5', null);
INSERT INTO `respuestas` VALUES ('217', '57', '6', '5', null);
INSERT INTO `respuestas` VALUES ('218', '58', '6', '4', null);
INSERT INTO `respuestas` VALUES ('219', '59', '6', '5', null);
INSERT INTO `respuestas` VALUES ('220', '60', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('221', '61', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('222', '62', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('223', '63', '6', '4', '721');
INSERT INTO `respuestas` VALUES ('224', '64', '6', '5', null);
INSERT INTO `respuestas` VALUES ('225', '65', '6', '0', null);
INSERT INTO `respuestas` VALUES ('226', '66', '6', '5', null);
INSERT INTO `respuestas` VALUES ('227', '67', '6', '5', null);
INSERT INTO `respuestas` VALUES ('228', '68', '6', '0', null);
INSERT INTO `respuestas` VALUES ('229', '69', '6', '4', null);
INSERT INTO `respuestas` VALUES ('230', '70', '6', '4', null);
INSERT INTO `respuestas` VALUES ('231', '71', '6', '4', null);
INSERT INTO `respuestas` VALUES ('232', '72', '6', '4', null);
INSERT INTO `respuestas` VALUES ('233', '73', '6', '5', null);
INSERT INTO `respuestas` VALUES ('234', '74', '6', '5', null);
INSERT INTO `respuestas` VALUES ('235', '75', '6', '5', null);
INSERT INTO `respuestas` VALUES ('236', '76', '6', '5', null);
INSERT INTO `respuestas` VALUES ('237', '77', '6', '5', null);
INSERT INTO `respuestas` VALUES ('238', '78', '6', '4', null);
INSERT INTO `respuestas` VALUES ('239', '79', '6', '5', null);
INSERT INTO `respuestas` VALUES ('240', '80', '6', '5', null);
INSERT INTO `respuestas` VALUES ('241', '81', '6', '5', null);
INSERT INTO `respuestas` VALUES ('242', '82', '6', '5', null);
INSERT INTO `respuestas` VALUES ('243', '95', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('244', '96', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('245', '97', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('246', '98', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('247', '99', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('248', '100', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('249', '101', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('250', '102', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('251', '103', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('252', '104', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('253', '105', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('254', '106', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('255', '121', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('256', '122', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('257', '123', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('258', '129', '6', '5', null);
INSERT INTO `respuestas` VALUES ('259', '130', '6', '5', null);
INSERT INTO `respuestas` VALUES ('260', '131', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('261', '132', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('262', '133', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('263', '134', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('264', '135', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('265', '136', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('266', '137', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('267', '138', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('268', '139', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('269', '140', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('270', '141', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('271', '142', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('272', '21', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('273', '143', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('274', '144', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('275', '145', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('276', '146', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('277', '147', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('278', '27', '6', '5', null);
INSERT INTO `respuestas` VALUES ('279', '152', '6', '5', null);
INSERT INTO `respuestas` VALUES ('280', '153', '6', '5', null);
INSERT INTO `respuestas` VALUES ('281', '154', '6', '5', null);
INSERT INTO `respuestas` VALUES ('282', '155', '6', '0', null);
INSERT INTO `respuestas` VALUES ('283', '156', '6', '0', null);
INSERT INTO `respuestas` VALUES ('284', '157', '6', '0', null);
INSERT INTO `respuestas` VALUES ('285', '158', '6', '0', null);
INSERT INTO `respuestas` VALUES ('286', '159', '6', '0', null);
INSERT INTO `respuestas` VALUES ('287', '160', '6', '0', null);
INSERT INTO `respuestas` VALUES ('288', '163', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('289', '164', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('290', '165', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('291', '166', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('292', '167', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('293', '168', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('294', '169', '6', '5', null);
INSERT INTO `respuestas` VALUES ('295', '170', '6', '5', null);
INSERT INTO `respuestas` VALUES ('296', '171', '6', '5', null);
INSERT INTO `respuestas` VALUES ('297', '172', '6', '5', null);
INSERT INTO `respuestas` VALUES ('298', '173', '6', '5', null);
INSERT INTO `respuestas` VALUES ('299', '174', '6', '5', null);
INSERT INTO `respuestas` VALUES ('300', '175', '6', '0', null);
INSERT INTO `respuestas` VALUES ('301', '176', '6', '0', null);
INSERT INTO `respuestas` VALUES ('302', '177', '6', '5', null);
INSERT INTO `respuestas` VALUES ('303', '178', '6', '0', null);
INSERT INTO `respuestas` VALUES ('304', '179', '6', '0', null);
INSERT INTO `respuestas` VALUES ('305', '180', '6', '0', null);
INSERT INTO `respuestas` VALUES ('306', '181', '6', '5', null);
INSERT INTO `respuestas` VALUES ('307', '182', '6', '5', null);
INSERT INTO `respuestas` VALUES ('308', '183', '6', '5', null);
INSERT INTO `respuestas` VALUES ('309', '184', '6', '5', null);
INSERT INTO `respuestas` VALUES ('310', '185', '6', '5', null);
INSERT INTO `respuestas` VALUES ('311', '186', '6', '5', null);
INSERT INTO `respuestas` VALUES ('312', '187', '6', '5', null);
INSERT INTO `respuestas` VALUES ('313', '188', '6', '5', null);
INSERT INTO `respuestas` VALUES ('314', '189', '6', '5', null);
INSERT INTO `respuestas` VALUES ('315', '190', '6', '5', null);
INSERT INTO `respuestas` VALUES ('316', '191', '6', '5', null);
INSERT INTO `respuestas` VALUES ('317', '192', '6', '5', null);
INSERT INTO `respuestas` VALUES ('318', '193', '6', '5', null);
INSERT INTO `respuestas` VALUES ('319', '194', '6', '5', null);
INSERT INTO `respuestas` VALUES ('320', '195', '6', '5', null);
INSERT INTO `respuestas` VALUES ('321', '196', '6', '5', null);
INSERT INTO `respuestas` VALUES ('322', '197', '6', '5', null);
INSERT INTO `respuestas` VALUES ('323', '198', '6', '5', null);
INSERT INTO `respuestas` VALUES ('324', '199', '6', '5', null);
INSERT INTO `respuestas` VALUES ('325', '200', '6', '5', null);
INSERT INTO `respuestas` VALUES ('326', '201', '6', '5', null);
INSERT INTO `respuestas` VALUES ('327', '202', '6', '5', null);
INSERT INTO `respuestas` VALUES ('328', '203', '6', '5', null);
INSERT INTO `respuestas` VALUES ('329', '204', '6', '5', null);
INSERT INTO `respuestas` VALUES ('330', '205', '6', '5', null);
INSERT INTO `respuestas` VALUES ('331', '206', '6', '5', null);
INSERT INTO `respuestas` VALUES ('332', '207', '6', '5', null);
INSERT INTO `respuestas` VALUES ('333', '208', '6', '5', null);
INSERT INTO `respuestas` VALUES ('334', '209', '6', '5', null);
INSERT INTO `respuestas` VALUES ('335', '210', '6', '5', null);
INSERT INTO `respuestas` VALUES ('336', '211', '6', '5', null);
INSERT INTO `respuestas` VALUES ('337', '215', '6', '5', null);
INSERT INTO `respuestas` VALUES ('338', '216', '6', '5', null);
INSERT INTO `respuestas` VALUES ('339', '44', '6', '5', null);
INSERT INTO `respuestas` VALUES ('340', '229', '6', '5', null);
INSERT INTO `respuestas` VALUES ('341', '230', '6', '5', null);
INSERT INTO `respuestas` VALUES ('342', '231', '6', '5', null);
INSERT INTO `respuestas` VALUES ('343', '232', '6', '5', null);
INSERT INTO `respuestas` VALUES ('344', '233', '6', '5', null);
INSERT INTO `respuestas` VALUES ('345', '234', '6', '5', null);
INSERT INTO `respuestas` VALUES ('346', '235', '6', '5', null);
INSERT INTO `respuestas` VALUES ('347', '236', '6', '5', null);
INSERT INTO `respuestas` VALUES ('348', '237', '6', '5', null);
INSERT INTO `respuestas` VALUES ('349', '238', '6', '5', null);
INSERT INTO `respuestas` VALUES ('350', '239', '6', '5', null);
INSERT INTO `respuestas` VALUES ('351', '240', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('352', '241', '6', '5', '721');
INSERT INTO `respuestas` VALUES ('353', '56', '7', '3', null);
INSERT INTO `respuestas` VALUES ('354', '57', '7', '1', null);
INSERT INTO `respuestas` VALUES ('355', '58', '7', '1', null);
INSERT INTO `respuestas` VALUES ('356', '59', '7', '1', null);
INSERT INTO `respuestas` VALUES ('357', '60', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('358', '61', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('359', '62', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('360', '63', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('361', '64', '7', '1', null);
INSERT INTO `respuestas` VALUES ('362', '65', '7', '1', null);
INSERT INTO `respuestas` VALUES ('363', '66', '7', '1', null);
INSERT INTO `respuestas` VALUES ('364', '67', '7', '1', null);
INSERT INTO `respuestas` VALUES ('365', '68', '7', '1', null);
INSERT INTO `respuestas` VALUES ('366', '69', '7', '1', null);
INSERT INTO `respuestas` VALUES ('367', '70', '7', '1', null);
INSERT INTO `respuestas` VALUES ('368', '71', '7', '1', null);
INSERT INTO `respuestas` VALUES ('369', '72', '7', '1', null);
INSERT INTO `respuestas` VALUES ('370', '73', '7', '1', null);
INSERT INTO `respuestas` VALUES ('371', '74', '7', '1', null);
INSERT INTO `respuestas` VALUES ('372', '75', '7', '1', null);
INSERT INTO `respuestas` VALUES ('373', '76', '7', '1', null);
INSERT INTO `respuestas` VALUES ('374', '77', '7', '1', null);
INSERT INTO `respuestas` VALUES ('375', '78', '7', '1', null);
INSERT INTO `respuestas` VALUES ('376', '79', '7', '1', null);
INSERT INTO `respuestas` VALUES ('377', '80', '7', '1', null);
INSERT INTO `respuestas` VALUES ('378', '81', '7', '1', null);
INSERT INTO `respuestas` VALUES ('379', '82', '7', '1', null);
INSERT INTO `respuestas` VALUES ('380', '95', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('381', '96', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('382', '97', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('383', '98', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('384', '99', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('385', '100', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('386', '101', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('387', '102', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('388', '103', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('389', '104', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('390', '105', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('391', '106', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('392', '121', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('393', '122', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('394', '123', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('395', '129', '7', '1', null);
INSERT INTO `respuestas` VALUES ('396', '130', '7', '1', null);
INSERT INTO `respuestas` VALUES ('397', '131', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('398', '132', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('399', '133', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('400', '134', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('401', '135', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('402', '136', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('403', '137', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('404', '138', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('405', '139', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('406', '140', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('407', '141', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('408', '142', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('409', '21', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('410', '143', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('411', '144', '7', '2', '720');
INSERT INTO `respuestas` VALUES ('412', '145', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('413', '146', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('414', '147', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('415', '27', '7', '1', null);
INSERT INTO `respuestas` VALUES ('416', '152', '7', '1', null);
INSERT INTO `respuestas` VALUES ('417', '153', '7', '1', null);
INSERT INTO `respuestas` VALUES ('418', '154', '7', '1', null);
INSERT INTO `respuestas` VALUES ('419', '155', '7', '1', null);
INSERT INTO `respuestas` VALUES ('420', '156', '7', '1', null);
INSERT INTO `respuestas` VALUES ('421', '157', '7', '1', null);
INSERT INTO `respuestas` VALUES ('422', '158', '7', '1', null);
INSERT INTO `respuestas` VALUES ('423', '159', '7', '1', null);
INSERT INTO `respuestas` VALUES ('424', '160', '7', '1', null);
INSERT INTO `respuestas` VALUES ('425', '163', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('426', '164', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('427', '165', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('428', '166', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('429', '167', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('430', '168', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('431', '169', '7', '1', null);
INSERT INTO `respuestas` VALUES ('432', '170', '7', '1', null);
INSERT INTO `respuestas` VALUES ('433', '171', '7', '1', null);
INSERT INTO `respuestas` VALUES ('434', '172', '7', '1', null);
INSERT INTO `respuestas` VALUES ('435', '173', '7', '1', null);
INSERT INTO `respuestas` VALUES ('436', '174', '7', '1', null);
INSERT INTO `respuestas` VALUES ('437', '175', '7', '1', null);
INSERT INTO `respuestas` VALUES ('438', '176', '7', '1', null);
INSERT INTO `respuestas` VALUES ('439', '177', '7', '1', null);
INSERT INTO `respuestas` VALUES ('440', '178', '7', '1', null);
INSERT INTO `respuestas` VALUES ('441', '179', '7', '1', null);
INSERT INTO `respuestas` VALUES ('442', '180', '7', '1', null);
INSERT INTO `respuestas` VALUES ('443', '181', '7', '1', null);
INSERT INTO `respuestas` VALUES ('444', '182', '7', '1', null);
INSERT INTO `respuestas` VALUES ('445', '183', '7', '1', null);
INSERT INTO `respuestas` VALUES ('446', '184', '7', '1', null);
INSERT INTO `respuestas` VALUES ('447', '185', '7', '1', null);
INSERT INTO `respuestas` VALUES ('448', '186', '7', '1', null);
INSERT INTO `respuestas` VALUES ('449', '187', '7', '1', null);
INSERT INTO `respuestas` VALUES ('450', '188', '7', '1', null);
INSERT INTO `respuestas` VALUES ('451', '189', '7', '1', null);
INSERT INTO `respuestas` VALUES ('452', '190', '7', '1', null);
INSERT INTO `respuestas` VALUES ('453', '191', '7', '1', null);
INSERT INTO `respuestas` VALUES ('454', '192', '7', '1', null);
INSERT INTO `respuestas` VALUES ('455', '193', '7', '1', null);
INSERT INTO `respuestas` VALUES ('456', '194', '7', '1', null);
INSERT INTO `respuestas` VALUES ('457', '195', '7', '1', null);
INSERT INTO `respuestas` VALUES ('458', '196', '7', '1', null);
INSERT INTO `respuestas` VALUES ('459', '197', '7', '1', null);
INSERT INTO `respuestas` VALUES ('460', '198', '7', '1', null);
INSERT INTO `respuestas` VALUES ('461', '199', '7', '1', null);
INSERT INTO `respuestas` VALUES ('462', '200', '7', '1', null);
INSERT INTO `respuestas` VALUES ('463', '201', '7', '1', null);
INSERT INTO `respuestas` VALUES ('464', '202', '7', '1', null);
INSERT INTO `respuestas` VALUES ('465', '203', '7', '1', null);
INSERT INTO `respuestas` VALUES ('466', '204', '7', '1', null);
INSERT INTO `respuestas` VALUES ('467', '205', '7', '1', null);
INSERT INTO `respuestas` VALUES ('468', '206', '7', '1', null);
INSERT INTO `respuestas` VALUES ('469', '207', '7', '1', null);
INSERT INTO `respuestas` VALUES ('470', '208', '7', '1', null);
INSERT INTO `respuestas` VALUES ('471', '209', '7', '1', null);
INSERT INTO `respuestas` VALUES ('472', '210', '7', '1', null);
INSERT INTO `respuestas` VALUES ('473', '211', '7', '1', null);
INSERT INTO `respuestas` VALUES ('474', '215', '7', '1', null);
INSERT INTO `respuestas` VALUES ('475', '216', '7', '1', null);
INSERT INTO `respuestas` VALUES ('476', '44', '7', '1', null);
INSERT INTO `respuestas` VALUES ('477', '229', '7', '1', null);
INSERT INTO `respuestas` VALUES ('478', '230', '7', '1', null);
INSERT INTO `respuestas` VALUES ('479', '231', '7', '1', null);
INSERT INTO `respuestas` VALUES ('480', '232', '7', '1', null);
INSERT INTO `respuestas` VALUES ('481', '233', '7', '1', null);
INSERT INTO `respuestas` VALUES ('482', '234', '7', '1', null);
INSERT INTO `respuestas` VALUES ('483', '235', '7', '1', null);
INSERT INTO `respuestas` VALUES ('484', '236', '7', '1', null);
INSERT INTO `respuestas` VALUES ('485', '237', '7', '1', null);
INSERT INTO `respuestas` VALUES ('486', '238', '7', '1', null);
INSERT INTO `respuestas` VALUES ('487', '239', '7', '1', null);
INSERT INTO `respuestas` VALUES ('488', '240', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('489', '241', '7', '1', '720');
INSERT INTO `respuestas` VALUES ('490', '56', '8', '5', null);
INSERT INTO `respuestas` VALUES ('491', '57', '8', '5', null);
INSERT INTO `respuestas` VALUES ('492', '58', '8', '4', null);
INSERT INTO `respuestas` VALUES ('493', '59', '8', '0', null);
INSERT INTO `respuestas` VALUES ('494', '60', '8', '5', '721');
INSERT INTO `respuestas` VALUES ('495', '61', '8', '5', '721');
INSERT INTO `respuestas` VALUES ('496', '62', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('497', '63', '8', '0', '721');
INSERT INTO `respuestas` VALUES ('498', '64', '8', '3', null);
INSERT INTO `respuestas` VALUES ('499', '65', '8', '5', null);
INSERT INTO `respuestas` VALUES ('500', '66', '8', '0', null);
INSERT INTO `respuestas` VALUES ('501', '67', '8', '5', null);
INSERT INTO `respuestas` VALUES ('502', '68', '8', '5', null);
INSERT INTO `respuestas` VALUES ('503', '69', '8', '5', null);
INSERT INTO `respuestas` VALUES ('504', '70', '8', '5', null);
INSERT INTO `respuestas` VALUES ('505', '71', '8', '5', null);
INSERT INTO `respuestas` VALUES ('506', '72', '8', '5', null);
INSERT INTO `respuestas` VALUES ('507', '73', '8', '5', null);
INSERT INTO `respuestas` VALUES ('508', '74', '8', '5', null);
INSERT INTO `respuestas` VALUES ('509', '75', '8', '5', null);
INSERT INTO `respuestas` VALUES ('510', '76', '8', '5', null);
INSERT INTO `respuestas` VALUES ('511', '77', '8', '5', null);
INSERT INTO `respuestas` VALUES ('512', '78', '8', '5', null);
INSERT INTO `respuestas` VALUES ('513', '79', '8', '5', null);
INSERT INTO `respuestas` VALUES ('514', '80', '8', '5', null);
INSERT INTO `respuestas` VALUES ('515', '81', '8', '3', null);
INSERT INTO `respuestas` VALUES ('516', '82', '8', '3', null);
INSERT INTO `respuestas` VALUES ('517', '95', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('518', '96', '8', '5', '721');
INSERT INTO `respuestas` VALUES ('519', '97', '8', '0', '721');
INSERT INTO `respuestas` VALUES ('520', '98', '8', '2', '721');
INSERT INTO `respuestas` VALUES ('521', '99', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('522', '100', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('523', '101', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('524', '102', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('525', '103', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('526', '104', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('527', '105', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('528', '106', '8', '4', '721');
INSERT INTO `respuestas` VALUES ('529', '121', '8', '5', '721');
INSERT INTO `respuestas` VALUES ('530', '122', '8', '5', '721');
INSERT INTO `respuestas` VALUES ('531', '123', '8', '5', '721');
INSERT INTO `respuestas` VALUES ('532', '129', '8', '5', null);
INSERT INTO `respuestas` VALUES ('533', '130', '8', '5', null);
INSERT INTO `respuestas` VALUES ('534', '131', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('535', '132', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('536', '133', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('537', '134', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('538', '135', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('539', '136', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('540', '137', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('541', '138', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('542', '139', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('543', '140', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('544', '141', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('545', '142', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('546', '21', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('547', '143', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('548', '144', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('549', '145', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('550', '146', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('551', '147', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('552', '27', '8', '1', null);
INSERT INTO `respuestas` VALUES ('553', '152', '8', '1', null);
INSERT INTO `respuestas` VALUES ('554', '153', '8', '1', null);
INSERT INTO `respuestas` VALUES ('555', '154', '8', '1', null);
INSERT INTO `respuestas` VALUES ('556', '155', '8', '1', null);
INSERT INTO `respuestas` VALUES ('557', '156', '8', '1', null);
INSERT INTO `respuestas` VALUES ('558', '157', '8', '1', null);
INSERT INTO `respuestas` VALUES ('559', '158', '8', '1', null);
INSERT INTO `respuestas` VALUES ('560', '159', '8', '1', null);
INSERT INTO `respuestas` VALUES ('561', '160', '8', '1', null);
INSERT INTO `respuestas` VALUES ('562', '163', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('563', '164', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('564', '165', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('565', '166', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('566', '167', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('567', '168', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('568', '169', '8', '1', null);
INSERT INTO `respuestas` VALUES ('569', '170', '8', '1', null);
INSERT INTO `respuestas` VALUES ('570', '171', '8', '1', null);
INSERT INTO `respuestas` VALUES ('571', '172', '8', '1', null);
INSERT INTO `respuestas` VALUES ('572', '173', '8', '1', null);
INSERT INTO `respuestas` VALUES ('573', '174', '8', '1', null);
INSERT INTO `respuestas` VALUES ('574', '175', '8', '1', null);
INSERT INTO `respuestas` VALUES ('575', '176', '8', '1', null);
INSERT INTO `respuestas` VALUES ('576', '177', '8', '1', null);
INSERT INTO `respuestas` VALUES ('577', '178', '8', '1', null);
INSERT INTO `respuestas` VALUES ('578', '179', '8', '1', null);
INSERT INTO `respuestas` VALUES ('579', '180', '8', '1', null);
INSERT INTO `respuestas` VALUES ('580', '181', '8', '1', null);
INSERT INTO `respuestas` VALUES ('581', '182', '8', '1', null);
INSERT INTO `respuestas` VALUES ('582', '183', '8', '1', null);
INSERT INTO `respuestas` VALUES ('583', '184', '8', '1', null);
INSERT INTO `respuestas` VALUES ('584', '185', '8', '1', null);
INSERT INTO `respuestas` VALUES ('585', '186', '8', '1', null);
INSERT INTO `respuestas` VALUES ('586', '187', '8', '1', null);
INSERT INTO `respuestas` VALUES ('587', '188', '8', '1', null);
INSERT INTO `respuestas` VALUES ('588', '189', '8', '1', null);
INSERT INTO `respuestas` VALUES ('589', '190', '8', '1', null);
INSERT INTO `respuestas` VALUES ('590', '191', '8', '1', null);
INSERT INTO `respuestas` VALUES ('591', '192', '8', '1', null);
INSERT INTO `respuestas` VALUES ('592', '193', '8', '1', null);
INSERT INTO `respuestas` VALUES ('593', '194', '8', '1', null);
INSERT INTO `respuestas` VALUES ('594', '195', '8', '2', null);
INSERT INTO `respuestas` VALUES ('595', '196', '8', '1', null);
INSERT INTO `respuestas` VALUES ('596', '197', '8', '1', null);
INSERT INTO `respuestas` VALUES ('597', '198', '8', '1', null);
INSERT INTO `respuestas` VALUES ('598', '199', '8', '1', null);
INSERT INTO `respuestas` VALUES ('599', '200', '8', '1', null);
INSERT INTO `respuestas` VALUES ('600', '201', '8', '1', null);
INSERT INTO `respuestas` VALUES ('601', '202', '8', '2', null);
INSERT INTO `respuestas` VALUES ('602', '203', '8', '1', null);
INSERT INTO `respuestas` VALUES ('603', '204', '8', '1', null);
INSERT INTO `respuestas` VALUES ('604', '205', '8', '1', null);
INSERT INTO `respuestas` VALUES ('605', '206', '8', '1', null);
INSERT INTO `respuestas` VALUES ('606', '207', '8', '1', null);
INSERT INTO `respuestas` VALUES ('607', '208', '8', '1', null);
INSERT INTO `respuestas` VALUES ('608', '209', '8', '1', null);
INSERT INTO `respuestas` VALUES ('609', '210', '8', '1', null);
INSERT INTO `respuestas` VALUES ('610', '211', '8', '1', null);
INSERT INTO `respuestas` VALUES ('611', '215', '8', '1', null);
INSERT INTO `respuestas` VALUES ('612', '216', '8', '1', null);
INSERT INTO `respuestas` VALUES ('613', '44', '8', '1', null);
INSERT INTO `respuestas` VALUES ('614', '229', '8', '1', null);
INSERT INTO `respuestas` VALUES ('615', '230', '8', '1', null);
INSERT INTO `respuestas` VALUES ('616', '231', '8', '1', null);
INSERT INTO `respuestas` VALUES ('617', '232', '8', '1', null);
INSERT INTO `respuestas` VALUES ('618', '233', '8', '1', null);
INSERT INTO `respuestas` VALUES ('619', '234', '8', '1', null);
INSERT INTO `respuestas` VALUES ('620', '235', '8', '1', null);
INSERT INTO `respuestas` VALUES ('621', '236', '8', '1', null);
INSERT INTO `respuestas` VALUES ('622', '237', '8', '1', null);
INSERT INTO `respuestas` VALUES ('623', '238', '8', '1', null);
INSERT INTO `respuestas` VALUES ('624', '239', '8', '1', null);
INSERT INTO `respuestas` VALUES ('625', '240', '8', '1', '721');
INSERT INTO `respuestas` VALUES ('626', '241', '8', '1', '721');

-- ----------------------------
-- Table structure for resultadoevaluacion
-- ----------------------------
DROP TABLE IF EXISTS `resultadoevaluacion`;
CREATE TABLE `resultadoevaluacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` varchar(1000) DEFAULT NULL,
  `encabezado_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `respuestaAbierta` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ResultadoEvaluacion_encabezado1_idx` (`encabezado_id`),
  KEY `fk_ResultadoEvaluacion_pregunta1_idx` (`pregunta_id`),
  CONSTRAINT `fk_ResultadoEvaluacion_encabezado1` FOREIGN KEY (`encabezado_id`) REFERENCES `encabezado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResultadoEvaluacion_pregunta1` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resultadoevaluacion
-- ----------------------------

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'Estudiantes pregrado');
INSERT INTO `rol` VALUES ('2', 'Docentes planta');
INSERT INTO `rol` VALUES ('3', 'Administrativos');
INSERT INTO `rol` VALUES ('4', 'Egresados pregrado');
INSERT INTO `rol` VALUES ('5', 'Directivos');
INSERT INTO `rol` VALUES ('6', 'Empleadores');
INSERT INTO `rol` VALUES ('7', 'Estudiantes especialización');
INSERT INTO `rol` VALUES ('8', 'Estudiantes maestria-doctorado');
INSERT INTO `rol` VALUES ('9', 'Egresados especializacion');
INSERT INTO `rol` VALUES ('10', 'Egresados maestria-doctorado');
INSERT INTO `rol` VALUES ('11', 'Docentes catedra');
