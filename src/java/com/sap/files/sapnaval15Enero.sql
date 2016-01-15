/*
Navicat MySQL Data Transfer

Source Server         : sac
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : sapnaval

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-01-15 16:35:08
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caracteristica
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of encuesta
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factor
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of facultad
-- ----------------------------

-- ----------------------------
-- Table structure for fuente
-- ----------------------------
DROP TABLE IF EXISTS `fuente`;
CREATE TABLE `fuente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fuente
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modelo
-- ----------------------------
INSERT INTO `modelo` VALUES ('1', 'Modelo de Autoevaluación Institucional', 'Modelo de Autoevaluación Institucional de la Escuela Naval de Cadetes Almirante Padilla', null, '2016-01-15', null);

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
  `codigo` varchar(100) DEFAULT NULL,
  `pregunta` varchar(1000) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `indicador_id` int(11) DEFAULT NULL,
  `modelo_id` int(11) DEFAULT NULL,
  `pregunta_padre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pregunta_indicador1_idx` (`indicador_id`),
  KEY `fk_pregunta_modelo1` (`modelo_id`),
  KEY `fk_pregunta_pregunta1_idx` (`pregunta_padre`),
  CONSTRAINT `fk_pregunta_indicador1` FOREIGN KEY (`indicador_id`) REFERENCES `indicador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_modelo1` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_pregunta1` FOREIGN KEY (`pregunta_padre`) REFERENCES `pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pregunta
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proceso
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programa
-- ----------------------------

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
