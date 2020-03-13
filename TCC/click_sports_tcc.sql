-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 13/03/2020 às 11:12
-- Versão do servidor: 5.7.28-0ubuntu0.18.04.4
-- Versão do PHP: 7.2.26-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `click_sports_tcc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `idavaliacao` int(11) NOT NULL,
  `data_avaliacao` date NOT NULL,
  `hora_avaliacao` time(4) NOT NULL,
  `cometario` varchar(45) DEFAULT NULL,
  `quadra_idquadra` int(11) NOT NULL,
  `Usuario_CPF` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `avaliacao`
--

INSERT INTO `avaliacao` (`idavaliacao`, `data_avaliacao`, `hora_avaliacao`, `cometario`, `quadra_idquadra`, `Usuario_CPF`) VALUES
(1, '2020-03-15', '08:00:00.0000', 'Legal', 1, '061.147.148-29'),
(2, '2020-03-23', '13:00:00.0000', 'Muito loko', 2, '129.853.379-17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `cod_perfil` int(11) NOT NULL,
  `desc_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `perfil`
--

INSERT INTO `perfil` (`cod_perfil`, `desc_usuario`) VALUES
(5, 'adm'),
(6, 'usuario'),
(7, 'adm'),
(8, 'usuario');

-- --------------------------------------------------------

--
-- Estrutura para tabela `quadra`
--

CREATE TABLE `quadra` (
  `idquadra` int(50) NOT NULL,
  `nome_quadra` varchar(45) NOT NULL,
  `disponibilidade` varchar(45) NOT NULL,
  `horario` varchar(45) NOT NULL,
  `endereço` varchar(80) NOT NULL,
  `CNPJ` varchar(45) NOT NULL,
  `valor_quadra` varchar(45) NOT NULL,
  `Usuario_CPF` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `quadra`
--

INSERT INTO `quadra` (`idquadra`, `nome_quadra`, `disponibilidade`, `horario`, `endereço`, `CNPJ`, `valor_quadra`, `Usuario_CPF`) VALUES
(1, 'IFC Araquari', 'Disponivel', '08:00 até 19:00', 'BR 280, km 27, Araquari - SC, 89245-000', '22.829.056/0001-96', 'R$40/hora', '127.270.499-86'),
(2, 'ADE Embraco Quadra 1', 'Disponivel', '07:00 até 21:00', 'R. Rui Barbosa, 925 - Costa e Silva, Joinville - SC, 89219-520', '22.829.056/0001-96', 'R$40/hora', '127.270.499-86');

-- --------------------------------------------------------

--
-- Estrutura para tabela `quadra_has_Usuario`
--

CREATE TABLE `quadra_has_Usuario` (
  `cod_reserva` int(11) NOT NULL,
  `quadra_idquadra` int(11) NOT NULL,
  `Usuario_CPF_locador` varchar(45) NOT NULL,
  `Usuario_CPF_proprietario` varchar(45) NOT NULL,
  `hora_ini` time(5) NOT NULL,
  `hora_fim` time(5) NOT NULL,
  `data` date NOT NULL,
  `confirmacao` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `quadra_has_Usuario`
--

INSERT INTO `quadra_has_Usuario` (`cod_reserva`, `quadra_idquadra`, `Usuario_CPF_locador`, `Usuario_CPF_proprietario`, `hora_ini`, `hora_fim`, `data`, `confirmacao`) VALUES
(1, 1, '061.147.148-29', '127.270.499-86', '10:00:00.00000', '12:00:00.00000', '2020-03-21', NULL),
(2, 2, '129.853.379-17', '127.270.499-86', '18:00:00.00000', '19:00:00.00000', '2020-03-22', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Usuario`
--

CREATE TABLE `Usuario` (
  `CPF` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `cell` varchar(45) NOT NULL,
  `CEP` varchar(45) NOT NULL,
  `endereço` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `perfil_cod_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `Usuario`
--

INSERT INTO `Usuario` (`CPF`, `nome`, `senha`, `email`, `cell`, `CEP`, `endereço`, `idade`, `perfil_cod_perfil`) VALUES
('061.147.148-29', 'Sergio Soriani', '123456', 'sergio@gmail.com', '47 99150-0166', '89201230', 'Rua Gustavo Grossembacher, Centro, Joinville', 50, 8),
('127.270.499-86', 'Ana Paula Selhorst', 'loko123', 'ana@gmail.com', '47 9999-6969', '89217200', 'marechal hermes 172, gloria', 18, 5),
('129.853.379-17', 'murilo vinicius', 'voleizin', 'murilo@gmail.com', '47 9741-6602', '89245000', 'Rua Adolfo Soares, itinga 147', 17, 6);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`idavaliacao`),
  ADD KEY `fk_avaliacao_quadra1_idx` (`quadra_idquadra`),
  ADD KEY `fk_avaliacao_Usuario1_idx` (`Usuario_CPF`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`cod_perfil`);

--
-- Índices de tabela `quadra`
--
ALTER TABLE `quadra`
  ADD PRIMARY KEY (`idquadra`),
  ADD KEY `fk_quadra_Usuario1_idx` (`Usuario_CPF`);

--
-- Índices de tabela `quadra_has_Usuario`
--
ALTER TABLE `quadra_has_Usuario`
  ADD PRIMARY KEY (`cod_reserva`),
  ADD KEY `fk_quadra_has_Usuario_Usuario1_idx` (`Usuario_CPF_locador`),
  ADD KEY `fk_quadra_has_Usuario_quadra1_idx` (`quadra_idquadra`),
  ADD KEY `fk_quadra_has_Usuario_Usuario2_idx` (`Usuario_CPF_proprietario`);

--
-- Índices de tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`CPF`),
  ADD KEY `fk_Usuario_perfil1_idx` (`perfil_cod_perfil`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `idavaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `cod_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de tabela `quadra`
--
ALTER TABLE `quadra`
  MODIFY `idquadra` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `quadra_has_Usuario`
--
ALTER TABLE `quadra_has_Usuario`
  MODIFY `cod_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `fk_avaliacao_Usuario1` FOREIGN KEY (`Usuario_CPF`) REFERENCES `Usuario` (`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_avaliacao_quadra1` FOREIGN KEY (`quadra_idquadra`) REFERENCES `quadra` (`idquadra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `quadra`
--
ALTER TABLE `quadra`
  ADD CONSTRAINT `fk_quadra_Usuario1` FOREIGN KEY (`Usuario_CPF`) REFERENCES `Usuario` (`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `quadra_has_Usuario`
--
ALTER TABLE `quadra_has_Usuario`
  ADD CONSTRAINT `fk_quadra_has_Usuario_Usuario1` FOREIGN KEY (`Usuario_CPF_locador`) REFERENCES `Usuario` (`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_quadra_has_Usuario_Usuario2` FOREIGN KEY (`Usuario_CPF_proprietario`) REFERENCES `Usuario` (`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_quadra_has_Usuario_quadra1` FOREIGN KEY (`quadra_idquadra`) REFERENCES `quadra` (`idquadra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `fk_Usuario_perfil1` FOREIGN KEY (`perfil_cod_perfil`) REFERENCES `perfil` (`cod_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
