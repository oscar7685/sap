/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : sapnaval

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-05-31 21:32:17
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caracteristica
-- ----------------------------
INSERT INTO `caracteristica` VALUES ('1', '1.1', 'MISIÓN, VISIÓN Y PROYECTO INSTITUCIONAL', '3', '1');
INSERT INTO `caracteristica` VALUES ('2', '1.2', 'PROYECTO EDUCATIVO DEL PROGRAMA', '3', '1');
INSERT INTO `caracteristica` VALUES ('3', '1.3', ' RELEVANCIA ACADÉMICA Y PERTINENCIA SOCIAL DEL PROGRAMA', '3', '1');
INSERT INTO `caracteristica` VALUES ('4', '2.4', ' MECANISMOS DE SELECCIÓN E INGRESO', '4', '1');
INSERT INTO `caracteristica` VALUES ('5', '2.5', ' ESTUDIANTES ADMITIDOS Y CAPACIDAD INSTITUCIONAL', '4', '1');
INSERT INTO `caracteristica` VALUES ('6', '2.6', ' PARTICIPACIÓN EN ACTIVIDADES DE FORMACIÓN INTEGRAL', '4', '1');
INSERT INTO `caracteristica` VALUES ('7', '2.7', ' REGLAMENTOS ESTUDIANTIL Y ACADÉMICO', '4', '1');
INSERT INTO `caracteristica` VALUES ('8', '3.8', ' SELECCIÓN Y VINCULACIÓN DE PROFESORES', '5', '1');
INSERT INTO `caracteristica` VALUES ('9', '3.9', ' ESTATUTO PROFESORAL', '5', '1');
INSERT INTO `caracteristica` VALUES ('10', '3.10', ' NÚMERO, DEDICACIÓN, NIVEL DE FORMACIÓN Y EXPERIENCIA DE LOS PROFESORES', '5', '1');
INSERT INTO `caracteristica` VALUES ('11', '3.11', ' DESARROLLO PROFESORAL', '5', '1');
INSERT INTO `caracteristica` VALUES ('12', '3.12', ' ESTÍMULOS A LA DOCENCIA, INVESTIGACIÓN, CREACIÓN ARTÍSTICA Y CULTURAL, EXTENSIÓN O PROYECCIÓN SOCIAL Y A LA COOPERACIÓN INTERNACIONAL', '5', '1');
INSERT INTO `caracteristica` VALUES ('13', '3.13', ' PRODUCCIÓN, PERTINENCIA, UTILIZACIÓN E IMPACTO DE MATERIAL DOCENTE', '5', '1');
INSERT INTO `caracteristica` VALUES ('14', '3.14', ' REMUNERACIÓN POR MÉRITOS', '5', '1');
INSERT INTO `caracteristica` VALUES ('15', '3.15', ' EVALUACIÓN DE PROFESORES', '5', '1');
INSERT INTO `caracteristica` VALUES ('16', '4.16', ' INTEGRALIDAD DEL CURRÍCULO', '6', '1');
INSERT INTO `caracteristica` VALUES ('17', '4.17', ' FLEXIBILIDAD DEL CURRÍCULO', '6', '1');
INSERT INTO `caracteristica` VALUES ('18', '4.18', ' INTERDISCIPLINARIEDAD', '6', '1');
INSERT INTO `caracteristica` VALUES ('19', '4.19', ' ESTRATEGIAS DE ENSEÑANZA Y APRENDIZAJE', '6', '1');
INSERT INTO `caracteristica` VALUES ('20', '4.20', ' SISTEMA DE EVALUACIÓN DE ESTUDIANTES', '6', '1');
INSERT INTO `caracteristica` VALUES ('21', '4.21', ' TRABAJOS DE LOS ESTUDIANTES', '6', '1');
INSERT INTO `caracteristica` VALUES ('22', '4.22', ' EVALUACIÓN Y AUTORREGULACIÓN DEL PROGRAMA', '6', '1');
INSERT INTO `caracteristica` VALUES ('23', '4.23', ' EXTENSIÓN O PROYECCIÓN SOCIAL', '6', '1');
INSERT INTO `caracteristica` VALUES ('24', '4.24', ' RECURSOS BIBLIOGRÁFICOS', '6', '1');
INSERT INTO `caracteristica` VALUES ('25', '4.25', ' RECURSOS INFORMÁTICOS Y DE COMUNICACIÓN', '6', '1');
INSERT INTO `caracteristica` VALUES ('26', '4.26', ' RECURSOS DE APOYO DOCENTE', '6', '1');
INSERT INTO `caracteristica` VALUES ('27', '5.27', ' INSERCIÓN DEL PROGRAMA EN CONTEXTOS ACADÉMICOS NACIONALES E INTERNACIONALES', '7', '1');
INSERT INTO `caracteristica` VALUES ('28', '5.28', ' RELACIONES EXTERNAS DE PROFESORES Y ESTUDIANTES', '7', '1');
INSERT INTO `caracteristica` VALUES ('29', '6.29', 'FORMACIÓN PARA LA INVESTIGACIÓN, LA INNOVACIÓN Y LA CREACIÓN ARTÍSTICA Y CULTURAL', '8', '1');
INSERT INTO `caracteristica` VALUES ('30', '6.30', ' COMPROMISO CON LA INVESTIGACIÓN, LA INNOVACIÓN Y LA CREACIÓN ARTÍSTICA Y CULTURAL', '8', '1');
INSERT INTO `caracteristica` VALUES ('31', '7.31', ' POLÍTICAS, PROGRAMAS Y SERVICIOS DE BIENESTAR UNIVERSITARIO', '9', '1');
INSERT INTO `caracteristica` VALUES ('32', '7.32', ' PERMANENCIA Y RETENCIÓN ESTUDIANTIL', '9', '1');
INSERT INTO `caracteristica` VALUES ('33', '8.33', ' ORGANIZACIÓN, ADMINISTRACIÓN Y GESTIÓN DEL PROGRAMA', '10', '1');
INSERT INTO `caracteristica` VALUES ('34', '8.34', ' SISTEMAS DE COMUNICACIÓN E INFORMACIÓN', '10', '1');
INSERT INTO `caracteristica` VALUES ('35', '8.35', ' DIRECCIÓN DEL PROGRAMA', '10', '1');
INSERT INTO `caracteristica` VALUES ('36', '9.36', ' SEGUIMIENTO DE LOS EGRESADOS', '11', '1');
INSERT INTO `caracteristica` VALUES ('37', '9.37', ' IMPACTO DE LOS EGRESADOS EN EL MEDIO SOCIAL Y ACADÉMICO', '11', '1');
INSERT INTO `caracteristica` VALUES ('38', '10.38', ' RECURSOS FÍSICOS', '12', '1');
INSERT INTO `caracteristica` VALUES ('39', '10.39', ' PRESUPUESTO DEL PROGRAMA', '12', '1');
INSERT INTO `caracteristica` VALUES ('40', '10.40', ' ADMINISTRACIÓN DE RECURSOS', '12', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of condicion
-- ----------------------------
INSERT INTO `condicion` VALUES ('1', '24', '25', 'MostrarSI', '21');
INSERT INTO `condicion` VALUES ('2', '26', '27', 'MostrarSI', '23');
INSERT INTO `condicion` VALUES ('3', '52', '53', 'MostrarSI', '37');
INSERT INTO `condicion` VALUES ('4', '69', '70', 'MostrarSI', '41');
INSERT INTO `condicion` VALUES ('5', '79', '80', 'MostrarSI', '45');
INSERT INTO `condicion` VALUES ('6', '81', '82', 'MostrarSI', '47');
INSERT INTO `condicion` VALUES ('7', '98', '99', 'MostrarSI', '68');
INSERT INTO `condicion` VALUES ('8', '14', '15', 'MostrarSI', '15');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of encuesta
-- ----------------------------
INSERT INTO `encuesta` VALUES ('1', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PROFESORES', 'Actualmente el programa de  _PROGRAMA_ se encuentra en proceso de autoevaluación con el fin de obtener la renovación de la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('2', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A ESTUDIANTES', 'Actualmente el programa de  _PROGRAMA_ se encuentra en proceso de autoevaluación con el fin de obtener la renovación de la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('3', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL ADMINISTRATIVO', 'Actualmente el programa de  _PROGRAMA_ se encuentra en proceso de autoevaluación con el fin de obtener la renovación de la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('4', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A PERSONAL DIRECTIVO', 'Actualmente el programa de  _PROGRAMA_ se encuentra en proceso de autoevaluación con el fin de obtener la renovación de la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('5', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EGRESADOS', 'Actualmente el programa de  _PROGRAMA_ se encuentra en proceso de autoevaluación con el fin de obtener la renovación de la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');
INSERT INTO `encuesta` VALUES ('6', 'FAYM-FT-453-JINEN-V02', 'ENCUESTA A EMPLEADORES', 'Actualmente el programa de  _PROGRAMA_ se encuentra en proceso de autoevaluación con el fin de obtener la renovación de la acreditación de alta calidad por parte del CNA, identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.', 'Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento de cada uno de los indicadores enunciados.', '1', 'Procedimiento: Autoevaluación', 'Rige a partir de: 04/04/08');

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
INSERT INTO `encuestahaspregunta` VALUES ('2', '1');
INSERT INTO `encuestahaspregunta` VALUES ('2', '2');
INSERT INTO `encuestahaspregunta` VALUES ('1', '3');
INSERT INTO `encuestahaspregunta` VALUES ('3', '3');
INSERT INTO `encuestahaspregunta` VALUES ('4', '3');
INSERT INTO `encuestahaspregunta` VALUES ('6', '3');
INSERT INTO `encuestahaspregunta` VALUES ('1', '4');
INSERT INTO `encuestahaspregunta` VALUES ('3', '4');
INSERT INTO `encuestahaspregunta` VALUES ('4', '4');
INSERT INTO `encuestahaspregunta` VALUES ('5', '4');
INSERT INTO `encuestahaspregunta` VALUES ('6', '4');
INSERT INTO `encuestahaspregunta` VALUES ('5', '5');
INSERT INTO `encuestahaspregunta` VALUES ('5', '6');
INSERT INTO `encuestahaspregunta` VALUES ('5', '7');
INSERT INTO `encuestahaspregunta` VALUES ('4', '8');
INSERT INTO `encuestahaspregunta` VALUES ('1', '9');
INSERT INTO `encuestahaspregunta` VALUES ('3', '9');
INSERT INTO `encuestahaspregunta` VALUES ('1', '10');
INSERT INTO `encuestahaspregunta` VALUES ('1', '11');
INSERT INTO `encuestahaspregunta` VALUES ('3', '11');
INSERT INTO `encuestahaspregunta` VALUES ('1', '12');
INSERT INTO `encuestahaspregunta` VALUES ('2', '12');
INSERT INTO `encuestahaspregunta` VALUES ('3', '12');
INSERT INTO `encuestahaspregunta` VALUES ('4', '12');
INSERT INTO `encuestahaspregunta` VALUES ('5', '12');
INSERT INTO `encuestahaspregunta` VALUES ('6', '12');
INSERT INTO `encuestahaspregunta` VALUES ('1', '13');
INSERT INTO `encuestahaspregunta` VALUES ('2', '13');
INSERT INTO `encuestahaspregunta` VALUES ('3', '13');
INSERT INTO `encuestahaspregunta` VALUES ('4', '13');
INSERT INTO `encuestahaspregunta` VALUES ('5', '13');
INSERT INTO `encuestahaspregunta` VALUES ('1', '14');
INSERT INTO `encuestahaspregunta` VALUES ('2', '14');
INSERT INTO `encuestahaspregunta` VALUES ('3', '14');
INSERT INTO `encuestahaspregunta` VALUES ('4', '14');
INSERT INTO `encuestahaspregunta` VALUES ('5', '14');
INSERT INTO `encuestahaspregunta` VALUES ('1', '15');
INSERT INTO `encuestahaspregunta` VALUES ('2', '15');
INSERT INTO `encuestahaspregunta` VALUES ('3', '15');
INSERT INTO `encuestahaspregunta` VALUES ('4', '15');
INSERT INTO `encuestahaspregunta` VALUES ('5', '15');
INSERT INTO `encuestahaspregunta` VALUES ('1', '16');
INSERT INTO `encuestahaspregunta` VALUES ('2', '16');
INSERT INTO `encuestahaspregunta` VALUES ('1', '17');
INSERT INTO `encuestahaspregunta` VALUES ('2', '17');
INSERT INTO `encuestahaspregunta` VALUES ('2', '18');
INSERT INTO `encuestahaspregunta` VALUES ('2', '19');
INSERT INTO `encuestahaspregunta` VALUES ('1', '20');
INSERT INTO `encuestahaspregunta` VALUES ('2', '20');
INSERT INTO `encuestahaspregunta` VALUES ('1', '21');
INSERT INTO `encuestahaspregunta` VALUES ('2', '21');
INSERT INTO `encuestahaspregunta` VALUES ('1', '22');
INSERT INTO `encuestahaspregunta` VALUES ('2', '22');
INSERT INTO `encuestahaspregunta` VALUES ('4', '22');
INSERT INTO `encuestahaspregunta` VALUES ('1', '23');
INSERT INTO `encuestahaspregunta` VALUES ('4', '23');
INSERT INTO `encuestahaspregunta` VALUES ('1', '24');
INSERT INTO `encuestahaspregunta` VALUES ('2', '24');
INSERT INTO `encuestahaspregunta` VALUES ('4', '24');
INSERT INTO `encuestahaspregunta` VALUES ('1', '25');
INSERT INTO `encuestahaspregunta` VALUES ('2', '25');
INSERT INTO `encuestahaspregunta` VALUES ('4', '25');
INSERT INTO `encuestahaspregunta` VALUES ('1', '26');
INSERT INTO `encuestahaspregunta` VALUES ('1', '27');
INSERT INTO `encuestahaspregunta` VALUES ('4', '27');
INSERT INTO `encuestahaspregunta` VALUES ('1', '28');
INSERT INTO `encuestahaspregunta` VALUES ('4', '28');
INSERT INTO `encuestahaspregunta` VALUES ('1', '29');
INSERT INTO `encuestahaspregunta` VALUES ('2', '29');
INSERT INTO `encuestahaspregunta` VALUES ('4', '29');
INSERT INTO `encuestahaspregunta` VALUES ('1', '30');
INSERT INTO `encuestahaspregunta` VALUES ('2', '30');
INSERT INTO `encuestahaspregunta` VALUES ('4', '30');
INSERT INTO `encuestahaspregunta` VALUES ('1', '31');
INSERT INTO `encuestahaspregunta` VALUES ('1', '32');
INSERT INTO `encuestahaspregunta` VALUES ('1', '33');
INSERT INTO `encuestahaspregunta` VALUES ('1', '34');
INSERT INTO `encuestahaspregunta` VALUES ('4', '34');
INSERT INTO `encuestahaspregunta` VALUES ('1', '35');
INSERT INTO `encuestahaspregunta` VALUES ('1', '36');
INSERT INTO `encuestahaspregunta` VALUES ('1', '37');
INSERT INTO `encuestahaspregunta` VALUES ('1', '38');
INSERT INTO `encuestahaspregunta` VALUES ('1', '39');
INSERT INTO `encuestahaspregunta` VALUES ('4', '39');
INSERT INTO `encuestahaspregunta` VALUES ('1', '40');
INSERT INTO `encuestahaspregunta` VALUES ('4', '40');
INSERT INTO `encuestahaspregunta` VALUES ('1', '41');
INSERT INTO `encuestahaspregunta` VALUES ('4', '41');
INSERT INTO `encuestahaspregunta` VALUES ('1', '42');
INSERT INTO `encuestahaspregunta` VALUES ('4', '42');
INSERT INTO `encuestahaspregunta` VALUES ('1', '43');
INSERT INTO `encuestahaspregunta` VALUES ('1', '44');
INSERT INTO `encuestahaspregunta` VALUES ('1', '45');
INSERT INTO `encuestahaspregunta` VALUES ('2', '46');
INSERT INTO `encuestahaspregunta` VALUES ('2', '47');
INSERT INTO `encuestahaspregunta` VALUES ('1', '48');
INSERT INTO `encuestahaspregunta` VALUES ('1', '49');
INSERT INTO `encuestahaspregunta` VALUES ('1', '50');
INSERT INTO `encuestahaspregunta` VALUES ('1', '51');
INSERT INTO `encuestahaspregunta` VALUES ('1', '52');
INSERT INTO `encuestahaspregunta` VALUES ('1', '53');
INSERT INTO `encuestahaspregunta` VALUES ('1', '54');
INSERT INTO `encuestahaspregunta` VALUES ('1', '55');
INSERT INTO `encuestahaspregunta` VALUES ('2', '56');
INSERT INTO `encuestahaspregunta` VALUES ('4', '56');
INSERT INTO `encuestahaspregunta` VALUES ('1', '57');
INSERT INTO `encuestahaspregunta` VALUES ('1', '58');
INSERT INTO `encuestahaspregunta` VALUES ('2', '58');
INSERT INTO `encuestahaspregunta` VALUES ('4', '58');
INSERT INTO `encuestahaspregunta` VALUES ('2', '59');
INSERT INTO `encuestahaspregunta` VALUES ('4', '59');
INSERT INTO `encuestahaspregunta` VALUES ('1', '60');
INSERT INTO `encuestahaspregunta` VALUES ('1', '61');
INSERT INTO `encuestahaspregunta` VALUES ('2', '61');
INSERT INTO `encuestahaspregunta` VALUES ('1', '62');
INSERT INTO `encuestahaspregunta` VALUES ('2', '62');
INSERT INTO `encuestahaspregunta` VALUES ('4', '62');
INSERT INTO `encuestahaspregunta` VALUES ('1', '63');
INSERT INTO `encuestahaspregunta` VALUES ('2', '63');
INSERT INTO `encuestahaspregunta` VALUES ('1', '64');
INSERT INTO `encuestahaspregunta` VALUES ('2', '64');
INSERT INTO `encuestahaspregunta` VALUES ('4', '64');
INSERT INTO `encuestahaspregunta` VALUES ('1', '65');
INSERT INTO `encuestahaspregunta` VALUES ('2', '65');
INSERT INTO `encuestahaspregunta` VALUES ('1', '66');
INSERT INTO `encuestahaspregunta` VALUES ('2', '66');
INSERT INTO `encuestahaspregunta` VALUES ('4', '66');
INSERT INTO `encuestahaspregunta` VALUES ('2', '67');
INSERT INTO `encuestahaspregunta` VALUES ('1', '68');
INSERT INTO `encuestahaspregunta` VALUES ('4', '68');
INSERT INTO `encuestahaspregunta` VALUES ('1', '69');
INSERT INTO `encuestahaspregunta` VALUES ('4', '69');
INSERT INTO `encuestahaspregunta` VALUES ('1', '70');
INSERT INTO `encuestahaspregunta` VALUES ('4', '70');
INSERT INTO `encuestahaspregunta` VALUES ('1', '71');
INSERT INTO `encuestahaspregunta` VALUES ('2', '71');
INSERT INTO `encuestahaspregunta` VALUES ('4', '71');
INSERT INTO `encuestahaspregunta` VALUES ('1', '72');
INSERT INTO `encuestahaspregunta` VALUES ('2', '72');
INSERT INTO `encuestahaspregunta` VALUES ('4', '72');
INSERT INTO `encuestahaspregunta` VALUES ('6', '73');
INSERT INTO `encuestahaspregunta` VALUES ('1', '74');
INSERT INTO `encuestahaspregunta` VALUES ('2', '74');
INSERT INTO `encuestahaspregunta` VALUES ('4', '74');
INSERT INTO `encuestahaspregunta` VALUES ('1', '75');
INSERT INTO `encuestahaspregunta` VALUES ('2', '75');
INSERT INTO `encuestahaspregunta` VALUES ('4', '75');
INSERT INTO `encuestahaspregunta` VALUES ('1', '76');
INSERT INTO `encuestahaspregunta` VALUES ('2', '76');
INSERT INTO `encuestahaspregunta` VALUES ('1', '77');
INSERT INTO `encuestahaspregunta` VALUES ('2', '77');
INSERT INTO `encuestahaspregunta` VALUES ('1', '78');
INSERT INTO `encuestahaspregunta` VALUES ('2', '78');
INSERT INTO `encuestahaspregunta` VALUES ('1', '79');
INSERT INTO `encuestahaspregunta` VALUES ('4', '79');
INSERT INTO `encuestahaspregunta` VALUES ('1', '80');
INSERT INTO `encuestahaspregunta` VALUES ('4', '80');
INSERT INTO `encuestahaspregunta` VALUES ('1', '81');
INSERT INTO `encuestahaspregunta` VALUES ('2', '81');
INSERT INTO `encuestahaspregunta` VALUES ('4', '81');
INSERT INTO `encuestahaspregunta` VALUES ('1', '82');
INSERT INTO `encuestahaspregunta` VALUES ('2', '82');
INSERT INTO `encuestahaspregunta` VALUES ('4', '82');
INSERT INTO `encuestahaspregunta` VALUES ('1', '83');
INSERT INTO `encuestahaspregunta` VALUES ('2', '83');
INSERT INTO `encuestahaspregunta` VALUES ('1', '84');
INSERT INTO `encuestahaspregunta` VALUES ('1', '85');
INSERT INTO `encuestahaspregunta` VALUES ('1', '86');
INSERT INTO `encuestahaspregunta` VALUES ('2', '86');
INSERT INTO `encuestahaspregunta` VALUES ('3', '86');
INSERT INTO `encuestahaspregunta` VALUES ('4', '86');
INSERT INTO `encuestahaspregunta` VALUES ('1', '87');
INSERT INTO `encuestahaspregunta` VALUES ('2', '87');
INSERT INTO `encuestahaspregunta` VALUES ('3', '87');
INSERT INTO `encuestahaspregunta` VALUES ('4', '87');
INSERT INTO `encuestahaspregunta` VALUES ('1', '88');
INSERT INTO `encuestahaspregunta` VALUES ('2', '88');
INSERT INTO `encuestahaspregunta` VALUES ('3', '88');
INSERT INTO `encuestahaspregunta` VALUES ('4', '88');
INSERT INTO `encuestahaspregunta` VALUES ('1', '89');
INSERT INTO `encuestahaspregunta` VALUES ('2', '89');
INSERT INTO `encuestahaspregunta` VALUES ('3', '89');
INSERT INTO `encuestahaspregunta` VALUES ('4', '89');
INSERT INTO `encuestahaspregunta` VALUES ('3', '90');
INSERT INTO `encuestahaspregunta` VALUES ('3', '91');
INSERT INTO `encuestahaspregunta` VALUES ('1', '92');
INSERT INTO `encuestahaspregunta` VALUES ('2', '92');
INSERT INTO `encuestahaspregunta` VALUES ('1', '93');
INSERT INTO `encuestahaspregunta` VALUES ('2', '93');
INSERT INTO `encuestahaspregunta` VALUES ('3', '93');
INSERT INTO `encuestahaspregunta` VALUES ('4', '93');
INSERT INTO `encuestahaspregunta` VALUES ('1', '94');
INSERT INTO `encuestahaspregunta` VALUES ('2', '94');
INSERT INTO `encuestahaspregunta` VALUES ('3', '94');
INSERT INTO `encuestahaspregunta` VALUES ('4', '94');
INSERT INTO `encuestahaspregunta` VALUES ('1', '95');
INSERT INTO `encuestahaspregunta` VALUES ('2', '95');
INSERT INTO `encuestahaspregunta` VALUES ('3', '95');
INSERT INTO `encuestahaspregunta` VALUES ('2', '96');
INSERT INTO `encuestahaspregunta` VALUES ('1', '97');
INSERT INTO `encuestahaspregunta` VALUES ('2', '97');
INSERT INTO `encuestahaspregunta` VALUES ('1', '98');
INSERT INTO `encuestahaspregunta` VALUES ('3', '98');
INSERT INTO `encuestahaspregunta` VALUES ('4', '98');
INSERT INTO `encuestahaspregunta` VALUES ('1', '99');
INSERT INTO `encuestahaspregunta` VALUES ('3', '99');
INSERT INTO `encuestahaspregunta` VALUES ('4', '99');
INSERT INTO `encuestahaspregunta` VALUES ('6', '100');
INSERT INTO `encuestahaspregunta` VALUES ('6', '101');
INSERT INTO `encuestahaspregunta` VALUES ('5', '102');
INSERT INTO `encuestahaspregunta` VALUES ('5', '103');
INSERT INTO `encuestahaspregunta` VALUES ('5', '104');
INSERT INTO `encuestahaspregunta` VALUES ('5', '105');
INSERT INTO `encuestahaspregunta` VALUES ('6', '106');
INSERT INTO `encuestahaspregunta` VALUES ('1', '107');
INSERT INTO `encuestahaspregunta` VALUES ('2', '107');
INSERT INTO `encuestahaspregunta` VALUES ('3', '107');
INSERT INTO `encuestahaspregunta` VALUES ('4', '107');
INSERT INTO `encuestahaspregunta` VALUES ('1', '108');
INSERT INTO `encuestahaspregunta` VALUES ('4', '108');
INSERT INTO `encuestahaspregunta` VALUES ('1', '109');
INSERT INTO `encuestahaspregunta` VALUES ('4', '109');

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
INSERT INTO `factor` VALUES ('3', '1', 'Misión, Proyecto Institucional y de programa', '1');
INSERT INTO `factor` VALUES ('4', '2', ' Estudiantes', '1');
INSERT INTO `factor` VALUES ('5', '3', ' Profesores', '1');
INSERT INTO `factor` VALUES ('6', '4', ' Procesos académicos', '1');
INSERT INTO `factor` VALUES ('7', '5', ' Visibilidad nacional e internacional', '1');
INSERT INTO `factor` VALUES ('8', '6', ' Investigación, innovación, creación artística y cultural', '1');
INSERT INTO `factor` VALUES ('9', '7', ' Bienestar institucional', '1');
INSERT INTO `factor` VALUES ('10', '8', ' Organización, administración y gestión', '1');
INSERT INTO `factor` VALUES ('11', '9', ' Impacto de los egresados en el medio', '1');
INSERT INTO `factor` VALUES ('12', '10', ' Recursos físicos y financieros', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facultad
-- ----------------------------
INSERT INTO `facultad` VALUES ('1', 'Facultad de Administración', 'Facultad de Administración');
INSERT INTO `facultad` VALUES ('2', 'Facultad de Oceanografía Física', 'Facultad de Oceanografía Física');
INSERT INTO `facultad` VALUES ('3', 'Facultad de Ciencias Navales', 'Facultad de Ciencias Navales');
INSERT INTO `facultad` VALUES ('4', 'Facultad de Infantería de Marina', 'Facultad de Infantería de Marina');
INSERT INTO `facultad` VALUES ('5', 'Facultad de Ingeniería', 'Facultad de Ingeniería');

-- ----------------------------
-- Table structure for fuente
-- ----------------------------
DROP TABLE IF EXISTS `fuente`;
CREATE TABLE `fuente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fuente
-- ----------------------------
INSERT INTO `fuente` VALUES ('1', 'Estudiantes', 'Estudiantes');
INSERT INTO `fuente` VALUES ('2', 'Docentes', 'Docentes');
INSERT INTO `fuente` VALUES ('3', 'Administrativos', 'Administrativos');
INSERT INTO `fuente` VALUES ('4', 'Egresados', 'Egresados');
INSERT INTO `fuente` VALUES ('5', 'Directores de programa', 'Directores de programa');
INSERT INTO `fuente` VALUES ('6', 'Empleadores', 'Empleadores');

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
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of indicador
-- ----------------------------
INSERT INTO `indicador` VALUES ('1', '1.1.1', 'Apropiación de la visión y la misión institucional por parte de la comunidad académica. ', '1', '1');
INSERT INTO `indicador` VALUES ('2', '1.1.2', 'Correspondencia entre la visión y la misión institucional y los objetivos del programa académico. ', '1', '1');
INSERT INTO `indicador` VALUES ('3', '1.1.3', 'El proyecto institucional orienta las acciones y decisiones del programa académico, en la gestión del currículo, la docencia, la investigación científica, la creación artística, la internacionalización, la proyección social, el bienestar de la comunidad institucional y demás áreas estratégicas de la institución. ', '1', '1');
INSERT INTO `indicador` VALUES ('4', '1.1.4', 'La institución cuenta con una política eficaz y tiene evidencias sobre alternativas de financiación para facilitar el ingreso y permanencia de los estudiantes que evidencian dificultades económicas. ', '1', '1');
INSERT INTO `indicador` VALUES ('5', '1.1.5', 'La institución aplica una política eficaz que permite el acceso a la educación superior sin discriminación. Promueve estrategias eficaces orientadas a identificar, eliminar o disminuir barreras comunicativas para poblaciones diversas. ', '1', '1');
INSERT INTO `indicador` VALUES ('6', '1.1.6', 'La institución cuenta con una política eficaz orientada a identificar, eliminar o disminuir barreras en infraestructura física. La institución tiene evidencias sobre la aplicación de esta política', '1', '1');
INSERT INTO `indicador` VALUES ('7', '1.2.1', 'Estrategias y mecanismos establecidos para la discusión, actualización y difusión del Proyecto Educativo del Programa académico. ', '2', '1');
INSERT INTO `indicador` VALUES ('8', '1.2.2', 'Apropiación del Proyecto Educativo del Programa por parte de la comunidad académica del programa. ', '2', '1');
INSERT INTO `indicador` VALUES ('9', '1.2.3', 'Modelo pedagógico o concepción de aprendizaje que sustentan la metodología de enseñanza en que se ofrece el programa evaluado. ', '2', '1');
INSERT INTO `indicador` VALUES ('10', '1.2.4', 'Coherencia entre el Proyecto Educativo del Programa y las actividades académicas desarrolladas. ', '2', '1');
INSERT INTO `indicador` VALUES ('11', '1.3.1', 'Análisis realizados sobre las tendencias y líneas de desarrollo de la disciplina o profesión en el ámbito local, regional, nacional e internacional, y su incidencia en el programa. ', '3', '1');
INSERT INTO `indicador` VALUES ('12', '1.3.2', 'Estudios orientados a identificar las necesidades y requerimientos del entorno laboral (local, regional y nacional) en términos productivos y de competitividad, tecnológicos y de talento humano. Acciones del programa para atenderlos. ', '3', '1');
INSERT INTO `indicador` VALUES ('13', '1.3.3', 'Estudios que demuestren la necesidad social del programa en la metodología que se ofrece. ', '3', '1');
INSERT INTO `indicador` VALUES ('14', '1.3.4', 'Correspondencia entre el perfil laboral y ocupacional del sector y el perfil profesional expresado en el Proyecto Educativo del Programa. ', '3', '1');
INSERT INTO `indicador` VALUES ('15', '1.3.5', 'Estudios y/o proyectos formulados o en desarrollo, que propendan por la modernización, actualización y pertinencia del currículo de acuerdo con las necesidades del entorno. ', '3', '1');
INSERT INTO `indicador` VALUES ('16', '1.3.6', 'Estudios actualizados sobre las necesidades formativas en la región de influencia del programa. ', '3', '1');
INSERT INTO `indicador` VALUES ('17', '1.3.7', 'Cambios en el plan de estudios, resultantes de experiencias relativas al análisis y propuestas de solución a los problemas del contexto. ', '3', '1');
INSERT INTO `indicador` VALUES ('18', '1.3.8', 'Proyectos que adelanta el programa, mediante sus funciones de docencia, investigación, innovación, creación artística y cultural, y extensión tendientes a ejercer un impacto sobre el medio, de acuerdo con el Proyecto Educativo del Programa. ', '3', '1');
INSERT INTO `indicador` VALUES ('19', '1.3.9', 'Estudios orientados a evaluar el impacto del programa con respecto al cumplimiento de sus propósitos y objetivos, así como la incidencia en el entorno social y su grupo de referencia disciplinar o profesional', '3', '1');
INSERT INTO `indicador` VALUES ('20', '2.4.1', 'Mecanismos de ingreso que garanticen transparencia en la selección de los estudiantes. ', '4', '1');
INSERT INTO `indicador` VALUES ('21', '2.4.2', 'Estudiantes que ingresaron mediante la aplicación de reglas generales y mecanismos de admisión excepcionales, en los últimos cinco años. ', '4', '1');
INSERT INTO `indicador` VALUES ('22', '2.4.3', 'Existencia y utilización de sistemas y mecanismos de evaluación de los procesos de selección y admisión, y aplicación de los resultados de dicha evaluación. ', '4', '1');
INSERT INTO `indicador` VALUES ('23', '2.4.4', 'Requerimientos para el ingreso de estudiantes en condición de transferencia, homologación u otro proceso que amerite criterios específicos para el tránsito entre ciclos, niveles y/o instituciones. Beneficios de estos requerimientos en la formación integral de los estudiantes.', '4', '1');
INSERT INTO `indicador` VALUES ('24', '2.5.1', 'Políticas institucionales para la definición del número de estudiantes que se admiten al programa, acorde con el cuerpo docente, los recursos físicos y de apoyo académico disponibles. ', '5', '1');
INSERT INTO `indicador` VALUES ('25', '2.5.2', 'Apreciación de profesores y estudiantes del programa con respecto a la relación entre el número de admitidos, el cuerpo docente y los recursos académicos y físicos disponibles. ', '5', '1');
INSERT INTO `indicador` VALUES ('26', '2.5.3', 'Población de estudiantes que ingreso al programa en los últimos cinco años, el puntaje promedio obtenido por los admitidos en las Pruebas de Estado, el puntaje promedio estandarizado en pruebas de admisión cuando éstas se realicen, el puntaje mínimo aceptable para ingresar y la capacidad de selección y absorción de estudiantes por parte del programa (relación entre inscritos y admitidos, relación entre inscritos y matriculados). ', '5', '1');
INSERT INTO `indicador` VALUES ('27', '2.6.1', 'Políticas y estrategias definidas por el programa en materia de formación integral de los estudiantes. ', '6', '1');
INSERT INTO `indicador` VALUES ('28', '2.6.2', 'Apreciación de los estudiantes sobre la calidad de los espacios y estrategias que ofrece el programa, de acuerdo con la naturaleza y orientación de éste, para la participación en grupos o centros de estudio, proyectos de experimentación o de desarrollo empresarial y demás actividades académicas y culturales distintas de la docencia que contribuyan a su formación integral. ', '6', '1');
INSERT INTO `indicador` VALUES ('29', '2.6.3', 'Estudiantes que participan efectivamente en grupos o centros de estudio, proyectos de experimentación o de desarrollo empresarial o en las demás actividades académicas y culturales distintas de la docencia que brinda la institución o el programa para contribuir a la formación integral', '6', '1');
INSERT INTO `indicador` VALUES ('30', '2.7.1', 'Mecanismos utilizados para la divulgación del reglamento estudiantil y académico. ', '7', '1');
INSERT INTO `indicador` VALUES ('31', '2.7.2', 'Apreciación de estudiantes y profesores del programa sobre la pertinencia, vigencia y aplicación del reglamento estudiantil y académico. ', '7', '1');
INSERT INTO `indicador` VALUES ('32', '2.7.3', 'Evidencias sobre la aplicación de las normas establecidas en los reglamentos estudiantil y académico para atender las situaciones presentadas con los estudiantes. ', '7', '1');
INSERT INTO `indicador` VALUES ('33', '2.7.4', 'Apreciación de directivos, profesores y estudiantes sobre la participación del estudiantado en los órganos de dirección del programa. ', '7', '1');
INSERT INTO `indicador` VALUES ('34', '2.7.5', 'Políticas y estrategias sobre estímulos académicos para los estudiantes. El programa tiene evidencias sobre la aplicación de estas políticas y estrategias. ', '7', '1');
INSERT INTO `indicador` VALUES ('35', '3.8.1', 'Aplicación de las políticas, las normas y los criterios académicos establecidos por la institución para la selección y la vinculación de los profesores. ', '8', '1');
INSERT INTO `indicador` VALUES ('36', '3.8.2', 'Estrategias de la Institución para propiciar la permanencia de los profesores en el programa y el relevo generacional. ', '8', '1');
INSERT INTO `indicador` VALUES ('37', '3.8.3', 'Apreciación de directivos, profesores y estudiantes sobre la aplicación, pertinencia y vigencia de las políticas, las normas y los criterios académicos establecidos por la institución para la selección, vinculación y permanencia de sus profesores. ', '8', '1');
INSERT INTO `indicador` VALUES ('38', '3.9.1', 'Mecanismos de divulgación del estatuto profesoral. ', '9', '1');
INSERT INTO `indicador` VALUES ('39', '3.9.2', 'Apreciación de directivos y profesores del programa sobre la pertinencia, vigencia y aplicación del estatuto profesoral. ', '9', '1');
INSERT INTO `indicador` VALUES ('40', '3.9.3', 'Información actualizada sobre el número de profesores adscritos a la facultad, al programa o departamento que sirva al mismo, por categorías académicas establecidas en el escalafón. ', '9', '1');
INSERT INTO `indicador` VALUES ('41', '3.9.4', 'Aplicación de las políticas institucionales en materia de ubicación, permanencia y ascenso en las categorías del escalafón docente. ', '9', '1');
INSERT INTO `indicador` VALUES ('42', '3.9.5', 'Apreciación de directivos y profesores sobre la aplicación de las políticas institucionales en materia de participación del profesorado en los órganos de dirección de la institución y del programa. ', '9', '1');
INSERT INTO `indicador` VALUES ('43', '3.9.6', 'Evidencias sobre la participación de los profesores en los órganos de dirección del programa, de la facultad, del departamento y/o de la institución, durante los últimos cinco años. ', '9', '1');
INSERT INTO `indicador` VALUES ('44', '3.10.1', 'Profesores de planta con título de especialización, maestría y doctorado en relación con el objeto de conocimiento del programa adscritos directamente o a través de la facultad o departamento respectivo, e información demostrada acerca de las instituciones en las cuales fueron formados. ', '10', '1');
INSERT INTO `indicador` VALUES ('45', '3.10.2', 'Profesores del programa adscritos en forma directa o a través de la facultad o departamento respectivo con dedicación de tiempo completo, medio tiempo y cátedra, según nivel de formación. ', '10', '1');
INSERT INTO `indicador` VALUES ('46', '3.10.3', 'Tiempos de cada profesor del programa adscritos directamente o a través de la facultad o departamento respectivo, dedicados a la docencia (incluyendo el desarrollo de productos, artefactos, materiales y prototipos, entre otros), a la investigación, a la creación artística, a la extensión o proyección social, a la atención de funciones de gestión académica o administrativa, a la tutoría individual de los estudiantes, de acuerdo con la naturaleza del programa. ', '10', '1');
INSERT INTO `indicador` VALUES ('47', '3.10.4', 'Tiempos de los profesores de cátedra dedicados a las tutorías, el acompañamiento de estudiante y el desarrollo de competencias, especialmente actitudes, conocimientos, capacidades y habilidades. ', '10', '1');
INSERT INTO `indicador` VALUES ('48', '3.10.5', 'Experiencia profesional y/o académica de los profesores, según necesidades y exigencias del programa para el desarrollo óptimo de sus funciones sustantivas. ', '10', '1');
INSERT INTO `indicador` VALUES ('49', '3.10.6', 'Suficiencia del número de profesores con relación a la cantidad de estudiantes del programa y sus necesidades de formación de acuerdo con el proyecto educativo. ', '10', '1');
INSERT INTO `indicador` VALUES ('50', '3.10.7', 'Apreciación de directivos, profesores y estudiantes del programa adscritos directamente o a través de la facultad o departamento respectivo, sobre la calidad y la suficiencia del número y de la dedicación de los profesores al servicio de éste. ', '10', '1');
INSERT INTO `indicador` VALUES ('51', '3.10.8', 'Existencia y utilización de sistemas y criterios para evaluar el número, la dedicación, el nivel de formación y la experiencia de los profesores del programa, adscritos directamente o a través de la facultad o departamento respectivo; periodicidad de esta evaluación; acciones adelantadas por la institución y el programa, a partir de los resultados de las evaluaciones realizadas en esta materia en los últimos cinco años. ', '10', '1');
INSERT INTO `indicador` VALUES ('52', '3.11.1', 'Políticas institucionales y evidencias de aplicación, en materia de desarrollo integral del profesorado, que incluyan la capacitación y actualización en los aspectos académicos, profesionales y pedagógicos relacionados con la metodología del programa. ', '11', '1');
INSERT INTO `indicador` VALUES ('53', '3.11.2', 'Número de profesores del programa adscritos directamente o a través de la facultad o departamento respectivo, que han participado en los últimos cinco años en programas de desarrollo profesoral o que han recibido apoyo a la capacitación y actualización permanente, como resultado de las políticas institucionales orientadas para tal fin. ', '11', '1');
INSERT INTO `indicador` VALUES ('54', '3.11.3', 'Apreciación de directivos y profesores del programa adscritos directamente o a través de la facultad o departamento respectivo, sobre el impacto que han tenido las acciones orientadas al desarrollo integral de los profesores, en el enriquecimiento de la calidad del programa. ', '11', '1');
INSERT INTO `indicador` VALUES ('55', '3.11.4', 'Acompañamiento por expertos, para la cualificación de la labor pedagógica de los profesores, de acuerdo con el tipo y metodología del programa. ', '11', '1');
INSERT INTO `indicador` VALUES ('56', '3.11.5', 'Reconocimiento a los profesores que participan en procesos de creación artística y cultural. ', '11', '1');
INSERT INTO `indicador` VALUES ('57', '3.11.6', 'Estrategias orientadas a la actualización docente en temas relacionados con la atención a la diversidad poblacional. ', '11', '1');
INSERT INTO `indicador` VALUES ('58', '3.12.1', 'Políticas de estímulo y reconocimiento a los profesores por el ejercicio calificado de la docencia, de la investigación, de la innovación, de la creación artística, de la técnica y tecnología, de la extensión o proyección social y de la cooperación internacional. Evidencias de la aplicación de estas políticas. ', '12', '1');
INSERT INTO `indicador` VALUES ('59', '3.12.2', 'Estrategias que promueven la creación artística y cultural, la innovación, la adaptación, la transferencia técnica y tecnológica, la creación de tecnofactos y prototipos, y la obtención de patentes, de acuerdo con la naturaleza del programa. ', '12', '1');
INSERT INTO `indicador` VALUES ('60', '3.12.3', 'Porcentaje de los profesores del programa que, en los últimos cinco años, ha recibido reconocimientos y estímulos institucionales por el ejercicio calificado de la docencia, la investigación, la creación artística, la extensión o proyección social y la cooperación internacional.', '12', '1');
INSERT INTO `indicador` VALUES ('61', '3.12.4', 'Apreciación de directivos y profesores del programa, adscritos directamente o a través de la facultad o departamento respectivo, sobre el impacto que, para el enriquecimiento de la calidad del programa ha tenido el régimen de estímulos al profesorado por el ejercicio calificado de la docencia, la investigación, la innovación, la creación artística y cultural, la extensión o proyección social, los aportes al desarrollo técnico y tecnológico y la cooperación internacional.', '12', '1');
INSERT INTO `indicador` VALUES ('62', '3.13.1', 'Producción, utilización y evaluación de materiales de apoyo docente, en los últimos cinco años, pertinentes a la naturaleza y metodología del programa y su función pedagógica. ', '13', '1');
INSERT INTO `indicador` VALUES ('63', '3.13.2', 'Apreciación de los estudiantes del programa sobre la calidad de los materiales de apoyo producidos o utilizados por los profesores adscritos al programa y su pertinencia de acuerdo con la metodología del programa. ', '13', '1');
INSERT INTO `indicador` VALUES ('64', '3.13.3', 'Premios u otros reconocimientos a los materiales de apoyo a la labor docente, en el ámbito nacional o internacional, que hayan producido los profesores adscritos al programa. ', '13', '1');
INSERT INTO `indicador` VALUES ('65', '3.13.4', 'Existencia y aplicación de un régimen de propiedad intelectual en la institución aplicado a los materiales de apoyo a la docencia. ', '13', '1');
INSERT INTO `indicador` VALUES ('66', '3.14.1', 'Políticas y reglamentaciones institucionales en materia de remuneración de los profesores en las que se tengan en cuenta los méritos profesionales y académicos, así como los estímulos a la producción académica y de innovación debidamente evaluada. ', '14', '1');
INSERT INTO `indicador` VALUES ('67', '3.14.2', 'Evidencias sobre la aplicación de estas políticas y reglamentaciones. ', '14', '1');
INSERT INTO `indicador` VALUES ('68', '3.14.3', 'Apreciación de los profesores con respecto a la correspondencia entre la remuneración y los méritos académicos y profesionales ', '14', '1');
INSERT INTO `indicador` VALUES ('69', '3.14.4', 'Apreciación de los profesores del programa y de pares externos, sobre el sistema de evaluación de la producción académica.', '14', '1');
INSERT INTO `indicador` VALUES ('70', '3.15.1', 'Existencia y aplicación de políticas institucionales en materia de evaluación integral al desempeño de los profesores. La institución presente evidencias sobre el desarrollo de estas políticas. ', '15', '1');
INSERT INTO `indicador` VALUES ('71', '3.15.2', 'Criterios y mecanismos de evaluación de los profesores adscritos al programa, en correspondencia con la naturaleza del cargo, las funciones y los compromisos contraídos en relación con las metas institucionales y del programa. ', '15', '1');
INSERT INTO `indicador` VALUES ('72', '3.15.3', 'Evaluaciones realizadas a los profesores adscritos al programa durante los últimos cinco años y las acciones adelantadas por la institución y por el programa a partir de dichos resultados. ', '15', '1');
INSERT INTO `indicador` VALUES ('73', '3.15.4', 'Información verificable sobre la participación de los distintos actores en la evaluación. ', '15', '1');
INSERT INTO `indicador` VALUES ('74', '3.15.5', 'Apreciación de los profesores adscritos al programa, sobre los criterios y mecanismos para la evaluación de docentes, su transparencia, equidad y eficacia.', '15', '1');
INSERT INTO `indicador` VALUES ('75', '4.16.1', 'Existencia de criterios y mecanismos para el seguimiento y la evaluación del desarrollo de competencias, especialmente las actitudes, los conocimientos, las capacidades y las habilidades generales y aquellas que son específicas del ejercicio y de la cultura de la profesión o la disciplina en la que se forma al estudiante. ', '16', '1');
INSERT INTO `indicador` VALUES ('76', '4.16.2', 'Créditos académicos del programa correspondiente a asignaturas orientadas a ampliar la formación del estudiante en las dimensiones ética, estética, ambiental, filosófica, política y social. ', '16', '1');
INSERT INTO `indicador` VALUES ('77', '4.16.3', 'Asignación de créditos y de distribución de tiempos directo e independiente, a las distintas actividades de formación de acuerdo con la modalidad en que se ofrece el programa. ', '16', '1');
INSERT INTO `indicador` VALUES ('78', '4.16.4', 'Apreciación de directivos, profesores y estudiantes sobre la calidad e integralidad del currículo. ', '16', '1');
INSERT INTO `indicador` VALUES ('79', '4.16.5', 'Estrategias aplicadas para el fomento de la creatividad y del desarrollo de pensamiento autónomo en los estudiantes. ', '16', '1');
INSERT INTO `indicador` VALUES ('80', '4.16.6', 'Desempeño de los estudiantes del programa en las Pruebas de Estado de educación superior, en los últimos cinco años. Calificaciones promedio con respecto al promedio nacional. ', '16', '1');
INSERT INTO `indicador` VALUES ('81', '4.16.7', 'Valor agregado obtenido en los resultados de las Pruebas de Estado (Saber Pro), con relación a las Pruebas Saber Once utilizadas como mecanismo de ingreso a la educación superior y al desempeño de los estudiantes adscritos al programa. ', '16', '1');
INSERT INTO `indicador` VALUES ('82', '4.16.8', 'Identificación en el perfil profesional y ocupacional de los distintos tipos de competencias, especialmente actitudes, conocimientos, capacidades y habilidades requeridas en el nivel de formación y las actividades académicas necesarias para su desarrollo. ', '16', '1');
INSERT INTO `indicador` VALUES ('83', '4.16.9', 'Articulación del plan de estudios con los diversos niveles de formación (periodos académicos, especialización, maestría y doctorado, componentes propedéuticos y /o ciclos, entre otros) ', '16', '1');
INSERT INTO `indicador` VALUES ('84', '4.16.10', 'Aplicación de estrategias efectivas orientadas al desarrollo de competencias, especialmente conocimientos, capacidades y habilidades comunicativas en un segundo idioma extranjero. ', '16', '1');
INSERT INTO `indicador` VALUES ('85', '4.17.1', 'Existencia y aplicación de políticas institucionales en materia de flexibilidad, referidas a la organización y jerarquización de los contenidos, reconocimiento de créditos, formación en competencias tales como actitudes, conocimientos, capacidades, y habilidades, y estrategias pedagógicas, electividad, doble titulación y movilidad. ', '17', '1');
INSERT INTO `indicador` VALUES ('86', '4.17.2', 'Existencia y aplicación de políticas y normas para asegurar la continuidad y movilidad del estudiante en el sistema educativo y en la institución: homologaciones de créditos, reconocimientos de experiencias educativas y laborales previas, equivalencia de títulos y transferencias. ', '17', '1');
INSERT INTO `indicador` VALUES ('87', '4.17.3', 'Mecanismos de actualización permanente del currículo en consonancia con los desarrollos disciplinares, profesionales y pedagógicos, y en atención a las necesidades del entorno. ', '17', '1');
INSERT INTO `indicador` VALUES ('88', '4.17.4', 'Índice de flexibilidad curricular y comparativos nacionales e internacionales. ', '17', '1');
INSERT INTO `indicador` VALUES ('89', '4.17.5', 'Apreciación de directivos, profesores y estudiantes del programa sobre la aplicación y eficacia de las políticas institucionales en materia de flexibilidad curricular. ', '17', '1');
INSERT INTO `indicador` VALUES ('90', '4.17.6', 'Movilidad estudiantil con otras instituciones nacionales e internacionales.', '17', '1');
INSERT INTO `indicador` VALUES ('91', '4.17.7', 'Existencia de sistemas de homologación de créditos y de tránsito del pregrado al postgrado. ', '17', '1');
INSERT INTO `indicador` VALUES ('92', '4.17.8', 'Convenios y relaciones de cooperación con instituciones de educación media y superior y con el sector laboral, para asegurar el tránsito y continuidad de los estudiantes en el sistema educativo y su inserción en el sistema productivo, de acuerdo con el tipo y modalidad del programa. ', '17', '1');
INSERT INTO `indicador` VALUES ('93', '4.17.9', 'Oferta académica que facilite la aplicación de criterios de flexibilidad con miras a garantizar la participación de los estudiantes, en el diseño de su propio plan académico, de acuerdo con sus intereses y la adquisición de, competencias, tales como actitudes, conocimientos, capacidades y habilidades, con el apoyo de un tutor o asesor. ', '17', '1');
INSERT INTO `indicador` VALUES ('94', '4.17.10', 'Acciones llevadas a cabo entre la Institución y otras instituciones del sector público o privado (educativo, productivo, financiero, entre otros) para articular y afirmar el carácter secuencial y complementario de los ciclos, desde el punto de vista académico y laboral, de acuerdo con el tipo y modalidad del programa. ', '17', '1');
INSERT INTO `indicador` VALUES ('95', '4.18.1', 'Espacios y actividades curriculares y extracurriculares con carácter explícitamente interdisciplinario. ', '18', '1');
INSERT INTO `indicador` VALUES ('96', '4.18.2', 'Mecanismos que permitan el tratamiento de problemas pertinentes al programa y al ejercicio laboral, a través de orientaciones interdisciplinarias por parte de profesores y estudiantes. ', '18', '1');
INSERT INTO `indicador` VALUES ('97', '4.18.3', 'Apreciación de profesores y estudiantes sobre la pertinencia y eficacia de la interdisciplinariedad del programa en el enriquecimiento de la calidad del mismo. ', '18', '1');
INSERT INTO `indicador` VALUES ('98', '4.19.1', 'Concordancia de los métodos de enseñanza y aprendizaje utilizados con el tipo y metodología del programa. ', '19', '1');
INSERT INTO `indicador` VALUES ('99', '4.19.2', 'Correspondencia de los métodos de enseñanza y aprendizaje empleados para el desarrollo de los contenidos del plan de estudios del programa, con las competencias tales como las actitudes, los conocimientos, las capacidades y las habilidades que se espera desarrollar, la naturaleza de los saberes y las necesidades, objetivos y modalidad del programa. ', '19', '1');
INSERT INTO `indicador` VALUES ('100', '4.19.3', 'Apreciación de los estudiantes, profesores y directivos del programa sobre la correspondencia entre los métodos de enseñanza y aprendizaje que se emplean en el programa y el desarrollo de los contenidos del plan de estudios. ', '19', '1');
INSERT INTO `indicador` VALUES ('101', '4.19.4', 'Estrategias y mecanismos de seguimiento y acompañamiento por parte del docente al trabajo que realizan los estudiantes en las distintas actividades académicas, de acuerdo con sus capacidades y potencialidades y con el tipo y metodología del programa. ', '19', '1');
INSERT INTO `indicador` VALUES ('102', '4.19.5', 'Incorporación de los adelantos y transformaciones que se han dado en las ciencias, las técnicas y las tecnologías implicadas, de acuerdo con el tipo y modalidad del programa. ', '19', '1');
INSERT INTO `indicador` VALUES ('103', '4.19.6', 'Estrategias pedagógicas, didácticas y comunicativas acordes con la metodología y con las posibilidades tecnológicas y las necesidades de los estudiantes en atención a su diversidad. ', '19', '1');
INSERT INTO `indicador` VALUES ('104', '4.19.7', 'Articulación entre las estrategias pedagógicas propias de la metodología de enseñanza y los recursos tecnológicos utilizados. ', '19', '1');
INSERT INTO `indicador` VALUES ('105', '4.19.8', 'Estrategias y mecanismos pedagógicos aplicados y orientados hacia la integración de las tres funciones sustantivas de investigación, docencia y proyección social. ', '19', '1');
INSERT INTO `indicador` VALUES ('106', '4.19.9', 'Estudios realizados por la institución y el programa para identificar y evaluar la permanencia y retención, de acuerdo con la metodología de enseñanza en que se ofrece el programa  ', '19', '1');
INSERT INTO `indicador` VALUES ('107', '4.19.10', 'Correlación entre la duración prevista para el programa, de acuerdo con su metodología y plan de estudios, y la que realmente tiene lugar. ', '19', '1');
INSERT INTO `indicador` VALUES ('108', '4.19.11', 'Estrategias para garantizar el éxito académico de los estudiantes en el tiempo previsto para el desarrollo del plan de estudios, atendiendo los estándares de calidad. ', '19', '1');
INSERT INTO `indicador` VALUES ('109', '4.19.12', 'Informes estadísticos sobre la población de estudiantes del programa desde el primero hasta el último semestre, en las últimas cinco cohortes. ', '19', '1');
INSERT INTO `indicador` VALUES ('110', '4.19.13', 'Apreciación de profesores y estudiantes sobre la correspondencia entre las condiciones y exigencias académicas de permanencia y graduación en el programa, y la naturaleza del mismo. ', '19', '1');
INSERT INTO `indicador` VALUES ('111', '4.19.14', 'Existencia de mecanismos de seguimiento, acompañamiento especial a estudiantes y adecuaciones locativas para facilitar el óptimo desempeño de admitidos en condición de vulnerabilidad y discapacidad, entre otros. ', '19', '1');
INSERT INTO `indicador` VALUES ('112', '4.20.1', 'Criterios, políticas y reglamentaciones institucionales y del programa en materia de evaluación académica de los estudiantes. Evidencias de aplicación y divulgación de la misma. ', '20', '1');
INSERT INTO `indicador` VALUES ('113', '4.20.2', 'Correspondencia entre las formas de evaluación de los aprendizajes, los propósitos de formación y los perfiles de egreso definidos por el programa. ', '20', '1');
INSERT INTO `indicador` VALUES ('114', '4.20.3', 'Apreciación de directivos, profesores y estudiantes del programa sobre la correspondencia entre las formas de evaluación académica de los estudiantes, la naturaleza del mismo y los métodos pedagógicos empleados para su desarrollo. ', '20', '1');
INSERT INTO `indicador` VALUES ('115', '4.20.4', 'Apreciación de los estudiantes acerca de la utilidad del sistema de evaluación académica en la adquisición de competencias, tales como las actitudes, los conocimientos, las capacidades y las habilidades propias del programa. ', '20', '1');
INSERT INTO `indicador` VALUES ('116', '4.20.5', 'Criterios y procedimientos orientados a la evaluación de competencias especialmente actitudes, conocimientos, capacidades y habilidades, y estrategias de retroalimentación de la actividad académica de los estudiantes. ', '20', '1');
INSERT INTO `indicador` VALUES ('117', '4.20.6', 'Criterios y procedimientos para la revisión de los sistemas de evaluación académica de los estudiantes ', '20', '1');
INSERT INTO `indicador` VALUES ('118', '4.21.1', 'Correspondencia entre el tipo de trabajos y actividades realizados por los estudiantes respecto a los objetivos y modalidad del programa. ', '21', '1');
INSERT INTO `indicador` VALUES ('119', '4.21.2', 'Criterios y estrategias aplicados en el programa para efecto de la dosificación de la labor académica de los estudiantes en coherencia con el sistema de créditos. ', '21', '1');
INSERT INTO `indicador` VALUES ('120', '4.21.3', 'Apreciación de directivos y profesores adscritos al programa sobre la correspondencia entre la calidad de los trabajos realizados por los estudiantes y los objetivos de logro definidos para el mismo, incluyendo la formación personal. ', '21', '1');
INSERT INTO `indicador` VALUES ('121', '4.21.4', 'Correspondencia entre las actividades y trabajos realizados por los estudiantes y las formas de evaluación por competencias especialmente en actitudes, conocimientos, capacidades y habilidades, según la naturaleza del programa y los métodos pedagógicos empleados para desarrollar los diversos procesos de formación. ', '21', '1');
INSERT INTO `indicador` VALUES ('122', '4.21.5', 'Trabajos académicos realizados por estudiantes del programa, en los últimos cinco años, que han merecido premios o reconocimientos significativos por la comunidad académica nacional o internacional. ', '21', '1');
INSERT INTO `indicador` VALUES ('123', '4.22.1', 'Existencia y aplicación de políticas en materia de evaluación y autorregulación del programa académico que conduzcan al diseño y formulación de planes de mejoramiento continuo y a la gestión de la innovación.', '22', '1');
INSERT INTO `indicador` VALUES ('124', '4.22.2', 'Estrategias verificables de seguimiento, evaluación y mejoramiento continuo y gestión de la innovación de los procesos y logros del programa, así como de su pertinencia y relevancia social.', '22', '1');
INSERT INTO `indicador` VALUES ('125', '4.22.3', 'Apreciación de directivos, profesores, estudiantes sobre la incidencia de los sistemas de evaluación y autorregulación del programa en el enriquecimiento de la calidad de éste.', '22', '1');
INSERT INTO `indicador` VALUES ('126', '4.22.4', 'Cambios específicos realizados en el programa, en los últimos cinco años, a partir de los resultados de los procesos de evaluación y autorregulación.', '22', '1');
INSERT INTO `indicador` VALUES ('127', '4.23.1', 'Existencia y aplicación de criterios y políticas institucionales y del programa en materia de extensión o proyección social. ', '23', '1');
INSERT INTO `indicador` VALUES ('128', '4.23.2', 'Proyectos y actividades de extensión o proyección a la comunidad desarrollados por directivos, profesores y estudiantes del programa en los últimos cinco años. ', '23', '1');
INSERT INTO `indicador` VALUES ('129', '4.23.3', 'Evidencias del impacto en el entorno que han generado los resultados de los proyectos de extensión o proyección social desarrollados por el programa. ', '23', '1');
INSERT INTO `indicador` VALUES ('130', '4.23.4', 'Participación del programa en la aplicación las políticas nacionales en materia de innovación y desarrollo económico, técnico y tecnológico (innovación, adaptación, transferencia), de acuerdo con el tipo y modalidad del programa. ', '23', '1');
INSERT INTO `indicador` VALUES ('131', '4.23.5', 'Apreciación de empresarios, funcionarios públicos, líderes comunitarios y de otros agentes externos sobre el impacto social de los proyectos desarrollados por el programa. ', '23', '1');
INSERT INTO `indicador` VALUES ('132', '4.23.6', 'Número y tipo de reconocimientos hechos en los últimos cinco años por entidades gubernamentales y no gubernamentales al impacto que el programa ha ejercido en los medios local, regional, nacional o internacional. ', '23', '1');
INSERT INTO `indicador` VALUES ('133', '4.23.7', 'Mecanismos para el análisis de las acciones que el programa ejerce sobre el medio y para la revisión periódica de las estrategias implementadas en esa materia. ', '23', '1');
INSERT INTO `indicador` VALUES ('134', '4.23.8', 'Información sobre las comunidades, empresas, gobiernos, instituciones, organizaciones de usuarios, y asociaciones a los que se presta asistencia técnica o tecnológica, servicios, asesorías y otros apoyos que apuntan a la resolución de problemas o a la ejecución de programas de mejoramiento, de acuerdo con la naturaleza y modalidad del programa. ', '23', '1');
INSERT INTO `indicador` VALUES ('135', '4.24.1', 'Estrategias y mecanismos orientados a incentivar en el estudiante la consulta y el uso de material bibliográfico. Evidencias de aplicación de estas estrategias y mecanismos. ', '24', '1');
INSERT INTO `indicador` VALUES ('136', '4.24.2', 'Existencia y aplicación de criterios y políticas institucionales y del programa en materia de acceso, adquisición y actualización de material bibliográfico. ', '24', '1');
INSERT INTO `indicador` VALUES ('137', '4.24.3', 'Pertinencia, actualización y suficiencia del material bibliográfico con que cuenta el programa para apoyar el desarrollo de las distintas actividades académicas, de acuerdo con el tipo y modalidad de programa. ', '24', '1');
INSERT INTO `indicador` VALUES ('138', '4.24.4', 'inversión anual en las adquisiciones de libros, revistas especializadas, bases de datos y suscripciones a publicaciones periódicas, relacionados con el programa académico, en los últimos 5 años. ', '24', '1');
INSERT INTO `indicador` VALUES ('139', '4.24.5', 'Profesores y estudiantes del programa que utilizan recursos bibliográficos: libros, revistas especializadas y bases de datos, en los últimos cinco años, de acuerdo con el tipo y modalidad del programa. ', '24', '1');
INSERT INTO `indicador` VALUES ('140', '4.25.1', 'Plataforma tecnológica que garantice la conectividad, interactividad y acceso a sistemas de información, apoyos y recursos para el aprendizaje, de acuerdo con el tipo y modalidad del programa. ', '25', '1');
INSERT INTO `indicador` VALUES ('141', '4.25.2', 'Estrategias y mecanismos orientados a incentivar el uso de recursos informáticos y de comunicación, por parte de profesores adscritos al programa y estudiantes. ', '25', '1');
INSERT INTO `indicador` VALUES ('142', '4.25.3', 'Disponibilidad para docentes, estudiantes, directivos y administrativos, actualización y calidad de los recursos informáticos y de comunicaciones para el desarrollo de los procesos académicos y de apoyo del programa, de acuerdo con su naturaleza. ', '25', '1');
INSERT INTO `indicador` VALUES ('143', '4.25.4', 'Estrategias que garanticen el rendimiento de los equipos, la capacidad de almacenamiento y la seguridad (confidencialidad, disponibilidad e integridad) en el manejo de la información. ', '25', '1');
INSERT INTO `indicador` VALUES ('144', '4.25.5', 'Eficiencia, oportunidad y eficacia en cuanto a la actualización y al soporte técnico de la plataforma informática y los equipos computacionales. ', '25', '1');
INSERT INTO `indicador` VALUES ('145', '4.25.6', 'Apreciación de directivos, profesores y estudiantes del programa sobre la pertinencia, correspondencia y suficiencia de los recursos informáticos y de comunicación con que cuenta el programa. ', '25', '1');
INSERT INTO `indicador` VALUES ('146', '4.26.1', 'Dotación adecuada de equipos, materiales e insumos en los laboratorios y talleres, campos de práctica y plantas piloto, según la naturaleza, metodología y exigencias del programa. ', '26', '1');
INSERT INTO `indicador` VALUES ('147', '4.26.2', 'Dotación adecuada de laboratorios, máquinas y talleres suficientemente dotados con equipos y materiales, según la naturaleza, metodología y exigencias del programa, y que cumplen las normas sanitarias y de bioseguridad, seguridad industrial y de salud ocupacional y manejo de seres vivos, de acuerdo con la normativa vigente. ', '26', '1');
INSERT INTO `indicador` VALUES ('148', '4.26.3', 'Disponibilidad y capacidad de talleres, laboratorios, equipos, medios audiovisuales, sitios de práctica, estaciones y granjas experimentales, escenarios de simulación virtual, entre otros, para el óptimo desarrollo de la actividad docente, investigativa y de extensión, según requerimientos del programa. ', '26', '1');
INSERT INTO `indicador` VALUES ('149', '4.26.4', 'Convenios con centros, instituciones, empresas u organizaciones, que faciliten el uso de otros recursos y escenarios de enseñanza, aprendizaje, investigación y creación artística y cultural, por parte de la comunidad académica. ', '26', '1');
INSERT INTO `indicador` VALUES ('150', '4.26.5', 'Apreciación de profesores y estudiantes del programa sobre la capacidad, disponibilidad, dotación y utilización de laboratorios, talleres, ayudas audiovisuales y campos de práctica, entre otros recursos de apoyo docente. ', '26', '1');
INSERT INTO `indicador` VALUES ('151', '5.27.1', 'Existencia y aplicación de políticas institucionales en materia de referentes académicos externos, nacionales e internacionales para la revisión y actualización del plan de estudio.', '27', '1');
INSERT INTO `indicador` VALUES ('152', '5.27.2', 'Análisis sistemático de comparabilidad con otros programas nacionales e internacionales de la misma naturaleza.', '27', '1');
INSERT INTO `indicador` VALUES ('153', '5.27.3', 'Convenios activos y actividades de cooperación académica desarrollados por el programa con instituciones y programas de alta calidad y reconocimiento nacional e internacional.', '27', '1');
INSERT INTO `indicador` VALUES ('154', '5.27.4', 'Proyectos de investigación, innovación, creación artística y cultural y/o proyección desarrollados como producto de la cooperación académica y profesional, realizada por directivos, profesores y estudiantes del programa, con miembros de comunidades nacionales e internacionales de reconocido liderazgo en el área del programa.', '27', '1');
INSERT INTO `indicador` VALUES ('155', '5.27.5', 'Profesores, estudiantes y directivos del programa con participación activa en redes u organismos nacionales e internacionales de la que se hayan derivado productos concretos como publicaciones en coautoría, cofinanciación de proyectos, registros y patentes, entre otros.', '27', '1');
INSERT INTO `indicador` VALUES ('156', '5.27.6', 'Inversión efectivamente realizada por la institución para los fines de internacionalización en los últimos cinco años.', '27', '1');
INSERT INTO `indicador` VALUES ('157', '5.27.7', 'Prospecto o iniciativas en curso de doble titulación con otras entidades, de acuerdo con el tipo y naturaleza del programa.', '27', '1');
INSERT INTO `indicador` VALUES ('158', '5.27.8', 'Incidencia verificable en el enriquecimiento de la calidad del programa de la interacción con comunidades académicas nacionales e internacionales.', '27', '1');
INSERT INTO `indicador` VALUES ('159', '5.27.9', 'Evidencias del impacto social que ha generado la inserción del programa en los contextos académicos nacionales e internacionales, de acuerdo a su naturaleza.', '27', '1');
INSERT INTO `indicador` VALUES ('160', '5.28.1', 'Convenios activos de intercambio con universidades nacionales y extranjeras.', '28', '1');
INSERT INTO `indicador` VALUES ('161', '5.28.2', 'Número de estudiantes extranjeros en el programa en los últimos 5 años.', '28', '1');
INSERT INTO `indicador` VALUES ('162', '5.28.3', 'Experiencias de homologación de cursos realizados en otros programas nacionales o extranjeros.', '28', '1');
INSERT INTO `indicador` VALUES ('163', '5.28.4', 'Profesores o expertos visitantes nacionales y extranjeros que ha recibido el programa en los últimos cinco años (objetivos, duración y resultados de su estadía).', '28', '1');
INSERT INTO `indicador` VALUES ('164', '5.28.5', 'Profesores y estudiantes adscritos al programa que en los últimos cinco años han participado en actividades de cooperación académica y profesional con programas nacionales e internacionales de reconocido liderazgo en el área (semestre académico de intercambio, pasantía o práctica, rotación médica, curso corto, misión, profesor visitante/conferencia, estancia de investigación, estudios de postgrado, profesor en programa de pregrado y/o postgrado, congresos, foros, seminarios, simposios, educación continuada, par académico, parques tecnológicos, incubadoras de empresas, mesas y ruedas de negociación económica y tecnológica, entre otros).', '28', '1');
INSERT INTO `indicador` VALUES ('165', '5.28.6', 'Resultados efectivos de la participación de profesores y estudiantes adscritos al programa en actividades de cooperación académica.', '28', '1');
INSERT INTO `indicador` VALUES ('166', '5.28.7', 'Participación de profesores adscritos al programa en redes académicas, científicas, técnicas y tecnológicas, económicas, a nivel nacional e internacional, de acuerdo con el tipo y modalidad del programa.', '28', '1');
INSERT INTO `indicador` VALUES ('167', '5.28.8', 'Inversión efectiva desarrollada para proyectos de movilidad en doble vía en los últimos cinco años', '28', '1');
INSERT INTO `indicador` VALUES ('168', '6.29.1', 'Criterios, estrategias y actividades del programa, orientados a promover la capacidad de indagación y búsqueda, y la formación de un espíritu investigativo, creativo e innovador en los estudiantes.', '29', '1');
INSERT INTO `indicador` VALUES ('169', '6.29.2', 'Existencia y utilización de mecanismos por parte de los profesores adscritos al programa para incentivar en los estudiantes la generación de ideas y problemas de investigación, la identificación de problemas en el ámbito empresarial susceptibles de resolver mediante la aplicación del conocimiento y la innovación.', '29', '1');
INSERT INTO `indicador` VALUES ('170', '6.29.3', 'Estudiantes que están vinculados como monitores, auxiliares de investigación e integrantes de semilleros y/o grupos de investigación.', '29', '1');
INSERT INTO `indicador` VALUES ('171', '6.29.4', 'Grupos y semilleros de investigación del programa en los que participan estudiantes, de acuerdo con su tipo y modalidad.', '29', '1');
INSERT INTO `indicador` VALUES ('172', '6.29.5', 'Actividades académicas –cursos electivos, seminarios, pasantías, eventos– derivados de líneas de investigación en los últimos cinco años.', '29', '1');
INSERT INTO `indicador` VALUES ('173', '6.29.6', 'Actividades académicas –pasantías, talleres, actividades conjuntas- relacionadas con la realidad empresarial, organizadas desde los primeros semestres con una lógica enfocada en el entendimiento creciente de aquella según sus mayores grados de complejidad.', '29', '1');
INSERT INTO `indicador` VALUES ('174', '6.29.7', 'Existencia dentro del plan de estudios de espacios académicos y de vinculación con el sector productivo donde se analiza la naturaleza de la investigación científica, técnica y tecnológica, la innovación, sus objetos de indagación, sus problemas, oportunidades y sus resultados y soluciones.', '29', '1');
INSERT INTO `indicador` VALUES ('175', '6.29.8', 'Participación de los estudiantes en los programas institucionales de jóvenes investigadores.', '29', '1');
INSERT INTO `indicador` VALUES ('176', '6.29.9', 'Participación de los estudiantes en prácticas empresariales en temas de investigación y desarrollo, ingeniería y experimentación en Colombia y en el Exterior.', '29', '1');
INSERT INTO `indicador` VALUES ('177', '6.29.10', 'Participación de los estudiantes en proyectos Universidad Empresa Estado que adelante la Institución.', '29', '1');
INSERT INTO `indicador` VALUES ('178', '6.29.11', 'Participación de los estudiantes en programas de innovación tales como: transferencia de conocimiento, emprendimiento y creatividad.', '29', '1');
INSERT INTO `indicador` VALUES ('179', '6.30.1', 'Criterios, estrategias y políticas institucionales en materia de investigación, innovación y creación artística y cultural que se evidencie en mecanismos efectivos que estimulen el desarrollo de los procesos investigativos, de innovación y creativos, y establezcan criterios de evaluación de su calidad y pertinencia, ampliamente difundidos y aceptados por la comunidad académica.', '30', '1');
INSERT INTO `indicador` VALUES ('180', '6.30.2', 'Correspondencia entre el número y nivel de formación de los profesores adscritos al programa con la actividad investigativa y de innovación y la creación artística y cultural, relacionadas con la naturaleza del programa.', '30', '1');
INSERT INTO `indicador` VALUES ('181', '6.30.3', 'Recursos humanos, logísticos y financieros con que cuenta el programa, asociados a proyectos y a otras actividades de investigación, innovación y creación artística y cultural.', '30', '1');
INSERT INTO `indicador` VALUES ('182', '6.30.4', 'Grupos de investigación conformados por profesores y estudiantes adscritos al programa, reconocidos por COLCIENCIAS o por otro organismo.', '30', '1');
INSERT INTO `indicador` VALUES ('183', '6.30.5', 'Impacto a nivel regional, nacional e internacional de la investigación, la innovación y la creación artística y cultural del programa, de acuerdo con su naturaleza.', '30', '1');
INSERT INTO `indicador` VALUES ('184', '6.30.6', 'Publicaciones en revistas indexadas y especializadas nacionales e internacionales, innovaciones, patentes, productos o procesos técnicos y tecnológicos patentables o no patentables o protegidas por secreto industrial, libros, capítulos de libros, dirección de trabajos de grado de maestría y doctorado, paquetes tecnológicos, normas resultado de investigación, producción artística y cultural, productos de apropiación social del conocimiento, productos asociados a servicios técnicos o consultoría cualificada, elaborados por profesores adscritos al programa, de acuerdo con su tipo y naturaleza.', '30', '1');
INSERT INTO `indicador` VALUES ('185', '6.30.7', 'Apoyo administrativo y financiero para el desarrollo y gestión de la investigación, gestión del conocimiento (vigilancia tecnológica), la creación de empresas y de planes de negocios (como los centros de incubación y financiación empresarial, oficinas de transferencia de resultados de investigación, centros de investigación y desarrollo tecnológico, entre otros) proyectos de innovación en conjunto con empresas y la creación artística y cultural, de acuerdo con la naturaleza del programa.', '30', '1');
INSERT INTO `indicador` VALUES ('186', '7.31.1', 'Políticas sobre bienestar institucional suficientemente conocidas que propician el desarrollo integral de la comunidad institucional, reconozcan el valor y la diversidad y orientan la prestación de los servicios de bienestar.', '31', '1');
INSERT INTO `indicador` VALUES ('187', '7.31.2', 'Estrategias que propicien un clima institucional adecuado que favorezca el desarrollo humano y promueva una cultura que reconozca el valor de la diversidad.', '31', '1');
INSERT INTO `indicador` VALUES ('188', '7.31.3', 'Programas, servicios y actividades de bienestar dirigidos a los profesores, estudiantes y personal administrativo del programa.', '31', '1');
INSERT INTO `indicador` VALUES ('189', '7.31.4', 'Participación de directivos, profesores, estudiantes y personal administrativo del programa en los programas, los servicios y las actividades de bienestar institucional.', '31', '1');
INSERT INTO `indicador` VALUES ('190', '7.31.5', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre la calidad y pertinencia de los servicios y las actividades de bienestar y sobre su contribución a su desarrollo personal.', '31', '1');
INSERT INTO `indicador` VALUES ('191', '7.31.6', 'Programas y estrategias de seguimiento integral a la comunidad institucional y acciones derivadas que conduzcan al desarrollo humano y el respeto a la diferencia', '31', '1');
INSERT INTO `indicador` VALUES ('192', '7.31.7', 'Investigación permanente de la problemática social del entorno que incide en la comunidad institucional.', '31', '1');
INSERT INTO `indicador` VALUES ('193', '7.31.8', 'Estrategias que permitan a los estudiantes vincularse a redes de apoyo orientadas a contrarrestar las situaciones de vulnerabilidad.', '31', '1');
INSERT INTO `indicador` VALUES ('194', '7.32.1', 'Tasas de deserción estudiantil acumulada y por períodos académicos, acorde con los reportes efectuados al Sistema para la Prevención de la Deserción de la Educación Superior – SPADIES–. ', '32', '1');
INSERT INTO `indicador` VALUES ('195', '7.32.2', 'Registros periódicos de la caracterización de los estudiantes teniendo en cuenta variables de vulnerabilidad.', '32', '1');
INSERT INTO `indicador` VALUES ('196', '7.32.3', 'Existencia de proyectos que establezcan estrategias pedagógicas y actividades extracurriculares orientadas a optimizar las tasas de retención y de graduación de estudiantes en los tiempos previstos, manteniendo la calidad académica del programa', '32', '1');
INSERT INTO `indicador` VALUES ('197', '8.33.1', 'Correspondencia entre la organización, administración y gestión del programa, y los fines de la docencia, la investigación, la innovación o creación artística y cultural, la extensión o proyección social y la cooperación nacional e internacional en el programa.', '33', '1');
INSERT INTO `indicador` VALUES ('198', '8.33.2', 'Existencia de certificaciones y de mecanismos orientados al mejoramiento de la calidad de procesos.', '33', '1');
INSERT INTO `indicador` VALUES ('199', '8.33.3', 'Criterios institucionales para la toma de decisiones sobre asignación de cargos, responsabilidades y procedimientos en los diferentes programas académicos. Evidencias sobre la aplicación de estos criterios.', '33', '1');
INSERT INTO `indicador` VALUES ('200', '8.33.4', 'Cantidad y dedicación del talento humano para cubrir las necesidades del programa.', '33', '1');
INSERT INTO `indicador` VALUES ('201', '8.33.5', 'Formación y experiencia de quienes orientan la administración del programa.', '33', '1');
INSERT INTO `indicador` VALUES ('202', '8.33.6', 'Apreciación del personal administrativo del programa sobre la claridad de las funciones encomendadas, y sobre la articulación de sus tareas con las necesidades y objetivos del programa.', '33', '1');
INSERT INTO `indicador` VALUES ('203', '8.33.7', 'Apreciación de profesores y estudiantes adscritos al programa sobre la eficiencia, eficacia y orientación de los procesos administrativos hacia el desarrollo de las funciones misionales.', '33', '1');
INSERT INTO `indicador` VALUES ('204', '8.34.1', 'Existencia y utilización de sistemas de información integrados y mecanismos eficaces que faciliten la comunicación interna y externa el programa.', '34', '1');
INSERT INTO `indicador` VALUES ('205', '8.34.2', 'Existencia y efectividad de la página web institucional debidamente actualizada para mantener informados a los usuarios sobre los temas de interés institucional y facilitar la comunicación académica y administrativa.', '34', '1');
INSERT INTO `indicador` VALUES ('206', '8.34.3', 'La página web institucional incluye información detallada y actualizada sobre el currículo y los profesores adscritos al programa, incluyendo su formación y trayectoria.', '34', '1');
INSERT INTO `indicador` VALUES ('207', '8.34.4', 'Sistemas de consulta, registro y archivo de la información académica de los estudiantes y los profesores adscritos al programa.', '34', '1');
INSERT INTO `indicador` VALUES ('208', '8.34.5', 'Mecanismos de gestión documental, organización, actualización y seguridad de los registros y archivos académicos de estudiantes, profesores, personal directivo y administrativo.', '34', '1');
INSERT INTO `indicador` VALUES ('209', '8.34.6', 'Apreciación de directivos, profesores, estudiantes y personal administrativo sobre la eficacia de los sistemas de información académica y de los mecanismos de comunicación del programa.', '34', '1');
INSERT INTO `indicador` VALUES ('210', '8.34.7', 'Profesores, administrativos y estudiantes que confirman el acceso con calidad a los sistemas de comunicación e información mediados por las TIC.', '34', '1');
INSERT INTO `indicador` VALUES ('211', '8.34.8', 'Existencia de estrategias que garanticen la conectividad a los miembros de la comunidad académica del programa, de acuerdo con la modalidad en que éste es ofrecido.', '34', '1');
INSERT INTO `indicador` VALUES ('212', '8.34.9', 'Mecanismos de comunicación para facilitar que la población estudiantil en toda su diversidad tenga acceso a la información', '34', '1');
INSERT INTO `indicador` VALUES ('213', '8.35.1', 'Apreciación de profesores y estudiantes adscritos al programa sobre la orientación académica que imparten los directivos del mismo y sobre el liderazgo que ejercen.', '35', '1');
INSERT INTO `indicador` VALUES ('214', '8.35.2', 'Lineamientos y políticas que orientan la gestión del programa, debidamente divulgados y apropiados por los directivos, profesores y personal administrativo del mismo.', '35', '1');
INSERT INTO `indicador` VALUES ('215', '8.35.3', 'Documentos institucionales que establecen la forma de operación (procesos y procedimientos) de las distintas instancias relacionadas con la gestión del programa.', '35', '1');
INSERT INTO `indicador` VALUES ('216', '8.35.4', 'Mecanismos eficientes de participación de la comunidad académica en la gestión del programa', '35', '1');
INSERT INTO `indicador` VALUES ('217', '9.36.1', 'Existencia de registros actualizados sobre ocupación y ubicación profesional de los egresados del programa.', '36', '1');
INSERT INTO `indicador` VALUES ('218', '9.36.2', 'Correspondencia entre la ocupación y ubicación profesional de los egresados y el perfil de formación del programa.', '36', '1');
INSERT INTO `indicador` VALUES ('219', '9.36.3', 'Apreciación de los egresados, empleadores y usuarios externos sobre la calidad de la formación dada por el programa.', '36', '1');
INSERT INTO `indicador` VALUES ('220', '9.36.4', 'Apreciación de los egresados acerca de la forma como el programa favorece el desarrollo del proyecto de vida.', '36', '1');
INSERT INTO `indicador` VALUES ('221', '9.36.5', 'Utilización de la información contenida en el Observatorio Laboral para la Educación, como insumo para estudiar la pertinencia del programa.', '36', '1');
INSERT INTO `indicador` VALUES ('222', '9.36.6', 'Evidencia de los procesos de análisis de la situación de los egresados.', '36', '1');
INSERT INTO `indicador` VALUES ('223', '9.36.7', 'Mecanismos y estrategias para efectuar ajustes al programa en atención a las necesidades del entorno, evidenciados a través del seguimiento de los egresados.', '36', '1');
INSERT INTO `indicador` VALUES ('224', '9.36.8', 'Estrategias que faciliten el paso del estudiante al mundo laboral.', '36', '1');
INSERT INTO `indicador` VALUES ('225', '9.37.1', 'Índice de empleo entre los egresados del programa.', '37', '1');
INSERT INTO `indicador` VALUES ('226', '9.37.2', 'Egresados del programa que forman parte de comunidades académicas reconocidas, de asociaciones científicas, profesionales, tecnológicas, técnicas o artísticas, y del sector productivo y financiero, en el ámbito nacional o internacional.', '37', '1');
INSERT INTO `indicador` VALUES ('227', '9.37.3', 'Egresados del programa que han recibido distinciones y reconocimientos significativos por su desempeño en la disciplina, profesión, ocupación u oficio correspondiente.', '37', '1');
INSERT INTO `indicador` VALUES ('228', '9.37.4', 'Apreciación de empleadores sobre la calidad de la formación y el desempeño de los egresados del programa', '37', '1');
INSERT INTO `indicador` VALUES ('229', '10.38.1', 'Espacios que se destinan al desarrollo de cada una de las funciones sustantivas a que se dedica el programa y de las áreas destinadas al bienestar institucional.', '38', '1');
INSERT INTO `indicador` VALUES ('230', '10.38.2', 'Existencia y uso adecuado de aulas, laboratorios, talleres, sitios de estudio para los alumnos, salas de cómputo, oficinas de profesores, sitios para la creación artística y cultural, auditorios y salas de conferencias, oficinas administrativas, cafeterías, baños, servicios, campos de juego, espacios libres, zonas verdes y demás espacios destinados al bienestar en general.', '38', '1');
INSERT INTO `indicador` VALUES ('231', '10.38.3', 'Existencia de planes y proyectos en ejecución para la conservación, expansión, mejoras y mantenimiento de la planta física para el programa, de acuerdo con las normas técnicas respectivas.', '38', '1');
INSERT INTO `indicador` VALUES ('232', '10.38.4', 'Apreciación de directivos, profesores, estudiantes y personal administrativo del programa sobre las características de la planta física, desde el punto de vista de su accesibilidad, diseño, capacidad, iluminación, ventilación y condiciones de seguridad e higiene.', '38', '1');
INSERT INTO `indicador` VALUES ('233', '10.38.5', 'Disponibilidad de infraestructura física para atender las necesidades académicas, administrativas y de bienestar, que sea coherente con la modalidad en que se ofrece el programa.', '38', '1');
INSERT INTO `indicador` VALUES ('234', '10.39.1', 'Origen, monto y distribución de los recursos presupuestales destinados al programa.', '39', '1');
INSERT INTO `indicador` VALUES ('235', '10.39.2', 'Mecanismos de seguimiento y verificación a la ejecución presupuestal del programa con base en planes de mejoramiento y mantenimiento.', '39', '1');
INSERT INTO `indicador` VALUES ('236', '10.39.3', 'Distribución de la asignación presupuestal para actividades de docencia, investigación, creación artística y cultural, proyección social, bienestar institucional e internacionalización que en forma directa o indirecta se reflejen en el programa.', '39', '1');
INSERT INTO `indicador` VALUES ('237', '10.39.4', 'Porcentaje de los ingresos que la Institución dedica a la inversión en el programa.', '39', '1');
INSERT INTO `indicador` VALUES ('238', '10.39.5', 'Capacidad del programa para generar recursos externos para el apoyo a sus funciones misionales.', '39', '1');
INSERT INTO `indicador` VALUES ('239', '10.39.6', 'Apreciación de directivos y profesores adscritos al programa sobre la suficiencia de los recursos presupuestales de que se dispone en el mismo y sobre la ejecución presupuestal.', '39', '1');
INSERT INTO `indicador` VALUES ('240', '10.39.7', 'Existencia de estudio de viabilidad financiera del programa, que incluya un plan básico de inversión orientado a la consolidación del Proyecto Educativo.', '39', '1');
INSERT INTO `indicador` VALUES ('241', '10.39.8', 'Los planes de mejoramiento del programa se soportan en un presupuesto de apropiación programada.', '39', '1');
INSERT INTO `indicador` VALUES ('242', '10.40.1', 'Manejo de los recursos físicos y financieros, en concordancia con los planes de desarrollo, los planes de mejoramiento y el tamaño y la complejidad de la institución y del programa.', '40', '1');
INSERT INTO `indicador` VALUES ('243', '10.40.2', 'Criterios y mecanismos para la elaboración, ejecución y seguimiento del presupuesto y para la asignación de recursos físicos y financieros para el programa.', '40', '1');
INSERT INTO `indicador` VALUES ('244', '10.40.3', 'Evidencias de los controles legales y administrativos para asegurar el manejo transparente de los recursos.', '40', '1');
INSERT INTO `indicador` VALUES ('245', '10.40.4', 'Apreciación de directivos y profesores adscritos al programa sobre la equidad en la asignación de recursos físicos y financieros para el programa', '40', '1');

-- ----------------------------
-- Table structure for instrumento
-- ----------------------------
DROP TABLE IF EXISTS `instrumento`;
CREATE TABLE `instrumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instrumento
-- ----------------------------
INSERT INTO `instrumento` VALUES ('1', 'Encuesta', 'Instrumento para recolectar información a traves de encuestas');
INSERT INTO `instrumento` VALUES ('2', 'Información numérica', 'Instrumento para recolectar información a traves de información numérica');
INSERT INTO `instrumento` VALUES ('3', 'Información documental', 'Instrumento para recolectar información a traves de información documental');

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
INSERT INTO `instrumentohasindicador` VALUES ('1', '1');
INSERT INTO `instrumentohasindicador` VALUES ('3', '2');
INSERT INTO `instrumentohasindicador` VALUES ('3', '3');
INSERT INTO `instrumentohasindicador` VALUES ('3', '4');
INSERT INTO `instrumentohasindicador` VALUES ('3', '5');
INSERT INTO `instrumentohasindicador` VALUES ('3', '6');
INSERT INTO `instrumentohasindicador` VALUES ('3', '7');
INSERT INTO `instrumentohasindicador` VALUES ('1', '8');
INSERT INTO `instrumentohasindicador` VALUES ('3', '9');
INSERT INTO `instrumentohasindicador` VALUES ('3', '10');
INSERT INTO `instrumentohasindicador` VALUES ('3', '11');
INSERT INTO `instrumentohasindicador` VALUES ('3', '12');
INSERT INTO `instrumentohasindicador` VALUES ('3', '13');
INSERT INTO `instrumentohasindicador` VALUES ('3', '14');
INSERT INTO `instrumentohasindicador` VALUES ('3', '15');
INSERT INTO `instrumentohasindicador` VALUES ('3', '16');
INSERT INTO `instrumentohasindicador` VALUES ('3', '17');
INSERT INTO `instrumentohasindicador` VALUES ('3', '18');
INSERT INTO `instrumentohasindicador` VALUES ('3', '19');
INSERT INTO `instrumentohasindicador` VALUES ('1', '20');
INSERT INTO `instrumentohasindicador` VALUES ('3', '21');
INSERT INTO `instrumentohasindicador` VALUES ('3', '22');
INSERT INTO `instrumentohasindicador` VALUES ('3', '23');
INSERT INTO `instrumentohasindicador` VALUES ('3', '24');
INSERT INTO `instrumentohasindicador` VALUES ('1', '25');
INSERT INTO `instrumentohasindicador` VALUES ('3', '26');
INSERT INTO `instrumentohasindicador` VALUES ('3', '27');
INSERT INTO `instrumentohasindicador` VALUES ('1', '28');
INSERT INTO `instrumentohasindicador` VALUES ('1', '29');
INSERT INTO `instrumentohasindicador` VALUES ('3', '30');
INSERT INTO `instrumentohasindicador` VALUES ('1', '31');
INSERT INTO `instrumentohasindicador` VALUES ('3', '32');
INSERT INTO `instrumentohasindicador` VALUES ('1', '33');
INSERT INTO `instrumentohasindicador` VALUES ('3', '34');
INSERT INTO `instrumentohasindicador` VALUES ('3', '35');
INSERT INTO `instrumentohasindicador` VALUES ('3', '36');
INSERT INTO `instrumentohasindicador` VALUES ('1', '37');
INSERT INTO `instrumentohasindicador` VALUES ('3', '38');
INSERT INTO `instrumentohasindicador` VALUES ('1', '39');
INSERT INTO `instrumentohasindicador` VALUES ('3', '40');
INSERT INTO `instrumentohasindicador` VALUES ('3', '41');
INSERT INTO `instrumentohasindicador` VALUES ('1', '42');
INSERT INTO `instrumentohasindicador` VALUES ('3', '43');
INSERT INTO `instrumentohasindicador` VALUES ('3', '44');
INSERT INTO `instrumentohasindicador` VALUES ('3', '45');
INSERT INTO `instrumentohasindicador` VALUES ('3', '46');
INSERT INTO `instrumentohasindicador` VALUES ('3', '47');
INSERT INTO `instrumentohasindicador` VALUES ('3', '48');
INSERT INTO `instrumentohasindicador` VALUES ('3', '49');
INSERT INTO `instrumentohasindicador` VALUES ('1', '50');
INSERT INTO `instrumentohasindicador` VALUES ('3', '51');
INSERT INTO `instrumentohasindicador` VALUES ('1', '52');
INSERT INTO `instrumentohasindicador` VALUES ('1', '53');
INSERT INTO `instrumentohasindicador` VALUES ('1', '54');
INSERT INTO `instrumentohasindicador` VALUES ('1', '55');
INSERT INTO `instrumentohasindicador` VALUES ('1', '56');
INSERT INTO `instrumentohasindicador` VALUES ('3', '57');
INSERT INTO `instrumentohasindicador` VALUES ('1', '58');
INSERT INTO `instrumentohasindicador` VALUES ('3', '59');
INSERT INTO `instrumentohasindicador` VALUES ('1', '60');
INSERT INTO `instrumentohasindicador` VALUES ('1', '61');
INSERT INTO `instrumentohasindicador` VALUES ('1', '62');
INSERT INTO `instrumentohasindicador` VALUES ('1', '63');
INSERT INTO `instrumentohasindicador` VALUES ('1', '64');
INSERT INTO `instrumentohasindicador` VALUES ('1', '65');
INSERT INTO `instrumentohasindicador` VALUES ('1', '66');
INSERT INTO `instrumentohasindicador` VALUES ('3', '67');
INSERT INTO `instrumentohasindicador` VALUES ('1', '68');
INSERT INTO `instrumentohasindicador` VALUES ('1', '69');
INSERT INTO `instrumentohasindicador` VALUES ('1', '70');
INSERT INTO `instrumentohasindicador` VALUES ('3', '71');
INSERT INTO `instrumentohasindicador` VALUES ('3', '72');
INSERT INTO `instrumentohasindicador` VALUES ('3', '73');
INSERT INTO `instrumentohasindicador` VALUES ('1', '74');
INSERT INTO `instrumentohasindicador` VALUES ('3', '75');
INSERT INTO `instrumentohasindicador` VALUES ('3', '76');
INSERT INTO `instrumentohasindicador` VALUES ('3', '77');
INSERT INTO `instrumentohasindicador` VALUES ('1', '78');
INSERT INTO `instrumentohasindicador` VALUES ('3', '79');
INSERT INTO `instrumentohasindicador` VALUES ('3', '80');
INSERT INTO `instrumentohasindicador` VALUES ('3', '81');
INSERT INTO `instrumentohasindicador` VALUES ('3', '82');
INSERT INTO `instrumentohasindicador` VALUES ('3', '83');
INSERT INTO `instrumentohasindicador` VALUES ('3', '84');
INSERT INTO `instrumentohasindicador` VALUES ('3', '85');
INSERT INTO `instrumentohasindicador` VALUES ('3', '86');
INSERT INTO `instrumentohasindicador` VALUES ('3', '87');
INSERT INTO `instrumentohasindicador` VALUES ('3', '88');
INSERT INTO `instrumentohasindicador` VALUES ('1', '89');
INSERT INTO `instrumentohasindicador` VALUES ('3', '90');
INSERT INTO `instrumentohasindicador` VALUES ('3', '91');
INSERT INTO `instrumentohasindicador` VALUES ('3', '92');
INSERT INTO `instrumentohasindicador` VALUES ('3', '93');
INSERT INTO `instrumentohasindicador` VALUES ('3', '94');
INSERT INTO `instrumentohasindicador` VALUES ('3', '95');
INSERT INTO `instrumentohasindicador` VALUES ('3', '96');
INSERT INTO `instrumentohasindicador` VALUES ('1', '97');
INSERT INTO `instrumentohasindicador` VALUES ('3', '98');
INSERT INTO `instrumentohasindicador` VALUES ('3', '99');
INSERT INTO `instrumentohasindicador` VALUES ('1', '100');
INSERT INTO `instrumentohasindicador` VALUES ('3', '101');
INSERT INTO `instrumentohasindicador` VALUES ('3', '102');
INSERT INTO `instrumentohasindicador` VALUES ('3', '103');
INSERT INTO `instrumentohasindicador` VALUES ('3', '104');
INSERT INTO `instrumentohasindicador` VALUES ('3', '105');
INSERT INTO `instrumentohasindicador` VALUES ('3', '106');
INSERT INTO `instrumentohasindicador` VALUES ('3', '107');
INSERT INTO `instrumentohasindicador` VALUES ('3', '108');
INSERT INTO `instrumentohasindicador` VALUES ('3', '109');
INSERT INTO `instrumentohasindicador` VALUES ('1', '110');
INSERT INTO `instrumentohasindicador` VALUES ('1', '111');
INSERT INTO `instrumentohasindicador` VALUES ('1', '112');
INSERT INTO `instrumentohasindicador` VALUES ('3', '113');
INSERT INTO `instrumentohasindicador` VALUES ('1', '114');
INSERT INTO `instrumentohasindicador` VALUES ('1', '115');
INSERT INTO `instrumentohasindicador` VALUES ('3', '116');
INSERT INTO `instrumentohasindicador` VALUES ('3', '117');
INSERT INTO `instrumentohasindicador` VALUES ('3', '118');
INSERT INTO `instrumentohasindicador` VALUES ('3', '119');
INSERT INTO `instrumentohasindicador` VALUES ('1', '120');
INSERT INTO `instrumentohasindicador` VALUES ('3', '121');
INSERT INTO `instrumentohasindicador` VALUES ('3', '122');
INSERT INTO `instrumentohasindicador` VALUES ('1', '123');
INSERT INTO `instrumentohasindicador` VALUES ('3', '124');
INSERT INTO `instrumentohasindicador` VALUES ('1', '125');
INSERT INTO `instrumentohasindicador` VALUES ('3', '126');
INSERT INTO `instrumentohasindicador` VALUES ('1', '127');
INSERT INTO `instrumentohasindicador` VALUES ('3', '128');
INSERT INTO `instrumentohasindicador` VALUES ('3', '129');
INSERT INTO `instrumentohasindicador` VALUES ('3', '130');
INSERT INTO `instrumentohasindicador` VALUES ('1', '131');
INSERT INTO `instrumentohasindicador` VALUES ('3', '132');
INSERT INTO `instrumentohasindicador` VALUES ('3', '133');
INSERT INTO `instrumentohasindicador` VALUES ('3', '134');
INSERT INTO `instrumentohasindicador` VALUES ('3', '135');
INSERT INTO `instrumentohasindicador` VALUES ('3', '136');
INSERT INTO `instrumentohasindicador` VALUES ('1', '137');
INSERT INTO `instrumentohasindicador` VALUES ('3', '138');
INSERT INTO `instrumentohasindicador` VALUES ('3', '139');
INSERT INTO `instrumentohasindicador` VALUES ('3', '140');
INSERT INTO `instrumentohasindicador` VALUES ('3', '141');
INSERT INTO `instrumentohasindicador` VALUES ('3', '142');
INSERT INTO `instrumentohasindicador` VALUES ('3', '143');
INSERT INTO `instrumentohasindicador` VALUES ('3', '144');
INSERT INTO `instrumentohasindicador` VALUES ('1', '145');
INSERT INTO `instrumentohasindicador` VALUES ('3', '146');
INSERT INTO `instrumentohasindicador` VALUES ('3', '147');
INSERT INTO `instrumentohasindicador` VALUES ('3', '148');
INSERT INTO `instrumentohasindicador` VALUES ('3', '149');
INSERT INTO `instrumentohasindicador` VALUES ('1', '150');
INSERT INTO `instrumentohasindicador` VALUES ('1', '151');
INSERT INTO `instrumentohasindicador` VALUES ('3', '152');
INSERT INTO `instrumentohasindicador` VALUES ('3', '153');
INSERT INTO `instrumentohasindicador` VALUES ('3', '154');
INSERT INTO `instrumentohasindicador` VALUES ('1', '155');
INSERT INTO `instrumentohasindicador` VALUES ('3', '156');
INSERT INTO `instrumentohasindicador` VALUES ('3', '157');
INSERT INTO `instrumentohasindicador` VALUES ('3', '158');
INSERT INTO `instrumentohasindicador` VALUES ('3', '159');
INSERT INTO `instrumentohasindicador` VALUES ('3', '160');
INSERT INTO `instrumentohasindicador` VALUES ('3', '161');
INSERT INTO `instrumentohasindicador` VALUES ('3', '162');
INSERT INTO `instrumentohasindicador` VALUES ('3', '163');
INSERT INTO `instrumentohasindicador` VALUES ('1', '164');
INSERT INTO `instrumentohasindicador` VALUES ('3', '165');
INSERT INTO `instrumentohasindicador` VALUES ('1', '166');
INSERT INTO `instrumentohasindicador` VALUES ('3', '167');
INSERT INTO `instrumentohasindicador` VALUES ('3', '168');
INSERT INTO `instrumentohasindicador` VALUES ('3', '169');
INSERT INTO `instrumentohasindicador` VALUES ('3', '170');
INSERT INTO `instrumentohasindicador` VALUES ('3', '171');
INSERT INTO `instrumentohasindicador` VALUES ('3', '172');
INSERT INTO `instrumentohasindicador` VALUES ('3', '173');
INSERT INTO `instrumentohasindicador` VALUES ('3', '174');
INSERT INTO `instrumentohasindicador` VALUES ('3', '175');
INSERT INTO `instrumentohasindicador` VALUES ('3', '176');
INSERT INTO `instrumentohasindicador` VALUES ('3', '177');
INSERT INTO `instrumentohasindicador` VALUES ('3', '178');
INSERT INTO `instrumentohasindicador` VALUES ('3', '179');
INSERT INTO `instrumentohasindicador` VALUES ('3', '180');
INSERT INTO `instrumentohasindicador` VALUES ('3', '181');
INSERT INTO `instrumentohasindicador` VALUES ('3', '182');
INSERT INTO `instrumentohasindicador` VALUES ('3', '183');
INSERT INTO `instrumentohasindicador` VALUES ('3', '184');
INSERT INTO `instrumentohasindicador` VALUES ('3', '185');
INSERT INTO `instrumentohasindicador` VALUES ('1', '186');
INSERT INTO `instrumentohasindicador` VALUES ('3', '187');
INSERT INTO `instrumentohasindicador` VALUES ('3', '188');
INSERT INTO `instrumentohasindicador` VALUES ('3', '189');
INSERT INTO `instrumentohasindicador` VALUES ('1', '190');
INSERT INTO `instrumentohasindicador` VALUES ('3', '191');
INSERT INTO `instrumentohasindicador` VALUES ('3', '192');
INSERT INTO `instrumentohasindicador` VALUES ('3', '193');
INSERT INTO `instrumentohasindicador` VALUES ('3', '194');
INSERT INTO `instrumentohasindicador` VALUES ('3', '195');
INSERT INTO `instrumentohasindicador` VALUES ('3', '196');
INSERT INTO `instrumentohasindicador` VALUES ('3', '197');
INSERT INTO `instrumentohasindicador` VALUES ('3', '198');
INSERT INTO `instrumentohasindicador` VALUES ('3', '199');
INSERT INTO `instrumentohasindicador` VALUES ('3', '200');
INSERT INTO `instrumentohasindicador` VALUES ('3', '201');
INSERT INTO `instrumentohasindicador` VALUES ('1', '202');
INSERT INTO `instrumentohasindicador` VALUES ('1', '203');
INSERT INTO `instrumentohasindicador` VALUES ('3', '204');
INSERT INTO `instrumentohasindicador` VALUES ('1', '205');
INSERT INTO `instrumentohasindicador` VALUES ('3', '206');
INSERT INTO `instrumentohasindicador` VALUES ('3', '207');
INSERT INTO `instrumentohasindicador` VALUES ('3', '208');
INSERT INTO `instrumentohasindicador` VALUES ('1', '209');
INSERT INTO `instrumentohasindicador` VALUES ('1', '210');
INSERT INTO `instrumentohasindicador` VALUES ('3', '211');
INSERT INTO `instrumentohasindicador` VALUES ('1', '212');
INSERT INTO `instrumentohasindicador` VALUES ('1', '213');
INSERT INTO `instrumentohasindicador` VALUES ('1', '214');
INSERT INTO `instrumentohasindicador` VALUES ('3', '215');
INSERT INTO `instrumentohasindicador` VALUES ('3', '216');
INSERT INTO `instrumentohasindicador` VALUES ('3', '217');
INSERT INTO `instrumentohasindicador` VALUES ('3', '218');
INSERT INTO `instrumentohasindicador` VALUES ('1', '219');
INSERT INTO `instrumentohasindicador` VALUES ('1', '220');
INSERT INTO `instrumentohasindicador` VALUES ('3', '221');
INSERT INTO `instrumentohasindicador` VALUES ('3', '222');
INSERT INTO `instrumentohasindicador` VALUES ('3', '223');
INSERT INTO `instrumentohasindicador` VALUES ('3', '224');
INSERT INTO `instrumentohasindicador` VALUES ('3', '225');
INSERT INTO `instrumentohasindicador` VALUES ('1', '226');
INSERT INTO `instrumentohasindicador` VALUES ('1', '227');
INSERT INTO `instrumentohasindicador` VALUES ('1', '228');
INSERT INTO `instrumentohasindicador` VALUES ('3', '229');
INSERT INTO `instrumentohasindicador` VALUES ('3', '230');
INSERT INTO `instrumentohasindicador` VALUES ('3', '231');
INSERT INTO `instrumentohasindicador` VALUES ('1', '232');
INSERT INTO `instrumentohasindicador` VALUES ('3', '233');
INSERT INTO `instrumentohasindicador` VALUES ('3', '234');
INSERT INTO `instrumentohasindicador` VALUES ('3', '235');
INSERT INTO `instrumentohasindicador` VALUES ('3', '236');
INSERT INTO `instrumentohasindicador` VALUES ('3', '237');
INSERT INTO `instrumentohasindicador` VALUES ('3', '238');
INSERT INTO `instrumentohasindicador` VALUES ('1', '239');
INSERT INTO `instrumentohasindicador` VALUES ('3', '240');
INSERT INTO `instrumentohasindicador` VALUES ('3', '241');
INSERT INTO `instrumentohasindicador` VALUES ('3', '242');
INSERT INTO `instrumentohasindicador` VALUES ('3', '243');
INSERT INTO `instrumentohasindicador` VALUES ('3', '244');
INSERT INTO `instrumentohasindicador` VALUES ('1', '245');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modelo
-- ----------------------------
INSERT INTO `modelo` VALUES ('1', 'Modelo de Autoevaluación de Programas', 'Modelo de Autoevaluación de Programas de pregrado de la Escuela Naval de Cadetes Almirante Padilla', null, '2015-05-20', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ponderacioncaracteristica
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ponderacionfactor
-- ----------------------------

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
  `codigo` varchar(100) NOT NULL,
  `pregunta` varchar(1000) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `indicador_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) NOT NULL,
  `pregunta_padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pregunta_indicador1_idx` (`indicador_id`),
  KEY `fk_pregunta_modelo1` (`modelo_id`),
  KEY `fk_pregunta_pregunta1_idx` (`pregunta_padre`),
  CONSTRAINT `fk_pregunta_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_pregunta1` FOREIGN KEY (`pregunta_padre`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pregunta
-- ----------------------------
INSERT INTO `pregunta` VALUES ('1', '-', 'Curso', 'abierta', null, '1', null);
INSERT INTO `pregunta` VALUES ('2', '-', 'Año en el que ingreso a la ENAP', 'abierta', null, '1', null);
INSERT INTO `pregunta` VALUES ('3', '-', 'Número de identificación', 'abierta', null, '1', null);
INSERT INTO `pregunta` VALUES ('4', '-', 'Nivel de estudios', 'smur', null, '1', null);
INSERT INTO `pregunta` VALUES ('5', '-', 'Actualmente está empleado', 'smur', null, '1', null);
INSERT INTO `pregunta` VALUES ('6', '-', 'Ejerce su profesión', 'smur', null, '1', null);
INSERT INTO `pregunta` VALUES ('7', '-', 'Año de terminación curso complementación profesional', 'abierta', null, '1', null);
INSERT INTO `pregunta` VALUES ('8', '-', 'Año de vinculación a la ENAP', 'abierta', null, '1', null);
INSERT INTO `pregunta` VALUES ('9', '-', 'Tipo de vinculación a la ENAP', 'smur', null, '1', null);
INSERT INTO `pregunta` VALUES ('10', '-', 'Condición', 'smur', null, '1', null);
INSERT INTO `pregunta` VALUES ('11', '-', 'Dependencia', 'abierta', null, '1', null);
INSERT INTO `pregunta` VALUES ('12', '-', 'Durante el tiempo que lleva vinculado(a) con a la ENAP, ¿ha recibido alguna información oral o escrita sobre el quehacer del programa de _PROGRAMA_ y de nuestra institución?', 'smur', null, '1', null);
INSERT INTO `pregunta` VALUES ('13', '1.1.1.a', 'La Escuela Naval de Cadetes “Almirante Padilla”, es una unidad de apoyo de la Armada Nacional, por tanto, tiene una Función claramente formulada, que contribuye a la misión institucional. Desde su quehacer cotidiano, evalué el grado de apropiación (Conoce, Entiende y Aplica) del sentido de la función de la ENAP.', '1to5', '1', '1', null);
INSERT INTO `pregunta` VALUES ('14', '1.2.2.a', 'El programa ha definido un proyecto pedagógico coherente con el proyecto institucional de la Escuela Naval. ¿Conoce usted el Proyecto Educativo del programa?', 'smur', '8', '1', null);
INSERT INTO `pregunta` VALUES ('15', '1.2.2.b', 'Con base en el conocimiento que usted posee del Proyecto Educativo del Programa, evalúe desde su quehacer cotidiano, el grado de apropiación en cada uno de los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('16', '2.4.1.a', '¿Conoce los mecanismos de selección e ingreso de los estudiantes que ingresan a la Escuela Naval de Cadetes Almirante Padilla?', 'smur', '20', '1', null);
INSERT INTO `pregunta` VALUES ('17', '2.5.2.a', 'A nivel nacional, la relación estándar de atención docente: estudiantes, es 1:24. En la Escuela Naval de Cadetes “Almirante Padilla”-ENAP, en situación normal ésta relación es en promedio 1:10 y en algunos casos,  menor (casi personalizada).  ¿Considera  que la relación docente: estudiante en la ENAP es adecuada?', '1to5', '25', '1', null);
INSERT INTO `pregunta` VALUES ('18', '2.6.2.a', 'Señale en grado de importancia, de acuerdo a la naturaleza del programa, como considera usted la calidad de las siguientes actividades para la formación integral:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('19', '2.6.3.a', 'Evalúe  de acuerdo con la escala establecida (donde 5 es la actividad que  más participa y 1 es la actividad en que menos  participa) en cuales de las siguientes actividades de formación integral, ha participado activamente:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('20', '2.7.2.a', 'El Reglamento Académico establece la competencia, las normas técnicas y procedimientos que debe cumplir la Escuela Naval de Cadetes Almirante Padilla para la evaluación de los estudiantes, la relación con los docentes y otros aspectos de la administración académica. Su cumplimiento y control es responsabilidad de todo el personal involucrado en el proceso de formación y capacitación. ¿Tiene conocimiento de sus deberes y derechos contemplados en el Reglamento Académico de la Escuela Naval de Cadetes “Almirante Padilla”?', 'smur', '31', '1', null);
INSERT INTO `pregunta` VALUES ('21', '2.7.2.b', 'De acuerdo con su apreciación, evalúe los siguientes aspectos, del Reglamento Académico de la Escuela Naval de Cadetes “Almirante Padilla”:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('22', '2.7.4.a', 'El Reglamento Académico establece la competencia, las normas técnicas y procedimientos que debe cumplir la Escuela Naval de Cadetes Almirante Padilla para la evaluación de los estudiantes, la relación con los docentes y otros aspectos de la administración académica. Su cumplimiento y control es responsabilidad de todo el personal involucrado en el proceso de formación y capacitación. Mediante el acto de la matrícula, el estudiante manifiesta que conoce y acepta el presente reglamento y adquiere el compromiso de cumplirlo. ¿Considera usted que existe participación de los estudiantes en los órganos de dirección del programa?', '1to5', '33', '1', null);
INSERT INTO `pregunta` VALUES ('23', '2.7.4.b', '¿Considera usted que este sistema de participación, tiene un impacto positivo y significativo para el  proceso de formación?', '1to5', '33', '1', null);
INSERT INTO `pregunta` VALUES ('24', '3.8.3.a', '¿Conoce las políticas, las normas y los criterios académicos, establecidos por la Escuela Naval de Cadetes Almirante Padilla, para la selección, vinculación y permanencia de los docentes?', 'smur', '37', '1', null);
INSERT INTO `pregunta` VALUES ('25', '3.8.3.b ', 'Según su apreciación sobre las políticas, las normas y los criterios académicos, establecidos por la Escuela Naval de Cadetes Almirante Padilla, para la selección, vinculación y permanencia de los docentes, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('26', '3.9.2.a', 'La Escuela Naval como Institución de Educación Superior de Régimen Especial, adscrita al Ministerio de Defensa Nacional, cuenta con una normatividad especial para el personal civil, \"que contiene entre otros, los siguientes aspectos: régimen de selección, vinculación, promoción, derechos, deberes, distinciones y estímulos; sistemas de evaluación de desempeño, régimen disciplinario y demás disposiciones administrativas\" ¿Conoce las políticas y normatividad que rige la actividad docente en la Escuela Naval de Cadetes Almirante Padilla?', 'smur', '39', '1', null);
INSERT INTO `pregunta` VALUES ('27', '3.9.2.b', 'Según su apreciación sobre la normatividad especial que rige al personal civil con función docente de la Escuela Naval de Cadetes Almirante Padilla, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('28', '3.9.5.a', 'Según su apreciación, evalúe si se aplican políticas institucionales (Reglamento Académico) en materia de participación del profesorado en los siguientes órganos de dirección:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('29', '3.10.7.a\r\n', 'En conformidad con la estructura organizativa de la institución y con las especificidades del programa, éste cuenta con el número de profesores con la dedicación y nivel de formación requeridos para el desarrollo de las actividades de docencia, investigación y extensión o proyección social, y con la capacidad para atender adecuadamente a los estudiantes.\r\nDe acuerdo a lo anterior contestar las siguientes preguntas:\r\n¿Según su apreciación, considera que la interacción estudiante-profesor garantiza la calidad en la formación? Evalúe esta pregunta, para cada uno de los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('30', '3.10.7.b', '¿Según su apreciación, el número de profesores del programa es suficiente para atender adecuadamente a los estudiantes?', '1to5', '50', '1', null);
INSERT INTO `pregunta` VALUES ('31', '3.11.1.a', '¿Conoce las políticas y lineamientos de desarrollo profesoral encaminadas a suplir las necesidades y cumplir los objetivos del programa?', 'smur', '52', '1', null);
INSERT INTO `pregunta` VALUES ('32', '3.11.2.a', '¿Durante los últimos cinco años, ha participado de los siguientes programas de desarrollo profesoral en el marco del cumplimiento de alguna política institucional?', 'vecesmatriz', null, '1', null);
INSERT INTO `pregunta` VALUES ('33', '3.11.2.b', 'Como resultado de políticas institucionales para capacitación y actualización permanente, ¿Ha recibido durante los últimos cinco años apoyo  para la realización de los siguientes programas de desarrollo profesoral?', '6matriz', null, '1', null);
INSERT INTO `pregunta` VALUES ('34', '3.11.3.a', 'Según su apreciación, evalúe para cada uno de los siguientes procesos, ¿cuáles han sido impactados por las acciones orientadas al desarrollo integral de los profesores, en el enriquecimiento de la calidad del programa?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('35', '3.11.4.a', '¿Ha recibido capacitación de expertos,  para la  cualificación de su labor pedagógica, acuerdo con el tipo y metodología del programa?', 'smur', '55', '1', null);
INSERT INTO `pregunta` VALUES ('36', '3.11.5.a', '¿Ha recibido reconocimiento por participar en actividades de creación artística y  cultural? Seleccione todas aquellas actividades en las cuales haya recibido reconocimiento: ', 'multiple', '56', '1', null);
INSERT INTO `pregunta` VALUES ('37', '3.12.1.a', '¿Conoce las políticas de estímulo y reconocimiento por el ejercicio calificado de:', 'simatriz', null, '1', null);
INSERT INTO `pregunta` VALUES ('38', '3.12.3.a', '¿Ha recibido en los últimos cinco años, reconocimientos y estímulos institucionales por el ejercicio calificado de:', 'simatriz', null, '1', null);
INSERT INTO `pregunta` VALUES ('39', '3.12.4.a', 'Según su apreciación, ¿Cuáles de los siguientes procesos han sido impactados por los estímulos en el ejercicio calificado de la docencia? ', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('40', '3.12.4.b', 'Según su apreciación, ¿cuáles de los siguientes procesos han sido impactados por los estímulos en el ejercicio calificado de la investigación? ', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('41', '3.12.4.c', 'Según su apreciación, ¿cuáles de los siguientes procesos han sido impactados por los estímulos en el ejercicio calificado de la proyección social?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('42', '3.12.4.d', 'Según su apreciación, ¿cuáles de los siguientes procesos han sido impactados por los estímulos en el ejercicio calificado de la cooperación internacional?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('43', '3.13.1.a', '¿Durante los últimos cinco años, ha elaborado materiales de apoyo docente?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('44', '3.13.1.b', '¿El material de apoyo docente elaborado por usted, ha sido utilizado por los estudiantes?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('45', '3.13.1.c', '¿El material de apoyo docente elaborado por usted, se evalúa periódicamente con base en criterios y mecanismos académicos institucionales?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('46', '3.13.2.a', '¿El material de apoyo producido o utilizado  por sus docentes, para el desarrollo de las clases, es de calidad y contribuye en forma apropiada al desarrollo de los contenidos del programa?', '1to5', '63', '1', null);
INSERT INTO `pregunta` VALUES ('47', '3.13.2.b', '¿El material de apoyo producido o utilizado  por sus docentes, para el desarrollo de las clases, es pertinente con la naturaleza del programa?', '1to5', '63', '1', null);
INSERT INTO `pregunta` VALUES ('48', '3.13.3.a', '¿Ha obtenido premios u otros reconocimientos nacionales o internacionales por su producción de materiales de apoyo a la labor docente?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('49', '3.13.4.a', '¿Conoce las políticas de propiedad  intelectual de la Escuela Naval de Cadetes “Almirante Padilla”, referente a los materiales de apoyo a la docencia?', 'smur', '65', '1', null);
INSERT INTO `pregunta` VALUES ('50', '3.14.1.a', '¿Conoce las políticas y reglamentaciones institucionales en materia de remuneración de los profesores en las que se tengan en cuenta los méritos profesionales y académicos,  así como los estímulos a la producción académica y de innovación debidamente evaluada?', 'smur', '66', '1', null);
INSERT INTO `pregunta` VALUES ('51', '3.14.3.a', '¿Considera usted que existe una correspondencia entre la remuneración y los méritos académicos y profesionales?', '1to5', '68', '1', null);
INSERT INTO `pregunta` VALUES ('52', '3.14.4.a', '¿Tiene conocimiento usted sobre existencia de un sistema de evaluación de la producción académica en la Escuela Naval de cadetes “Almirante Padilla”?', 'smur', '69', '1', null);
INSERT INTO `pregunta` VALUES ('53', '3.14.4.b', '¿Según su apreciación considera que el sistema de evaluación de la producción académica de la Escuela Naval de Cadetes “Almirante Padilla”,  es acorde con las políticas institucionales?', '1to5', '69', '1', null);
INSERT INTO `pregunta` VALUES ('54', '3.15.1.a', '¿Conoce las políticas institucionales en materia de evaluación de los docentes?', 'smur', '70', '1', null);
INSERT INTO `pregunta` VALUES ('55', '3.15.5.a', 'De acuerdo con su apreciación sobre los criterios y mecanismos para la evaluación de docentes, evalué los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('56', '4.16.4.a', 'El Currículo contribuye a la formación en valores, actitudes, aptitudes, conocimientos, métodos, principios de acción básicos y competencias comunicativas y profesionales, de acuerdo con el estado del arte de la disciplina, profesión, ocupación u oficio, y busca la formación integral del estudiante, en coherencia con la misión institucional y los objetivos del programa. ¿Según su apreciación, considera que la calidad e integridad del currículo propician la formación integral del estudiante?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('57', '4.16.4.b', 'El Currículo contribuye a la formación en valores, actitudes, aptitudes, conocimientos, métodos, principios de acción básicos y competencias comunicativas y profesionales, de acuerdo con el estado del arte de la disciplina, profesión, ocupación u oficio, y busca la formación integral del estudiante, en coherencia con la misión institucional y los objetivos del programa. ¿Considera usted que el currículo del programa cumple con las condiciones de calidad e integralidad con respecto a los siguientes criterios?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('58', '4.17.5.a', 'Se entiende por currículo, el conjunto de criterios, planes de estudio, metodologías y procesos que contribuyan a la formación integral de los estudiantes y a la construcción de una entidad cultural de la ENAP. Este currículo ha de ser lo suficientemente flexible para mantenerse actualizado y pertinente y facilitar la permanencia de los estudiantes en el programa y en la Institución. ¿Según su apreciación sobre el currículo del programa, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('59', '4.17.5.b', '¿De acuerdo con su apreciación, considera que las políticas curriculares de la Escuela Naval, son eficaces y facilitan la permanencia de los estudiantes en el programa y en la Institución?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('60', '4.17.5.c', '¿De acuerdo con su apreciación, considera que las políticas institucionales de la Escuela Naval, son eficaces y propician la flexibilidad curricular?', '1to5', '89', '1', null);
INSERT INTO `pregunta` VALUES ('61', '4.18.3.a', 'De acuerdo con su apreciación sobre la interdisciplinariedad del programa, evalúe los siguientes aspectos teniendo en cuenta su aporte al enriquecimiento de la calidad', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('62', '4.19.3.a', '¿De acuerdo con su apreciación, considera que los métodos y estrategias de orientación del aprendizaje son adecuados y corresponden al desarrollo de los contenidos del plan de estudios?', '1to5', '100', '1', null);
INSERT INTO `pregunta` VALUES ('63', '4.19.13.a', 'Considera usted que existe correspondencia entre las  condiciones y exigencias académicas de permanencia y graduación en el programa, y la naturaleza del mismo?', '1to5', '110', '1', null);
INSERT INTO `pregunta` VALUES ('64', '4.19.14.a', 'Conoce los siguientes mecanismos que facilitan el óptimo desempeño de admitidos en condición de vulnerabilidad y discapacidad entre otros.', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('65', '4.20.1.a', '¿Conoce la existencia de criterios, políticas y reglamentaciones institucionales y del programa, respecto a los siguientes aspectos?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('66', '4.20.3.a', 'El Sistema de Evaluación de estudiantes contempla políticas y reglas claras, universales y equitativas de evaluación, y las aplica teniendo en cuenta la naturaleza de las distintas actividades académicas. Según su apreciación, evalúe la correspondencia entre las formas de evaluación académica de los estudiantes del programa, respecto a los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('67', '4.20.4.a', 'De acuerdo con su apreciación, como considera que el sistema de evaluación académica contribuye a la adquisición de las siguientes competencias?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('68', '4.21.3.a', 'Los trabajos realizados por los estudiantes (talleres, ensayos, papers, proyectos de aula, entre otros), en las diferentes etapas del plan de estudios, favorecen el logro de los objetivos del programa y el desarrollo de competencias, según las exigencias de calidad de la comunidad académica. ¿Considera usted que los trabajos realizados por los estudiantes en las diferentes etapas del plan estudio son consecuentes con los objetivos del programa? ', '1to5', '120', '1', null);
INSERT INTO `pregunta` VALUES ('69', '4.22.1.a', 'Conoce la existencia de políticas en materia de evaluación y autorregulación del programa académico que conduzcan al diseño y formulación de planes de mejoramiento continuo y a la gestión de la innovación?', 'smur', '123', '1', null);
INSERT INTO `pregunta` VALUES ('70', '4.22.1.b', 'Dichas políticas se aplican al interior del programa?', '1to5', '123', '1', null);
INSERT INTO `pregunta` VALUES ('71', '4.22.3.a', '¿De acuerdo con su apreciación, considera que las políticas de evaluación y autorregulación del programa  contribuyen al mejoramiento de la calidad educativa del programa?', '1to5', '125', '1', null);
INSERT INTO `pregunta` VALUES ('72', '4.23.1.a', '¿Conoce la existencia de criterios y políticas institucionales y del programa en materia de extensión o proyección social?', 'smur', '127', '1', null);
INSERT INTO `pregunta` VALUES ('73', '4.23.5.a', 'El programa ha definido mecanismos para enfrentar académicamente problemas del entorno, promueve el vínculo con los distintos sectores de la sociedad e incorpora en el plan de estudios el resultado de estas experiencias.¿Según su apreciación considera que los resultados de los proyectos de extensión o proyección social desarrollados por el programa, han tendido algún impacto en el entorno?', '1to5', '131', '1', null);
INSERT INTO `pregunta` VALUES ('74', '4.24.3.a', 'Respecto al material bibliográfico con que cuenta el programa, para apoyar el desarrollo de las distintas actividades académicas, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('75', '4.25.6.a', 'Según su apreciación, respecto a los recursos informáticos y de comunicación dispuestos por la institución para el desarrollo de las actividades académicas, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('76', '4.26.5.a', 'Según su apreciación, evalúe si los siguientes recursos de apoyo docente, son suficientes para el cumplimiento de los objetivos de formación académica:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('77', '4.26.5.b', 'Según su apreciación, evalúe si los siguientes recursos de apoyo docente, son adecuados y se encuentran lo suficientemente actualizados para el desarrollo de las actividades de formación académica:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('78', '4.26.5.c', 'Según su apreciación, evalúe si los siguientes recursos de apoyo docente, son accesibles para el desarrollo de las actividades de formación académica:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('79', '5.27.1.a', '¿Conoce las políticas institucionales en materia de referentes académicos externos, nacionales e internacionales para la revisión y actualización del plan de estudio?', 'smur', '151', '1', null);
INSERT INTO `pregunta` VALUES ('80', '5.27.1.b', '¿Dichas políticas son aplicadas por el programa?', '1to5', '151', '1', null);
INSERT INTO `pregunta` VALUES ('81', '5.27.5.a', 'Participa de forma activa en redes u organismos nacionales e internacionales en donde se hayan derivado productos o publicaciones?', 'smur', '155', '1', null);
INSERT INTO `pregunta` VALUES ('82', '5.27.5.b', 'Seleccione de los siguientes productos, aquellos en los cuales ha participado.', 'multiple', '155', '1', null);
INSERT INTO `pregunta` VALUES ('83', '5.28.5.a', 'De las siguientes actividades de cooperación académica y profesional con programas nacionales e internacionales de reconocido liderazgo en el área del programa, seleccione aquellos en los cuales ha participado en los últimos 5 años en representación de la Escuela Naval de Cadetes “Almirante Padilla”.', 'multiple', '164', '1', null);
INSERT INTO `pregunta` VALUES ('84', '5.28.7.a', 'Ha participado en redes académicas, científicas, técnicas y tecnológicas, económicas a nivel nacional?', 'smur', '166', '1', null);
INSERT INTO `pregunta` VALUES ('85', '5.28.7.b', 'Ha participado en redes académicas, científicas, técnicas y tecnológicas, económicas a nivel internacional?', 'smur', '166', '1', null);
INSERT INTO `pregunta` VALUES ('86', '7.31.1.a', 'Conoce las políticas de la ENAP sobre bienestar institucional que propicien el desarrollo integral de la comunidad, reconozcan el valor y la diversidad y orienten la prestación de los servicios de bienestar:', 'smur', '186', '1', null);
INSERT INTO `pregunta` VALUES ('87', '7.31.5.a', '¿De acuerdo con su apreciación, considera que las políticas de bienestar institucional, contribuyen con su desarrollo personal?', '1to5', '190', '1', null);
INSERT INTO `pregunta` VALUES ('88', '7.31.5.b', '¿De acuerdo con su apreciación, considera que las actividades de bienestar, son pertinentes y han contribuido a la calidad del programa?', '1to5', '190', '1', null);
INSERT INTO `pregunta` VALUES ('89', '7.31.5.c', '¿De acuerdo con su apreciación, considera que los servicios de bienestar, son pertinentes y han contribuido a la calidad del programa?', '1to5', '190', '1', null);
INSERT INTO `pregunta` VALUES ('90', '8.33.6.a', '¿Tiene usted claridad acerca de las funciones asociadas al cargo que desempeña?', '1to5', '202', '1', null);
INSERT INTO `pregunta` VALUES ('91', '8.33.6.b', '¿Considera usted que sus funciones están articuladas con los objetivos del programa?', '1to5', '202', '1', null);
INSERT INTO `pregunta` VALUES ('92', '8.33.7.a', 'De acuerdo a los siguientes aspectos, evalúe los procesos de gestión  administrativa del programa, para lograr el desarrollo de las funciones misionales:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('93', '8.34.2.a', 'De los siguientes medios de comunicación e información empleados por la Escuela Naval de Cadetes “Almirante Padilla”, para mantener informados a los usuarios sobre los temas de interés institucional y facilitar la comunicación académica y administrativa, ¿Cuál es su apreciación frente a la efectividad de los medios de comunicación e información en su labor académica?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('94', '8.34.6.a', 'De los siguientes mecanismos de comunicación interna y externa, existentes en la Escuela Naval de Cadetes “Almirante Padilla”, evalúe la accesibilidad a cada uno', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('95', '8.34.7.a', 'Considera usted que la calidad del acceso a  los sistemas de comunicación  e información mediados por las  Tecnologías de Información y comunicación (TIC)  disponibles por la Escuela Naval son adecuados para el cumplimiento de su función?', '1to5', '210', '1', null);
INSERT INTO `pregunta` VALUES ('96', '8.34.9.a', 'De todos los mecanismos de comunicación existentes para difundir información sobre la Escuela Naval de Cadetes “Almirante Padilla” y las diferentes actividades que se llevan a cabo, considera usted que son accesibles a  la población estudiantil en toda su diversidad ?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('97', '8.35.1.a', 'Según su apreciación sobre los directivos del programa, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('98', '8.35.2.a', 'Conoce los lineamientos y políticas que orientan la gestión del programa?', 'smur', '214', '1', null);
INSERT INTO `pregunta` VALUES ('99', '8.35.2.b', 'De acuerdo con su experiencia en relación con los lineamientos y políticas  de gestión del programa, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('100', '9.36.3.a', '¿Cuál es su apreciación sobre la calidad de la formación de los egresados del programa de _PROGRAMA_?', '1to5', '219', '1', null);
INSERT INTO `pregunta` VALUES ('101', '9.36.3.b', '¿Cuál es su apreciación sobre el desempeño de los egresados del programa de _PROGRAMA_?', '1to5', '219', '1', null);
INSERT INTO `pregunta` VALUES ('102', '9.36.3.c', 'Según su apreciación evalúe la  calidad de la formación recibida por parte del programa?', '1to5', '219', '1', null);
INSERT INTO `pregunta` VALUES ('103', '9.36.4.a', 'Según su apreciación como egresado, evalúe si el programa emplea  mecanismos que favorezcan su proyecto de vida?', '1to5', '220', '1', null);
INSERT INTO `pregunta` VALUES ('104', '9.37.2.a', 'Como egresado del programa seleccione a cuál o cuáles de las siguientes comunidades o asociaciones forma parte?', 'simatriz', null, '1', null);
INSERT INTO `pregunta` VALUES ('105', '9.37.3.a', 'Ha recibido alguna de las siguientes distinciones y reconocimientos significativos por su desempeño en la disciplina, profesión, ocupación u oficio como egresado del programa?', 'multiple', '227', '1', null);
INSERT INTO `pregunta` VALUES ('106', '9.37.4.a', 'Según su apreciación evalúe los siguientes aspectos referidos a los egresados del programa de _PROGRAMA_.', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('107', '10.38.4.a', 'Según su apreciación sobre las características de la planta física de la Escuela Naval de Cadetes “Almirante Padilla”, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('108', '10.39.6.a', 'Según su apreciación sobre los recursos presupuestales disponibles para el programa, evalúe los siguientes aspectos:', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('109', '10.40.4.a', 'Según su apreciación, considera equitativa la asignación de recursos físicos y financieros para el funcionamiento programa?', 'matriz15', null, '1', null);
INSERT INTO `pregunta` VALUES ('110', '-', 'Objetivos del programa', 'matriz15', '8', '1', '15');
INSERT INTO `pregunta` VALUES ('111', '-', 'Lineamientos básicos del currículo', 'matriz15', '8', '1', '15');
INSERT INTO `pregunta` VALUES ('112', '-', 'Perfil de los estudiantes', 'matriz15', '8', '1', '15');
INSERT INTO `pregunta` VALUES ('113', '-', 'Políticas y estrategias empleadas para el desarrollo de las funciones sustantivas', 'matriz15', '8', '1', '15');
INSERT INTO `pregunta` VALUES ('114', '-', 'Formación naval-militar', 'matriz15', '28', '1', '18');
INSERT INTO `pregunta` VALUES ('115', '-', 'Formación integral humanística', 'matriz15', '28', '1', '18');
INSERT INTO `pregunta` VALUES ('116', '-', 'Cultura física (deportiva)', 'matriz15', '28', '1', '18');
INSERT INTO `pregunta` VALUES ('117', '-', 'Artística (coro ENAP,  grupo de teatro por compañía,  banda de música)', 'matriz15', '28', '1', '18');
INSERT INTO `pregunta` VALUES ('118', '-', 'Cultura Investigativa (feria de la ciencia y tecnología, semilleros de investigación)', 'matriz15', '28', '1', '18');
INSERT INTO `pregunta` VALUES ('119', '-', 'Culturales (conferencia, cine, exposiciones artísticas, eventos culturales de la región)', 'matriz15', '28', '1', '18');
INSERT INTO `pregunta` VALUES ('120', '-', 'Formación naval-militar', 'matriz15', '29', '1', '19');
INSERT INTO `pregunta` VALUES ('121', '-', 'Formación integral humanística', 'matriz15', '29', '1', '19');
INSERT INTO `pregunta` VALUES ('122', '-', 'Cultura física (deportiva)', 'matriz15', '29', '1', '19');
INSERT INTO `pregunta` VALUES ('123', '-', 'Artística (coro ENAP,  grupo de teatro por compañía,  banda de música)', 'matriz15', '29', '1', '19');
INSERT INTO `pregunta` VALUES ('124', '-', 'Cultura Investigativa (feria de la ciencia y tecnología, semilleros de investigación)', 'matriz15', '29', '1', '19');
INSERT INTO `pregunta` VALUES ('125', '-', 'Culturales (conferencia, cine, exposiciones artísticas, eventos culturales de la región)', 'matriz15', '29', '1', '19');
INSERT INTO `pregunta` VALUES ('126', '-', 'Pertinencia', 'matriz15', '31', '1', '21');
INSERT INTO `pregunta` VALUES ('127', '-', 'Vigencia', 'matriz15', '31', '1', '21');
INSERT INTO `pregunta` VALUES ('128', '-', 'Aplicación', 'matriz15', '31', '1', '21');
INSERT INTO `pregunta` VALUES ('129', '-', 'Pertinencia', 'matriz15', '37', '1', '25');
INSERT INTO `pregunta` VALUES ('130', '-', 'Vigencia', 'matriz15', '37', '1', '25');
INSERT INTO `pregunta` VALUES ('131', '-', 'Aplicabilidad', 'matriz15', '37', '1', '25');
INSERT INTO `pregunta` VALUES ('132', '-', 'Pertinencia', 'matriz15', '39', '1', '27');
INSERT INTO `pregunta` VALUES ('133', '-', 'Vigencia', 'matriz15', '39', '1', '27');
INSERT INTO `pregunta` VALUES ('134', '-', 'Aplicación', 'matriz15', '39', '1', '27');
INSERT INTO `pregunta` VALUES ('135', '-', 'Consejo Académico ', 'matriz15', '42', '1', '28');
INSERT INTO `pregunta` VALUES ('136', '-', 'Comité Decanos', 'matriz15', '42', '1', '28');
INSERT INTO `pregunta` VALUES ('137', '-', 'Comité Curricular Superior', 'matriz15', '42', '1', '28');
INSERT INTO `pregunta` VALUES ('138', '-', 'Comité Curricular de Facultad', 'matriz15', '42', '1', '28');
INSERT INTO `pregunta` VALUES ('139', '-', 'Docencia', 'matriz15', '50', '1', '29');
INSERT INTO `pregunta` VALUES ('140', '-', 'Investigación', 'matriz15', '50', '1', '29');
INSERT INTO `pregunta` VALUES ('141', '-', 'Extensión o Proyección Social', 'matriz15', '50', '1', '29');
INSERT INTO `pregunta` VALUES ('142', '-', 'Creación artística y cultural', 'matriz15', '50', '1', '29');
INSERT INTO `pregunta` VALUES ('143', '-', 'Número de profesores con relación al número estudiantes', 'matriz15', '50', '1', '29');
INSERT INTO `pregunta` VALUES ('144', '-', 'Congresos', 'vecesmatriz', '53', '1', '32');
INSERT INTO `pregunta` VALUES ('145', '-', 'Diplomados', 'vecesmatriz', '53', '1', '32');
INSERT INTO `pregunta` VALUES ('146', '-', 'Seminarios/talleres', 'vecesmatriz', '53', '1', '32');
INSERT INTO `pregunta` VALUES ('147', '-', 'Especializaciones', 'vecesmatriz', '53', '1', '32');
INSERT INTO `pregunta` VALUES ('148', '-', 'Maestrías', 'vecesmatriz', '53', '1', '32');
INSERT INTO `pregunta` VALUES ('149', '-', 'Doctorados', 'vecesmatriz', '53', '1', '32');
INSERT INTO `pregunta` VALUES ('150', '-', 'Congresos', '6matriz', '53', '1', '33');
INSERT INTO `pregunta` VALUES ('151', '-', 'Diplomados', '6matriz', '53', '1', '33');
INSERT INTO `pregunta` VALUES ('152', '-', 'Seminarios/talleres', '6matriz', '53', '1', '33');
INSERT INTO `pregunta` VALUES ('153', '-', 'Especializaciones', '6matriz', '53', '1', '33');
INSERT INTO `pregunta` VALUES ('154', '-', 'Maestrías', '6matriz', '53', '1', '33');
INSERT INTO `pregunta` VALUES ('155', '-', 'Doctorados', '6matriz', '53', '1', '33');
INSERT INTO `pregunta` VALUES ('156', '-', 'Sistemas de Evaluación', 'matriz15', '54', '1', '34');
INSERT INTO `pregunta` VALUES ('157', '-', 'Actualización del Micro Curriculum', 'matriz15', '54', '1', '34');
INSERT INTO `pregunta` VALUES ('158', '-', 'Fortalecimiento de la Investigación', 'matriz15', '54', '1', '34');
INSERT INTO `pregunta` VALUES ('159', '-', 'Permanencia y deserción estudiantil', 'matriz15', '54', '1', '34');
INSERT INTO `pregunta` VALUES ('160', '-', 'Estrategias pedagógicas', 'matriz15', '54', '1', '34');
INSERT INTO `pregunta` VALUES ('161', '-', 'Fortalecimiento del proyecto educativo del programa (PEP)', 'matriz15', '54', '1', '34');
INSERT INTO `pregunta` VALUES ('162', '-', 'Publicaciones y ponencias presentadas', 'matriz15', '54', '1', '34');
INSERT INTO `pregunta` VALUES ('163', '-', 'Fomento de la creatividad en los estudiantes', 'matriz15', '54', '1', '34');
INSERT INTO `pregunta` VALUES ('164', '-', 'La  docencia', 'simatriz', '58', '1', '37');
INSERT INTO `pregunta` VALUES ('165', '-', 'La investigación e innovación  ', 'simatriz', '59', '1', '37');
INSERT INTO `pregunta` VALUES ('166', '-', 'La creación artística', 'simatriz', '58', '1', '37');
INSERT INTO `pregunta` VALUES ('167', '-', 'La técnica y tecnología', 'simatriz', '59', '1', '37');
INSERT INTO `pregunta` VALUES ('168', '-', 'La extensión o proyección social', 'simatriz', '58', '1', '37');
INSERT INTO `pregunta` VALUES ('169', '-', 'La cooperación internacional', 'simatriz', '59', '1', '37');
INSERT INTO `pregunta` VALUES ('170', '-', 'La  docencia', 'simatriz', '60', '1', '38');
INSERT INTO `pregunta` VALUES ('171', '-', 'La investigación e innovación  ', 'simatriz', '60', '1', '38');
INSERT INTO `pregunta` VALUES ('172', '-', 'La creación artística', 'simatriz', '60', '1', '38');
INSERT INTO `pregunta` VALUES ('173', '-', 'La técnica y tecnología', 'simatriz', '60', '1', '38');
INSERT INTO `pregunta` VALUES ('174', '-', 'La extensión o proyección social', 'simatriz', '60', '1', '38');
INSERT INTO `pregunta` VALUES ('175', '-', 'La cooperación internacional', 'simatriz', '60', '1', '38');
INSERT INTO `pregunta` VALUES ('176', '-', 'Sistemas de Evaluación', 'matriz15', '61', '1', '39');
INSERT INTO `pregunta` VALUES ('177', '-', 'Actualización del Micro Curriculum', 'matriz15', '61', '1', '39');
INSERT INTO `pregunta` VALUES ('178', '-', 'Permanencia y deserción estudiantil', 'matriz15', '61', '1', '39');
INSERT INTO `pregunta` VALUES ('179', '-', 'Estrategias pedagógicas', 'matriz15', '61', '1', '39');
INSERT INTO `pregunta` VALUES ('180', '-', 'Fortalecimiento del proyecto educativo del programa (PEP)', 'matriz15', '61', '1', '39');
INSERT INTO `pregunta` VALUES ('181', '-', 'Fortalecimiento de la Investigación', 'matriz15', '61', '1', '40');
INSERT INTO `pregunta` VALUES ('182', '-', 'Publicaciones', 'matriz15', '61', '1', '40');
INSERT INTO `pregunta` VALUES ('183', '-', 'Visibilidad  (Participación En Eventos Nacionales E Internacionales)', 'matriz15', '61', '1', '40');
INSERT INTO `pregunta` VALUES ('184', '-', 'Fomento de la creatividad en los estudiantes', 'matriz15', '61', '1', '40');
INSERT INTO `pregunta` VALUES ('185', '-', 'Interacción con la comunidad', 'matriz15', '61', '1', '41');
INSERT INTO `pregunta` VALUES ('186', '-', 'Reconocimiento institucional ', 'matriz15', '61', '1', '41');
INSERT INTO `pregunta` VALUES ('187', '-', 'Cooperación académica ', 'matriz15', '61', '1', '41');
INSERT INTO `pregunta` VALUES ('188', '-', 'Fortalecimiento de la investigación ', 'matriz15', '61', '1', '41');
INSERT INTO `pregunta` VALUES ('189', '-', 'Interacción con la comunidad', 'matriz15', '61', '1', '42');
INSERT INTO `pregunta` VALUES ('190', '-', 'Reconocimiento institucional ', 'matriz15', '61', '1', '42');
INSERT INTO `pregunta` VALUES ('191', '-', 'Cooperación académica ', 'matriz15', '61', '1', '42');
INSERT INTO `pregunta` VALUES ('192', '-', 'Fortalecimiento de la investigación ', 'matriz15', '61', '1', '42');
INSERT INTO `pregunta` VALUES ('193', '-', 'Movilidad estudiantil', 'matriz15', '61', '1', '42');
INSERT INTO `pregunta` VALUES ('194', '-', 'Movilidad docente', 'matriz15', '61', '1', '42');
INSERT INTO `pregunta` VALUES ('195', '-', 'Material Impreso (Visual)', 'matriz15', '62', '1', '43');
INSERT INTO `pregunta` VALUES ('196', '-', 'Material hipertextual e hipermedial (Computarizado)', 'matriz15', '62', '1', '43');
INSERT INTO `pregunta` VALUES ('197', '-', 'Material televisivo-video (Audiovisual)', 'matriz15', '62', '1', '43');
INSERT INTO `pregunta` VALUES ('198', '-', 'Material de Audio (Auditivo)', 'matriz15', '62', '1', '43');
INSERT INTO `pregunta` VALUES ('199', '-', 'Material Impreso (Visual)', 'matriz15', '62', '1', '44');
INSERT INTO `pregunta` VALUES ('200', '-', 'Material hipertextual e hipermedial (Computarizado)', 'matriz15', '62', '1', '44');
INSERT INTO `pregunta` VALUES ('201', '-', 'Material televisivo-video (Audiovisual)', 'matriz15', '62', '1', '44');
INSERT INTO `pregunta` VALUES ('202', '-', 'Material de Audio (Auditivo)', 'matriz15', '62', '1', '44');
INSERT INTO `pregunta` VALUES ('203', '-', 'Material Impreso (Visual)', 'matriz15', '62', '1', '45');
INSERT INTO `pregunta` VALUES ('204', '-', 'Material hipertextual e hipermedial (Computarizado)', 'matriz15', '62', '1', '45');
INSERT INTO `pregunta` VALUES ('205', '-', 'Material televisivo-video (Audiovisual)', 'matriz15', '62', '1', '45');
INSERT INTO `pregunta` VALUES ('206', '-', 'Material de Audio (Auditivo)', 'matriz15', '62', '1', '45');
INSERT INTO `pregunta` VALUES ('207', '-', 'Material Impreso (Visual)', 'matriz15', '64', '1', '48');
INSERT INTO `pregunta` VALUES ('208', '-', 'Material hipertextual e hipermedial (Computarizado)', 'matriz15', '64', '1', '48');
INSERT INTO `pregunta` VALUES ('209', '-', 'Material televisivo-video (Audiovisual)', 'matriz15', '64', '1', '48');
INSERT INTO `pregunta` VALUES ('210', '-', 'Material de Audio (Auditivo)', 'matriz15', '64', '1', '48');
INSERT INTO `pregunta` VALUES ('211', '-', 'Transparencia', 'matriz15', '74', '1', '55');
INSERT INTO `pregunta` VALUES ('212', '-', 'Equidad', 'matriz15', '74', '1', '55');
INSERT INTO `pregunta` VALUES ('213', '-', 'Eficacia', 'matriz15', '74', '1', '55');
INSERT INTO `pregunta` VALUES ('214', '-', 'Calidad del currículo', 'matriz15', '78', '1', '56');
INSERT INTO `pregunta` VALUES ('215', '-', 'Integralidad del currículo', 'matriz15', '78', '1', '56');
INSERT INTO `pregunta` VALUES ('216', '-', 'Objetivos', 'matriz15', '78', '1', '57');
INSERT INTO `pregunta` VALUES ('217', '-', 'Contenidos', 'matriz15', '78', '1', '57');
INSERT INTO `pregunta` VALUES ('218', '-', 'Técnicas de evaluación', 'matriz15', '78', '1', '57');
INSERT INTO `pregunta` VALUES ('219', '-', 'Criterios metodológicos', 'matriz15', '78', '1', '57');
INSERT INTO `pregunta` VALUES ('220', '-', 'Planes de estudio', 'matriz15', '78', '1', '57');
INSERT INTO `pregunta` VALUES ('221', '-', 'Flexibilidad del currículo', 'matriz15', '89', '1', '58');
INSERT INTO `pregunta` VALUES ('222', '-', 'Actualización del currículo', 'matriz15', '89', '1', '58');
INSERT INTO `pregunta` VALUES ('223', '-', 'Pertinencia del currículo', 'matriz15', '89', '1', '58');
INSERT INTO `pregunta` VALUES ('224', '-', 'Eficacia de las políticas', 'matriz15', '89', '1', '59');
INSERT INTO `pregunta` VALUES ('225', '-', 'Permanencia de los estudiantes', 'matriz15', '89', '1', '59');
INSERT INTO `pregunta` VALUES ('226', '-', 'Pertinencia', 'matriz15', '97', '1', '61');
INSERT INTO `pregunta` VALUES ('227', '-', 'Eficacia', 'matriz15', '97', '1', '61');
INSERT INTO `pregunta` VALUES ('228', '-', 'Mecanismo Seguimiento  ', 'matriz15', '111', '1', '64');
INSERT INTO `pregunta` VALUES ('229', '-', 'Mecanismo de acompañamiento especial', 'matriz15', '111', '1', '64');
INSERT INTO `pregunta` VALUES ('230', '-', 'Adecuaciones locativas', 'matriz15', '111', '1', '64');
INSERT INTO `pregunta` VALUES ('231', '-', 'Evaluación académica de los estudiantes', 'matriz15', '112', '1', '65');
INSERT INTO `pregunta` VALUES ('232', '-', 'Estrategias de divulgación del sistema de evaluación', 'matriz15', '112', '1', '65');
INSERT INTO `pregunta` VALUES ('233', '-', 'Naturaleza del programa', 'matriz15', '114', '1', '66');
INSERT INTO `pregunta` VALUES ('234', '-', 'Métodos pedagógicos (taller, exposición, foro, quiz, conversatorio, exámenes)', 'matriz15', '114', '1', '66');
INSERT INTO `pregunta` VALUES ('235', '-', 'Las actitudes', 'matriz15', '115', '1', '67');
INSERT INTO `pregunta` VALUES ('236', '-', 'Los conocimientos', 'matriz15', '115', '1', '67');
INSERT INTO `pregunta` VALUES ('237', '-', 'Las capacidades', 'matriz15', '115', '1', '67');
INSERT INTO `pregunta` VALUES ('238', '-', 'Las habilidades propias del programa', 'matriz15', '115', '1', '67');
INSERT INTO `pregunta` VALUES ('239', '-', 'Pertinencia', 'matriz15', '137', '1', '74');
INSERT INTO `pregunta` VALUES ('240', '-', 'Actualización', 'matriz15', '137', '1', '74');
INSERT INTO `pregunta` VALUES ('241', '-', 'Suficiencia', 'matriz15', '137', '1', '74');
INSERT INTO `pregunta` VALUES ('242', '-', 'Pertinencia', 'matriz15', '145', '1', '75');
INSERT INTO `pregunta` VALUES ('243', '-', 'Correspondencia con la Naturaleza del Programa', 'matriz15', '145', '1', '75');
INSERT INTO `pregunta` VALUES ('244', '-', 'Suficiencia', 'matriz15', '145', '1', '75');
INSERT INTO `pregunta` VALUES ('245', '-', 'Actualización ', 'matriz15', '145', '1', '75');
INSERT INTO `pregunta` VALUES ('246', '-', 'Eficiencia ', 'matriz15', '145', '1', '75');
INSERT INTO `pregunta` VALUES ('247', '-', 'Talleres (COTECMAR, CIOH, DARET)', 'matriz15', '150', '1', '76');
INSERT INTO `pregunta` VALUES ('248', '-', 'Laboratorios', 'matriz15', '150', '1', '76');
INSERT INTO `pregunta` VALUES ('249', '-', 'Tecnologías de información (Intranet, Internet, Wi Fi)', 'matriz15', '150', '1', '76');
INSERT INTO `pregunta` VALUES ('250', '-', 'Medios audiovisuales', 'matriz15', '150', '1', '76');
INSERT INTO `pregunta` VALUES ('251', '-', 'Campo Practicas a bordo del ARC Gloria', 'matriz15', '150', '1', '76');
INSERT INTO `pregunta` VALUES ('252', '-', 'Campo Practicas a bordo de Unidades a Flote', 'matriz15', '150', '1', '76');
INSERT INTO `pregunta` VALUES ('253', '-', 'Talleres (COTECMAR, CIOH, DARET)', 'matriz15', '150', '1', '77');
INSERT INTO `pregunta` VALUES ('254', '-', 'Laboratorios (Infraestructura)', 'matriz15', '150', '1', '77');
INSERT INTO `pregunta` VALUES ('255', '-', 'Laboratorios (Instrumentación) ', 'matriz15', '150', '1', '77');
INSERT INTO `pregunta` VALUES ('256', '-', 'Bases de Datos ', 'matriz15', '150', '1', '77');
INSERT INTO `pregunta` VALUES ('257', '-', 'Medios audiovisuales', 'matriz15', '150', '1', '77');
INSERT INTO `pregunta` VALUES ('258', '-', 'Campo Practicas a bordo del ARC Gloria', 'matriz15', '150', '1', '77');
INSERT INTO `pregunta` VALUES ('259', '-', 'Campo Practicas a bordo de Unidades a Flote', 'matriz15', '150', '1', '77');
INSERT INTO `pregunta` VALUES ('260', '-', 'Talleres (COTECMAR, CIOH, DARET)', 'matriz15', '150', '1', '78');
INSERT INTO `pregunta` VALUES ('261', '-', 'Laboratorios', 'matriz15', '150', '1', '78');
INSERT INTO `pregunta` VALUES ('262', '-', 'Tecnologías de información (Intranet, Internet, Wi Fi)', 'matriz15', '150', '1', '78');
INSERT INTO `pregunta` VALUES ('263', '-', 'Medios audiovisuales', 'matriz15', '150', '1', '78');
INSERT INTO `pregunta` VALUES ('264', '-', 'Campo Practicas a bordo del ARC Gloria', 'matriz15', '150', '1', '78');
INSERT INTO `pregunta` VALUES ('265', '-', 'Campo Practicas a bordo de Unidades a Flote', 'matriz15', '150', '1', '78');
INSERT INTO `pregunta` VALUES ('266', '-', 'Eficiencia', 'matriz15', '203', '1', '92');
INSERT INTO `pregunta` VALUES ('267', '-', 'Eficacia', 'matriz15', '203', '1', '92');
INSERT INTO `pregunta` VALUES ('268', '-', 'Enfoque', 'matriz15', '203', '1', '92');
INSERT INTO `pregunta` VALUES ('269', '-', 'Intranet', 'matriz15', '205', '1', '93');
INSERT INTO `pregunta` VALUES ('270', '-', 'Página Web', 'matriz15', '205', '1', '93');
INSERT INTO `pregunta` VALUES ('271', '-', 'Sistema de manejo  académico (SMA)', 'matriz15', '205', '1', '93');
INSERT INTO `pregunta` VALUES ('272', '-', 'Cartelera digital', 'matriz15', '205', '1', '93');
INSERT INTO `pregunta` VALUES ('273', '-', 'Correo electrónico Institucional', 'matriz15', '205', '1', '93');
INSERT INTO `pregunta` VALUES ('274', '-', 'Correo electrónico personal', 'matriz15', '205', '1', '93');
INSERT INTO `pregunta` VALUES ('275', '-', 'Intranet', 'matriz15', '209', '1', '94');
INSERT INTO `pregunta` VALUES ('276', '-', 'Página Web', 'matriz15', '209', '1', '94');
INSERT INTO `pregunta` VALUES ('277', '-', 'Sistema de manejo  académico (SMA)', 'matriz15', '209', '1', '94');
INSERT INTO `pregunta` VALUES ('278', '-', 'Cartelera digital', 'matriz15', '209', '1', '94');
INSERT INTO `pregunta` VALUES ('279', '-', 'Correo electrónico Institucional', 'matriz15', '209', '1', '94');
INSERT INTO `pregunta` VALUES ('280', '-', 'Correo electrónico personal ', 'matriz15', '209', '1', '94');
INSERT INTO `pregunta` VALUES ('281', '-', 'Intranet', 'matriz15', '212', '1', '96');
INSERT INTO `pregunta` VALUES ('282', '-', 'Página Web', 'matriz15', '212', '1', '96');
INSERT INTO `pregunta` VALUES ('283', '-', 'Internet', 'matriz15', '212', '1', '96');
INSERT INTO `pregunta` VALUES ('284', '-', 'Sistema de manejo  académico (SMA)', 'matriz15', '212', '1', '96');
INSERT INTO `pregunta` VALUES ('285', '-', 'Cartelera digital', 'matriz15', '212', '1', '96');
INSERT INTO `pregunta` VALUES ('286', '-', 'Correo electrónico Institucional', 'matriz15', '212', '1', '96');
INSERT INTO `pregunta` VALUES ('287', '-', 'Correo electrónico personal ', 'matriz15', '212', '1', '96');
INSERT INTO `pregunta` VALUES ('288', '-', 'Orientación académica que imparten  ', 'matriz15', '213', '1', '97');
INSERT INTO `pregunta` VALUES ('289', '-', 'Sobre el liderazgo que ejercen', 'matriz15', '213', '1', '97');
INSERT INTO `pregunta` VALUES ('290', '-', 'Coherencia con la Misión Institucional', 'matriz15', '214', '1', '99');
INSERT INTO `pregunta` VALUES ('291', '-', 'Viabilidad  ', 'matriz15', '214', '1', '99');
INSERT INTO `pregunta` VALUES ('292', '-', 'Aplicación', 'matriz15', '214', '1', '99');
INSERT INTO `pregunta` VALUES ('293', '-', 'Comunidades académicas reconocidas', 'matriz15', '226', '1', '104');
INSERT INTO `pregunta` VALUES ('294', '-', 'Asociaciones científicas del ámbito nacional', 'matriz15', '226', '1', '104');
INSERT INTO `pregunta` VALUES ('295', '-', 'Asociaciones científicas del ámbito internacional', 'matriz15', '226', '1', '104');
INSERT INTO `pregunta` VALUES ('296', '-', 'Asociaciones profesionales del ámbito nacional', 'matriz15', '226', '1', '104');
INSERT INTO `pregunta` VALUES ('297', '-', 'Asociaciones profesionales del ámbito internacional', 'matriz15', '226', '1', '104');
INSERT INTO `pregunta` VALUES ('298', '-', 'Asociaciones del sector productivo y financiero del ámbito nacional', 'matriz15', '226', '1', '104');
INSERT INTO `pregunta` VALUES ('299', '-', 'Asociaciones del sector productivo y financiero del ámbito internacional', 'matriz15', '226', '1', '104');
INSERT INTO `pregunta` VALUES ('300', '-', 'La calidad de la formación', 'matriz15', '228', '1', '106');
INSERT INTO `pregunta` VALUES ('301', '-', 'El desempeño', 'matriz15', '228', '1', '106');
INSERT INTO `pregunta` VALUES ('302', '-', 'Accesibilidad', 'matriz15', '232', '1', '107');
INSERT INTO `pregunta` VALUES ('303', '-', 'Diseño', 'matriz15', '232', '1', '107');
INSERT INTO `pregunta` VALUES ('304', '-', 'Capacidad', 'matriz15', '232', '1', '107');
INSERT INTO `pregunta` VALUES ('305', '-', 'Iluminación', 'matriz15', '232', '1', '107');
INSERT INTO `pregunta` VALUES ('306', '-', 'Ventilación', 'matriz15', '232', '1', '107');
INSERT INTO `pregunta` VALUES ('307', '-', 'Condiciones de seguridad e higiene', 'matriz15', '232', '1', '107');
INSERT INTO `pregunta` VALUES ('308', '-', 'La suficiencia de los recursos para el cumplimiento de actividades propias del programa', 'matriz15', '239', '1', '108');
INSERT INTO `pregunta` VALUES ('309', '-', 'Ejecución presupuestal de los recursos asignados', 'matriz15', '239', '1', '108');
INSERT INTO `pregunta` VALUES ('310', '-', 'Recursos Físicos', 'matriz15', '245', '1', '109');
INSERT INTO `pregunta` VALUES ('311', '-', 'Recursos financieros', 'matriz15', '245', '1', '109');

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
INSERT INTO `proceso` VALUES ('1', 'En Configuración', '--', 'Proceso de EJEMPLO', '720', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programa
-- ----------------------------
INSERT INTO `programa` VALUES ('720', 'OCEANOGRAFÍA FÍSICA', 'OCEANOGRAFÍA FÍSICA', 'Presencial', 'Universitaria', '2');
INSERT INTO `programa` VALUES ('721', 'INGENIERÍA NAVAL', 'INGENIERÍA NAVAL', 'Presencial', 'Universitaria', '5');
INSERT INTO `programa` VALUES ('722', 'ADMINISTRACIÓN MARITIMA', 'ADMINISTRACION MARITIMA', 'Presencial', 'Universitaria', '1');
INSERT INTO `programa` VALUES ('723', 'CIENCIAS NAUTICAS PARA OFICIALES MERCANTES', 'CIENCIAS NAUTICAS PARA OFICIALES MERCANTES', 'Presencial', 'Universitaria', '3');

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
INSERT INTO `representante` VALUES ('123456', 'Escuela', 'Naval', '123456', 'Comite central', 'correo@naval.edu.co');

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of respuesta
-- ----------------------------
INSERT INTO `respuesta` VALUES ('1', 'PREGRADO', '4');
INSERT INTO `respuesta` VALUES ('2', 'ESPECIALIZACIÓN', '4');
INSERT INTO `respuesta` VALUES ('3', 'MAESTRÍA', '4');
INSERT INTO `respuesta` VALUES ('4', 'DOCTORADO', '4');
INSERT INTO `respuesta` VALUES ('5', 'SI', '5');
INSERT INTO `respuesta` VALUES ('6', 'NO', '5');
INSERT INTO `respuesta` VALUES ('7', 'SI', '6');
INSERT INTO `respuesta` VALUES ('8', 'NO', '6');
INSERT INTO `respuesta` VALUES ('9', 'NOMINA ', '9');
INSERT INTO `respuesta` VALUES ('10', 'CONTRATO', '9');
INSERT INTO `respuesta` VALUES ('11', 'CIVIL', '10');
INSERT INTO `respuesta` VALUES ('12', 'MILITAR', '10');
INSERT INTO `respuesta` VALUES ('13', 'SI', '12');
INSERT INTO `respuesta` VALUES ('14', 'NO', '12');
INSERT INTO `respuesta` VALUES ('15', 'SI', '14');
INSERT INTO `respuesta` VALUES ('16', 'NO', '14');
INSERT INTO `respuesta` VALUES ('17', 'SI', '16');
INSERT INTO `respuesta` VALUES ('18', 'NO', '16');
INSERT INTO `respuesta` VALUES ('19', 'SI', '20');
INSERT INTO `respuesta` VALUES ('20', 'NO', '20');
INSERT INTO `respuesta` VALUES ('21', 'SI', '24');
INSERT INTO `respuesta` VALUES ('22', 'NO', '24');
INSERT INTO `respuesta` VALUES ('23', 'SI', '26');
INSERT INTO `respuesta` VALUES ('24', 'NO', '26');
INSERT INTO `respuesta` VALUES ('25', 'SI', '31');
INSERT INTO `respuesta` VALUES ('26', 'NO', '31');
INSERT INTO `respuesta` VALUES ('27', 'SI', '35');
INSERT INTO `respuesta` VALUES ('28', 'NO', '35');
INSERT INTO `respuesta` VALUES ('29', 'Tradiciones marineras', '36');
INSERT INTO `respuesta` VALUES ('30', 'Semana deportiva', '36');
INSERT INTO `respuesta` VALUES ('31', 'Ninguna', '36');
INSERT INTO `respuesta` VALUES ('32', 'Otra', '36');
INSERT INTO `respuesta` VALUES ('33', 'SI', '49');
INSERT INTO `respuesta` VALUES ('34', 'NO', '49');
INSERT INTO `respuesta` VALUES ('35', 'SI', '50');
INSERT INTO `respuesta` VALUES ('36', 'NO', '50');
INSERT INTO `respuesta` VALUES ('37', 'SI', '52');
INSERT INTO `respuesta` VALUES ('38', 'NO', '52');
INSERT INTO `respuesta` VALUES ('39', 'SI', '54');
INSERT INTO `respuesta` VALUES ('40', 'NO', '54');
INSERT INTO `respuesta` VALUES ('41', 'SI', '69');
INSERT INTO `respuesta` VALUES ('42', 'NO', '69');
INSERT INTO `respuesta` VALUES ('43', 'SI', '72');
INSERT INTO `respuesta` VALUES ('44', 'NO', '72');
INSERT INTO `respuesta` VALUES ('45', 'SI', '79');
INSERT INTO `respuesta` VALUES ('46', 'NO', '79');
INSERT INTO `respuesta` VALUES ('47', 'SI', '81');
INSERT INTO `respuesta` VALUES ('48', 'NO', '81');
INSERT INTO `respuesta` VALUES ('49', 'Publicaciones en Coautoría', '82');
INSERT INTO `respuesta` VALUES ('50', 'Cofinanciación de Proyectos', '82');
INSERT INTO `respuesta` VALUES ('51', 'Registros y Patentes', '82');
INSERT INTO `respuesta` VALUES ('52', 'Otro', '82');
INSERT INTO `respuesta` VALUES ('53', 'Curso Corto', '83');
INSERT INTO `respuesta` VALUES ('54', 'Profesor Visitante/Conferencia', '83');
INSERT INTO `respuesta` VALUES ('55', 'Estancia de investigación', '83');
INSERT INTO `respuesta` VALUES ('56', 'Estudios de Posgrado ', '83');
INSERT INTO `respuesta` VALUES ('57', 'Profesor en Programas de Pregrado/Posgrado', '83');
INSERT INTO `respuesta` VALUES ('58', 'Foro', '83');
INSERT INTO `respuesta` VALUES ('59', 'Simposio', '83');
INSERT INTO `respuesta` VALUES ('60', 'Congreso', '83');
INSERT INTO `respuesta` VALUES ('61', 'Seminario', '83');
INSERT INTO `respuesta` VALUES ('62', 'Educación Continua', '83');
INSERT INTO `respuesta` VALUES ('63', 'Par académico', '83');
INSERT INTO `respuesta` VALUES ('64', 'SI', '84');
INSERT INTO `respuesta` VALUES ('65', 'NO', '84');
INSERT INTO `respuesta` VALUES ('66', 'SI', '86');
INSERT INTO `respuesta` VALUES ('67', 'NO', '86');
INSERT INTO `respuesta` VALUES ('68', 'SI', '98');
INSERT INTO `respuesta` VALUES ('69', 'NO', '98');
INSERT INTO `respuesta` VALUES ('70', 'La Padilla ', '105');
INSERT INTO `respuesta` VALUES ('71', 'La de la ENAP', '105');
INSERT INTO `respuesta` VALUES ('72', 'La Tono', '105');
INSERT INTO `respuesta` VALUES ('73', 'La del Valor', '105');
INSERT INTO `respuesta` VALUES ('74', 'La de Orden Publico ', '105');
INSERT INTO `respuesta` VALUES ('75', 'La de DIMAR', '105');
INSERT INTO `respuesta` VALUES ('76', 'Otra', '105');
INSERT INTO `respuesta` VALUES ('77', 'SI', '85');
INSERT INTO `respuesta` VALUES ('78', 'NO', '85');

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
