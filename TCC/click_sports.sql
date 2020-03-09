-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 09/03/2020 às 16:49
-- Versão do servidor: 5.7.28-0ubuntu0.18.04.4
-- Versão do PHP: 7.2.26-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `click_sports`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `idavaliacao` int(11) NOT NULL,
  `hora_avaliacao` time(5) NOT NULL,
  `data_avalicao` date NOT NULL,
  `comentario` varchar(45) DEFAULT NULL,
  `Usuario_CPF` varchar(45) NOT NULL,
  `quadra_idquadra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'adm'),
(2, 'adm'),
(3, 'user'),
(4, 'user');

-- --------------------------------------------------------

--
-- Estrutura para tabela `quadra`
--

CREATE TABLE `quadra` (
  `idquadra` int(11) NOT NULL,
  `nome_quadra` varchar(45) NOT NULL DEFAULT '',
  `disponibilidade` varchar(45) NOT NULL,
  `horario` varchar(45) NOT NULL,
  `endereço` varchar(45) NOT NULL,
  `CNPJ` varchar(45) NOT NULL,
  `Usuario_CPF` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `quadra_has_Usuario`
--

CREATE TABLE `quadra_has_Usuario` (
  `cod_reserva` int(11) NOT NULL,
  `quadra_idquadra` int(11) NOT NULL,
  `Usuario_CPF_locador` varchar(45) NOT NULL,
  `Usuario_CPF_proprietario` varchar(45) NOT NULL,
  `hora_ini` time(6) NOT NULL,
  `hora_fim` time(6) NOT NULL,
  `data` date NOT NULL,
  `confirmacao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('127.270.499-86', 'Ana Paula Selhorst', 'loko123', 'ana@gmail.com', '99996969', '89217200', 'marechal hermes 172, gloria', 17, 1),
('129.853.379-17', 'murilo vinicius', 'voleizin', 'murilo@gmail.com', '97416602', '89245000', 'Rua Adolfo Soares, itinga 147', 17, 3);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`idavaliacao`),
  ADD KEY `fk_avaliacao_Usuario1_idx` (`Usuario_CPF`),
  ADD KEY `fk_avaliacao_quadra1_idx` (`quadra_idquadra`);

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
  MODIFY `idavaliacao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `quadra`
--
ALTER TABLE `quadra`
  MODIFY `idquadra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `quadra_has_Usuario`
--
ALTER TABLE `quadra_has_Usuario`
  MODIFY `cod_reserva` int(11) NOT NULL AUTO_INCREMENT;
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
