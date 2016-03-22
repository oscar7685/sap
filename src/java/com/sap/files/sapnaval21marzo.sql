/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : sapnaval

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2016-03-21 21:39:42
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

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
INSERT INTO `caracteristica` VALUES ('31', '1', 'Misión, Visión y Proyecto Institucional', '13', '2');
INSERT INTO `caracteristica` VALUES ('32', '2', 'Proyecto Educativo del Programa', '13', '2');
INSERT INTO `caracteristica` VALUES ('33', '3', 'C3', '13', '2');
INSERT INTO `caracteristica` VALUES ('34', '4', 'C4', '13', '2');
INSERT INTO `caracteristica` VALUES ('35', '5', 'Estudiantes admitidos y capacidad institucional', '14', '2');
INSERT INTO `caracteristica` VALUES ('36', '6', 'Participación en actividades de formación integral ', '14', '2');
INSERT INTO `caracteristica` VALUES ('37', '7', 'Reglamentos estudiantil y académico ', '14', '2');
INSERT INTO `caracteristica` VALUES ('38', '8', 'Selección, vinculación y permanencia de profesores', '15', '2');
INSERT INTO `caracteristica` VALUES ('39', '9', 'Estatuto profesoral', '15', '2');
INSERT INTO `caracteristica` VALUES ('40', '10', 'Número, dedicación, nivel de formación y experiencia de los profesores', '15', '2');
INSERT INTO `caracteristica` VALUES ('41', '11', 'Desarrollo profesoral', '15', '2');
INSERT INTO `caracteristica` VALUES ('42', '12', 'Estímulos a la docencia, investigación, creación artística y cultural, extensión o proyección social y a la cooperación internacional', '15', '2');
INSERT INTO `caracteristica` VALUES ('43', '13', 'Producción, pertinencia, utilización e impacto de material docente', '15', '2');
INSERT INTO `caracteristica` VALUES ('44', '14', 'Remuneración por méritos', '15', '2');
INSERT INTO `caracteristica` VALUES ('45', '15', 'Evaluación de profesores', '15', '2');
INSERT INTO `caracteristica` VALUES ('46', '16', 'Integralidad del currículo', '16', '2');
INSERT INTO `caracteristica` VALUES ('47', '17', 'Flexibilidad del currículo', '16', '2');
INSERT INTO `caracteristica` VALUES ('48', '18', 'Interdisciplinariedad', '16', '2');
INSERT INTO `caracteristica` VALUES ('49', '19', 'Estrategias de enseñanza y aprendizaje', '16', '2');
INSERT INTO `caracteristica` VALUES ('50', '20', 'Sistema de evaluación de estudiantes', '16', '2');
INSERT INTO `caracteristica` VALUES ('51', '21', 'Trabajos de los estudiantes', '16', '2');
INSERT INTO `caracteristica` VALUES ('52', '22', 'Evaluación y autorregulación del programa', '16', '2');
INSERT INTO `caracteristica` VALUES ('53', '23', 'Extensión o proyección social', '16', '2');
INSERT INTO `caracteristica` VALUES ('54', '24', 'Recursos bibliográficos', '16', '2');
INSERT INTO `caracteristica` VALUES ('55', '25', 'Recursos informáticos y de comunicación', '16', '2');
INSERT INTO `caracteristica` VALUES ('56', '26', 'Recursos de apoyo docente', '16', '2');
INSERT INTO `caracteristica` VALUES ('57', '27', 'C27', '16', '2');
INSERT INTO `caracteristica` VALUES ('58', '28', 'C28', '16', '2');
INSERT INTO `caracteristica` VALUES ('59', '29', 'C29', '16', '2');
INSERT INTO `caracteristica` VALUES ('60', '30', 'C30', '16', '2');
INSERT INTO `caracteristica` VALUES ('61', '31', 'Políticas, programas y servicios de bienestar universitario', '19', '2');
INSERT INTO `caracteristica` VALUES ('62', '32', 'C32', '19', '2');
INSERT INTO `caracteristica` VALUES ('63', '33', 'Organización, administración y gestión del programa', '20', '2');
INSERT INTO `caracteristica` VALUES ('64', '34', 'Sistemas de comunicación e información', '20', '2');
INSERT INTO `caracteristica` VALUES ('65', '35', 'Dirección del programa', '20', '2');
INSERT INTO `caracteristica` VALUES ('66', '36', 'Seguimiento de los egresados', '21', '2');
INSERT INTO `caracteristica` VALUES ('67', '37', 'C37', '21', '2');
INSERT INTO `caracteristica` VALUES ('68', '38', 'C38', '21', '2');
INSERT INTO `caracteristica` VALUES ('69', '39', 'Presupuesto del programa', '22', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

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
INSERT INTO `factor` VALUES ('13', '1', 'Misión, proyecto educativo y del programa', '2');
INSERT INTO `factor` VALUES ('14', '2', 'Estudiantes', '2');
INSERT INTO `factor` VALUES ('15', '3', 'Profesores', '2');
INSERT INTO `factor` VALUES ('16', '4', 'Procesos académicos', '2');
INSERT INTO `factor` VALUES ('17', '5', 'Factor 5.', '2');
INSERT INTO `factor` VALUES ('18', '6', 'Factor 6.', '2');
INSERT INTO `factor` VALUES ('19', '7', 'Bienestar institucional', '2');
INSERT INTO `factor` VALUES ('20', '8', 'Organización, administración y gestión', '2');
INSERT INTO `factor` VALUES ('21', '9', 'Impacto de los egresados en el medio', '2');
INSERT INTO `factor` VALUES ('22', '10', 'Recursos físicos y financieros', '2');

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
  `fechainicio` datetime DEFAULT NULL,
  `fechafinal` datetime DEFAULT NULL,
  PRIMARY KEY (`idparticipante`),
  KEY `fk_participante_proceso1_idx` (`proceso_id`),
  CONSTRAINT `fk_participante_proceso1` FOREIGN KEY (`proceso_id`) REFERENCES `proceso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participante
-- ----------------------------
INSERT INTO `participante` VALUES ('9', '1', null, null);
INSERT INTO `participante` VALUES ('10', '1', null, null);
INSERT INTO `participante` VALUES ('11', '1', null, null);
INSERT INTO `participante` VALUES ('13', '1', null, null);
INSERT INTO `participante` VALUES ('16', '1', null, null);
INSERT INTO `participante` VALUES ('18', '1', null, null);
INSERT INTO `participante` VALUES ('22', '1', '2016-02-26 17:20:58', '2016-02-26 17:25:20');
INSERT INTO `participante` VALUES ('23', '1', '2016-02-27 09:09:02', '2016-02-27 09:41:28');
INSERT INTO `participante` VALUES ('24', '1', '2016-02-27 11:35:37', '2016-02-27 11:48:00');
INSERT INTO `participante` VALUES ('25', '1', '2016-02-29 07:11:48', '2016-02-29 07:13:56');
INSERT INTO `participante` VALUES ('26', '1', '2016-02-29 08:05:45', null);
INSERT INTO `participante` VALUES ('27', '1', '2016-02-29 08:05:48', null);
INSERT INTO `participante` VALUES ('28', '1', '2016-02-29 08:12:26', null);
INSERT INTO `participante` VALUES ('29', '1', '2016-02-29 09:11:23', '2016-02-29 09:14:31');
INSERT INTO `participante` VALUES ('30', '1', '2016-02-29 10:39:52', null);
INSERT INTO `participante` VALUES ('31', '1', '2016-02-29 10:56:09', '2016-02-29 11:14:33');
INSERT INTO `participante` VALUES ('32', '1', '2016-02-29 11:07:30', null);
INSERT INTO `participante` VALUES ('33', '1', '2016-02-29 11:32:26', null);
INSERT INTO `participante` VALUES ('34', '1', '2016-02-29 11:32:29', null);
INSERT INTO `participante` VALUES ('35', '1', '2016-02-29 12:21:07', '2016-02-29 12:30:19');
INSERT INTO `participante` VALUES ('36', '1', '2016-02-29 15:16:29', '2016-02-29 15:34:08');
INSERT INTO `participante` VALUES ('37', '1', '2016-02-29 16:38:59', '2016-02-29 17:03:46');
INSERT INTO `participante` VALUES ('38', '1', '2016-02-29 18:23:54', '2016-02-29 18:32:17');
INSERT INTO `participante` VALUES ('39', '1', '2016-03-01 07:26:58', null);
INSERT INTO `participante` VALUES ('40', '1', '2016-03-01 07:26:59', null);
INSERT INTO `participante` VALUES ('41', '1', '2016-03-01 07:27:00', '2016-03-01 07:35:52');
INSERT INTO `participante` VALUES ('42', '1', '2016-03-01 07:37:14', null);
INSERT INTO `participante` VALUES ('43', '1', '2016-03-01 07:37:54', null);
INSERT INTO `participante` VALUES ('44', '1', '2016-03-01 07:37:56', '2016-03-01 07:52:26');
INSERT INTO `participante` VALUES ('45', '1', '2016-03-01 08:16:34', '2016-03-01 08:29:12');
INSERT INTO `participante` VALUES ('46', '1', '2016-03-01 09:48:21', '2016-03-01 09:57:02');
INSERT INTO `participante` VALUES ('47', '1', '2016-03-01 10:00:53', null);
INSERT INTO `participante` VALUES ('48', '1', '2016-03-01 10:00:55', '2016-03-01 10:10:13');
INSERT INTO `participante` VALUES ('49', '1', '2016-03-01 10:27:54', '2016-03-01 10:31:05');
INSERT INTO `participante` VALUES ('50', '1', '2016-03-01 10:38:46', '2016-03-01 11:14:00');
INSERT INTO `participante` VALUES ('51', '1', '2016-03-01 10:50:30', '2016-03-01 11:03:04');
INSERT INTO `participante` VALUES ('52', '1', '2016-03-01 11:06:58', null);
INSERT INTO `participante` VALUES ('53', '1', '2016-03-01 11:07:06', null);
INSERT INTO `participante` VALUES ('54', '1', '2016-03-01 14:14:40', '2016-03-01 14:39:05');
INSERT INTO `participante` VALUES ('55', '1', '2016-03-01 15:49:35', null);
INSERT INTO `participante` VALUES ('56', '1', '2016-03-01 15:50:16', '2016-03-01 16:09:28');
INSERT INTO `participante` VALUES ('57', '1', '2016-03-01 16:37:52', '2016-03-01 16:49:44');
INSERT INTO `participante` VALUES ('58', '1', '2016-03-01 16:42:21', '2016-03-01 17:00:33');
INSERT INTO `participante` VALUES ('59', '1', '2016-03-01 16:49:09', '2016-03-01 17:03:41');
INSERT INTO `participante` VALUES ('60', '1', '2016-03-01 16:49:09', '2016-03-01 17:23:18');
INSERT INTO `participante` VALUES ('61', '1', '2016-03-01 17:18:56', null);
INSERT INTO `participante` VALUES ('62', '1', '2016-03-01 17:26:49', null);
INSERT INTO `participante` VALUES ('63', '1', '2016-03-01 18:12:28', '2016-03-01 18:42:08');
INSERT INTO `participante` VALUES ('64', '1', '2016-03-01 18:43:58', '2016-03-01 19:03:02');
INSERT INTO `participante` VALUES ('65', '1', '2016-03-01 21:54:46', null);
INSERT INTO `participante` VALUES ('66', '1', '2016-03-01 22:24:48', '2016-03-01 22:58:07');
INSERT INTO `participante` VALUES ('67', '1', '2016-03-01 23:13:20', '2016-03-01 23:25:30');
INSERT INTO `participante` VALUES ('68', '1', '2016-03-02 07:07:26', null);
INSERT INTO `participante` VALUES ('69', '1', '2016-03-02 07:07:36', null);
INSERT INTO `participante` VALUES ('70', '1', '2016-03-02 07:07:37', '2016-03-02 07:21:44');
INSERT INTO `participante` VALUES ('71', '1', '2016-03-02 08:09:11', '2016-03-02 08:15:59');
INSERT INTO `participante` VALUES ('72', '1', '2016-03-02 08:10:31', '2016-03-02 08:43:33');
INSERT INTO `participante` VALUES ('73', '1', '2016-03-02 08:22:47', null);
INSERT INTO `participante` VALUES ('74', '1', '2016-03-02 08:38:08', '2016-03-02 09:09:37');
INSERT INTO `participante` VALUES ('75', '1', '2016-03-02 09:24:49', '2016-03-02 09:30:45');
INSERT INTO `participante` VALUES ('76', '1', '2016-03-02 10:02:47', '2016-03-02 10:19:28');
INSERT INTO `participante` VALUES ('77', '1', '2016-03-02 10:18:05', '2016-03-02 10:28:04');
INSERT INTO `participante` VALUES ('78', '1', '2016-03-02 10:59:32', null);
INSERT INTO `participante` VALUES ('79', '1', '2016-03-02 10:59:37', null);
INSERT INTO `participante` VALUES ('80', '1', '2016-03-02 10:59:41', null);
INSERT INTO `participante` VALUES ('81', '1', '2016-03-02 10:59:53', null);
INSERT INTO `participante` VALUES ('82', '1', '2016-03-02 10:59:54', null);
INSERT INTO `participante` VALUES ('83', '1', '2016-03-02 11:07:53', null);
INSERT INTO `participante` VALUES ('84', '1', '2016-03-02 11:08:02', '2016-03-02 11:19:45');
INSERT INTO `participante` VALUES ('85', '1', '2016-03-02 11:15:05', '2016-03-02 11:28:21');
INSERT INTO `participante` VALUES ('86', '1', '2016-03-02 11:58:50', '2016-03-02 12:20:42');
INSERT INTO `participante` VALUES ('87', '1', '2016-03-02 16:33:25', null);
INSERT INTO `participante` VALUES ('88', '1', '2016-03-03 11:43:14', '2016-03-03 11:47:08');
INSERT INTO `participante` VALUES ('89', '1', '2016-03-07 14:15:55', '2016-03-07 14:23:29');
INSERT INTO `participante` VALUES ('90', '1', '2016-03-07 20:19:26', '2016-03-07 20:19:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participante_has_rol
-- ----------------------------
INSERT INTO `participante_has_rol` VALUES ('13', '9', '3', '1');
INSERT INTO `participante_has_rol` VALUES ('14', '10', '3', '1');
INSERT INTO `participante_has_rol` VALUES ('15', '11', '5', '1');
INSERT INTO `participante_has_rol` VALUES ('17', '13', '3', '1');
INSERT INTO `participante_has_rol` VALUES ('20', '16', '3', '725');
INSERT INTO `participante_has_rol` VALUES ('22', '18', '3', '1');
INSERT INTO `participante_has_rol` VALUES ('26', '22', '3', '722');
INSERT INTO `participante_has_rol` VALUES ('27', '23', '1', '727');
INSERT INTO `participante_has_rol` VALUES ('28', '24', '2', '721');
INSERT INTO `participante_has_rol` VALUES ('29', '25', '3', '1');
INSERT INTO `participante_has_rol` VALUES ('30', '26', '1', '720');
INSERT INTO `participante_has_rol` VALUES ('31', '27', '1', '720');
INSERT INTO `participante_has_rol` VALUES ('32', '28', '1', '720');
INSERT INTO `participante_has_rol` VALUES ('33', '29', '3', '724');
INSERT INTO `participante_has_rol` VALUES ('34', '30', '1', '727');
INSERT INTO `participante_has_rol` VALUES ('35', '30', '4', '724');
INSERT INTO `participante_has_rol` VALUES ('36', '31', '1', '727');
INSERT INTO `participante_has_rol` VALUES ('37', '31', '4', '724');
INSERT INTO `participante_has_rol` VALUES ('38', '32', '1', '722');
INSERT INTO `participante_has_rol` VALUES ('39', '32', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('40', '33', '1', '725');
INSERT INTO `participante_has_rol` VALUES ('41', '34', '1', '725');
INSERT INTO `participante_has_rol` VALUES ('42', '35', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('43', '36', '2', '724');
INSERT INTO `participante_has_rol` VALUES ('44', '37', '1', '727');
INSERT INTO `participante_has_rol` VALUES ('45', '38', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('46', '38', '4', '721');
INSERT INTO `participante_has_rol` VALUES ('47', '39', '1', '727');
INSERT INTO `participante_has_rol` VALUES ('48', '40', '1', '727');
INSERT INTO `participante_has_rol` VALUES ('49', '41', '1', '727');
INSERT INTO `participante_has_rol` VALUES ('50', '42', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('51', '43', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('52', '44', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('53', '45', '11', '722');
INSERT INTO `participante_has_rol` VALUES ('54', '46', '3', '720');
INSERT INTO `participante_has_rol` VALUES ('55', '47', '2', '724');
INSERT INTO `participante_has_rol` VALUES ('56', '48', '2', '724');
INSERT INTO `participante_has_rol` VALUES ('57', '49', '3', '1');
INSERT INTO `participante_has_rol` VALUES ('58', '50', '2', '720');
INSERT INTO `participante_has_rol` VALUES ('59', '51', '3', '728');
INSERT INTO `participante_has_rol` VALUES ('60', '52', '2', '727');
INSERT INTO `participante_has_rol` VALUES ('61', '52', '9', '728');
INSERT INTO `participante_has_rol` VALUES ('62', '52', '10', '729');
INSERT INTO `participante_has_rol` VALUES ('63', '52', '3', '722');
INSERT INTO `participante_has_rol` VALUES ('64', '53', '2', '727');
INSERT INTO `participante_has_rol` VALUES ('65', '53', '9', '728');
INSERT INTO `participante_has_rol` VALUES ('66', '53', '10', '729');
INSERT INTO `participante_has_rol` VALUES ('67', '53', '3', '722');
INSERT INTO `participante_has_rol` VALUES ('68', '54', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('69', '55', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('70', '55', '4', '721');
INSERT INTO `participante_has_rol` VALUES ('71', '56', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('72', '56', '4', '721');
INSERT INTO `participante_has_rol` VALUES ('73', '57', '2', '720');
INSERT INTO `participante_has_rol` VALUES ('74', '58', '2', '724');
INSERT INTO `participante_has_rol` VALUES ('75', '58', '2', '725');
INSERT INTO `participante_has_rol` VALUES ('76', '59', '2', '720');
INSERT INTO `participante_has_rol` VALUES ('77', '60', '2', '720');
INSERT INTO `participante_has_rol` VALUES ('78', '61', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('79', '61', '4', '724');
INSERT INTO `participante_has_rol` VALUES ('80', '61', '4', '727');
INSERT INTO `participante_has_rol` VALUES ('81', '62', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('82', '62', '4', '721');
INSERT INTO `participante_has_rol` VALUES ('83', '63', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('84', '64', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('85', '65', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('86', '66', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('87', '67', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('88', '68', '1', '720');
INSERT INTO `participante_has_rol` VALUES ('89', '69', '1', '720');
INSERT INTO `participante_has_rol` VALUES ('90', '70', '6', null);
INSERT INTO `participante_has_rol` VALUES ('91', '70', '1', '720');
INSERT INTO `participante_has_rol` VALUES ('92', '71', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('93', '72', '1', '720');
INSERT INTO `participante_has_rol` VALUES ('94', '72', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('95', '72', '2', '729');
INSERT INTO `participante_has_rol` VALUES ('96', '72', '2', '732');
INSERT INTO `participante_has_rol` VALUES ('97', '72', '11', '728');
INSERT INTO `participante_has_rol` VALUES ('98', '72', '11', '732');
INSERT INTO `participante_has_rol` VALUES ('99', '72', '4', '724');
INSERT INTO `participante_has_rol` VALUES ('100', '72', '5', '732');
INSERT INTO `participante_has_rol` VALUES ('101', '72', '3', '732');
INSERT INTO `participante_has_rol` VALUES ('102', '73', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('103', '74', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('104', '75', '3', '727');
INSERT INTO `participante_has_rol` VALUES ('105', '76', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('106', '77', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('107', '77', '4', '721');
INSERT INTO `participante_has_rol` VALUES ('108', '78', '1', '724');
INSERT INTO `participante_has_rol` VALUES ('109', '79', '1', '724');
INSERT INTO `participante_has_rol` VALUES ('110', '80', '1', '724');
INSERT INTO `participante_has_rol` VALUES ('111', '81', '1', '724');
INSERT INTO `participante_has_rol` VALUES ('112', '82', '1', '724');
INSERT INTO `participante_has_rol` VALUES ('113', '83', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('114', '83', '4', '724');
INSERT INTO `participante_has_rol` VALUES ('115', '83', '4', '727');
INSERT INTO `participante_has_rol` VALUES ('116', '84', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('117', '84', '4', '724');
INSERT INTO `participante_has_rol` VALUES ('118', '84', '4', '727');
INSERT INTO `participante_has_rol` VALUES ('119', '85', '7', '732');
INSERT INTO `participante_has_rol` VALUES ('120', '85', '4', '724');
INSERT INTO `participante_has_rol` VALUES ('121', '86', '1', '724');
INSERT INTO `participante_has_rol` VALUES ('122', '86', '3', '725');
INSERT INTO `participante_has_rol` VALUES ('123', '87', '3', '1');
INSERT INTO `participante_has_rol` VALUES ('124', '88', '3', '1');
INSERT INTO `participante_has_rol` VALUES ('125', '89', '6', null);

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
INSERT INTO `pregunta` VALUES ('1', '1', 'Función de la ENAP es: Formar integralmente a Oficiales y Cadetes de la Armada Nacional, de la Marina Mercante y a profesionales del sector marítimo, propiciando las funciones de Docencia, Investigación, y Proyección Social, fomentando la cultura de la auto evaluación permanente en procura de la calidad y pertinencia de la educación, en el contexto de un mundo globalizado, con el propósito de contribuir al cumplimiento de la Misión Institucional. En qué grado califica la función de la ENAP en cuanto a:', '1', null, null, null, null);
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
INSERT INTO `pregunta` VALUES ('60', '', 'a. Su conocimiento.', '1', null, null, '2', 'si');
INSERT INTO `pregunta` VALUES ('61', '', 'b. La coherencia entre los objetivos del programa y los desarrollos curriculares.', '1', null, null, '2', 'si');
INSERT INTO `pregunta` VALUES ('62', '', 'c. Los mecanismos empleados por la institución para su difusión.', '1', null, null, '2', 'si');
INSERT INTO `pregunta` VALUES ('63', '', 'd. La coherencia con la Misión institucional.', '1', null, null, '2', 'si');
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
INSERT INTO `pregunta` VALUES ('95', '', 'a. Formación académica.  ', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('96', '', 'b. Trayectoria profesional y académica.', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('97', '', 'c. Competencias pedagógicas.', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('98', '', 'd. Claridad de métodos de calificación', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('99', '', 'e. Equidad en los métodos de calificación', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('100', '', 'f.  Mecanismos para la evaluación de los estudiantes', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('101', '', 'g.  Oportunidad en la entrega de calificaciones', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('102', '', 'h.  Aprovechamiento de las herramientas tecnológicas de apoyo a la docencia', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('103', '', 'i.  Respeto por el estudiante', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('104', '', 'j. Disposición para atender los estudiantes', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('105', '', 'k.  Compromiso con la investigación', '3', null, null, '11', 'si');
INSERT INTO `pregunta` VALUES ('106', '', 'l. Compromiso con la extensión o proyección social.', '3', null, null, '11', 'si');
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
INSERT INTO `pregunta` VALUES ('121', '', 'a. La calidad', '2', null, null, '16', 'si');
INSERT INTO `pregunta` VALUES ('122', '', 'b. La pertinencia en relación con los objetivos y metodología del programa', '2', null, null, '16', 'si');
INSERT INTO `pregunta` VALUES ('123', '', 'c. La utilización ', '2', null, null, '16', 'si');
INSERT INTO `pregunta` VALUES ('124', '', 'a. La formación académica.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('125', '', 'b. La experiencia académica.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('126', '', 'c. La experiencia profesional.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('127', '', 'd. Los méritos académicos.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('128', '', 'e. Los méritos investigativos.', '2', null, null, '17', null);
INSERT INTO `pregunta` VALUES ('129', '', 'a. La discusión abierta y critica.', '2', null, null, '18', null);
INSERT INTO `pregunta` VALUES ('130', '', 'b. El conocimiento de sus opiniones e inquietudes.', '2', null, null, '18', null);
INSERT INTO `pregunta` VALUES ('131', '', 'a. La forma cómo responde a las tendencias académicas en su área de conocimiento.', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('132', '', 'b. La calidad de las asignaturas o cursos impartidos. ', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('133', '', 'c. La profundidad de los temas tratados', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('134', '', 'd. Las estrategias empleadas para lograr una formación integral.', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('135', '', 'e. La flexibilidad del currículo.', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('136', '', 'f. La utilización de tecnologías de información y comunicación como apoyo a la docencia.', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('137', '', 'g. Las posibilidades para trabajar interdisciplinariamente', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('138', '', 'h. Las oportunidades de internacionalización del plan de estudios (intercambio de estudiantes, profesores visitantes, pasantías, prácticas fuera del país, cursos en inglés, entre otros) .', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('139', '', 'i. Las facilidades para participar en foros, seminarios y congresos dentro o fuera de la institución.', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('140', '', 'j. La calidad del acompañamiento de los docentes en el proceso de formación.', '3', null, null, '19', 'si');
INSERT INTO `pregunta` VALUES ('141', '', 'a.  Están en correspondencia con el desarrollo de los contenidos. ', '2', null, null, '20', 'si');
INSERT INTO `pregunta` VALUES ('142', '', 'b. Contribuyen al mejoramiento del proceso de formación.', '2', null, null, '20', 'si');
INSERT INTO `pregunta` VALUES ('143', '', 'a.  Tienen el propósito de mejorar procesos de enseñanza – aprendizaje.', '2', null, null, '22', 'si');
INSERT INTO `pregunta` VALUES ('144', '', 'b. Están en correspondencia con los contenidos temáticos desarrollados.', '2', null, null, '22', 'si');
INSERT INTO `pregunta` VALUES ('145', '', 'a. Ampliar sus conocimientos.', '2', null, null, '23', 'si');
INSERT INTO `pregunta` VALUES ('146', '', 'b. Desarrollar nuevas capacidades.', '2', null, null, '23', 'si');
INSERT INTO `pregunta` VALUES ('147', '', 'c. Fortalecer sus habilidades.', '2', null, null, '23', 'si');
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
INSERT INTO `pregunta` VALUES ('163', '', 'a. Actualizado.', '2', null, null, '32', 'si');
INSERT INTO `pregunta` VALUES ('164', '', 'b. Suficiente.', '2', null, null, '32', 'si');
INSERT INTO `pregunta` VALUES ('165', '', 'c. Pertinente.', '2', null, null, '32', 'si');
INSERT INTO `pregunta` VALUES ('166', '', 'a. Están actualizados.', '2', null, null, '34', 'si');
INSERT INTO `pregunta` VALUES ('167', '', 'b. Son suficientes.', '2', null, null, '34', 'si');
INSERT INTO `pregunta` VALUES ('168', '', 'c. Son pertinentes.', '2', null, null, '34', 'si');
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
INSERT INTO `pregunta` VALUES ('240', '', 'a. Dan una orientación efectiva para el cumplimiento de los objetivos del programa.', '2', null, null, '51', 'si');
INSERT INTO `pregunta` VALUES ('241', '', 'B. Ejercen un liderazgo.', '2', null, null, '51', 'si');
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
INSERT INTO `pregunta_has_caracteristica` VALUES ('1', '31');
INSERT INTO `pregunta_has_caracteristica` VALUES ('2', '32');
INSERT INTO `pregunta_has_caracteristica` VALUES ('3', '35');
INSERT INTO `pregunta_has_caracteristica` VALUES ('4', '36');
INSERT INTO `pregunta_has_caracteristica` VALUES ('5', '36');
INSERT INTO `pregunta_has_caracteristica` VALUES ('6', '37');
INSERT INTO `pregunta_has_caracteristica` VALUES ('7', '37');
INSERT INTO `pregunta_has_caracteristica` VALUES ('8', '38');
INSERT INTO `pregunta_has_caracteristica` VALUES ('9', '39');
INSERT INTO `pregunta_has_caracteristica` VALUES ('10', '39');
INSERT INTO `pregunta_has_caracteristica` VALUES ('11', '40');
INSERT INTO `pregunta_has_caracteristica` VALUES ('12', '40');
INSERT INTO `pregunta_has_caracteristica` VALUES ('14', '41');
INSERT INTO `pregunta_has_caracteristica` VALUES ('15', '42');
INSERT INTO `pregunta_has_caracteristica` VALUES ('16', '43');
INSERT INTO `pregunta_has_caracteristica` VALUES ('17', '44');
INSERT INTO `pregunta_has_caracteristica` VALUES ('13', '45');
INSERT INTO `pregunta_has_caracteristica` VALUES ('131', '46');
INSERT INTO `pregunta_has_caracteristica` VALUES ('132', '46');
INSERT INTO `pregunta_has_caracteristica` VALUES ('133', '46');
INSERT INTO `pregunta_has_caracteristica` VALUES ('134', '46');
INSERT INTO `pregunta_has_caracteristica` VALUES ('139', '46');
INSERT INTO `pregunta_has_caracteristica` VALUES ('140', '46');
INSERT INTO `pregunta_has_caracteristica` VALUES ('135', '47');
INSERT INTO `pregunta_has_caracteristica` VALUES ('136', '47');
INSERT INTO `pregunta_has_caracteristica` VALUES ('138', '47');
INSERT INTO `pregunta_has_caracteristica` VALUES ('137', '48');
INSERT INTO `pregunta_has_caracteristica` VALUES ('20', '49');
INSERT INTO `pregunta_has_caracteristica` VALUES ('21', '49');
INSERT INTO `pregunta_has_caracteristica` VALUES ('22', '50');
INSERT INTO `pregunta_has_caracteristica` VALUES ('23', '50');
INSERT INTO `pregunta_has_caracteristica` VALUES ('25', '51');
INSERT INTO `pregunta_has_caracteristica` VALUES ('27', '52');
INSERT INTO `pregunta_has_caracteristica` VALUES ('31', '53');
INSERT INTO `pregunta_has_caracteristica` VALUES ('32', '54');
INSERT INTO `pregunta_has_caracteristica` VALUES ('34', '55');
INSERT INTO `pregunta_has_caracteristica` VALUES ('35', '56');
INSERT INTO `pregunta_has_caracteristica` VALUES ('36', '56');
INSERT INTO `pregunta_has_caracteristica` VALUES ('44', '61');
INSERT INTO `pregunta_has_caracteristica` VALUES ('45', '61');
INSERT INTO `pregunta_has_caracteristica` VALUES ('46', '63');
INSERT INTO `pregunta_has_caracteristica` VALUES ('48', '63');
INSERT INTO `pregunta_has_caracteristica` VALUES ('49', '64');
INSERT INTO `pregunta_has_caracteristica` VALUES ('51', '65');
INSERT INTO `pregunta_has_caracteristica` VALUES ('52', '66');
INSERT INTO `pregunta_has_caracteristica` VALUES ('53', '66');
INSERT INTO `pregunta_has_caracteristica` VALUES ('55', '69');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proceso
-- ----------------------------
INSERT INTO `proceso` VALUES ('1', '21/01/2016', '--', 'Proceso de Autoevaluación con fines de obtención de la acreditación institucional', '1', '1');
INSERT INTO `proceso` VALUES ('2', 'En Configuración', '--', 'Primer Proceso de Autoevaluación del Programa Oceanografia Fisica 2016-1', '720', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=4721 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of respuestas
-- ----------------------------
INSERT INTO `respuestas` VALUES ('627', '56', '9', '5', null);
INSERT INTO `respuestas` VALUES ('628', '57', '9', '5', null);
INSERT INTO `respuestas` VALUES ('629', '58', '9', '4', null);
INSERT INTO `respuestas` VALUES ('630', '59', '9', '5', null);
INSERT INTO `respuestas` VALUES ('631', '44', '9', '4', null);
INSERT INTO `respuestas` VALUES ('632', '229', '9', '4', null);
INSERT INTO `respuestas` VALUES ('633', '230', '9', '3', null);
INSERT INTO `respuestas` VALUES ('634', '231', '9', '4', null);
INSERT INTO `respuestas` VALUES ('635', '47', '9', '4', null);
INSERT INTO `respuestas` VALUES ('636', '235', '9', '5', null);
INSERT INTO `respuestas` VALUES ('637', '236', '9', '3', null);
INSERT INTO `respuestas` VALUES ('638', '237', '9', '3', null);
INSERT INTO `respuestas` VALUES ('639', '238', '9', '4', null);
INSERT INTO `respuestas` VALUES ('640', '239', '9', '5', null);
INSERT INTO `respuestas` VALUES ('641', '56', '10', '5', null);
INSERT INTO `respuestas` VALUES ('642', '57', '10', '5', null);
INSERT INTO `respuestas` VALUES ('643', '58', '10', '4', null);
INSERT INTO `respuestas` VALUES ('644', '59', '10', '5', null);
INSERT INTO `respuestas` VALUES ('645', '44', '10', '4', null);
INSERT INTO `respuestas` VALUES ('646', '229', '10', '4', null);
INSERT INTO `respuestas` VALUES ('647', '230', '10', '4', null);
INSERT INTO `respuestas` VALUES ('648', '231', '10', '3', null);
INSERT INTO `respuestas` VALUES ('649', '47', '10', '4', null);
INSERT INTO `respuestas` VALUES ('650', '235', '10', '4', null);
INSERT INTO `respuestas` VALUES ('651', '236', '10', '4', null);
INSERT INTO `respuestas` VALUES ('652', '237', '10', '3', null);
INSERT INTO `respuestas` VALUES ('653', '238', '10', '4', null);
INSERT INTO `respuestas` VALUES ('654', '239', '10', '4', null);
INSERT INTO `respuestas` VALUES ('655', '56', '11', '5', null);
INSERT INTO `respuestas` VALUES ('656', '57', '11', '4', null);
INSERT INTO `respuestas` VALUES ('657', '58', '11', '5', null);
INSERT INTO `respuestas` VALUES ('658', '59', '11', '5', null);
INSERT INTO `respuestas` VALUES ('659', '81', '11', '4', null);
INSERT INTO `respuestas` VALUES ('660', '82', '11', '2', null);
INSERT INTO `respuestas` VALUES ('661', '89', '11', '2', null);
INSERT INTO `respuestas` VALUES ('662', '90', '11', '3', null);
INSERT INTO `respuestas` VALUES ('663', '91', '11', '3', null);
INSERT INTO `respuestas` VALUES ('664', '95', '11', '4', null);
INSERT INTO `respuestas` VALUES ('665', '96', '11', '4', null);
INSERT INTO `respuestas` VALUES ('666', '97', '11', '4', null);
INSERT INTO `respuestas` VALUES ('667', '98', '11', '4', null);
INSERT INTO `respuestas` VALUES ('668', '99', '11', '4', null);
INSERT INTO `respuestas` VALUES ('669', '100', '11', '5', null);
INSERT INTO `respuestas` VALUES ('670', '101', '11', '5', null);
INSERT INTO `respuestas` VALUES ('671', '102', '11', '4', null);
INSERT INTO `respuestas` VALUES ('672', '103', '11', '4', null);
INSERT INTO `respuestas` VALUES ('673', '104', '11', '4', null);
INSERT INTO `respuestas` VALUES ('674', '105', '11', '3', null);
INSERT INTO `respuestas` VALUES ('675', '106', '11', '4', null);
INSERT INTO `respuestas` VALUES ('676', '143', '11', '3', null);
INSERT INTO `respuestas` VALUES ('677', '144', '11', '3', null);
INSERT INTO `respuestas` VALUES ('678', '27', '11', '4', null);
INSERT INTO `respuestas` VALUES ('679', '152', '11', '3', null);
INSERT INTO `respuestas` VALUES ('680', '153', '11', '3', null);
INSERT INTO `respuestas` VALUES ('681', '154', '11', '3', null);
INSERT INTO `respuestas` VALUES ('682', '155', '11', '4', null);
INSERT INTO `respuestas` VALUES ('683', '156', '11', '5', null);
INSERT INTO `respuestas` VALUES ('684', '157', '11', '5', null);
INSERT INTO `respuestas` VALUES ('685', '158', '11', '5', null);
INSERT INTO `respuestas` VALUES ('686', '159', '11', '5', null);
INSERT INTO `respuestas` VALUES ('687', '160', '11', '5', null);
INSERT INTO `respuestas` VALUES ('688', '169', '11', '5', null);
INSERT INTO `respuestas` VALUES ('689', '170', '11', '5', null);
INSERT INTO `respuestas` VALUES ('690', '171', '11', '5', null);
INSERT INTO `respuestas` VALUES ('691', '172', '11', '5', null);
INSERT INTO `respuestas` VALUES ('692', '173', '11', '5', null);
INSERT INTO `respuestas` VALUES ('693', '174', '11', '5', null);
INSERT INTO `respuestas` VALUES ('694', '175', '11', '5', null);
INSERT INTO `respuestas` VALUES ('695', '176', '11', '5', null);
INSERT INTO `respuestas` VALUES ('696', '177', '11', '5', null);
INSERT INTO `respuestas` VALUES ('697', '178', '11', '5', null);
INSERT INTO `respuestas` VALUES ('698', '179', '11', '5', null);
INSERT INTO `respuestas` VALUES ('699', '180', '11', '5', null);
INSERT INTO `respuestas` VALUES ('700', '181', '11', '5', null);
INSERT INTO `respuestas` VALUES ('701', '182', '11', '5', null);
INSERT INTO `respuestas` VALUES ('702', '183', '11', '5', null);
INSERT INTO `respuestas` VALUES ('703', '184', '11', '5', null);
INSERT INTO `respuestas` VALUES ('704', '185', '11', '5', null);
INSERT INTO `respuestas` VALUES ('705', '224', '11', '5', null);
INSERT INTO `respuestas` VALUES ('706', '225', '11', '5', null);
INSERT INTO `respuestas` VALUES ('707', '44', '11', '5', null);
INSERT INTO `respuestas` VALUES ('708', '229', '11', '5', null);
INSERT INTO `respuestas` VALUES ('709', '230', '11', '5', null);
INSERT INTO `respuestas` VALUES ('710', '231', '11', '5', null);
INSERT INTO `respuestas` VALUES ('711', '235', '11', '5', null);
INSERT INTO `respuestas` VALUES ('712', '236', '11', '5', null);
INSERT INTO `respuestas` VALUES ('713', '237', '11', '5', null);
INSERT INTO `respuestas` VALUES ('714', '238', '11', '5', null);
INSERT INTO `respuestas` VALUES ('715', '239', '11', '5', null);
INSERT INTO `respuestas` VALUES ('716', '56', '13', '4', null);
INSERT INTO `respuestas` VALUES ('717', '57', '13', '4', null);
INSERT INTO `respuestas` VALUES ('718', '58', '13', '3', null);
INSERT INTO `respuestas` VALUES ('719', '59', '13', '4', null);
INSERT INTO `respuestas` VALUES ('720', '44', '13', '3', null);
INSERT INTO `respuestas` VALUES ('721', '229', '13', '3', null);
INSERT INTO `respuestas` VALUES ('722', '230', '13', '3', null);
INSERT INTO `respuestas` VALUES ('723', '231', '13', '3', null);
INSERT INTO `respuestas` VALUES ('724', '47', '13', '3', null);
INSERT INTO `respuestas` VALUES ('725', '235', '13', '3', null);
INSERT INTO `respuestas` VALUES ('726', '236', '13', '2', null);
INSERT INTO `respuestas` VALUES ('727', '237', '13', '0', null);
INSERT INTO `respuestas` VALUES ('728', '238', '13', '4', null);
INSERT INTO `respuestas` VALUES ('729', '239', '13', '4', null);
INSERT INTO `respuestas` VALUES ('730', '56', '16', '5', null);
INSERT INTO `respuestas` VALUES ('731', '57', '16', '5', null);
INSERT INTO `respuestas` VALUES ('732', '58', '16', '5', null);
INSERT INTO `respuestas` VALUES ('733', '59', '16', '5', null);
INSERT INTO `respuestas` VALUES ('734', '60', '16', '5', '725');
INSERT INTO `respuestas` VALUES ('735', '61', '16', '5', '725');
INSERT INTO `respuestas` VALUES ('736', '62', '16', '5', '725');
INSERT INTO `respuestas` VALUES ('737', '63', '16', '5', '725');
INSERT INTO `respuestas` VALUES ('738', '44', '16', '4', null);
INSERT INTO `respuestas` VALUES ('739', '229', '16', '5', null);
INSERT INTO `respuestas` VALUES ('740', '230', '16', '5', null);
INSERT INTO `respuestas` VALUES ('741', '231', '16', '5', null);
INSERT INTO `respuestas` VALUES ('742', '46', '16', '4', null);
INSERT INTO `respuestas` VALUES ('743', '47', '16', '5', null);
INSERT INTO `respuestas` VALUES ('744', '235', '16', '4', null);
INSERT INTO `respuestas` VALUES ('745', '236', '16', '4', null);
INSERT INTO `respuestas` VALUES ('746', '237', '16', '4', null);
INSERT INTO `respuestas` VALUES ('747', '238', '16', '5', null);
INSERT INTO `respuestas` VALUES ('748', '239', '16', '5', null);
INSERT INTO `respuestas` VALUES ('749', '56', '18', '5', null);
INSERT INTO `respuestas` VALUES ('750', '57', '18', '5', null);
INSERT INTO `respuestas` VALUES ('751', '58', '18', '5', null);
INSERT INTO `respuestas` VALUES ('752', '59', '18', '5', null);
INSERT INTO `respuestas` VALUES ('753', '44', '18', '5', null);
INSERT INTO `respuestas` VALUES ('754', '229', '18', '4', null);
INSERT INTO `respuestas` VALUES ('755', '230', '18', '5', null);
INSERT INTO `respuestas` VALUES ('756', '231', '18', '4', null);
INSERT INTO `respuestas` VALUES ('757', '47', '18', '4', null);
INSERT INTO `respuestas` VALUES ('758', '235', '18', '5', null);
INSERT INTO `respuestas` VALUES ('759', '236', '18', '4', null);
INSERT INTO `respuestas` VALUES ('760', '237', '18', '3', null);
INSERT INTO `respuestas` VALUES ('761', '238', '18', '4', null);
INSERT INTO `respuestas` VALUES ('762', '239', '18', '3', null);
INSERT INTO `respuestas` VALUES ('777', '56', '22', '5', null);
INSERT INTO `respuestas` VALUES ('778', '57', '22', '3', null);
INSERT INTO `respuestas` VALUES ('779', '58', '22', '4', null);
INSERT INTO `respuestas` VALUES ('780', '59', '22', '3', null);
INSERT INTO `respuestas` VALUES ('781', '60', '22', '4', '722');
INSERT INTO `respuestas` VALUES ('782', '61', '22', '5', '722');
INSERT INTO `respuestas` VALUES ('783', '62', '22', '3', '722');
INSERT INTO `respuestas` VALUES ('784', '63', '22', '5', '722');
INSERT INTO `respuestas` VALUES ('785', '44', '22', '4', null);
INSERT INTO `respuestas` VALUES ('786', '229', '22', '4', null);
INSERT INTO `respuestas` VALUES ('787', '230', '22', '4', null);
INSERT INTO `respuestas` VALUES ('788', '231', '22', '5', null);
INSERT INTO `respuestas` VALUES ('789', '46', '22', '5', null);
INSERT INTO `respuestas` VALUES ('790', '47', '22', '4', null);
INSERT INTO `respuestas` VALUES ('791', '235', '22', '4', null);
INSERT INTO `respuestas` VALUES ('792', '236', '22', '3', null);
INSERT INTO `respuestas` VALUES ('793', '237', '22', '3', null);
INSERT INTO `respuestas` VALUES ('794', '238', '22', '5', null);
INSERT INTO `respuestas` VALUES ('795', '239', '22', '5', null);
INSERT INTO `respuestas` VALUES ('796', '56', '23', '5', null);
INSERT INTO `respuestas` VALUES ('797', '57', '23', '4', null);
INSERT INTO `respuestas` VALUES ('798', '58', '23', '4', null);
INSERT INTO `respuestas` VALUES ('799', '59', '23', '4', null);
INSERT INTO `respuestas` VALUES ('800', '60', '23', '5', '727');
INSERT INTO `respuestas` VALUES ('801', '61', '23', '5', '727');
INSERT INTO `respuestas` VALUES ('802', '62', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('803', '63', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('804', '64', '23', '5', null);
INSERT INTO `respuestas` VALUES ('805', '65', '23', '4', null);
INSERT INTO `respuestas` VALUES ('806', '66', '23', '4', null);
INSERT INTO `respuestas` VALUES ('807', '67', '23', '5', null);
INSERT INTO `respuestas` VALUES ('808', '68', '23', '5', null);
INSERT INTO `respuestas` VALUES ('809', '69', '23', '4', null);
INSERT INTO `respuestas` VALUES ('810', '70', '23', '4', null);
INSERT INTO `respuestas` VALUES ('811', '71', '23', '5', null);
INSERT INTO `respuestas` VALUES ('812', '72', '23', '4', null);
INSERT INTO `respuestas` VALUES ('813', '73', '23', '4', null);
INSERT INTO `respuestas` VALUES ('814', '74', '23', '4', null);
INSERT INTO `respuestas` VALUES ('815', '75', '23', '4', null);
INSERT INTO `respuestas` VALUES ('816', '76', '23', '4', null);
INSERT INTO `respuestas` VALUES ('817', '77', '23', '2', null);
INSERT INTO `respuestas` VALUES ('818', '78', '23', '2', null);
INSERT INTO `respuestas` VALUES ('819', '79', '23', '3', null);
INSERT INTO `respuestas` VALUES ('820', '80', '23', '3', null);
INSERT INTO `respuestas` VALUES ('821', '81', '23', '2', null);
INSERT INTO `respuestas` VALUES ('822', '82', '23', '2', null);
INSERT INTO `respuestas` VALUES ('823', '95', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('824', '96', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('825', '97', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('826', '98', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('827', '99', '23', '2', '727');
INSERT INTO `respuestas` VALUES ('828', '100', '23', '2', '727');
INSERT INTO `respuestas` VALUES ('829', '101', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('830', '102', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('831', '103', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('832', '104', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('833', '105', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('834', '106', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('835', '121', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('836', '122', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('837', '123', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('838', '129', '23', '4', null);
INSERT INTO `respuestas` VALUES ('839', '130', '23', '4', null);
INSERT INTO `respuestas` VALUES ('840', '131', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('841', '132', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('842', '133', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('843', '134', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('844', '135', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('845', '136', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('846', '137', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('847', '138', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('848', '139', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('849', '140', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('850', '141', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('851', '142', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('852', '21', '23', '5', '727');
INSERT INTO `respuestas` VALUES ('853', '143', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('854', '144', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('855', '145', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('856', '146', '23', '5', '727');
INSERT INTO `respuestas` VALUES ('857', '147', '23', '5', '727');
INSERT INTO `respuestas` VALUES ('858', '27', '23', '3', null);
INSERT INTO `respuestas` VALUES ('859', '152', '23', '4', null);
INSERT INTO `respuestas` VALUES ('860', '153', '23', '4', null);
INSERT INTO `respuestas` VALUES ('861', '154', '23', '4', null);
INSERT INTO `respuestas` VALUES ('862', '155', '23', '4', null);
INSERT INTO `respuestas` VALUES ('863', '156', '23', '4', null);
INSERT INTO `respuestas` VALUES ('864', '157', '23', '4', null);
INSERT INTO `respuestas` VALUES ('865', '158', '23', '3', null);
INSERT INTO `respuestas` VALUES ('866', '159', '23', '3', null);
INSERT INTO `respuestas` VALUES ('867', '160', '23', '3', null);
INSERT INTO `respuestas` VALUES ('868', '163', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('869', '164', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('870', '165', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('871', '166', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('872', '167', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('873', '168', '23', '3', '727');
INSERT INTO `respuestas` VALUES ('874', '169', '23', '4', null);
INSERT INTO `respuestas` VALUES ('875', '170', '23', '4', null);
INSERT INTO `respuestas` VALUES ('876', '171', '23', '4', null);
INSERT INTO `respuestas` VALUES ('877', '172', '23', '4', null);
INSERT INTO `respuestas` VALUES ('878', '173', '23', '4', null);
INSERT INTO `respuestas` VALUES ('879', '174', '23', '4', null);
INSERT INTO `respuestas` VALUES ('880', '175', '23', '5', null);
INSERT INTO `respuestas` VALUES ('881', '176', '23', '4', null);
INSERT INTO `respuestas` VALUES ('882', '177', '23', '4', null);
INSERT INTO `respuestas` VALUES ('883', '178', '23', '4', null);
INSERT INTO `respuestas` VALUES ('884', '179', '23', '4', null);
INSERT INTO `respuestas` VALUES ('885', '180', '23', '4', null);
INSERT INTO `respuestas` VALUES ('886', '181', '23', '4', null);
INSERT INTO `respuestas` VALUES ('887', '182', '23', '4', null);
INSERT INTO `respuestas` VALUES ('888', '183', '23', '4', null);
INSERT INTO `respuestas` VALUES ('889', '184', '23', '4', null);
INSERT INTO `respuestas` VALUES ('890', '185', '23', '4', null);
INSERT INTO `respuestas` VALUES ('891', '186', '23', '3', null);
INSERT INTO `respuestas` VALUES ('892', '187', '23', '3', null);
INSERT INTO `respuestas` VALUES ('893', '188', '23', '3', null);
INSERT INTO `respuestas` VALUES ('894', '189', '23', '3', null);
INSERT INTO `respuestas` VALUES ('895', '190', '23', '3', null);
INSERT INTO `respuestas` VALUES ('896', '191', '23', '3', null);
INSERT INTO `respuestas` VALUES ('897', '192', '23', '3', null);
INSERT INTO `respuestas` VALUES ('898', '193', '23', '3', null);
INSERT INTO `respuestas` VALUES ('899', '194', '23', '3', null);
INSERT INTO `respuestas` VALUES ('900', '195', '23', '3', null);
INSERT INTO `respuestas` VALUES ('901', '196', '23', '4', null);
INSERT INTO `respuestas` VALUES ('902', '197', '23', '4', null);
INSERT INTO `respuestas` VALUES ('903', '198', '23', '1', null);
INSERT INTO `respuestas` VALUES ('904', '199', '23', '1', null);
INSERT INTO `respuestas` VALUES ('905', '200', '23', '2', null);
INSERT INTO `respuestas` VALUES ('906', '201', '23', '3', null);
INSERT INTO `respuestas` VALUES ('907', '202', '23', '1', null);
INSERT INTO `respuestas` VALUES ('908', '203', '23', '2', null);
INSERT INTO `respuestas` VALUES ('909', '204', '23', '4', null);
INSERT INTO `respuestas` VALUES ('910', '205', '23', '4', null);
INSERT INTO `respuestas` VALUES ('911', '206', '23', '3', null);
INSERT INTO `respuestas` VALUES ('912', '207', '23', '4', null);
INSERT INTO `respuestas` VALUES ('913', '208', '23', '3', null);
INSERT INTO `respuestas` VALUES ('914', '209', '23', '4', null);
INSERT INTO `respuestas` VALUES ('915', '210', '23', '3', null);
INSERT INTO `respuestas` VALUES ('916', '211', '23', '2', null);
INSERT INTO `respuestas` VALUES ('917', '215', '23', '4', null);
INSERT INTO `respuestas` VALUES ('918', '216', '23', '4', null);
INSERT INTO `respuestas` VALUES ('919', '44', '23', '4', null);
INSERT INTO `respuestas` VALUES ('920', '229', '23', '4', null);
INSERT INTO `respuestas` VALUES ('921', '230', '23', '4', null);
INSERT INTO `respuestas` VALUES ('922', '231', '23', '4', null);
INSERT INTO `respuestas` VALUES ('923', '232', '23', '4', null);
INSERT INTO `respuestas` VALUES ('924', '233', '23', '4', null);
INSERT INTO `respuestas` VALUES ('925', '234', '23', '4', null);
INSERT INTO `respuestas` VALUES ('926', '235', '23', '1', null);
INSERT INTO `respuestas` VALUES ('927', '236', '23', '1', null);
INSERT INTO `respuestas` VALUES ('928', '237', '23', '3', null);
INSERT INTO `respuestas` VALUES ('929', '238', '23', '3', null);
INSERT INTO `respuestas` VALUES ('930', '239', '23', '3', null);
INSERT INTO `respuestas` VALUES ('931', '240', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('932', '241', '23', '4', '727');
INSERT INTO `respuestas` VALUES ('933', '56', '24', '5', null);
INSERT INTO `respuestas` VALUES ('934', '57', '24', '5', null);
INSERT INTO `respuestas` VALUES ('935', '58', '24', '4', null);
INSERT INTO `respuestas` VALUES ('936', '59', '24', '5', null);
INSERT INTO `respuestas` VALUES ('937', '60', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('938', '61', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('939', '62', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('940', '63', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('941', '64', '24', '5', null);
INSERT INTO `respuestas` VALUES ('942', '65', '24', '5', null);
INSERT INTO `respuestas` VALUES ('943', '66', '24', '5', null);
INSERT INTO `respuestas` VALUES ('944', '81', '24', '3', null);
INSERT INTO `respuestas` VALUES ('945', '82', '24', '3', null);
INSERT INTO `respuestas` VALUES ('946', '83', '24', '4', null);
INSERT INTO `respuestas` VALUES ('947', '84', '24', '4', null);
INSERT INTO `respuestas` VALUES ('948', '85', '24', '4', null);
INSERT INTO `respuestas` VALUES ('949', '86', '24', '4', null);
INSERT INTO `respuestas` VALUES ('950', '87', '24', '4', null);
INSERT INTO `respuestas` VALUES ('951', '88', '24', '4', null);
INSERT INTO `respuestas` VALUES ('952', '89', '24', '5', null);
INSERT INTO `respuestas` VALUES ('953', '90', '24', '3', null);
INSERT INTO `respuestas` VALUES ('954', '91', '24', '4', null);
INSERT INTO `respuestas` VALUES ('955', '92', '24', '4', null);
INSERT INTO `respuestas` VALUES ('956', '93', '24', '4', null);
INSERT INTO `respuestas` VALUES ('957', '94', '24', '5', null);
INSERT INTO `respuestas` VALUES ('958', '95', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('959', '96', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('960', '97', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('961', '98', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('962', '99', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('963', '100', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('964', '101', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('965', '102', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('966', '103', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('967', '104', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('968', '105', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('969', '106', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('970', '12', '24', '4', null);
INSERT INTO `respuestas` VALUES ('971', '107', '24', '3', null);
INSERT INTO `respuestas` VALUES ('972', '108', '24', '4', null);
INSERT INTO `respuestas` VALUES ('973', '109', '24', '5', null);
INSERT INTO `respuestas` VALUES ('974', '110', '24', '3', null);
INSERT INTO `respuestas` VALUES ('975', '111', '24', '4', null);
INSERT INTO `respuestas` VALUES ('976', '112', '24', '4', null);
INSERT INTO `respuestas` VALUES ('977', '113', '24', '4', null);
INSERT INTO `respuestas` VALUES ('978', '114', '24', '3', null);
INSERT INTO `respuestas` VALUES ('979', '115', '24', '3', null);
INSERT INTO `respuestas` VALUES ('980', '116', '24', '3', null);
INSERT INTO `respuestas` VALUES ('981', '117', '24', '4', null);
INSERT INTO `respuestas` VALUES ('982', '118', '24', '3', null);
INSERT INTO `respuestas` VALUES ('983', '119', '24', '3', null);
INSERT INTO `respuestas` VALUES ('984', '120', '24', '3', null);
INSERT INTO `respuestas` VALUES ('985', '124', '24', '3', null);
INSERT INTO `respuestas` VALUES ('986', '125', '24', '3', null);
INSERT INTO `respuestas` VALUES ('987', '126', '24', '3', null);
INSERT INTO `respuestas` VALUES ('988', '127', '24', '3', null);
INSERT INTO `respuestas` VALUES ('989', '128', '24', '3', null);
INSERT INTO `respuestas` VALUES ('990', '129', '24', '4', null);
INSERT INTO `respuestas` VALUES ('991', '130', '24', '4', null);
INSERT INTO `respuestas` VALUES ('992', '131', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('993', '132', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('994', '133', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('995', '134', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('996', '135', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('997', '136', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('998', '137', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('999', '138', '24', '3', '721');
INSERT INTO `respuestas` VALUES ('1000', '139', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('1001', '140', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1002', '141', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1003', '142', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1004', '21', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1005', '143', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1006', '144', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1007', '25', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1008', '148', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1009', '149', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1010', '150', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1011', '151', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1012', '27', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1013', '152', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1014', '153', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1015', '154', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1016', '155', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1017', '156', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1018', '157', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1019', '158', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1020', '159', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1021', '160', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1022', '163', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('1023', '164', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('1024', '165', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1025', '33', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1026', '166', '24', '4', '721');
INSERT INTO `respuestas` VALUES ('1027', '167', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1028', '168', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1029', '169', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1030', '170', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1031', '171', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1032', '172', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1033', '173', '24', '3', null);
INSERT INTO `respuestas` VALUES ('1034', '174', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1035', '175', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1036', '176', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1037', '177', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1038', '178', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1039', '179', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1040', '180', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1041', '181', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1042', '182', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1043', '183', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1044', '184', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1045', '185', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1046', '204', '24', '3', null);
INSERT INTO `respuestas` VALUES ('1047', '205', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1048', '206', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1049', '207', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1050', '208', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1051', '209', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1052', '210', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1053', '211', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1054', '224', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1055', '225', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1056', '44', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1057', '229', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1058', '230', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1059', '231', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1060', '232', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1061', '233', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1062', '234', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1063', '235', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1064', '236', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1065', '237', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1066', '238', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1067', '239', '24', '4', null);
INSERT INTO `respuestas` VALUES ('1068', '240', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1069', '241', '24', '5', '721');
INSERT INTO `respuestas` VALUES ('1070', '256', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1071', '257', '24', '5', null);
INSERT INTO `respuestas` VALUES ('1072', '56', '25', '5', null);
INSERT INTO `respuestas` VALUES ('1073', '57', '25', '5', null);
INSERT INTO `respuestas` VALUES ('1074', '58', '25', '4', null);
INSERT INTO `respuestas` VALUES ('1075', '59', '25', '5', null);
INSERT INTO `respuestas` VALUES ('1076', '44', '25', '5', null);
INSERT INTO `respuestas` VALUES ('1077', '229', '25', '4', null);
INSERT INTO `respuestas` VALUES ('1078', '230', '25', '5', null);
INSERT INTO `respuestas` VALUES ('1079', '231', '25', '4', null);
INSERT INTO `respuestas` VALUES ('1080', '47', '25', '4', null);
INSERT INTO `respuestas` VALUES ('1081', '235', '25', '5', null);
INSERT INTO `respuestas` VALUES ('1082', '236', '25', '4', null);
INSERT INTO `respuestas` VALUES ('1083', '237', '25', '3', null);
INSERT INTO `respuestas` VALUES ('1084', '238', '25', '0', null);
INSERT INTO `respuestas` VALUES ('1085', '239', '25', '4', null);
INSERT INTO `respuestas` VALUES ('1086', '56', '29', '4', null);
INSERT INTO `respuestas` VALUES ('1087', '57', '29', '4', null);
INSERT INTO `respuestas` VALUES ('1088', '58', '29', '3', null);
INSERT INTO `respuestas` VALUES ('1089', '59', '29', '4', null);
INSERT INTO `respuestas` VALUES ('1090', '60', '29', '3', '724');
INSERT INTO `respuestas` VALUES ('1091', '61', '29', '3', '724');
INSERT INTO `respuestas` VALUES ('1092', '62', '29', '3', '724');
INSERT INTO `respuestas` VALUES ('1093', '63', '29', '3', '724');
INSERT INTO `respuestas` VALUES ('1094', '44', '29', '3', null);
INSERT INTO `respuestas` VALUES ('1095', '229', '29', '3', null);
INSERT INTO `respuestas` VALUES ('1096', '230', '29', '3', null);
INSERT INTO `respuestas` VALUES ('1097', '231', '29', '3', null);
INSERT INTO `respuestas` VALUES ('1098', '46', '29', '4', null);
INSERT INTO `respuestas` VALUES ('1099', '47', '29', '3', null);
INSERT INTO `respuestas` VALUES ('1100', '235', '29', '4', null);
INSERT INTO `respuestas` VALUES ('1101', '236', '29', '3', null);
INSERT INTO `respuestas` VALUES ('1102', '237', '29', '2', null);
INSERT INTO `respuestas` VALUES ('1103', '238', '29', '3', null);
INSERT INTO `respuestas` VALUES ('1104', '239', '29', '5', null);
INSERT INTO `respuestas` VALUES ('1105', '56', '31', '5', null);
INSERT INTO `respuestas` VALUES ('1106', '57', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1107', '58', '31', '5', null);
INSERT INTO `respuestas` VALUES ('1108', '59', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1109', '60', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1110', '61', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1111', '62', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1112', '63', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1113', '64', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1114', '65', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1115', '66', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1116', '67', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1117', '68', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1118', '69', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1119', '70', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1120', '71', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1121', '72', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1122', '73', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1123', '74', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1124', '75', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1125', '76', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1126', '77', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1127', '78', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1128', '79', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1129', '80', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1130', '81', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1131', '82', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1132', '95', '31', '5', '727');
INSERT INTO `respuestas` VALUES ('1133', '96', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1134', '97', '31', '5', '727');
INSERT INTO `respuestas` VALUES ('1135', '98', '31', '5', '727');
INSERT INTO `respuestas` VALUES ('1136', '99', '31', '5', '727');
INSERT INTO `respuestas` VALUES ('1137', '100', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1138', '101', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1139', '102', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1140', '103', '31', '5', '727');
INSERT INTO `respuestas` VALUES ('1141', '104', '31', '5', '727');
INSERT INTO `respuestas` VALUES ('1142', '105', '31', '5', '727');
INSERT INTO `respuestas` VALUES ('1143', '106', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1144', '121', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1145', '122', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1146', '123', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1147', '129', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1148', '130', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1149', '131', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1150', '132', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1151', '133', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1152', '134', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1153', '135', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1154', '136', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1155', '137', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1156', '138', '31', '3', '727');
INSERT INTO `respuestas` VALUES ('1157', '139', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1158', '140', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1159', '141', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1160', '142', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1161', '21', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1162', '143', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1163', '144', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1164', '145', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1165', '146', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1166', '147', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1167', '27', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1168', '152', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1169', '153', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1170', '154', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1171', '155', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1172', '156', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1173', '157', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1174', '158', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1175', '159', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1176', '160', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1177', '161', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1178', '162', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1179', '163', '31', '3', '727');
INSERT INTO `respuestas` VALUES ('1180', '164', '31', '3', '727');
INSERT INTO `respuestas` VALUES ('1181', '165', '31', '3', '727');
INSERT INTO `respuestas` VALUES ('1182', '166', '31', '3', '727');
INSERT INTO `respuestas` VALUES ('1183', '167', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1184', '168', '31', '3', '727');
INSERT INTO `respuestas` VALUES ('1185', '169', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1186', '170', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1187', '171', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1188', '172', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1189', '173', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1190', '174', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1191', '175', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1192', '176', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1193', '177', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1194', '178', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1195', '179', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1196', '180', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1197', '181', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1198', '182', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1199', '183', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1200', '184', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1201', '185', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1202', '186', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1203', '187', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1204', '188', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1205', '189', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1206', '190', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1207', '191', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1208', '192', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1209', '193', '31', '5', null);
INSERT INTO `respuestas` VALUES ('1210', '194', '31', '5', null);
INSERT INTO `respuestas` VALUES ('1211', '195', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1212', '196', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1213', '197', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1214', '198', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1215', '199', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1216', '200', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1217', '201', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1218', '202', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1219', '203', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1220', '204', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1221', '205', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1222', '206', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1223', '207', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1224', '208', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1225', '209', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1226', '210', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1227', '211', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1228', '215', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1229', '216', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1230', '217', '31', '5', null);
INSERT INTO `respuestas` VALUES ('1231', '218', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1232', '219', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1233', '220', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1234', '221', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1235', '44', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1236', '229', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1237', '230', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1238', '231', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1239', '232', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1240', '233', '31', '3', null);
INSERT INTO `respuestas` VALUES ('1241', '234', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1242', '235', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1243', '236', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1244', '237', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1245', '238', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1246', '239', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1247', '240', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1248', '241', '31', '4', '727');
INSERT INTO `respuestas` VALUES ('1249', '242', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1250', '243', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1251', '244', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1252', '245', '31', '4', null);
INSERT INTO `respuestas` VALUES ('1253', '54', '31', '5', null);
INSERT INTO `respuestas` VALUES ('1254', '56', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1255', '57', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1256', '58', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1257', '59', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1258', '60', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1259', '61', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1260', '62', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1261', '63', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1262', '77', '35', '5', null);
INSERT INTO `respuestas` VALUES ('1263', '78', '35', '5', null);
INSERT INTO `respuestas` VALUES ('1264', '79', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1265', '80', '35', '5', null);
INSERT INTO `respuestas` VALUES ('1266', '81', '35', '2', null);
INSERT INTO `respuestas` VALUES ('1267', '82', '35', '2', null);
INSERT INTO `respuestas` VALUES ('1268', '95', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1269', '96', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1270', '97', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1271', '98', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1272', '99', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1273', '100', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1274', '101', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1275', '102', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1276', '103', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1277', '104', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1278', '105', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1279', '106', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1280', '129', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1281', '130', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1282', '131', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1283', '132', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1284', '133', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1285', '134', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1286', '135', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1287', '136', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1288', '137', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1289', '138', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1290', '139', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1291', '140', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1292', '141', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1293', '142', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1294', '21', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1295', '143', '35', '3', '732');
INSERT INTO `respuestas` VALUES ('1296', '144', '35', '5', '732');
INSERT INTO `respuestas` VALUES ('1297', '145', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1298', '146', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1299', '147', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1300', '27', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1301', '163', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1302', '164', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1303', '165', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1304', '166', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1305', '167', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1306', '168', '35', '4', '732');
INSERT INTO `respuestas` VALUES ('1307', '169', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1308', '170', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1309', '171', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1310', '172', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1311', '173', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1312', '174', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1313', '175', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1314', '176', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1315', '177', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1316', '178', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1317', '179', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1318', '180', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1319', '181', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1320', '182', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1321', '183', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1322', '184', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1323', '185', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1324', '204', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1325', '205', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1326', '206', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1327', '207', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1328', '208', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1329', '209', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1330', '210', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1331', '211', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1332', '44', '35', '2', null);
INSERT INTO `respuestas` VALUES ('1333', '229', '35', '2', null);
INSERT INTO `respuestas` VALUES ('1334', '230', '35', '3', null);
INSERT INTO `respuestas` VALUES ('1335', '231', '35', '3', null);
INSERT INTO `respuestas` VALUES ('1336', '235', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1337', '236', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1338', '237', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1339', '238', '35', '0', null);
INSERT INTO `respuestas` VALUES ('1340', '239', '35', '4', null);
INSERT INTO `respuestas` VALUES ('1341', '56', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1342', '57', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1343', '58', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1344', '59', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1345', '60', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1346', '61', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1347', '62', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1348', '63', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1349', '64', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1350', '65', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1351', '66', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1352', '81', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1353', '82', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1354', '83', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1355', '84', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1356', '85', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1357', '86', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1358', '87', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1359', '88', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1360', '89', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1361', '90', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1362', '91', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1363', '92', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1364', '93', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1365', '94', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1366', '95', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1367', '96', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1368', '97', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1369', '98', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1370', '99', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1371', '100', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1372', '101', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1373', '102', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1374', '103', '36', '5', '724');
INSERT INTO `respuestas` VALUES ('1375', '104', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1376', '105', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1377', '106', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1378', '12', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1379', '107', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1380', '108', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1381', '109', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1382', '110', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1383', '111', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1384', '112', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1385', '113', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1386', '114', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1387', '115', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1388', '116', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1389', '117', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1390', '118', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1391', '119', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1392', '120', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1393', '124', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1394', '125', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1395', '126', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1396', '127', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1397', '128', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1398', '129', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1399', '130', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1400', '131', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1401', '132', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1402', '133', '36', '0', '724');
INSERT INTO `respuestas` VALUES ('1403', '134', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1404', '135', '36', '2', '724');
INSERT INTO `respuestas` VALUES ('1405', '136', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1406', '137', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1407', '138', '36', '1', '724');
INSERT INTO `respuestas` VALUES ('1408', '139', '36', '1', '724');
INSERT INTO `respuestas` VALUES ('1409', '140', '36', '2', '724');
INSERT INTO `respuestas` VALUES ('1410', '141', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1411', '142', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1412', '21', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1413', '143', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1414', '144', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1415', '25', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1416', '148', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1417', '149', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1418', '150', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1419', '151', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1420', '27', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1421', '152', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1422', '153', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1423', '154', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1424', '155', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1425', '156', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1426', '157', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1427', '158', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1428', '159', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1429', '160', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1430', '163', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1431', '164', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1432', '165', '36', '3', '724');
INSERT INTO `respuestas` VALUES ('1433', '33', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1434', '166', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1435', '167', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1436', '168', '36', '4', '724');
INSERT INTO `respuestas` VALUES ('1437', '169', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1438', '170', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1439', '171', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1440', '172', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1441', '173', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1442', '174', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1443', '175', '36', '5', null);
INSERT INTO `respuestas` VALUES ('1444', '176', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1445', '177', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1446', '178', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1447', '179', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1448', '180', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1449', '181', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1450', '182', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1451', '183', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1452', '184', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1453', '185', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1454', '204', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1455', '205', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1456', '206', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1457', '207', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1458', '208', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1459', '209', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1460', '210', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1461', '211', '36', '2', null);
INSERT INTO `respuestas` VALUES ('1462', '224', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1463', '225', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1464', '44', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1465', '229', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1466', '230', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1467', '231', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1468', '232', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1469', '233', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1470', '234', '36', '0', null);
INSERT INTO `respuestas` VALUES ('1471', '235', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1472', '236', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1473', '237', '36', '1', null);
INSERT INTO `respuestas` VALUES ('1474', '238', '36', '5', null);
INSERT INTO `respuestas` VALUES ('1475', '239', '36', '5', null);
INSERT INTO `respuestas` VALUES ('1476', '240', '36', '2', '724');
INSERT INTO `respuestas` VALUES ('1477', '241', '36', '2', '724');
INSERT INTO `respuestas` VALUES ('1478', '256', '36', '4', null);
INSERT INTO `respuestas` VALUES ('1479', '257', '36', '3', null);
INSERT INTO `respuestas` VALUES ('1480', '56', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1481', '57', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1482', '58', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1483', '59', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1484', '60', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1485', '61', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1486', '62', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1487', '63', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1488', '64', '37', '5', null);
INSERT INTO `respuestas` VALUES ('1489', '65', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1490', '66', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1491', '67', '37', '5', null);
INSERT INTO `respuestas` VALUES ('1492', '68', '37', '5', null);
INSERT INTO `respuestas` VALUES ('1493', '69', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1494', '70', '37', '5', null);
INSERT INTO `respuestas` VALUES ('1495', '71', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1496', '72', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1497', '73', '37', '5', null);
INSERT INTO `respuestas` VALUES ('1498', '74', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1499', '75', '37', '5', null);
INSERT INTO `respuestas` VALUES ('1500', '76', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1501', '77', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1502', '78', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1503', '79', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1504', '80', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1505', '81', '37', '5', null);
INSERT INTO `respuestas` VALUES ('1506', '82', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1507', '95', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1508', '96', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1509', '97', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1510', '98', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1511', '99', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1512', '100', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1513', '101', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1514', '102', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1515', '103', '37', '5', '727');
INSERT INTO `respuestas` VALUES ('1516', '104', '37', '5', '727');
INSERT INTO `respuestas` VALUES ('1517', '105', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1518', '106', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1519', '121', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1520', '122', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1521', '123', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1522', '129', '37', '3', null);
INSERT INTO `respuestas` VALUES ('1523', '130', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1524', '131', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1525', '132', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1526', '133', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1527', '134', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1528', '135', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1529', '136', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1530', '137', '37', '5', '727');
INSERT INTO `respuestas` VALUES ('1531', '138', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1532', '139', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1533', '140', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1534', '141', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1535', '142', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1536', '21', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1537', '143', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1538', '144', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1539', '145', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1540', '146', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1541', '147', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1542', '27', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1543', '152', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1544', '153', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1545', '154', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1546', '155', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1547', '156', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1548', '157', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1549', '158', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1550', '159', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1551', '160', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1552', '163', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1553', '164', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1554', '165', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1555', '166', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1556', '167', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1557', '168', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1558', '169', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1559', '170', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1560', '171', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1561', '172', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1562', '173', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1563', '174', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1564', '175', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1565', '176', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1566', '177', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1567', '178', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1568', '179', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1569', '180', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1570', '181', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1571', '182', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1572', '183', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1573', '184', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1574', '185', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1575', '186', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1576', '187', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1577', '188', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1578', '189', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1579', '190', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1580', '191', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1581', '192', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1582', '193', '37', '3', null);
INSERT INTO `respuestas` VALUES ('1583', '194', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1584', '195', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1585', '196', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1586', '197', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1587', '198', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1588', '199', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1589', '200', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1590', '201', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1591', '202', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1592', '203', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1593', '204', '37', '3', null);
INSERT INTO `respuestas` VALUES ('1594', '205', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1595', '206', '37', '3', null);
INSERT INTO `respuestas` VALUES ('1596', '207', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1597', '208', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1598', '209', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1599', '210', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1600', '211', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1601', '215', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1602', '216', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1603', '44', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1604', '229', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1605', '230', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1606', '231', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1607', '232', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1608', '233', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1609', '234', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1610', '235', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1611', '236', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1612', '237', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1613', '238', '37', '3', null);
INSERT INTO `respuestas` VALUES ('1614', '239', '37', '4', null);
INSERT INTO `respuestas` VALUES ('1615', '240', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1616', '241', '37', '4', '727');
INSERT INTO `respuestas` VALUES ('1617', '56', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1618', '57', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1619', '58', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1620', '59', '38', '3', null);
INSERT INTO `respuestas` VALUES ('1621', '60', '38', '5', '732');
INSERT INTO `respuestas` VALUES ('1622', '61', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1623', '62', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1624', '63', '38', '5', '732');
INSERT INTO `respuestas` VALUES ('1625', '77', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1626', '78', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1627', '79', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1628', '80', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1629', '81', '38', '1', null);
INSERT INTO `respuestas` VALUES ('1630', '82', '38', '2', null);
INSERT INTO `respuestas` VALUES ('1631', '95', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1632', '96', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1633', '97', '38', '2', '732');
INSERT INTO `respuestas` VALUES ('1634', '98', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1635', '99', '38', '5', '732');
INSERT INTO `respuestas` VALUES ('1636', '100', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1637', '101', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1638', '102', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1639', '103', '38', '5', '732');
INSERT INTO `respuestas` VALUES ('1640', '104', '38', '5', '732');
INSERT INTO `respuestas` VALUES ('1641', '105', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1642', '106', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1643', '129', '38', '3', null);
INSERT INTO `respuestas` VALUES ('1644', '130', '38', '3', null);
INSERT INTO `respuestas` VALUES ('1645', '131', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1646', '132', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1647', '133', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1648', '134', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1649', '135', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1650', '136', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1651', '137', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1652', '138', '38', '1', '732');
INSERT INTO `respuestas` VALUES ('1653', '139', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1654', '140', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1655', '141', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1656', '142', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1657', '21', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1658', '143', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1659', '144', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1660', '145', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1661', '146', '38', '5', '732');
INSERT INTO `respuestas` VALUES ('1662', '147', '38', '5', '732');
INSERT INTO `respuestas` VALUES ('1663', '27', '38', '2', null);
INSERT INTO `respuestas` VALUES ('1664', '161', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1665', '162', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1666', '163', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1667', '164', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1668', '165', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1669', '166', '38', '3', '732');
INSERT INTO `respuestas` VALUES ('1670', '167', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1671', '168', '38', '4', '732');
INSERT INTO `respuestas` VALUES ('1672', '169', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1673', '170', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1674', '171', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1675', '172', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1676', '173', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1677', '174', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1678', '175', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1679', '176', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1680', '177', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1681', '178', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1682', '179', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1683', '180', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1684', '181', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1685', '182', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1686', '183', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1687', '184', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1688', '185', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1689', '204', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1690', '205', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1691', '206', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1692', '207', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1693', '208', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1694', '209', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1695', '210', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1696', '211', '38', '2', null);
INSERT INTO `respuestas` VALUES ('1697', '217', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1698', '218', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1699', '219', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1700', '220', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1701', '221', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1702', '44', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1703', '229', '38', '2', null);
INSERT INTO `respuestas` VALUES ('1704', '230', '38', '2', null);
INSERT INTO `respuestas` VALUES ('1705', '231', '38', '2', null);
INSERT INTO `respuestas` VALUES ('1706', '235', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1707', '236', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1708', '237', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1709', '238', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1710', '239', '38', '5', null);
INSERT INTO `respuestas` VALUES ('1711', '242', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1712', '243', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1713', '244', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1714', '245', '38', '4', null);
INSERT INTO `respuestas` VALUES ('1715', '54', '38', '2', null);
INSERT INTO `respuestas` VALUES ('1716', '56', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1717', '57', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1718', '58', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1719', '59', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1720', '60', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1721', '61', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1722', '62', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1723', '63', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1724', '64', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1725', '65', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1726', '66', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1727', '67', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1728', '68', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1729', '69', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1730', '70', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1731', '71', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1732', '72', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1733', '73', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1734', '74', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1735', '75', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1736', '76', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1737', '77', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1738', '78', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1739', '79', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1740', '80', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1741', '81', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1742', '82', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1743', '95', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1744', '96', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1745', '97', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1746', '98', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1747', '99', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1748', '100', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1749', '101', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1750', '102', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1751', '103', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1752', '104', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1753', '105', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1754', '106', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1755', '121', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1756', '122', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1757', '123', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1758', '129', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1759', '130', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1760', '131', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1761', '132', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1762', '133', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1763', '134', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1764', '135', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1765', '136', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1766', '137', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1767', '138', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1768', '139', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1769', '140', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1770', '141', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1771', '142', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1772', '21', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1773', '143', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1774', '144', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1775', '145', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1776', '146', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1777', '147', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1778', '27', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1779', '152', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1780', '153', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1781', '154', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1782', '155', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1783', '156', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1784', '157', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1785', '158', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1786', '159', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1787', '160', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1788', '163', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1789', '164', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1790', '165', '41', '4', '727');
INSERT INTO `respuestas` VALUES ('1791', '166', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1792', '167', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1793', '168', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1794', '169', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1795', '170', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1796', '171', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1797', '172', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1798', '173', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1799', '174', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1800', '175', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1801', '176', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1802', '177', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1803', '178', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1804', '179', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1805', '180', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1806', '181', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1807', '182', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1808', '183', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1809', '184', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1810', '185', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1811', '186', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1812', '187', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1813', '188', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1814', '189', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1815', '190', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1816', '191', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1817', '192', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1818', '193', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1819', '194', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1820', '195', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1821', '196', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1822', '197', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1823', '198', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1824', '199', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1825', '200', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1826', '201', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1827', '202', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1828', '203', '41', '5', null);
INSERT INTO `respuestas` VALUES ('1829', '204', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1830', '205', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1831', '206', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1832', '207', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1833', '208', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1834', '209', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1835', '210', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1836', '211', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1837', '215', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1838', '216', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1839', '44', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1840', '229', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1841', '230', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1842', '231', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1843', '232', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1844', '233', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1845', '234', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1846', '235', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1847', '236', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1848', '237', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1849', '238', '41', '3', null);
INSERT INTO `respuestas` VALUES ('1850', '239', '41', '4', null);
INSERT INTO `respuestas` VALUES ('1851', '240', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1852', '241', '41', '3', '727');
INSERT INTO `respuestas` VALUES ('1853', '56', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1854', '57', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1855', '58', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1856', '59', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1857', '60', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1858', '61', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1859', '62', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1860', '63', '44', '5', '732');
INSERT INTO `respuestas` VALUES ('1861', '77', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1862', '78', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1863', '79', '44', '5', null);
INSERT INTO `respuestas` VALUES ('1864', '80', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1865', '81', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1866', '82', '44', '2', null);
INSERT INTO `respuestas` VALUES ('1867', '95', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1868', '96', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1869', '97', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1870', '98', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1871', '99', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1872', '100', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1873', '101', '44', '5', '732');
INSERT INTO `respuestas` VALUES ('1874', '102', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1875', '103', '44', '5', '732');
INSERT INTO `respuestas` VALUES ('1876', '104', '44', '5', '732');
INSERT INTO `respuestas` VALUES ('1877', '105', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1878', '106', '44', '2', '732');
INSERT INTO `respuestas` VALUES ('1879', '129', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1880', '130', '44', '2', null);
INSERT INTO `respuestas` VALUES ('1881', '131', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1882', '132', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1883', '133', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1884', '134', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1885', '135', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1886', '136', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1887', '137', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1888', '138', '44', '2', '732');
INSERT INTO `respuestas` VALUES ('1889', '139', '44', '1', '732');
INSERT INTO `respuestas` VALUES ('1890', '140', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1891', '141', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1892', '142', '44', '2', '732');
INSERT INTO `respuestas` VALUES ('1893', '21', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1894', '143', '44', '2', '732');
INSERT INTO `respuestas` VALUES ('1895', '144', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1896', '145', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1897', '146', '44', '2', '732');
INSERT INTO `respuestas` VALUES ('1898', '147', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1899', '27', '44', '1', null);
INSERT INTO `respuestas` VALUES ('1900', '163', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1901', '164', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1902', '165', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1903', '166', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1904', '167', '44', '3', '732');
INSERT INTO `respuestas` VALUES ('1905', '168', '44', '4', '732');
INSERT INTO `respuestas` VALUES ('1906', '169', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1907', '170', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1908', '171', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1909', '172', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1910', '173', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1911', '174', '44', '2', null);
INSERT INTO `respuestas` VALUES ('1912', '175', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1913', '176', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1914', '177', '44', '5', null);
INSERT INTO `respuestas` VALUES ('1915', '178', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1916', '179', '44', '5', null);
INSERT INTO `respuestas` VALUES ('1917', '180', '44', '0', null);
INSERT INTO `respuestas` VALUES ('1918', '181', '44', '0', null);
INSERT INTO `respuestas` VALUES ('1919', '182', '44', '0', null);
INSERT INTO `respuestas` VALUES ('1920', '183', '44', '0', null);
INSERT INTO `respuestas` VALUES ('1921', '184', '44', '0', null);
INSERT INTO `respuestas` VALUES ('1922', '185', '44', '0', null);
INSERT INTO `respuestas` VALUES ('1923', '204', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1924', '205', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1925', '206', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1926', '207', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1927', '208', '44', '2', null);
INSERT INTO `respuestas` VALUES ('1928', '209', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1929', '210', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1930', '211', '44', '1', null);
INSERT INTO `respuestas` VALUES ('1931', '44', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1932', '229', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1933', '230', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1934', '231', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1935', '235', '44', '5', null);
INSERT INTO `respuestas` VALUES ('1936', '236', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1937', '237', '44', '3', null);
INSERT INTO `respuestas` VALUES ('1938', '238', '44', '1', null);
INSERT INTO `respuestas` VALUES ('1939', '239', '44', '4', null);
INSERT INTO `respuestas` VALUES ('1940', '56', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1941', '57', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1942', '58', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1943', '59', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1944', '60', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1945', '61', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1946', '62', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1947', '63', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1948', '64', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1949', '65', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1950', '66', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1951', '81', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1952', '82', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1953', '83', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1954', '84', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1955', '85', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1956', '86', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1957', '87', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1958', '88', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1959', '89', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1960', '90', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1961', '91', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1962', '92', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1963', '93', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1964', '94', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1965', '95', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('1966', '96', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('1967', '97', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1968', '98', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1969', '99', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1970', '100', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('1971', '101', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1972', '102', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1973', '103', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1974', '104', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1975', '105', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1976', '106', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1977', '107', '45', '4', null);
INSERT INTO `respuestas` VALUES ('1978', '108', '45', '4', null);
INSERT INTO `respuestas` VALUES ('1979', '109', '45', '4', null);
INSERT INTO `respuestas` VALUES ('1980', '110', '45', '3', null);
INSERT INTO `respuestas` VALUES ('1981', '124', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1982', '125', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1983', '126', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1984', '127', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1985', '128', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1986', '129', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1987', '130', '45', '5', null);
INSERT INTO `respuestas` VALUES ('1988', '131', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1989', '132', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1990', '133', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1991', '134', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1992', '135', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1993', '136', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1994', '137', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1995', '138', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1996', '139', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1997', '140', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1998', '141', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('1999', '142', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('2000', '21', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('2001', '143', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('2002', '144', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('2003', '25', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('2004', '27', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2005', '152', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2006', '153', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2007', '154', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2008', '155', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2009', '156', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2010', '157', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2011', '158', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2012', '159', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2013', '160', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2014', '163', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('2015', '164', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('2016', '165', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('2017', '33', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2018', '166', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('2019', '167', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('2020', '168', '45', '4', '722');
INSERT INTO `respuestas` VALUES ('2021', '169', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2022', '170', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2023', '171', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2024', '172', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2025', '173', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2026', '174', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2027', '175', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2028', '176', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2029', '177', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2030', '178', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2031', '179', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2032', '180', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2033', '181', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2034', '182', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2035', '183', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2036', '184', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2037', '185', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2038', '204', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2039', '205', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2040', '206', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2041', '207', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2042', '208', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2043', '209', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2044', '210', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2045', '211', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2046', '44', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2047', '229', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2048', '230', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2049', '231', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2050', '232', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2051', '233', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2052', '234', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2053', '235', '45', '4', null);
INSERT INTO `respuestas` VALUES ('2054', '236', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2055', '237', '45', '2', null);
INSERT INTO `respuestas` VALUES ('2056', '238', '45', '3', null);
INSERT INTO `respuestas` VALUES ('2057', '239', '45', '5', null);
INSERT INTO `respuestas` VALUES ('2058', '240', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('2059', '241', '45', '5', '722');
INSERT INTO `respuestas` VALUES ('2060', '56', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2061', '57', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2062', '58', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2063', '59', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2064', '60', '46', '2', '720');
INSERT INTO `respuestas` VALUES ('2065', '61', '46', '3', '720');
INSERT INTO `respuestas` VALUES ('2066', '62', '46', '3', '720');
INSERT INTO `respuestas` VALUES ('2067', '63', '46', '3', '720');
INSERT INTO `respuestas` VALUES ('2068', '44', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2069', '229', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2070', '230', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2071', '231', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2072', '46', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2073', '47', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2074', '235', '46', '3', null);
INSERT INTO `respuestas` VALUES ('2075', '236', '46', '4', null);
INSERT INTO `respuestas` VALUES ('2076', '237', '46', '0', null);
INSERT INTO `respuestas` VALUES ('2077', '238', '46', '0', null);
INSERT INTO `respuestas` VALUES ('2078', '239', '46', '3', null);
INSERT INTO `respuestas` VALUES ('2079', '56', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2080', '57', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2081', '58', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2082', '59', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2083', '60', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2084', '61', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2085', '62', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2086', '63', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2087', '64', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2088', '65', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2089', '66', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2090', '81', '48', '2', null);
INSERT INTO `respuestas` VALUES ('2091', '82', '48', '2', null);
INSERT INTO `respuestas` VALUES ('2092', '83', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2093', '84', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2094', '85', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2095', '86', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2096', '87', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2097', '88', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2098', '89', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2099', '90', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2100', '91', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2101', '92', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2102', '93', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2103', '94', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2104', '95', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2105', '96', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2106', '97', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2107', '98', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2108', '99', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2109', '100', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2110', '101', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2111', '102', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2112', '103', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2113', '104', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2114', '105', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2115', '106', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2116', '12', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2117', '107', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2118', '108', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2119', '109', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2120', '110', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2121', '111', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2122', '112', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2123', '113', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2124', '114', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2125', '115', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2126', '116', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2127', '117', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2128', '118', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2129', '119', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2130', '120', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2131', '124', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2132', '125', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2133', '126', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2134', '127', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2135', '128', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2136', '129', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2137', '130', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2138', '131', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2139', '132', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2140', '133', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2141', '134', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2142', '135', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2143', '136', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2144', '137', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2145', '138', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2146', '139', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2147', '140', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2148', '141', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2149', '142', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2150', '21', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2151', '143', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2152', '144', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2153', '25', '48', '4', '724');
INSERT INTO `respuestas` VALUES ('2154', '148', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2155', '149', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2156', '150', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2157', '151', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2158', '27', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2159', '152', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2160', '153', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2161', '154', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2162', '155', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2163', '156', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2164', '157', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2165', '158', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2166', '159', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2167', '160', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2168', '163', '48', '3', '724');
INSERT INTO `respuestas` VALUES ('2169', '164', '48', '3', '724');
INSERT INTO `respuestas` VALUES ('2170', '165', '48', '3', '724');
INSERT INTO `respuestas` VALUES ('2171', '33', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2172', '166', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2173', '167', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2174', '168', '48', '5', '724');
INSERT INTO `respuestas` VALUES ('2175', '169', '48', '5', null);
INSERT INTO `respuestas` VALUES ('2176', '170', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2177', '171', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2178', '172', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2179', '173', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2180', '174', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2181', '175', '48', '2', null);
INSERT INTO `respuestas` VALUES ('2182', '176', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2183', '177', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2184', '178', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2185', '179', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2186', '180', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2187', '181', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2188', '182', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2189', '183', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2190', '184', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2191', '185', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2192', '204', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2193', '205', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2194', '206', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2195', '207', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2196', '208', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2197', '209', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2198', '210', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2199', '211', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2200', '224', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2201', '225', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2202', '44', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2203', '229', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2204', '230', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2205', '231', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2206', '232', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2207', '233', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2208', '234', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2209', '235', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2210', '236', '48', '3', null);
INSERT INTO `respuestas` VALUES ('2211', '237', '48', '2', null);
INSERT INTO `respuestas` VALUES ('2212', '238', '48', '2', null);
INSERT INTO `respuestas` VALUES ('2213', '239', '48', '2', null);
INSERT INTO `respuestas` VALUES ('2214', '240', '48', '3', '724');
INSERT INTO `respuestas` VALUES ('2215', '241', '48', '3', '724');
INSERT INTO `respuestas` VALUES ('2216', '256', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2217', '257', '48', '4', null);
INSERT INTO `respuestas` VALUES ('2218', '56', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2219', '57', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2220', '58', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2221', '59', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2222', '44', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2223', '229', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2224', '230', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2225', '231', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2226', '47', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2227', '235', '49', '3', null);
INSERT INTO `respuestas` VALUES ('2228', '236', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2229', '237', '49', '2', null);
INSERT INTO `respuestas` VALUES ('2230', '238', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2231', '239', '49', '4', null);
INSERT INTO `respuestas` VALUES ('2232', '56', '51', '4', null);
INSERT INTO `respuestas` VALUES ('2233', '57', '51', '4', null);
INSERT INTO `respuestas` VALUES ('2234', '58', '51', '4', null);
INSERT INTO `respuestas` VALUES ('2235', '59', '51', '2', null);
INSERT INTO `respuestas` VALUES ('2236', '60', '51', '4', '728');
INSERT INTO `respuestas` VALUES ('2237', '61', '51', '4', '728');
INSERT INTO `respuestas` VALUES ('2238', '62', '51', '2', '728');
INSERT INTO `respuestas` VALUES ('2239', '63', '51', '3', '728');
INSERT INTO `respuestas` VALUES ('2240', '44', '51', '3', null);
INSERT INTO `respuestas` VALUES ('2241', '229', '51', '2', null);
INSERT INTO `respuestas` VALUES ('2242', '230', '51', '2', null);
INSERT INTO `respuestas` VALUES ('2243', '231', '51', '2', null);
INSERT INTO `respuestas` VALUES ('2244', '47', '51', '4', null);
INSERT INTO `respuestas` VALUES ('2245', '235', '51', '2', null);
INSERT INTO `respuestas` VALUES ('2246', '236', '51', '2', null);
INSERT INTO `respuestas` VALUES ('2247', '237', '51', '0', null);
INSERT INTO `respuestas` VALUES ('2248', '238', '51', '0', null);
INSERT INTO `respuestas` VALUES ('2249', '239', '51', '4', null);
INSERT INTO `respuestas` VALUES ('2250', '56', '50', '5', null);
INSERT INTO `respuestas` VALUES ('2251', '57', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2252', '58', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2253', '59', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2254', '60', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2255', '61', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2256', '62', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2257', '63', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2258', '64', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2259', '65', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2260', '66', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2261', '81', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2262', '82', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2263', '83', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2264', '84', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2265', '85', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2266', '86', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2267', '87', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2268', '88', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2269', '89', '50', '5', null);
INSERT INTO `respuestas` VALUES ('2270', '90', '50', '5', null);
INSERT INTO `respuestas` VALUES ('2271', '91', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2272', '92', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2273', '93', '50', '5', null);
INSERT INTO `respuestas` VALUES ('2274', '94', '50', '5', null);
INSERT INTO `respuestas` VALUES ('2275', '95', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2276', '96', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2277', '97', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2278', '98', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2279', '99', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2280', '100', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2281', '101', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2282', '102', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2283', '103', '50', '5', '720');
INSERT INTO `respuestas` VALUES ('2284', '104', '50', '5', '720');
INSERT INTO `respuestas` VALUES ('2285', '105', '50', '5', '720');
INSERT INTO `respuestas` VALUES ('2286', '106', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2287', '12', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2288', '107', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2289', '108', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2290', '109', '50', '5', null);
INSERT INTO `respuestas` VALUES ('2291', '110', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2292', '111', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2293', '112', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2294', '113', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2295', '114', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2296', '115', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2297', '116', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2298', '117', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2299', '118', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2300', '119', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2301', '120', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2302', '124', '50', '5', null);
INSERT INTO `respuestas` VALUES ('2303', '125', '50', '5', null);
INSERT INTO `respuestas` VALUES ('2304', '126', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2305', '127', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2306', '128', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2307', '129', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2308', '130', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2309', '131', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2310', '132', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2311', '133', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2312', '134', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2313', '135', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2314', '136', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2315', '137', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2316', '138', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2317', '139', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2318', '140', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2319', '141', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2320', '142', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2321', '21', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2322', '143', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2323', '144', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2324', '25', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2325', '148', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2326', '149', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2327', '150', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2328', '151', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2329', '27', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2330', '152', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2331', '153', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2332', '154', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2333', '155', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2334', '156', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2335', '157', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2336', '158', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2337', '159', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2338', '160', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2339', '163', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2340', '164', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2341', '165', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2342', '33', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2343', '166', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2344', '167', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2345', '168', '50', '3', '720');
INSERT INTO `respuestas` VALUES ('2346', '169', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2347', '170', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2348', '171', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2349', '172', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2350', '173', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2351', '174', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2352', '175', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2353', '176', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2354', '177', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2355', '178', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2356', '179', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2357', '180', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2358', '181', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2359', '182', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2360', '183', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2361', '184', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2362', '185', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2363', '204', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2364', '205', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2365', '206', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2366', '207', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2367', '208', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2368', '209', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2369', '210', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2370', '211', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2371', '224', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2372', '225', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2373', '44', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2374', '229', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2375', '230', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2376', '231', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2377', '232', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2378', '233', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2379', '234', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2380', '235', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2381', '236', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2382', '237', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2383', '238', '50', '2', null);
INSERT INTO `respuestas` VALUES ('2384', '239', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2385', '240', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2386', '241', '50', '4', '720');
INSERT INTO `respuestas` VALUES ('2387', '256', '50', '3', null);
INSERT INTO `respuestas` VALUES ('2388', '257', '50', '4', null);
INSERT INTO `respuestas` VALUES ('2389', '56', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2390', '57', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2391', '58', '54', '2', null);
INSERT INTO `respuestas` VALUES ('2392', '59', '54', '2', null);
INSERT INTO `respuestas` VALUES ('2393', '60', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2394', '61', '54', '2', '732');
INSERT INTO `respuestas` VALUES ('2395', '62', '54', '2', '732');
INSERT INTO `respuestas` VALUES ('2396', '63', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2397', '77', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2398', '78', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2399', '79', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2400', '80', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2401', '81', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2402', '82', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2403', '95', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2404', '96', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2405', '97', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2406', '98', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2407', '99', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2408', '100', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2409', '101', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2410', '102', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2411', '103', '54', '5', '732');
INSERT INTO `respuestas` VALUES ('2412', '104', '54', '5', '732');
INSERT INTO `respuestas` VALUES ('2413', '105', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2414', '106', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2415', '129', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2416', '130', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2417', '131', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2418', '132', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2419', '133', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2420', '134', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2421', '135', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2422', '136', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2423', '137', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2424', '138', '54', '0', '732');
INSERT INTO `respuestas` VALUES ('2425', '139', '54', '0', '732');
INSERT INTO `respuestas` VALUES ('2426', '140', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2427', '141', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2428', '142', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2429', '21', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2430', '143', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2431', '144', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2432', '145', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2433', '146', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2434', '147', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2435', '27', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2436', '163', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2437', '164', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2438', '165', '54', '3', '732');
INSERT INTO `respuestas` VALUES ('2439', '166', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2440', '167', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2441', '168', '54', '4', '732');
INSERT INTO `respuestas` VALUES ('2442', '169', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2443', '170', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2444', '171', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2445', '172', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2446', '173', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2447', '174', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2448', '175', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2449', '176', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2450', '177', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2451', '178', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2452', '179', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2453', '180', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2454', '181', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2455', '182', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2456', '183', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2457', '184', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2458', '185', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2459', '204', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2460', '205', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2461', '206', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2462', '207', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2463', '208', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2464', '209', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2465', '210', '54', '4', null);
INSERT INTO `respuestas` VALUES ('2466', '211', '54', '0', null);
INSERT INTO `respuestas` VALUES ('2467', '44', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2468', '229', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2469', '230', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2470', '231', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2471', '235', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2472', '236', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2473', '237', '54', '2', null);
INSERT INTO `respuestas` VALUES ('2474', '238', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2475', '239', '54', '3', null);
INSERT INTO `respuestas` VALUES ('2476', '56', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2477', '57', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2478', '58', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2479', '59', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2480', '60', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2481', '61', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2482', '62', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2483', '63', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2484', '77', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2485', '78', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2486', '79', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2487', '80', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2488', '81', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2489', '82', '56', '1', null);
INSERT INTO `respuestas` VALUES ('2490', '95', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2491', '96', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2492', '97', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2493', '98', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2494', '99', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2495', '100', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2496', '101', '56', '1', '732');
INSERT INTO `respuestas` VALUES ('2497', '102', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2498', '103', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2499', '104', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2500', '105', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2501', '106', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2502', '129', '56', '2', null);
INSERT INTO `respuestas` VALUES ('2503', '130', '56', '2', null);
INSERT INTO `respuestas` VALUES ('2504', '131', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2505', '132', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2506', '133', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2507', '134', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2508', '135', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2509', '136', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2510', '137', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2511', '138', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2512', '139', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2513', '140', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2514', '141', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2515', '142', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2516', '21', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2517', '143', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2518', '144', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2519', '145', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2520', '146', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2521', '147', '56', '2', '732');
INSERT INTO `respuestas` VALUES ('2522', '27', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2523', '161', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2524', '162', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2525', '163', '56', '3', '732');
INSERT INTO `respuestas` VALUES ('2526', '164', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2527', '165', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2528', '166', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2529', '167', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2530', '168', '56', '4', '732');
INSERT INTO `respuestas` VALUES ('2531', '169', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2532', '170', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2533', '171', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2534', '172', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2535', '173', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2536', '174', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2537', '175', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2538', '176', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2539', '177', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2540', '178', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2541', '179', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2542', '180', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2543', '181', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2544', '182', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2545', '183', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2546', '184', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2547', '185', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2548', '204', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2549', '205', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2550', '206', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2551', '207', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2552', '208', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2553', '209', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2554', '210', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2555', '211', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2556', '217', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2557', '218', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2558', '219', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2559', '220', '56', '2', null);
INSERT INTO `respuestas` VALUES ('2560', '221', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2561', '44', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2562', '229', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2563', '230', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2564', '231', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2565', '235', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2566', '236', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2567', '237', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2568', '238', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2569', '239', '56', '5', null);
INSERT INTO `respuestas` VALUES ('2570', '242', '56', '3', null);
INSERT INTO `respuestas` VALUES ('2571', '243', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2572', '244', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2573', '245', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2574', '54', '56', '4', null);
INSERT INTO `respuestas` VALUES ('2575', '56', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2576', '57', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2577', '58', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2578', '59', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2579', '60', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2580', '61', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2581', '62', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2582', '63', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2583', '64', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2584', '65', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2585', '66', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2586', '81', '57', '0', null);
INSERT INTO `respuestas` VALUES ('2587', '82', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2588', '83', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2589', '84', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2590', '85', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2591', '86', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2592', '87', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2593', '88', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2594', '89', '57', '2', null);
INSERT INTO `respuestas` VALUES ('2595', '90', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2596', '91', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2597', '92', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2598', '93', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2599', '94', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2600', '95', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2601', '96', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2602', '97', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2603', '98', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2604', '99', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2605', '100', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2606', '101', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2607', '102', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2608', '103', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2609', '104', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2610', '105', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2611', '106', '57', '5', '720');
INSERT INTO `respuestas` VALUES ('2612', '12', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2613', '107', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2614', '108', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2615', '109', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2616', '110', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2617', '111', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2618', '112', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2619', '113', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2620', '114', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2621', '115', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2622', '116', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2623', '117', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2624', '118', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2625', '119', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2626', '120', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2627', '124', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2628', '125', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2629', '126', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2630', '127', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2631', '128', '57', '3', null);
INSERT INTO `respuestas` VALUES ('2632', '129', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2633', '130', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2634', '131', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2635', '132', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2636', '133', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2637', '134', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2638', '135', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2639', '136', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2640', '137', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2641', '138', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2642', '139', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2643', '140', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2644', '141', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2645', '142', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2646', '21', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2647', '143', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2648', '144', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2649', '25', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2650', '148', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2651', '149', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2652', '150', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2653', '151', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2654', '27', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2655', '152', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2656', '153', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2657', '154', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2658', '155', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2659', '156', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2660', '157', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2661', '158', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2662', '159', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2663', '160', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2664', '163', '57', '3', '720');
INSERT INTO `respuestas` VALUES ('2665', '164', '57', '3', '720');
INSERT INTO `respuestas` VALUES ('2666', '165', '57', '3', '720');
INSERT INTO `respuestas` VALUES ('2667', '33', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2668', '166', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2669', '167', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2670', '168', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2671', '169', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2672', '170', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2673', '171', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2674', '172', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2675', '173', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2676', '174', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2677', '175', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2678', '176', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2679', '177', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2680', '178', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2681', '179', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2682', '180', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2683', '181', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2684', '182', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2685', '183', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2686', '184', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2687', '185', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2688', '204', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2689', '205', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2690', '206', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2691', '207', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2692', '208', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2693', '209', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2694', '210', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2695', '211', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2696', '224', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2697', '225', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2698', '44', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2699', '229', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2700', '230', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2701', '231', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2702', '232', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2703', '233', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2704', '234', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2705', '235', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2706', '236', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2707', '237', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2708', '238', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2709', '239', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2710', '240', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2711', '241', '57', '4', '720');
INSERT INTO `respuestas` VALUES ('2712', '256', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2713', '257', '57', '4', null);
INSERT INTO `respuestas` VALUES ('2714', '56', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2715', '57', '58', '4', null);
INSERT INTO `respuestas` VALUES ('2716', '58', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2717', '59', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2718', '60', '58', '3', '724');
INSERT INTO `respuestas` VALUES ('2719', '61', '58', '3', '724');
INSERT INTO `respuestas` VALUES ('2720', '62', '58', '3', '724');
INSERT INTO `respuestas` VALUES ('2721', '63', '58', '3', '724');
INSERT INTO `respuestas` VALUES ('2722', '60', '58', '3', '725');
INSERT INTO `respuestas` VALUES ('2723', '61', '58', '3', '725');
INSERT INTO `respuestas` VALUES ('2724', '62', '58', '3', '725');
INSERT INTO `respuestas` VALUES ('2725', '63', '58', '3', '725');
INSERT INTO `respuestas` VALUES ('2726', '64', '58', '2', null);
INSERT INTO `respuestas` VALUES ('2727', '65', '58', '2', null);
INSERT INTO `respuestas` VALUES ('2728', '66', '58', '2', null);
INSERT INTO `respuestas` VALUES ('2729', '81', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2730', '82', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2731', '83', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2732', '84', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2733', '85', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2734', '86', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2735', '87', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2736', '88', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2737', '89', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2738', '90', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2739', '91', '58', '3', null);
INSERT INTO `respuestas` VALUES ('2740', '92', '58', '4', null);
INSERT INTO `respuestas` VALUES ('2741', '93', '58', '4', null);
INSERT INTO `respuestas` VALUES ('2742', '94', '58', '4', null);
INSERT INTO `respuestas` VALUES ('2743', '95', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2744', '96', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2745', '97', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2746', '98', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2747', '99', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2748', '100', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2749', '101', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2750', '102', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2751', '103', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2752', '104', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2753', '105', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2754', '106', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2755', '95', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2756', '96', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2757', '97', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2758', '98', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2759', '99', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2760', '100', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2761', '101', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2762', '102', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2763', '103', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2764', '104', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2765', '105', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2766', '106', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2767', '12', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2768', '107', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2769', '108', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2770', '109', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2771', '110', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2772', '111', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2773', '112', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2774', '113', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2775', '114', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2776', '115', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2777', '116', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2778', '117', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2779', '118', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2780', '119', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2781', '120', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2782', '124', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2783', '125', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2784', '126', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2785', '127', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2786', '128', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2787', '129', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2788', '130', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2789', '131', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2790', '132', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2791', '133', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2792', '134', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2793', '135', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2794', '136', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2795', '137', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2796', '138', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2797', '139', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2798', '140', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2799', '131', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2800', '132', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2801', '133', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2802', '134', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2803', '135', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2804', '136', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2805', '137', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2806', '138', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2807', '139', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2808', '140', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2809', '141', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2810', '142', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2811', '141', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2812', '142', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2813', '21', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2814', '21', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2815', '143', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2816', '144', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2817', '143', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2818', '144', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2819', '25', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2820', '25', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2821', '148', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2822', '149', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2823', '150', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2824', '151', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2825', '27', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2826', '152', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2827', '153', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2828', '154', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2829', '155', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2830', '156', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2831', '157', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2832', '158', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2833', '159', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2834', '160', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2835', '163', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2836', '164', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2837', '165', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2838', '163', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2839', '164', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2840', '165', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2841', '33', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2842', '166', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2843', '167', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2844', '168', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2845', '166', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2846', '167', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2847', '168', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2848', '169', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2849', '170', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2850', '171', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2851', '172', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2852', '173', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2853', '174', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2854', '175', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2855', '176', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2856', '177', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2857', '178', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2858', '179', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2859', '180', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2860', '181', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2861', '182', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2862', '183', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2863', '184', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2864', '185', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2865', '204', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2866', '205', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2867', '206', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2868', '207', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2869', '208', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2870', '209', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2871', '210', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2872', '211', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2873', '224', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2874', '225', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2875', '44', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2876', '229', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2877', '230', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2878', '231', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2879', '232', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2880', '233', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2881', '234', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2882', '235', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2883', '236', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2884', '237', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2885', '238', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2886', '239', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2887', '240', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2888', '241', '58', '5', '724');
INSERT INTO `respuestas` VALUES ('2889', '240', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2890', '241', '58', '5', '725');
INSERT INTO `respuestas` VALUES ('2891', '256', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2892', '257', '58', '5', null);
INSERT INTO `respuestas` VALUES ('2893', '56', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2894', '57', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2895', '58', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2896', '59', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2897', '60', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2898', '61', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2899', '62', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2900', '63', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2901', '64', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2902', '65', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2903', '66', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2904', '81', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2905', '82', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2906', '83', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2907', '84', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2908', '85', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2909', '86', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2910', '87', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2911', '88', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2912', '89', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2913', '90', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2914', '91', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2915', '92', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2916', '93', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2917', '94', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2918', '95', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2919', '96', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2920', '97', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2921', '98', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2922', '99', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2923', '100', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2924', '101', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2925', '102', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2926', '103', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2927', '104', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2928', '105', '59', '3', '720');
INSERT INTO `respuestas` VALUES ('2929', '106', '59', '3', '720');
INSERT INTO `respuestas` VALUES ('2930', '12', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2931', '107', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2932', '108', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2933', '109', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2934', '110', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2935', '111', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2936', '112', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2937', '113', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2938', '114', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2939', '115', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2940', '116', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2941', '117', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2942', '118', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2943', '119', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2944', '120', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2945', '124', '59', '2', null);
INSERT INTO `respuestas` VALUES ('2946', '125', '59', '2', null);
INSERT INTO `respuestas` VALUES ('2947', '126', '59', '2', null);
INSERT INTO `respuestas` VALUES ('2948', '127', '59', '2', null);
INSERT INTO `respuestas` VALUES ('2949', '128', '59', '2', null);
INSERT INTO `respuestas` VALUES ('2950', '129', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2951', '130', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2952', '131', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2953', '132', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2954', '133', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2955', '134', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2956', '135', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2957', '136', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2958', '137', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2959', '138', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2960', '139', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2961', '140', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2962', '141', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2963', '142', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2964', '21', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2965', '143', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2966', '144', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2967', '25', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2968', '148', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2969', '149', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2970', '150', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2971', '151', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2972', '27', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2973', '152', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2974', '153', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2975', '154', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2976', '155', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2977', '156', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2978', '157', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2979', '158', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2980', '159', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2981', '160', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2982', '163', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2983', '164', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2984', '165', '59', '4', '720');
INSERT INTO `respuestas` VALUES ('2985', '33', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2986', '166', '59', '3', '720');
INSERT INTO `respuestas` VALUES ('2987', '167', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2988', '168', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('2989', '169', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2990', '170', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2991', '171', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2992', '172', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2993', '173', '59', '3', null);
INSERT INTO `respuestas` VALUES ('2994', '174', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2995', '175', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2996', '176', '59', '4', null);
INSERT INTO `respuestas` VALUES ('2997', '177', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2998', '178', '59', '5', null);
INSERT INTO `respuestas` VALUES ('2999', '179', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3000', '180', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3001', '181', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3002', '182', '59', '5', null);
INSERT INTO `respuestas` VALUES ('3003', '183', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3004', '184', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3005', '185', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3006', '204', '59', '3', null);
INSERT INTO `respuestas` VALUES ('3007', '205', '59', '3', null);
INSERT INTO `respuestas` VALUES ('3008', '206', '59', '3', null);
INSERT INTO `respuestas` VALUES ('3009', '207', '59', '3', null);
INSERT INTO `respuestas` VALUES ('3010', '208', '59', '3', null);
INSERT INTO `respuestas` VALUES ('3011', '209', '59', '3', null);
INSERT INTO `respuestas` VALUES ('3012', '210', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3013', '211', '59', '2', null);
INSERT INTO `respuestas` VALUES ('3014', '224', '59', '5', null);
INSERT INTO `respuestas` VALUES ('3015', '225', '59', '5', null);
INSERT INTO `respuestas` VALUES ('3016', '44', '59', '5', null);
INSERT INTO `respuestas` VALUES ('3017', '229', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3018', '230', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3019', '231', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3020', '232', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3021', '233', '59', '2', null);
INSERT INTO `respuestas` VALUES ('3022', '234', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3023', '235', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3024', '236', '59', '3', null);
INSERT INTO `respuestas` VALUES ('3025', '237', '59', '3', null);
INSERT INTO `respuestas` VALUES ('3026', '238', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3027', '239', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3028', '240', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('3029', '241', '59', '5', '720');
INSERT INTO `respuestas` VALUES ('3030', '256', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3031', '257', '59', '4', null);
INSERT INTO `respuestas` VALUES ('3032', '56', '60', '5', null);
INSERT INTO `respuestas` VALUES ('3033', '57', '60', '5', null);
INSERT INTO `respuestas` VALUES ('3034', '58', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3035', '59', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3036', '60', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3037', '61', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3038', '62', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3039', '63', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3040', '64', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3041', '65', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3042', '66', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3043', '81', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3044', '82', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3045', '83', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3046', '84', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3047', '85', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3048', '86', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3049', '87', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3050', '88', '60', '5', null);
INSERT INTO `respuestas` VALUES ('3051', '89', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3052', '90', '60', '5', null);
INSERT INTO `respuestas` VALUES ('3053', '91', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3054', '92', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3055', '93', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3056', '94', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3057', '95', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3058', '96', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3059', '97', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3060', '98', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3061', '99', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3062', '100', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3063', '101', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3064', '102', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3065', '103', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3066', '104', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3067', '105', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3068', '106', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3069', '12', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3070', '107', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3071', '108', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3072', '109', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3073', '110', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3074', '111', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3075', '112', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3076', '113', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3077', '114', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3078', '115', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3079', '116', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3080', '117', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3081', '118', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3082', '119', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3083', '120', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3084', '124', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3085', '125', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3086', '126', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3087', '127', '60', '1', null);
INSERT INTO `respuestas` VALUES ('3088', '128', '60', '1', null);
INSERT INTO `respuestas` VALUES ('3089', '129', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3090', '130', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3091', '131', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3092', '132', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3093', '133', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3094', '134', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3095', '135', '60', '3', '720');
INSERT INTO `respuestas` VALUES ('3096', '136', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3097', '137', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3098', '138', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3099', '139', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3100', '140', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3101', '141', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3102', '142', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3103', '21', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3104', '143', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3105', '144', '60', '5', '720');
INSERT INTO `respuestas` VALUES ('3106', '25', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3107', '148', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3108', '149', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3109', '150', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3110', '151', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3111', '27', '60', '5', null);
INSERT INTO `respuestas` VALUES ('3112', '152', '60', '5', null);
INSERT INTO `respuestas` VALUES ('3113', '153', '60', '5', null);
INSERT INTO `respuestas` VALUES ('3114', '154', '60', '5', null);
INSERT INTO `respuestas` VALUES ('3115', '155', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3116', '156', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3117', '157', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3118', '158', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3119', '159', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3120', '160', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3121', '163', '60', '3', '720');
INSERT INTO `respuestas` VALUES ('3122', '164', '60', '2', '720');
INSERT INTO `respuestas` VALUES ('3123', '165', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3124', '33', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3125', '166', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3126', '167', '60', '3', '720');
INSERT INTO `respuestas` VALUES ('3127', '168', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3128', '169', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3129', '170', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3130', '171', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3131', '172', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3132', '173', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3133', '174', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3134', '175', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3135', '176', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3136', '177', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3137', '178', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3138', '179', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3139', '180', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3140', '181', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3141', '182', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3142', '183', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3143', '184', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3144', '185', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3145', '204', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3146', '205', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3147', '206', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3148', '207', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3149', '208', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3150', '209', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3151', '210', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3152', '211', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3153', '224', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3154', '225', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3155', '44', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3156', '229', '60', '0', null);
INSERT INTO `respuestas` VALUES ('3157', '230', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3158', '231', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3159', '232', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3160', '233', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3161', '234', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3162', '235', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3163', '236', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3164', '237', '60', '4', null);
INSERT INTO `respuestas` VALUES ('3165', '238', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3166', '239', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3167', '240', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3168', '241', '60', '4', '720');
INSERT INTO `respuestas` VALUES ('3169', '256', '60', '2', null);
INSERT INTO `respuestas` VALUES ('3170', '257', '60', '3', null);
INSERT INTO `respuestas` VALUES ('3171', '56', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3172', '57', '63', '2', null);
INSERT INTO `respuestas` VALUES ('3173', '58', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3174', '59', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3175', '60', '63', '4', '732');
INSERT INTO `respuestas` VALUES ('3176', '61', '63', '2', '732');
INSERT INTO `respuestas` VALUES ('3177', '62', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3178', '63', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3179', '77', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3180', '78', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3181', '79', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3182', '80', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3183', '81', '63', '0', null);
INSERT INTO `respuestas` VALUES ('3184', '82', '63', '0', null);
INSERT INTO `respuestas` VALUES ('3185', '95', '63', '4', '732');
INSERT INTO `respuestas` VALUES ('3186', '96', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3187', '97', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3188', '98', '63', '4', '732');
INSERT INTO `respuestas` VALUES ('3189', '99', '63', '4', '732');
INSERT INTO `respuestas` VALUES ('3190', '100', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3191', '101', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3192', '102', '63', '4', '732');
INSERT INTO `respuestas` VALUES ('3193', '103', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3194', '104', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3195', '105', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3196', '106', '63', '4', '732');
INSERT INTO `respuestas` VALUES ('3197', '129', '63', '3', null);
INSERT INTO `respuestas` VALUES ('3198', '130', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3199', '131', '63', '2', '732');
INSERT INTO `respuestas` VALUES ('3200', '132', '63', '2', '732');
INSERT INTO `respuestas` VALUES ('3201', '133', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3202', '134', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3203', '135', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3204', '136', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3205', '137', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3206', '138', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3207', '139', '63', '1', '732');
INSERT INTO `respuestas` VALUES ('3208', '140', '63', '4', '732');
INSERT INTO `respuestas` VALUES ('3209', '141', '63', '2', '732');
INSERT INTO `respuestas` VALUES ('3210', '142', '63', '1', '732');
INSERT INTO `respuestas` VALUES ('3211', '21', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3212', '143', '63', '2', '732');
INSERT INTO `respuestas` VALUES ('3213', '144', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3214', '145', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3215', '146', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3216', '147', '63', '3', '732');
INSERT INTO `respuestas` VALUES ('3217', '27', '63', '0', null);
INSERT INTO `respuestas` VALUES ('3218', '163', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3219', '164', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3220', '165', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3221', '166', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3222', '167', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3223', '168', '63', '5', '732');
INSERT INTO `respuestas` VALUES ('3224', '169', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3225', '170', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3226', '171', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3227', '172', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3228', '173', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3229', '174', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3230', '175', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3231', '176', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3232', '177', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3233', '178', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3234', '179', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3235', '180', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3236', '181', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3237', '182', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3238', '183', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3239', '184', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3240', '185', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3241', '204', '63', '3', null);
INSERT INTO `respuestas` VALUES ('3242', '205', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3243', '206', '63', '0', null);
INSERT INTO `respuestas` VALUES ('3244', '207', '63', '3', null);
INSERT INTO `respuestas` VALUES ('3245', '208', '63', '3', null);
INSERT INTO `respuestas` VALUES ('3246', '209', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3247', '210', '63', '0', null);
INSERT INTO `respuestas` VALUES ('3248', '211', '63', '0', null);
INSERT INTO `respuestas` VALUES ('3249', '44', '63', '3', null);
INSERT INTO `respuestas` VALUES ('3250', '229', '63', '3', null);
INSERT INTO `respuestas` VALUES ('3251', '230', '63', '3', null);
INSERT INTO `respuestas` VALUES ('3252', '231', '63', '5', null);
INSERT INTO `respuestas` VALUES ('3253', '235', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3254', '236', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3255', '237', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3256', '238', '63', '0', null);
INSERT INTO `respuestas` VALUES ('3257', '239', '63', '4', null);
INSERT INTO `respuestas` VALUES ('3258', '56', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3259', '57', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3260', '58', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3261', '59', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3262', '60', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3263', '61', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3264', '62', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3265', '63', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3266', '77', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3267', '78', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3268', '79', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3269', '80', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3270', '81', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3271', '82', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3272', '95', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3273', '96', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3274', '97', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3275', '98', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3276', '99', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3277', '100', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3278', '101', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3279', '102', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3280', '103', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3281', '104', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3282', '105', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3283', '106', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3284', '129', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3285', '130', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3286', '131', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3287', '132', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3288', '133', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3289', '134', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3290', '135', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3291', '136', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3292', '137', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3293', '138', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3294', '139', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3295', '140', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3296', '141', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3297', '142', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3298', '21', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3299', '143', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3300', '144', '64', '1', '732');
INSERT INTO `respuestas` VALUES ('3301', '145', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3302', '146', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3303', '147', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3304', '27', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3305', '163', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3306', '164', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3307', '165', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3308', '166', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3309', '167', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3310', '168', '64', '5', '732');
INSERT INTO `respuestas` VALUES ('3311', '169', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3312', '170', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3313', '171', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3314', '172', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3315', '173', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3316', '174', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3317', '175', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3318', '176', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3319', '177', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3320', '178', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3321', '179', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3322', '180', '64', '0', null);
INSERT INTO `respuestas` VALUES ('3323', '181', '64', '0', null);
INSERT INTO `respuestas` VALUES ('3324', '182', '64', '0', null);
INSERT INTO `respuestas` VALUES ('3325', '183', '64', '0', null);
INSERT INTO `respuestas` VALUES ('3326', '184', '64', '0', null);
INSERT INTO `respuestas` VALUES ('3327', '185', '64', '0', null);
INSERT INTO `respuestas` VALUES ('3328', '204', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3329', '205', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3330', '206', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3331', '207', '64', '1', null);
INSERT INTO `respuestas` VALUES ('3332', '208', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3333', '209', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3334', '210', '64', '0', null);
INSERT INTO `respuestas` VALUES ('3335', '211', '64', '0', null);
INSERT INTO `respuestas` VALUES ('3336', '44', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3337', '229', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3338', '230', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3339', '231', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3340', '235', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3341', '236', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3342', '237', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3343', '238', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3344', '239', '64', '5', null);
INSERT INTO `respuestas` VALUES ('3345', '56', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3346', '57', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3347', '58', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3348', '59', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3349', '60', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3350', '61', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3351', '62', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3352', '63', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3353', '77', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3354', '78', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3355', '79', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3356', '80', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3357', '81', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3358', '82', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3359', '95', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3360', '96', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3361', '97', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3362', '98', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3363', '99', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3364', '100', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3365', '101', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3366', '102', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3367', '103', '66', '5', '732');
INSERT INTO `respuestas` VALUES ('3368', '104', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3369', '105', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3370', '106', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3371', '129', '66', '5', null);
INSERT INTO `respuestas` VALUES ('3372', '130', '66', '5', null);
INSERT INTO `respuestas` VALUES ('3373', '131', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3374', '132', '66', '5', '732');
INSERT INTO `respuestas` VALUES ('3375', '133', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3376', '134', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3377', '135', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3378', '136', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3379', '137', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3380', '138', '66', '0', '732');
INSERT INTO `respuestas` VALUES ('3381', '139', '66', '0', '732');
INSERT INTO `respuestas` VALUES ('3382', '140', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3383', '141', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3384', '142', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3385', '21', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3386', '143', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3387', '144', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3388', '145', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3389', '146', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3390', '147', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3391', '27', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3392', '163', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3393', '164', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3394', '165', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3395', '166', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3396', '167', '66', '3', '732');
INSERT INTO `respuestas` VALUES ('3397', '168', '66', '4', '732');
INSERT INTO `respuestas` VALUES ('3398', '169', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3399', '170', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3400', '171', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3401', '172', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3402', '173', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3403', '174', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3404', '175', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3405', '176', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3406', '177', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3407', '178', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3408', '179', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3409', '180', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3410', '181', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3411', '182', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3412', '183', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3413', '184', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3414', '185', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3415', '204', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3416', '205', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3417', '206', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3418', '207', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3419', '208', '66', '2', null);
INSERT INTO `respuestas` VALUES ('3420', '209', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3421', '210', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3422', '211', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3423', '44', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3424', '229', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3425', '230', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3426', '231', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3427', '235', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3428', '236', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3429', '237', '66', '4', null);
INSERT INTO `respuestas` VALUES ('3430', '238', '66', '0', null);
INSERT INTO `respuestas` VALUES ('3431', '239', '66', '3', null);
INSERT INTO `respuestas` VALUES ('3432', '56', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3433', '57', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3434', '58', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3435', '59', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3436', '60', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3437', '61', '67', '2', '732');
INSERT INTO `respuestas` VALUES ('3438', '62', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3439', '63', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3440', '77', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3441', '78', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3442', '79', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3443', '80', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3444', '81', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3445', '82', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3446', '95', '67', '5', '732');
INSERT INTO `respuestas` VALUES ('3447', '96', '67', '5', '732');
INSERT INTO `respuestas` VALUES ('3448', '97', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3449', '98', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3450', '99', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3451', '100', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3452', '101', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3453', '102', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3454', '103', '67', '5', '732');
INSERT INTO `respuestas` VALUES ('3455', '104', '67', '5', '732');
INSERT INTO `respuestas` VALUES ('3456', '105', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3457', '106', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3458', '129', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3459', '130', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3460', '131', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3461', '132', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3462', '133', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3463', '134', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3464', '135', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3465', '136', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3466', '137', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3467', '138', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3468', '139', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3469', '140', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3470', '141', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3471', '142', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3472', '21', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3473', '143', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3474', '144', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3475', '145', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3476', '146', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3477', '147', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3478', '27', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3479', '163', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3480', '164', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3481', '165', '67', '3', '732');
INSERT INTO `respuestas` VALUES ('3482', '166', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3483', '167', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3484', '168', '67', '4', '732');
INSERT INTO `respuestas` VALUES ('3485', '169', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3486', '170', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3487', '171', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3488', '172', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3489', '173', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3490', '174', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3491', '175', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3492', '176', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3493', '177', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3494', '178', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3495', '179', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3496', '180', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3497', '181', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3498', '182', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3499', '183', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3500', '184', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3501', '185', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3502', '204', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3503', '205', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3504', '206', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3505', '207', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3506', '208', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3507', '209', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3508', '210', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3509', '211', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3510', '44', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3511', '229', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3512', '230', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3513', '231', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3514', '235', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3515', '236', '67', '4', null);
INSERT INTO `respuestas` VALUES ('3516', '237', '67', '3', null);
INSERT INTO `respuestas` VALUES ('3517', '238', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3518', '239', '67', '5', null);
INSERT INTO `respuestas` VALUES ('3519', '56', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3520', '57', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3521', '58', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3522', '59', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3523', '60', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3524', '61', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3525', '62', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3526', '63', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3527', '64', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3528', '65', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3529', '66', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3530', '67', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3531', '68', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3532', '69', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3533', '70', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3534', '71', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3535', '72', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3536', '73', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3537', '74', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3538', '75', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3539', '76', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3540', '77', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3541', '78', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3542', '79', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3543', '80', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3544', '81', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3545', '82', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3546', '95', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3547', '96', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3548', '97', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3549', '98', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3550', '99', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3551', '100', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3552', '101', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3553', '102', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3554', '103', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3555', '104', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3556', '105', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3557', '106', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3558', '121', '70', '4', '720');
INSERT INTO `respuestas` VALUES ('3559', '122', '70', '4', '720');
INSERT INTO `respuestas` VALUES ('3560', '123', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3561', '129', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3562', '130', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3563', '131', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3564', '132', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3565', '133', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3566', '134', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3567', '135', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3568', '136', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3569', '137', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3570', '138', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3571', '139', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3572', '140', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3573', '141', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3574', '142', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3575', '21', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3576', '143', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3577', '144', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3578', '145', '70', '4', '720');
INSERT INTO `respuestas` VALUES ('3579', '146', '70', '4', '720');
INSERT INTO `respuestas` VALUES ('3580', '147', '70', '4', '720');
INSERT INTO `respuestas` VALUES ('3581', '27', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3582', '152', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3583', '153', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3584', '154', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3585', '155', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3586', '156', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3587', '157', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3588', '158', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3589', '159', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3590', '160', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3591', '161', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3592', '162', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3593', '31', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3594', '163', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3595', '164', '70', '4', '720');
INSERT INTO `respuestas` VALUES ('3596', '165', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3597', '166', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3598', '167', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3599', '168', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3600', '169', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3601', '170', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3602', '171', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3603', '172', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3604', '173', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3605', '174', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3606', '175', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3607', '176', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3608', '177', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3609', '178', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3610', '179', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3611', '180', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3612', '181', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3613', '182', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3614', '183', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3615', '184', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3616', '185', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3617', '186', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3618', '187', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3619', '188', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3620', '189', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3621', '190', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3622', '191', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3623', '192', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3624', '193', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3625', '194', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3626', '195', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3627', '196', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3628', '197', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3629', '198', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3630', '199', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3631', '200', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3632', '201', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3633', '202', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3634', '203', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3635', '204', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3636', '205', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3637', '206', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3638', '207', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3639', '208', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3640', '209', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3641', '210', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3642', '211', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3643', '215', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3644', '216', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3645', '44', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3646', '229', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3647', '230', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3648', '231', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3649', '232', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3650', '233', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3651', '234', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3652', '235', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3653', '236', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3654', '237', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3655', '238', '70', '3', null);
INSERT INTO `respuestas` VALUES ('3656', '239', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3657', '240', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3658', '241', '70', '5', '720');
INSERT INTO `respuestas` VALUES ('3659', '246', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3660', '247', '70', '4', null);
INSERT INTO `respuestas` VALUES ('3661', '248', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3662', '249', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3663', '250', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3664', '251', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3665', '252', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3666', '253', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3667', '254', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3668', '255', '70', '5', null);
INSERT INTO `respuestas` VALUES ('3669', '56', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3670', '57', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3671', '58', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3672', '59', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3673', '60', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3674', '61', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3675', '62', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3676', '63', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3677', '77', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3678', '78', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3679', '79', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3680', '80', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3681', '81', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3682', '82', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3683', '95', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3684', '96', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3685', '97', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3686', '98', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3687', '99', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3688', '100', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3689', '101', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3690', '102', '71', '5', '732');
INSERT INTO `respuestas` VALUES ('3691', '103', '71', '5', '732');
INSERT INTO `respuestas` VALUES ('3692', '104', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3693', '105', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3694', '106', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3695', '129', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3696', '130', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3697', '131', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3698', '132', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3699', '133', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3700', '134', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3701', '135', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3702', '136', '71', '5', '732');
INSERT INTO `respuestas` VALUES ('3703', '137', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3704', '138', '71', '4', '732');
INSERT INTO `respuestas` VALUES ('3705', '139', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3706', '140', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3707', '141', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3708', '142', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3709', '21', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3710', '143', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3711', '144', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3712', '145', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3713', '146', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3714', '147', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3715', '27', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3716', '163', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3717', '164', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3718', '165', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3719', '166', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3720', '167', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3721', '168', '71', '3', '732');
INSERT INTO `respuestas` VALUES ('3722', '169', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3723', '170', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3724', '171', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3725', '172', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3726', '173', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3727', '174', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3728', '175', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3729', '176', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3730', '177', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3731', '178', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3732', '179', '71', '5', null);
INSERT INTO `respuestas` VALUES ('3733', '180', '71', '0', null);
INSERT INTO `respuestas` VALUES ('3734', '181', '71', '0', null);
INSERT INTO `respuestas` VALUES ('3735', '182', '71', '0', null);
INSERT INTO `respuestas` VALUES ('3736', '183', '71', '0', null);
INSERT INTO `respuestas` VALUES ('3737', '184', '71', '0', null);
INSERT INTO `respuestas` VALUES ('3738', '185', '71', '0', null);
INSERT INTO `respuestas` VALUES ('3739', '204', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3740', '205', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3741', '206', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3742', '207', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3743', '208', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3744', '209', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3745', '210', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3746', '211', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3747', '44', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3748', '229', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3749', '230', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3750', '231', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3751', '235', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3752', '236', '71', '3', null);
INSERT INTO `respuestas` VALUES ('3753', '237', '71', '4', null);
INSERT INTO `respuestas` VALUES ('3754', '238', '71', '4', null);
INSERT INTO `respuestas` VALUES ('3755', '239', '71', '4', null);
INSERT INTO `respuestas` VALUES ('3756', '56', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3757', '57', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3758', '58', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3759', '59', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3760', '60', '72', '3', '720');
INSERT INTO `respuestas` VALUES ('3761', '61', '72', '2', '720');
INSERT INTO `respuestas` VALUES ('3762', '62', '72', '3', '720');
INSERT INTO `respuestas` VALUES ('3763', '63', '72', '2', '720');
INSERT INTO `respuestas` VALUES ('3764', '60', '72', '2', '732');
INSERT INTO `respuestas` VALUES ('3765', '61', '72', '2', '732');
INSERT INTO `respuestas` VALUES ('3766', '62', '72', '2', '732');
INSERT INTO `respuestas` VALUES ('3767', '63', '72', '2', '732');
INSERT INTO `respuestas` VALUES ('3768', '60', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3769', '61', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3770', '62', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3771', '63', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3772', '60', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3773', '61', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3774', '62', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3775', '63', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3776', '64', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3777', '65', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3778', '66', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3779', '67', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3780', '68', '72', '4', null);
INSERT INTO `respuestas` VALUES ('3781', '69', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3782', '70', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3783', '71', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3784', '72', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3785', '73', '72', '4', null);
INSERT INTO `respuestas` VALUES ('3786', '74', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3787', '75', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3788', '76', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3789', '77', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3790', '78', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3791', '79', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3792', '80', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3793', '81', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3794', '82', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3795', '83', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3796', '84', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3797', '85', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3798', '86', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3799', '87', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3800', '88', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3801', '89', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3802', '90', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3803', '91', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3804', '92', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3805', '93', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3806', '94', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3807', '95', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3808', '96', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3809', '97', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3810', '98', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3811', '99', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3812', '100', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3813', '101', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3814', '102', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3815', '103', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3816', '104', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3817', '105', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3818', '106', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3819', '95', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3820', '96', '72', '2', '732');
INSERT INTO `respuestas` VALUES ('3821', '97', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3822', '98', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3823', '99', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3824', '100', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3825', '101', '72', '4', '732');
INSERT INTO `respuestas` VALUES ('3826', '102', '72', '4', '732');
INSERT INTO `respuestas` VALUES ('3827', '103', '72', '5', '732');
INSERT INTO `respuestas` VALUES ('3828', '104', '72', '5', '732');
INSERT INTO `respuestas` VALUES ('3829', '105', '72', '1', '732');
INSERT INTO `respuestas` VALUES ('3830', '106', '72', '1', '732');
INSERT INTO `respuestas` VALUES ('3831', '95', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3832', '96', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3833', '97', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3834', '98', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3835', '99', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3836', '100', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3837', '101', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3838', '102', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3839', '103', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3840', '104', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3841', '105', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3842', '106', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3843', '95', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3844', '96', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3845', '97', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3846', '98', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3847', '99', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3848', '100', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3849', '101', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3850', '102', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3851', '103', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3852', '104', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3853', '105', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3854', '106', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3855', '12', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3856', '107', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3857', '108', '72', '0', null);
INSERT INTO `respuestas` VALUES ('3858', '109', '72', '0', null);
INSERT INTO `respuestas` VALUES ('3859', '110', '72', '0', null);
INSERT INTO `respuestas` VALUES ('3860', '111', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3861', '112', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3862', '113', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3863', '114', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3864', '115', '72', '1', null);
INSERT INTO `respuestas` VALUES ('3865', '121', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3866', '122', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3867', '123', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3868', '129', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3869', '130', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3870', '131', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3871', '132', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3872', '133', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3873', '134', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3874', '135', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3875', '136', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3876', '137', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3877', '138', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3878', '139', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3879', '140', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3880', '131', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3881', '132', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3882', '133', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3883', '134', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3884', '135', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3885', '136', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3886', '137', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3887', '138', '72', '1', '732');
INSERT INTO `respuestas` VALUES ('3888', '139', '72', '1', '732');
INSERT INTO `respuestas` VALUES ('3889', '140', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3890', '131', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3891', '132', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3892', '133', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3893', '134', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3894', '135', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3895', '136', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3896', '137', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3897', '138', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3898', '139', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3899', '140', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3900', '131', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3901', '132', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3902', '133', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3903', '134', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3904', '135', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3905', '136', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3906', '137', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3907', '138', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3908', '139', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3909', '140', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3910', '141', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3911', '142', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3912', '141', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3913', '142', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3914', '141', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3915', '142', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3916', '141', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3917', '142', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3918', '21', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3919', '21', '72', '2', '732');
INSERT INTO `respuestas` VALUES ('3920', '21', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3921', '21', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3922', '143', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3923', '144', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3924', '143', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3925', '144', '72', '4', '732');
INSERT INTO `respuestas` VALUES ('3926', '143', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3927', '144', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3928', '143', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3929', '144', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3930', '145', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3931', '146', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3932', '147', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3933', '145', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3934', '146', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3935', '147', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3936', '25', '72', '2', '732');
INSERT INTO `respuestas` VALUES ('3937', '25', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3938', '148', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3939', '149', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3940', '150', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3941', '151', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3942', '27', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3943', '152', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3944', '153', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3945', '154', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3946', '155', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3947', '156', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3948', '157', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3949', '158', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3950', '159', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3951', '160', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3952', '161', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3953', '162', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3954', '163', '72', '3', '720');
INSERT INTO `respuestas` VALUES ('3955', '164', '72', '3', '720');
INSERT INTO `respuestas` VALUES ('3956', '165', '72', '3', '720');
INSERT INTO `respuestas` VALUES ('3957', '163', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3958', '164', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3959', '165', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3960', '163', '72', '3', '729');
INSERT INTO `respuestas` VALUES ('3961', '164', '72', '3', '729');
INSERT INTO `respuestas` VALUES ('3962', '165', '72', '3', '729');
INSERT INTO `respuestas` VALUES ('3963', '163', '72', '3', '728');
INSERT INTO `respuestas` VALUES ('3964', '164', '72', '3', '728');
INSERT INTO `respuestas` VALUES ('3965', '165', '72', '3', '728');
INSERT INTO `respuestas` VALUES ('3966', '33', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3967', '166', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3968', '167', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3969', '168', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('3970', '166', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3971', '167', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3972', '168', '72', '3', '732');
INSERT INTO `respuestas` VALUES ('3973', '166', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3974', '167', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3975', '168', '72', '0', '729');
INSERT INTO `respuestas` VALUES ('3976', '166', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3977', '167', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3978', '168', '72', '0', '728');
INSERT INTO `respuestas` VALUES ('3979', '169', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3980', '170', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3981', '171', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3982', '172', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3983', '173', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3984', '174', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3985', '175', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3986', '176', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3987', '177', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3988', '178', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3989', '179', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3990', '180', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3991', '181', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3992', '182', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3993', '183', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3994', '184', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3995', '185', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3996', '186', '72', '3', null);
INSERT INTO `respuestas` VALUES ('3997', '187', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3998', '188', '72', '2', null);
INSERT INTO `respuestas` VALUES ('3999', '189', '72', '5', null);
INSERT INTO `respuestas` VALUES ('4000', '190', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4001', '191', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4002', '192', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4003', '193', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4004', '194', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4005', '195', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4006', '196', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4007', '197', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4008', '198', '72', '5', null);
INSERT INTO `respuestas` VALUES ('4009', '199', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4010', '200', '72', '5', null);
INSERT INTO `respuestas` VALUES ('4011', '201', '72', '5', null);
INSERT INTO `respuestas` VALUES ('4012', '202', '72', '5', null);
INSERT INTO `respuestas` VALUES ('4013', '203', '72', '4', null);
INSERT INTO `respuestas` VALUES ('4014', '204', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4015', '205', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4016', '206', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4017', '207', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4018', '208', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4019', '209', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4020', '210', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4021', '211', '72', '1', null);
INSERT INTO `respuestas` VALUES ('4022', '212', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4023', '213', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4024', '214', '72', '1', null);
INSERT INTO `respuestas` VALUES ('4025', '215', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4026', '216', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4027', '217', '72', '1', null);
INSERT INTO `respuestas` VALUES ('4028', '218', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4029', '219', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4030', '220', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4031', '221', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4032', '222', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4033', '223', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4034', '224', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4035', '225', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4036', '226', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4037', '227', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4038', '228', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4039', '44', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4040', '229', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4041', '230', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4042', '231', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4043', '47', '72', '0', null);
INSERT INTO `respuestas` VALUES ('4044', '232', '72', '0', null);
INSERT INTO `respuestas` VALUES ('4045', '233', '72', '0', null);
INSERT INTO `respuestas` VALUES ('4046', '234', '72', '0', null);
INSERT INTO `respuestas` VALUES ('4047', '235', '72', '4', null);
INSERT INTO `respuestas` VALUES ('4048', '236', '72', '4', null);
INSERT INTO `respuestas` VALUES ('4049', '237', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4050', '238', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4051', '239', '72', '5', null);
INSERT INTO `respuestas` VALUES ('4052', '240', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('4053', '241', '72', '0', '720');
INSERT INTO `respuestas` VALUES ('4054', '242', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4055', '243', '72', '2', null);
INSERT INTO `respuestas` VALUES ('4056', '244', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4057', '245', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4058', '54', '72', '0', null);
INSERT INTO `respuestas` VALUES ('4059', '256', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4060', '257', '72', '3', null);
INSERT INTO `respuestas` VALUES ('4061', '56', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4062', '57', '74', '2', null);
INSERT INTO `respuestas` VALUES ('4063', '58', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4064', '59', '74', '2', null);
INSERT INTO `respuestas` VALUES ('4065', '60', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4066', '61', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4067', '62', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4068', '63', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4069', '77', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4070', '78', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4071', '79', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4072', '80', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4073', '81', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4074', '82', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4075', '95', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4076', '96', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4077', '97', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4078', '98', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4079', '99', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4080', '100', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4081', '101', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4082', '102', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4083', '103', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4084', '104', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4085', '105', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4086', '106', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4087', '129', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4088', '130', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4089', '131', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4090', '132', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4091', '133', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4092', '134', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4093', '135', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4094', '136', '74', '5', '732');
INSERT INTO `respuestas` VALUES ('4095', '137', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4096', '138', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4097', '139', '74', '2', '732');
INSERT INTO `respuestas` VALUES ('4098', '140', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4099', '141', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4100', '142', '74', '5', '732');
INSERT INTO `respuestas` VALUES ('4101', '21', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4102', '143', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4103', '144', '74', '3', '732');
INSERT INTO `respuestas` VALUES ('4104', '145', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4105', '146', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4106', '147', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4107', '27', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4108', '163', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4109', '164', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4110', '165', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4111', '166', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4112', '167', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4113', '168', '74', '4', '732');
INSERT INTO `respuestas` VALUES ('4114', '169', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4115', '170', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4116', '171', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4117', '172', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4118', '173', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4119', '174', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4120', '175', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4121', '176', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4122', '177', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4123', '178', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4124', '179', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4125', '180', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4126', '181', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4127', '182', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4128', '183', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4129', '184', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4130', '185', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4131', '204', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4132', '205', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4133', '206', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4134', '207', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4135', '208', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4136', '209', '74', '5', null);
INSERT INTO `respuestas` VALUES ('4137', '210', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4138', '211', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4139', '44', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4140', '229', '74', '2', null);
INSERT INTO `respuestas` VALUES ('4141', '230', '74', '2', null);
INSERT INTO `respuestas` VALUES ('4142', '231', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4143', '235', '74', '3', null);
INSERT INTO `respuestas` VALUES ('4144', '236', '74', '2', null);
INSERT INTO `respuestas` VALUES ('4145', '237', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4146', '238', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4147', '239', '74', '4', null);
INSERT INTO `respuestas` VALUES ('4148', '56', '75', '4', null);
INSERT INTO `respuestas` VALUES ('4149', '57', '75', '4', null);
INSERT INTO `respuestas` VALUES ('4150', '58', '75', '4', null);
INSERT INTO `respuestas` VALUES ('4151', '59', '75', '4', null);
INSERT INTO `respuestas` VALUES ('4152', '60', '75', '4', '727');
INSERT INTO `respuestas` VALUES ('4153', '61', '75', '4', '727');
INSERT INTO `respuestas` VALUES ('4154', '62', '75', '4', '727');
INSERT INTO `respuestas` VALUES ('4155', '63', '75', '4', '727');
INSERT INTO `respuestas` VALUES ('4156', '44', '75', '0', null);
INSERT INTO `respuestas` VALUES ('4157', '229', '75', '0', null);
INSERT INTO `respuestas` VALUES ('4158', '230', '75', '0', null);
INSERT INTO `respuestas` VALUES ('4159', '231', '75', '0', null);
INSERT INTO `respuestas` VALUES ('4160', '46', '75', '5', null);
INSERT INTO `respuestas` VALUES ('4161', '47', '75', '4', null);
INSERT INTO `respuestas` VALUES ('4162', '235', '75', '4', null);
INSERT INTO `respuestas` VALUES ('4163', '236', '75', '4', null);
INSERT INTO `respuestas` VALUES ('4164', '237', '75', '0', null);
INSERT INTO `respuestas` VALUES ('4165', '238', '75', '0', null);
INSERT INTO `respuestas` VALUES ('4166', '239', '75', '5', null);
INSERT INTO `respuestas` VALUES ('4167', '56', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4168', '57', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4169', '58', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4170', '59', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4171', '60', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4172', '61', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4173', '62', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4174', '63', '76', '5', '732');
INSERT INTO `respuestas` VALUES ('4175', '77', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4176', '78', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4177', '79', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4178', '80', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4179', '81', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4180', '82', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4181', '95', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4182', '96', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4183', '97', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4184', '98', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4185', '99', '76', '3', '732');
INSERT INTO `respuestas` VALUES ('4186', '100', '76', '3', '732');
INSERT INTO `respuestas` VALUES ('4187', '101', '76', '3', '732');
INSERT INTO `respuestas` VALUES ('4188', '102', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4189', '103', '76', '5', '732');
INSERT INTO `respuestas` VALUES ('4190', '104', '76', '5', '732');
INSERT INTO `respuestas` VALUES ('4191', '105', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4192', '106', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4193', '129', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4194', '130', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4195', '131', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4196', '132', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4197', '133', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4198', '134', '76', '5', '732');
INSERT INTO `respuestas` VALUES ('4199', '135', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4200', '136', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4201', '137', '76', '5', '732');
INSERT INTO `respuestas` VALUES ('4202', '138', '76', '1', '732');
INSERT INTO `respuestas` VALUES ('4203', '139', '76', '2', '732');
INSERT INTO `respuestas` VALUES ('4204', '140', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4205', '141', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4206', '142', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4207', '21', '76', '5', '732');
INSERT INTO `respuestas` VALUES ('4208', '143', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4209', '144', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4210', '145', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4211', '146', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4212', '147', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4213', '27', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4214', '163', '76', '2', '732');
INSERT INTO `respuestas` VALUES ('4215', '164', '76', '2', '732');
INSERT INTO `respuestas` VALUES ('4216', '165', '76', '3', '732');
INSERT INTO `respuestas` VALUES ('4217', '166', '76', '5', '732');
INSERT INTO `respuestas` VALUES ('4218', '167', '76', '4', '732');
INSERT INTO `respuestas` VALUES ('4219', '168', '76', '5', '732');
INSERT INTO `respuestas` VALUES ('4220', '169', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4221', '170', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4222', '171', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4223', '172', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4224', '173', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4225', '174', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4226', '175', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4227', '176', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4228', '177', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4229', '178', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4230', '179', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4231', '180', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4232', '181', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4233', '182', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4234', '183', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4235', '184', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4236', '185', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4237', '204', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4238', '205', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4239', '206', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4240', '207', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4241', '208', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4242', '209', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4243', '210', '76', '3', null);
INSERT INTO `respuestas` VALUES ('4244', '211', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4245', '44', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4246', '229', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4247', '230', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4248', '231', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4249', '235', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4250', '236', '76', '4', null);
INSERT INTO `respuestas` VALUES ('4251', '237', '76', '5', null);
INSERT INTO `respuestas` VALUES ('4252', '238', '76', '0', null);
INSERT INTO `respuestas` VALUES ('4253', '239', '76', '1', null);
INSERT INTO `respuestas` VALUES ('4254', '56', '77', '4', null);
INSERT INTO `respuestas` VALUES ('4255', '57', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4256', '58', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4257', '59', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4258', '60', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4259', '61', '77', '1', '732');
INSERT INTO `respuestas` VALUES ('4260', '62', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4261', '63', '77', '5', '732');
INSERT INTO `respuestas` VALUES ('4262', '77', '77', '5', null);
INSERT INTO `respuestas` VALUES ('4263', '78', '77', '5', null);
INSERT INTO `respuestas` VALUES ('4264', '79', '77', '5', null);
INSERT INTO `respuestas` VALUES ('4265', '80', '77', '5', null);
INSERT INTO `respuestas` VALUES ('4266', '81', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4267', '82', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4268', '95', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4269', '96', '77', '4', '732');
INSERT INTO `respuestas` VALUES ('4270', '97', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4271', '98', '77', '2', '732');
INSERT INTO `respuestas` VALUES ('4272', '99', '77', '0', '732');
INSERT INTO `respuestas` VALUES ('4273', '100', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4274', '101', '77', '4', '732');
INSERT INTO `respuestas` VALUES ('4275', '102', '77', '4', '732');
INSERT INTO `respuestas` VALUES ('4276', '103', '77', '5', '732');
INSERT INTO `respuestas` VALUES ('4277', '104', '77', '5', '732');
INSERT INTO `respuestas` VALUES ('4278', '105', '77', '2', '732');
INSERT INTO `respuestas` VALUES ('4279', '106', '77', '0', '732');
INSERT INTO `respuestas` VALUES ('4280', '129', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4281', '130', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4282', '131', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4283', '132', '77', '2', '732');
INSERT INTO `respuestas` VALUES ('4284', '133', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4285', '134', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4286', '135', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4287', '136', '77', '4', '732');
INSERT INTO `respuestas` VALUES ('4288', '137', '77', '0', '732');
INSERT INTO `respuestas` VALUES ('4289', '138', '77', '0', '732');
INSERT INTO `respuestas` VALUES ('4290', '139', '77', '2', '732');
INSERT INTO `respuestas` VALUES ('4291', '140', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4292', '141', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4293', '142', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4294', '21', '77', '2', '732');
INSERT INTO `respuestas` VALUES ('4295', '143', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4296', '144', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4297', '145', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4298', '146', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4299', '147', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4300', '27', '77', '1', null);
INSERT INTO `respuestas` VALUES ('4301', '161', '77', '4', null);
INSERT INTO `respuestas` VALUES ('4302', '162', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4303', '163', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4304', '164', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4305', '165', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4306', '166', '77', '2', '732');
INSERT INTO `respuestas` VALUES ('4307', '167', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4308', '168', '77', '3', '732');
INSERT INTO `respuestas` VALUES ('4309', '169', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4310', '170', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4311', '171', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4312', '172', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4313', '173', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4314', '174', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4315', '175', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4316', '176', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4317', '177', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4318', '178', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4319', '179', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4320', '180', '77', '4', null);
INSERT INTO `respuestas` VALUES ('4321', '181', '77', '4', null);
INSERT INTO `respuestas` VALUES ('4322', '182', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4323', '183', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4324', '184', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4325', '185', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4326', '204', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4327', '205', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4328', '206', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4329', '207', '77', '2', null);
INSERT INTO `respuestas` VALUES ('4330', '208', '77', '2', null);
INSERT INTO `respuestas` VALUES ('4331', '209', '77', '2', null);
INSERT INTO `respuestas` VALUES ('4332', '210', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4333', '211', '77', '1', null);
INSERT INTO `respuestas` VALUES ('4334', '217', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4335', '218', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4336', '219', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4337', '220', '77', '1', null);
INSERT INTO `respuestas` VALUES ('4338', '221', '77', '1', null);
INSERT INTO `respuestas` VALUES ('4339', '44', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4340', '229', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4341', '230', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4342', '231', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4343', '235', '77', '1', null);
INSERT INTO `respuestas` VALUES ('4344', '236', '77', '2', null);
INSERT INTO `respuestas` VALUES ('4345', '237', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4346', '238', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4347', '239', '77', '5', null);
INSERT INTO `respuestas` VALUES ('4348', '242', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4349', '243', '77', '2', null);
INSERT INTO `respuestas` VALUES ('4350', '244', '77', '0', null);
INSERT INTO `respuestas` VALUES ('4351', '245', '77', '3', null);
INSERT INTO `respuestas` VALUES ('4352', '54', '77', '4', null);
INSERT INTO `respuestas` VALUES ('4353', '56', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4354', '57', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4355', '58', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4356', '59', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4357', '60', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4358', '61', '84', '2', '732');
INSERT INTO `respuestas` VALUES ('4359', '62', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4360', '63', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4361', '77', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4362', '78', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4363', '79', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4364', '80', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4365', '81', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4366', '82', '84', '5', null);
INSERT INTO `respuestas` VALUES ('4367', '95', '84', '4', '732');
INSERT INTO `respuestas` VALUES ('4368', '96', '84', '4', '732');
INSERT INTO `respuestas` VALUES ('4369', '97', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4370', '98', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4371', '99', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4372', '100', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4373', '101', '84', '4', '732');
INSERT INTO `respuestas` VALUES ('4374', '102', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4375', '103', '84', '4', '732');
INSERT INTO `respuestas` VALUES ('4376', '104', '84', '4', '732');
INSERT INTO `respuestas` VALUES ('4377', '105', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4378', '106', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4379', '129', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4380', '130', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4381', '131', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4382', '132', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4383', '133', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4384', '134', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4385', '135', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4386', '136', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4387', '137', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4388', '138', '84', '2', '732');
INSERT INTO `respuestas` VALUES ('4389', '139', '84', '2', '732');
INSERT INTO `respuestas` VALUES ('4390', '140', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4391', '141', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4392', '142', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4393', '21', '84', '4', '732');
INSERT INTO `respuestas` VALUES ('4394', '143', '84', '4', '732');
INSERT INTO `respuestas` VALUES ('4395', '144', '84', '4', '732');
INSERT INTO `respuestas` VALUES ('4396', '145', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4397', '146', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4398', '147', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4399', '27', '84', '2', null);
INSERT INTO `respuestas` VALUES ('4400', '161', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4401', '162', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4402', '163', '84', '2', '732');
INSERT INTO `respuestas` VALUES ('4403', '164', '84', '3', '732');
INSERT INTO `respuestas` VALUES ('4404', '165', '84', '2', '732');
INSERT INTO `respuestas` VALUES ('4405', '166', '84', '2', '732');
INSERT INTO `respuestas` VALUES ('4406', '167', '84', '2', '732');
INSERT INTO `respuestas` VALUES ('4407', '168', '84', '2', '732');
INSERT INTO `respuestas` VALUES ('4408', '169', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4409', '170', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4410', '171', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4411', '172', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4412', '173', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4413', '174', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4414', '175', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4415', '176', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4416', '177', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4417', '178', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4418', '179', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4419', '180', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4420', '181', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4421', '182', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4422', '183', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4423', '184', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4424', '185', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4425', '204', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4426', '205', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4427', '206', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4428', '207', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4429', '208', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4430', '209', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4431', '210', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4432', '211', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4433', '217', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4434', '218', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4435', '219', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4436', '220', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4437', '221', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4438', '44', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4439', '229', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4440', '230', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4441', '231', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4442', '235', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4443', '236', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4444', '237', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4445', '238', '84', '0', null);
INSERT INTO `respuestas` VALUES ('4446', '239', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4447', '242', '84', '4', null);
INSERT INTO `respuestas` VALUES ('4448', '243', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4449', '244', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4450', '245', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4451', '54', '84', '3', null);
INSERT INTO `respuestas` VALUES ('4452', '56', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4453', '57', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4454', '58', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4455', '59', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4456', '60', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4457', '61', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4458', '62', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4459', '63', '85', '5', '732');
INSERT INTO `respuestas` VALUES ('4460', '77', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4461', '78', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4462', '79', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4463', '80', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4464', '81', '85', '2', null);
INSERT INTO `respuestas` VALUES ('4465', '82', '85', '2', null);
INSERT INTO `respuestas` VALUES ('4466', '95', '85', '2', '732');
INSERT INTO `respuestas` VALUES ('4467', '96', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4468', '97', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4469', '98', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4470', '99', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4471', '100', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4472', '101', '85', '2', '732');
INSERT INTO `respuestas` VALUES ('4473', '102', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4474', '103', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4475', '104', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4476', '105', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4477', '106', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4478', '129', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4479', '130', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4480', '131', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4481', '132', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4482', '133', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4483', '134', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4484', '135', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4485', '136', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4486', '137', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4487', '138', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4488', '139', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4489', '140', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4490', '141', '85', '2', '732');
INSERT INTO `respuestas` VALUES ('4491', '142', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4492', '21', '85', '3', '732');
INSERT INTO `respuestas` VALUES ('4493', '143', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4494', '144', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4495', '145', '85', '5', '732');
INSERT INTO `respuestas` VALUES ('4496', '146', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4497', '147', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4498', '27', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4499', '161', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4500', '162', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4501', '163', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4502', '164', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4503', '165', '85', '4', '732');
INSERT INTO `respuestas` VALUES ('4504', '166', '85', '5', '732');
INSERT INTO `respuestas` VALUES ('4505', '167', '85', '5', '732');
INSERT INTO `respuestas` VALUES ('4506', '168', '85', '5', '732');
INSERT INTO `respuestas` VALUES ('4507', '169', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4508', '170', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4509', '171', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4510', '172', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4511', '173', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4512', '174', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4513', '175', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4514', '176', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4515', '177', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4516', '178', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4517', '179', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4518', '180', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4519', '181', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4520', '182', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4521', '183', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4522', '184', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4523', '185', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4524', '204', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4525', '205', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4526', '206', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4527', '207', '85', '3', null);
INSERT INTO `respuestas` VALUES ('4528', '208', '85', '3', null);
INSERT INTO `respuestas` VALUES ('4529', '209', '85', '1', null);
INSERT INTO `respuestas` VALUES ('4530', '210', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4531', '211', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4532', '217', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4533', '218', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4534', '219', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4535', '220', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4536', '221', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4537', '44', '85', '3', null);
INSERT INTO `respuestas` VALUES ('4538', '229', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4539', '230', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4540', '231', '85', '0', null);
INSERT INTO `respuestas` VALUES ('4541', '235', '85', '3', null);
INSERT INTO `respuestas` VALUES ('4542', '236', '85', '3', null);
INSERT INTO `respuestas` VALUES ('4543', '237', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4544', '238', '85', '3', null);
INSERT INTO `respuestas` VALUES ('4545', '239', '85', '1', null);
INSERT INTO `respuestas` VALUES ('4546', '242', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4547', '243', '85', '5', null);
INSERT INTO `respuestas` VALUES ('4548', '244', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4549', '245', '85', '4', null);
INSERT INTO `respuestas` VALUES ('4550', '54', '85', '3', null);
INSERT INTO `respuestas` VALUES ('4551', '56', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4552', '57', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4553', '58', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4554', '59', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4555', '60', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4556', '61', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4557', '62', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4558', '63', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4559', '60', '86', '3', '725');
INSERT INTO `respuestas` VALUES ('4560', '61', '86', '4', '725');
INSERT INTO `respuestas` VALUES ('4561', '62', '86', '4', '725');
INSERT INTO `respuestas` VALUES ('4562', '63', '86', '3', '725');
INSERT INTO `respuestas` VALUES ('4563', '64', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4564', '65', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4565', '66', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4566', '67', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4567', '68', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4568', '69', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4569', '70', '86', '0', null);
INSERT INTO `respuestas` VALUES ('4570', '71', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4571', '72', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4572', '73', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4573', '74', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4574', '75', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4575', '76', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4576', '77', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4577', '78', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4578', '79', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4579', '80', '86', '0', null);
INSERT INTO `respuestas` VALUES ('4580', '81', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4581', '82', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4582', '95', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4583', '96', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4584', '97', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4585', '98', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4586', '99', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4587', '100', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4588', '101', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4589', '102', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4590', '103', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4591', '104', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4592', '105', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4593', '106', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4594', '121', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4595', '122', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4596', '123', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4597', '129', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4598', '130', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4599', '131', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4600', '132', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4601', '133', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4602', '134', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4603', '135', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4604', '136', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4605', '137', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4606', '138', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4607', '139', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4608', '140', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4609', '141', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4610', '142', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4611', '21', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4612', '143', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4613', '144', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4614', '145', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4615', '146', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4616', '147', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4617', '27', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4618', '152', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4619', '153', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4620', '154', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4621', '155', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4622', '156', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4623', '157', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4624', '158', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4625', '159', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4626', '160', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4627', '163', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4628', '164', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4629', '165', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4630', '166', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4631', '167', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4632', '168', '86', '3', '724');
INSERT INTO `respuestas` VALUES ('4633', '169', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4634', '170', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4635', '171', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4636', '172', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4637', '173', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4638', '174', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4639', '175', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4640', '176', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4641', '177', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4642', '178', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4643', '179', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4644', '180', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4645', '181', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4646', '182', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4647', '183', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4648', '184', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4649', '185', '86', '5', null);
INSERT INTO `respuestas` VALUES ('4650', '186', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4651', '187', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4652', '188', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4653', '189', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4654', '190', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4655', '191', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4656', '192', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4657', '193', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4658', '194', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4659', '195', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4660', '196', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4661', '197', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4662', '198', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4663', '199', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4664', '200', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4665', '201', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4666', '202', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4667', '203', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4668', '204', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4669', '205', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4670', '206', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4671', '207', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4672', '208', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4673', '209', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4674', '210', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4675', '211', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4676', '215', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4677', '216', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4678', '44', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4679', '229', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4680', '230', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4681', '231', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4682', '46', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4683', '47', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4684', '232', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4685', '233', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4686', '234', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4687', '235', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4688', '236', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4689', '237', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4690', '238', '86', '3', null);
INSERT INTO `respuestas` VALUES ('4691', '239', '86', '4', null);
INSERT INTO `respuestas` VALUES ('4692', '240', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4693', '241', '86', '4', '724');
INSERT INTO `respuestas` VALUES ('4694', '56', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4695', '57', '88', '5', null);
INSERT INTO `respuestas` VALUES ('4696', '58', '88', '3', null);
INSERT INTO `respuestas` VALUES ('4697', '59', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4698', '44', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4699', '229', '88', '3', null);
INSERT INTO `respuestas` VALUES ('4700', '230', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4701', '231', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4702', '47', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4703', '235', '88', '5', null);
INSERT INTO `respuestas` VALUES ('4704', '236', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4705', '237', '88', '3', null);
INSERT INTO `respuestas` VALUES ('4706', '238', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4707', '239', '88', '4', null);
INSERT INTO `respuestas` VALUES ('4708', '161', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4709', '162', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4710', '31', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4711', '246', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4712', '247', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4713', '248', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4714', '249', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4715', '250', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4716', '251', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4717', '252', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4718', '253', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4719', '254', '89', '4', null);
INSERT INTO `respuestas` VALUES ('4720', '255', '89', '4', null);

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
  `idencuesta1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO `rol` VALUES ('1', 'Estudiantes pregrado', '1');
INSERT INTO `rol` VALUES ('2', 'Docentes planta', '4');
INSERT INTO `rol` VALUES ('3', 'Administrativos', '7');
INSERT INTO `rol` VALUES ('4', 'Egresados pregrado', '8');
INSERT INTO `rol` VALUES ('5', 'Directivos', '6');
INSERT INTO `rol` VALUES ('6', 'Empleadores', '11');
INSERT INTO `rol` VALUES ('7', 'Estudiantes especialización', '3');
INSERT INTO `rol` VALUES ('8', 'Estudiantes maestria-doctorado', '2');
INSERT INTO `rol` VALUES ('9', 'Egresados especializacion', '9');
INSERT INTO `rol` VALUES ('10', 'Egresados maestria-doctorado', '10');
INSERT INTO `rol` VALUES ('11', 'Docentes catedra', '5');
