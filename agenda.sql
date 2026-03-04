-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 04/03/2026 às 14:50
-- Versão do servidor: 10.6.24-MariaDB-cll-lve
-- Versão do PHP: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agenda`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(18, 'Adolescentes'),
(29, 'Anciãos'),
(25, 'ASA'),
(6, 'Aventureiros'),
(7, 'Comunicação'),
(27, 'Coral'),
(2, 'Desbravadores'),
(21, 'Diáconos e Diaconisas'),
(4, 'Escola Sabatina'),
(26, 'Lar e Família'),
(16, 'Liberdade Religiosa'),
(19, 'Louvor'),
(23, 'Ministério da Criança'),
(28, 'Ministério da Mulher'),
(1, 'Ministério Jovens'),
(5, 'Ministério Pessoal'),
(22, 'Mordomia'),
(3, 'Música'),
(13, 'Oração'),
(31, 'Pastor'),
(11, 'Patrimônio'),
(24, 'Possibilidades'),
(14, 'Publicações'),
(15, 'Recepção'),
(12, 'Saúde'),
(9, 'Secretaria'),
(30, 'Sonoplastia'),
(17, 'Terceira Idade'),
(10, 'Tesouraria');

-- --------------------------------------------------------

--
-- Estrutura para tabela `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `locationId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','approved') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `events`
--

INSERT INTO `events` (`id`, `title`, `start`, `end`, `locationId`, `departmentId`, `description`, `status`) VALUES
(3, '1ª EDIÇÃO DO ARENA FORJAP DE 2026', '2026-01-24 17:07:00', '2026-01-24 19:01:00', 2, 1, 'Tema: O Deus do Velho Testamento - Um Ditador Autoritário ou um Pai de Amor Incompreendido?\r\n\r\nVenha participar!', 'approved'),
(7, 'JA da Família I', '2026-04-11 17:35:00', '2026-04-11 19:00:00', 2, 26, 'Temas para as famílias da igreja. (a definir)', 'approved'),
(8, 'JA da Família II', '2026-06-20 17:35:00', '2026-06-20 19:00:00', 2, 26, 'Temas para a família (a definir).', 'approved'),
(9, 'JA da Família', '2026-09-12 17:34:00', '2026-09-12 19:00:00', 2, 26, 'Temas para a família (a definir)', 'approved'),
(10, 'JA da Família', '2026-11-21 19:35:00', '2026-11-21 19:00:00', 2, 26, 'Temas para a família (a definir).', 'approved'),
(11, 'JanPar', '2026-06-13 17:30:00', '2026-06-14 19:00:00', 3, 26, 'Local e valores ainda a serem definidos.', 'approved'),
(12, 'Finanças da Família (JA)', '2026-02-28 17:29:00', '2026-02-28 19:00:00', 2, 26, 'Falaremos sobre planejamento familiar.', 'approved'),
(13, 'Finanças para as famílias', '2026-02-28 13:30:00', '2026-02-28 15:00:00', 2, 26, 'Falarei sobre os princípios bíblicos de finanças familiar.', 'approved'),
(14, 'Finanças para as Famílias', '2026-03-14 20:30:00', '2026-03-14 22:01:00', 2, 26, 'Praticando planejamento e escolhas na família.', 'approved'),
(15, 'Culto Sábado - Samuel Silva', '2026-01-03 11:00:00', '2026-01-03 12:00:00', 2, 7, '', 'approved'),
(16, 'Culto domingo - Luzia', '2026-01-04 19:00:00', '2026-01-04 20:00:00', 2, 7, '', 'approved'),
(17, 'Culto Quarta feira - Islayne ', '2026-01-07 19:00:00', '2026-01-07 20:00:00', 2, 7, '', 'approved'),
(18, 'Culto Sábado - Leandro', '2026-01-10 11:00:00', '2026-01-10 12:00:00', 2, 7, '', 'approved'),
(19, 'Culto domingo - Cláudio Coqueiro ', '2026-01-11 19:00:00', '2026-01-11 20:00:00', 2, 7, '', 'approved'),
(20, 'Culto Quarta feira - Carlos Pita', '2026-01-14 20:00:00', '2026-01-15 21:00:00', 2, 7, '', 'approved'),
(21, 'Culto Sábado - Gabriel Maciel ', '2026-01-17 11:00:00', '2026-01-17 12:00:00', 2, 7, '', 'approved'),
(22, 'Culto Sábado - Pr Geovane ', '2026-01-24 11:00:00', '2026-01-24 12:00:00', 2, 29, 'DO FRACASSO AO MILAGRE', 'approved'),
(23, 'Culto Sábado - Pr Alcy', '2026-01-31 11:00:00', '2026-01-31 12:00:00', 2, 7, '', 'approved'),
(24, 'Dia Mundial dos Aventureiros ', '2026-05-16 13:00:00', '2026-05-16 15:30:00', 2, 6, 'Programação completa dos Aventureiros, desde o louvor até o culto.', 'approved'),
(25, 'Escola Cristã de Férias ', '2026-07-17 15:00:00', '2026-07-19 15:00:00', 4, 6, 'Dia 17/7 - sexta das 14:00 às 16:30\nDia 18/7 - sábado das 15:00 às 17:30\nDia 19/7 - domingo das 09:00 às 12:00', 'approved'),
(26, 'Investidura ', '2026-11-28 16:00:00', '2026-07-28 20:30:00', 2, 6, 'JA Investidura dos Aventureiros e comemoração do aniversário do Falcão Real Kids e social .', 'approved'),
(27, 'CONCURSO DE ORATÓRIA - FASE CLUBE', '2026-03-21 20:00:00', '2026-03-21 21:30:00', 2, 2, '', 'approved'),
(28, 'CURSO DE ORATÓRIA - FASE DISTRITAL', '2026-04-25 20:00:00', '2026-04-25 22:00:00', 2, 2, '', 'approved'),
(29, 'JANTAR DOS NAMORADOS', '2026-06-13 21:00:00', '2026-06-13 23:00:00', 4, 2, 'Local a confirmar ', 'approved'),
(30, 'ANIVERSÁRIO DO CLUBE', '2026-08-08 12:00:00', '2026-08-08 21:00:00', 2, 2, '', 'approved'),
(31, 'DIA MUNDIAL DOS DESBRAVADORES - SABÁDO MANHÃ (IGREJA) ', '2026-09-19 12:00:00', '2026-09-19 15:00:00', 2, 2, '', 'approved'),
(32, 'INVESTIDURA DE CLASSE', '2026-11-14 20:00:00', '2026-11-14 21:30:00', 2, 2, '', 'approved'),
(33, 'HAPPY DAY - ENCERRAMENTO', '2027-01-16 20:00:00', '2027-01-16 22:00:00', 2, 2, 'Local a confirmar ', 'approved'),
(34, 'Culto dia das crianças ', '2026-10-10 13:30:00', '2026-10-10 15:00:00', 2, 23, 'Culto dia das crianças ', 'approved'),
(35, 'Festa das Crianças ', '2026-10-11 12:00:00', '2026-10-11 16:00:00', 3, 23, 'Festa das crianças ', 'approved'),
(37, 'Culto Domingo de Ação de Graças - Orador Isaac Teixeira', '2026-02-01 19:00:00', '2026-02-01 20:00:00', 2, 29, '', 'approved'),
(38, 'Culto Divino - Orador Osmar', '2026-02-07 11:00:00', '2026-02-07 12:00:00', 2, 29, '', 'approved'),
(39, 'Início das reuniões do Clube Falcão Real Kids ', '2026-02-07 18:00:00', '2026-02-07 20:30:00', 4, 6, '', 'approved'),
(40, 'AVENTURI ', '2026-11-13 10:00:00', '2026-11-15 20:00:00', 3, 6, 'Programação será realizada na Estância Árvore da Vida em Sumaré ', 'approved'),
(42, 'Culto Divino Sábado - 10 dias de Oração - Pr Geovanne ', '2026-02-21 14:00:00', '2026-02-21 15:00:00', 2, 29, '', 'approved'),
(43, 'Culto Domingo - Cláudio Coqueiro - 10 dias de Oração', '2026-02-22 19:00:00', '2026-02-22 20:00:00', 2, 29, 'Dez dias de oração', 'approved'),
(44, 'Culto JA - Lar e Família', '2026-02-28 20:00:00', '2026-02-28 21:00:00', 2, 29, '', 'approved'),
(45, 'Culto Domingo - Oradora Eliana Barros ', '2026-03-01 19:00:00', '2026-03-01 20:00:00', 2, 29, '', 'approved'),
(46, 'Culto de Oração - Pr Geovanne ', '2026-03-04 20:00:00', '2026-03-05 22:00:00', 2, 29, '', 'approved'),
(47, 'Culto Divino - Sábado da Mulher Missionária - Oradora Carol Marques', '2026-03-07 11:00:00', '2026-03-07 12:00:00', 2, 29, '- Investidura Ministério da Mulher', 'approved'),
(57, 'JA - Lançamento Semana Santa', '2026-03-07 17:15:00', '2026-03-07 19:00:00', 2, 29, '', 'approved'),
(58, 'Culto Domingo - Eliana Barros', '2026-03-08 19:00:00', '2026-03-08 20:00:00', 2, 29, '', 'approved'),
(59, 'Culto Divino - Allysson (Dia Mundial do Jovem Adventista)', '2026-03-21 10:30:00', '2026-03-21 12:00:00', 2, 29, '- Dia Mundial do Jovem Adventista', 'approved'),
(60, 'Culto Domingo - Pr Geovanne ', '2026-03-22 19:00:00', '2026-03-22 20:00:00', 2, 29, '', 'approved'),
(61, 'DIA DA AÇÃO SOLIDÁRIA ADVENTISTA - ASA', '2026-08-01 10:30:00', '2026-08-01 12:00:00', 2, 25, 'Celebração do Aniversário da ASA.\nPregação. ', 'approved'),
(68, 'Culto Divino - Sábado - Orador Valdemar Jr', '2026-04-11 11:00:00', '2026-04-11 12:00:00', 2, 29, '', 'approved'),
(69, 'Culto Divino - Sábado - Pr Geovane ', '2026-04-18 11:00:00', '2026-04-18 12:00:00', 2, 29, '', 'approved'),
(70, 'Culto Domingo - Pr Geovane', '2026-04-19 19:00:00', '2026-04-19 20:00:00', 2, 29, '', 'approved'),
(71, 'Culto Divino - Sábado - Pr Geovane', '2026-04-25 11:00:00', '2026-04-25 12:00:00', 2, 29, 'Dia do Diácono', 'approved'),
(72, 'Culto Oração- Quarta- Pr Geovane', '2026-05-06 20:00:00', '2026-05-06 21:00:00', 2, 29, '', 'approved'),
(73, 'Culto Divino - Sábado - Pr Geovane', '2026-05-16 11:00:00', '2026-05-16 12:00:00', 2, 29, '', 'approved'),
(74, 'Culto Domingo - Pr Geovane', '2026-05-24 19:00:00', '2026-05-24 20:00:00', 2, 29, '', 'approved'),
(75, 'Culto Oração- Quarta- Pr Geovane', '2026-06-10 20:00:00', '2026-06-10 21:00:00', 2, 29, '', 'approved'),
(77, 'Culto Domingo - Pr Geovane', '2026-06-28 19:00:00', '2026-06-28 20:00:00', 2, 29, '', 'approved'),
(78, 'Culto Oração- Quarta- Pr Geovane', '2026-07-15 20:00:00', '2026-07-15 21:00:00', 2, 29, '', 'approved'),
(79, 'Culto Domingo - Pr Geovane', '2026-08-09 19:00:00', '2026-08-09 20:00:00', 2, 29, '', 'approved'),
(80, 'Culto Divino - Sábado - Pr Geovane', '2026-08-15 11:00:00', '2026-08-15 12:00:00', 2, 29, '', 'approved'),
(81, 'Culto Divino - Sábado - Norival', '2026-08-22 11:00:00', '2026-08-22 12:00:00', 2, 29, '', 'approved'),
(82, 'Culto Oração- Quarta- Pr Geovane', '2026-08-26 20:00:00', '2026-08-26 21:00:00', 2, 29, '', 'approved'),
(83, 'Culto Domingo - Pr Geovanne', '2026-09-13 19:00:00', '2026-09-13 20:00:00', 2, 29, '', 'approved'),
(84, 'Culto Oração- Quarta- Pr Geovane', '2026-10-07 20:00:00', '2026-10-07 21:00:00', 2, 29, '', 'approved'),
(85, 'Culto Divino - Sábado - Pr Geovane', '2026-10-17 11:00:00', '2026-10-17 12:00:00', 2, 29, '', 'approved'),
(86, 'Culto Divino - Sábado - Pr Geovane', '2026-10-24 10:30:00', '2026-10-24 12:00:00', 2, 29, '- Dia do pastor\n- Programação Especial Musical - Ministério Hafah São Miguel', 'approved'),
(87, 'Culto Domingo - Pr Geovanne', '2026-10-25 19:00:00', '2026-10-25 20:00:00', 2, 29, '', 'approved'),
(88, 'Culto Oração- Quarta- Pr Geovane', '2026-11-11 20:00:00', '2026-11-11 21:00:00', 2, 29, '', 'approved'),
(89, 'Culto Divino - Sábado - Pr Geovane', '2026-11-21 11:00:00', '2026-11-21 12:00:00', 2, 29, '', 'approved'),
(90, 'Culto Domingo - Pr Geovanne', '2026-11-29 19:00:00', '2026-11-29 20:00:00', 2, 29, '', 'approved'),
(91, 'Culto Oração- Quarta- Pr Geovane', '2026-12-16 20:00:00', '2026-12-16 21:00:00', 2, 29, '', 'approved'),
(92, 'Culto Divino - Sábado - Pr Geovane Martins', '2026-12-19 11:00:00', '2026-12-19 12:00:00', 2, 29, 'DO FRACASSO AO MILAGRE', 'approved'),
(93, 'Culto da Terceira Idade', '2026-03-13 19:45:00', '2026-03-13 21:00:00', 4, 17, 'Culto do Departamento da Terceira Idade, voltado à esse grupo. Haverá um palestrante, música e uma refeição após o culto.', 'approved'),
(94, 'Culto da Terceira Idade', '2026-05-15 19:45:00', '2026-05-15 21:00:00', 4, 17, 'Culto do Departamento da Terceira Idade, voltado à esse grupo. Haverá um palestrante, música e uma refeição após o culto.', 'approved'),
(95, 'Culto da Terceira Idade', '2026-07-10 19:45:00', '2026-07-10 21:00:00', 4, 17, 'Culto voltado ao grupo da Terceira Idade. Haverá uma pregação, música e confraternização após o culto.', 'approved'),
(96, 'Culto da Terceira Idade', '2026-09-11 19:45:00', '2026-09-11 21:00:00', 4, 17, 'Culto voltado ao grupo da Terceira Idade. Haverá uma pregação, música e confraternização após o culto.', 'approved'),
(97, 'Culto da Terceira Idade', '2026-11-13 19:45:00', '2026-11-13 21:00:00', 4, 17, 'Culto voltado ao grupo da Terceira Idade. Haverá uma pregação, música e confraternização após o culto.', 'approved'),
(100, 'Novembro Azul ', '2026-11-07 10:45:00', '2026-11-07 11:45:00', 2, 12, '', 'approved'),
(101, 'Caminhada/ corrida ', '2026-02-15 08:00:00', '2026-02-15 09:00:00', 5, 12, '', 'approved'),
(104, 'FEIRA DE SAUDE', '2026-06-28 09:00:00', '2026-06-28 15:00:00', 3, 12, 'FEIRA DE SAUDE', 'approved'),
(105, 'Chamada para curso de parar de fumar', '2026-08-29 15:00:00', '2026-08-28 18:00:00', 5, 12, 'Saida para convidar pessoas para o curso de parar de fumar.Dia Nacional de combate ao fumo é 29 de agosto', 'approved'),
(106, 'Cantata de Páscoa ', '2026-03-29 19:00:00', '2026-03-28 20:30:00', 2, 27, 'Início da Semana Santa - Musical com tema da semana e evangelistico.  ', 'approved'),
(110, 'Coral 2026', '2026-01-24 15:00:00', '2026-01-24 16:10:00', 2, 27, 'Primeiro encontro com os coralistas.', 'approved'),
(113, 'Semana De Oração História da igreja Adventista ', '2026-05-27 19:00:00', '2026-05-28 19:00:00', 2, 5, 'Culto de resgate da história da igreja adventista do sétimo dia, levando a igreja a conhecer nossos pioneiros, dom profético e nosso legado na pregação do evangelho', 'approved'),
(114, 'Reunião com a diretoria do clube de Aventureiros ', '2026-01-31 12:30:00', '2026-01-24 17:00:00', 4, 6, 'Almoço e reunião ', 'approved'),
(115, 'Reunião com a diretoria do clube de Aventureiros ', '2026-01-31 12:30:00', '2026-01-24 17:00:00', 4, 6, 'Almoço e reunião ', 'approved'),
(119, 'Dia do diaconato', '2026-04-18 16:40:00', '2026-01-24 16:41:00', 2, 21, 'Coral das Diaconisas .', 'approved'),
(120, 'Dia do diaconato', '2026-04-18 16:40:00', '2026-01-24 16:41:00', 2, 21, 'Coral das Diaconisas .', 'approved'),
(121, 'Fórum de Integração e Aperfeiçoamento (Feedback 360º)', '2026-06-07 17:00:00', '2026-01-24 18:40:00', 4, 19, 'Avaliar o primeiro semestre e recalibrar as ações. A excelência exige pausa e reflexão. ', 'approved'),
(122, 'Reunião Equipe de Louvor', '2026-02-01 17:00:00', '2026-01-24 18:40:00', 4, 19, 'Estabelecer a base teológica e técnica para o ano. Este não é apenas um encontro administrativo, mas um momento de consagração e visão. ', 'approved'),
(124, 'Ensaio  geral', '2026-03-28 15:00:00', '2026-03-28 17:50:00', 2, 27, 'Ensaio Geral pré Cantata.', 'approved'),
(125, 'Semana de Oração História da Igreja Adventista', '2026-05-28 20:00:00', '2026-05-28 21:00:00', 2, 5, '', 'approved'),
(126, 'Semana de Oração História da Igreja Adventista', '2026-05-29 20:00:00', '2026-05-29 21:00:00', 2, 5, '', 'approved'),
(127, 'Semana de Oração História da Igreja Adventista - Pr Douglas Geraldo', '2026-04-30 11:00:00', '2026-04-30 12:00:00', 2, 5, 'Semana de Oração História da Igreja Adventista', 'approved'),
(128, 'Semana de Oração História da Igreja Adventista - Pr Douglas Geraldo', '2026-05-31 19:00:00', '2026-05-31 20:00:00', 2, 5, 'Semana de Oração História da Igreja Adventista', 'approved'),
(129, 'Semana de Oração História da Igreja Adventista', '2026-05-30 11:00:00', '2026-05-30 12:00:00', 2, 5, '', 'approved'),
(130, 'Programação especial do Quarteto Jades - Escola Sabatina, Culto e JA', '2026-07-04 09:00:00', '2026-07-04 19:00:00', 2, 3, '', 'approved'),
(132, 'JA Ministério Hafah', '2026-10-24 17:00:00', '2026-10-24 19:00:00', 2, 3, '', 'approved'),
(133, 'Culto de Louvor', '2026-12-05 11:00:00', '2026-12-05 12:00:00', 2, 3, 'Culto de louvor dos departamentos de música da IASD Penha', 'approved'),
(134, 'Culto Sábado - Dia Mundial da Terceira idade', '2026-10-03 11:00:00', '2026-10-03 11:59:00', 2, 17, '', 'approved'),
(135, 'Palestra Dia Mundial da Terceira Idade', '2026-10-03 15:00:00', '2026-10-03 16:30:00', 2, 17, '', 'approved'),
(136, 'Culto Divino - Sábado - Norival ', '2026-02-14 11:00:00', '2026-02-14 12:00:00', 2, 29, '', 'approved'),
(137, 'Culto Divino - Sábado - Norival ', '2026-02-14 11:00:00', '2026-02-14 12:00:00', 2, 29, '', 'approved'),
(138, 'Reunião Clube Desbravadores', '2026-01-31 15:00:00', '2026-01-31 17:30:00', 2, 2, '', 'approved'),
(139, 'Reunião Clube Desbravadores', '2026-02-07 15:00:00', '2026-02-07 17:30:00', 2, 2, '', 'approved'),
(140, 'Reunião Clube Desbravadores (10 dias Oração)', '2026-02-21 15:00:00', '2026-02-19 17:30:00', 2, 2, '', 'approved'),
(141, 'Reunião Clube Desbravadores', '2026-02-21 15:00:00', '2026-02-21 17:30:00', 2, 2, '', 'approved'),
(142, 'Culto Divino - Sábado - Especial Aniverário Clube Desbravadores Falcão Real ', '2026-08-08 10:00:00', '2026-08-08 12:00:00', 2, 2, 'Comemoração do aniversário do Clube ', 'approved'),
(143, 'Reunião Clube Desbravadores', '2026-03-07 15:00:00', '2026-03-07 17:14:00', 2, 2, '', 'approved'),
(144, 'Reunião Clube Desbravadores', '2026-03-14 15:00:00', '2026-03-14 17:30:00', 2, 2, '', 'approved'),
(145, 'Reunião Clube Desbravadores', '2026-03-21 15:00:00', '2026-03-21 17:30:00', 2, 2, '', 'approved'),
(146, 'Reunião Clube Desbravadores', '2026-04-04 15:00:00', '2026-04-04 17:30:00', 2, 2, '', 'approved'),
(147, 'Reunião Clube Desbravadores', '2026-04-11 15:00:00', '2026-04-11 17:30:00', 2, 2, '', 'approved'),
(148, 'Reunião Clube Desbravadores', '2026-04-18 15:00:00', '2026-04-18 17:30:00', 2, 2, '', 'approved'),
(149, 'Reunião Clube Desbravadores', '2026-04-25 15:00:00', '2026-04-25 17:30:00', 2, 2, '', 'approved'),
(151, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-02-07 16:00:00', '2026-02-07 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(152, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-03-07 16:00:00', '2026-03-07 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha.', 'approved'),
(153, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-04-04 16:00:00', '2026-04-04 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(154, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-05-02 16:00:00', '2026-05-02 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(155, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-06-06 16:00:00', '2026-05-06 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(156, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-06-06 16:00:00', '2026-05-06 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(157, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-06-06 16:00:00', '2026-05-06 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(158, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-06-06 16:00:00', '2026-05-06 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(159, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-06-06 16:00:00', '2026-05-06 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(160, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-07-04 16:00:00', '2026-07-04 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(162, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-08-01 16:00:00', '2026-08-01 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(163, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-09-05 16:00:00', '2026-09-05 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(164, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-10-03 16:00:00', '2026-10-03 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(165, 'Visitas Missionárias - Sábado Missionário da Mulher Adventista', '2026-03-07 14:00:00', '2026-03-07 17:00:00', 5, 28, '*Serão agendadas previamente visitas para esse dia, a Mulheres Adventistas que estão afastadas, e interessadas. \n     ', 'approved'),
(166, 'COMISSÃO DIRETIVA DA IASD PENHA', '2026-11-07 16:00:00', '2026-11-07 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(167, 'COMISSÃO DIRETIVA DA IASD PENHA ', '2026-12-05 16:00:00', '2026-12-05 18:00:00', 4, 9, 'Comissão Diretiva da IASD Penha', 'approved'),
(168, 'Reunião Clube Desbravadores', '2026-05-02 15:00:00', '2026-05-02 17:30:00', 2, 2, '', 'approved'),
(169, 'Reunião Clube Desbravadores', '2026-05-09 15:00:00', '2026-05-09 17:30:00', 2, 2, '', 'approved'),
(170, 'Reunião Clube Desbravadores', '2026-05-16 15:00:00', '2026-05-16 17:30:00', 4, 2, '', 'approved'),
(171, 'Chá Evangelístico \"Uma amiga para Jesus\" ', '2026-05-17 16:00:00', '2026-05-17 18:00:00', 4, 28, '*Foco: convidar Mulheres não adventista e as Adventistas afastadas. Preparação para Semana do Evangelismo Feminino.', 'approved'),
(172, 'Reunião Clube Desbravadores', '2026-05-23 15:00:00', '2026-05-23 17:30:00', 2, 2, '', 'approved'),
(173, 'Reunião Clube Desbravadores', '2026-05-30 15:00:00', '2026-05-30 17:30:00', 2, 2, '', 'approved'),
(174, 'Reunião Clube Desbravadores', '2026-05-13 15:00:00', '2026-05-13 17:30:00', 2, 2, '', 'approved'),
(175, 'Semana de Evangelismo MM', '2026-05-30 20:00:00', '2026-06-05 20:00:00', 5, 28, 'Ainda definindo qual local será. \nPois ocorrerá em uma residência nos dias: \n30/05 - Sábado 20h (fora da Igreja)\n01/06 - Segunda 20h (fora da igreja)\n02/06 - Terça 20h (fora da Igreja)\n04/06 - Quinta 20h (fora da Igreja)\n05/06 - Sexta 20h (fora da Igreja)\nNos dias de culto convidaremos as mulheres a participar da programação normal do Culto Divino. (Que não será uma programação dirigida pelo MM). \n', 'approved'),
(176, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-19 05:00:00', '2026-02-19 06:00:00', 17, 9, 'Encontro da Semana dos 10 Dias de Oração, via zoom.\nLink a ser enviado posteriormente.', 'approved'),
(177, 'Reunião Clube Desbravadores', '2026-06-13 15:00:00', '2026-06-13 17:30:00', 2, 2, '', 'approved'),
(178, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-20 05:00:00', '2026-02-20 06:00:00', 17, 9, 'Encontro da Semana dos 10 Dias de Oração, via zoom.\nLink a ser enviado posteriormente.', 'approved'),
(179, 'Reunião Clube Desbravadores', '2026-06-20 15:00:00', '2026-06-20 17:30:00', 2, 2, '', 'approved'),
(180, 'Reunião Clube Desbravadores', '2026-06-27 15:00:00', '2026-06-27 17:30:00', 2, 2, '', 'approved'),
(181, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-21 09:00:00', '2026-02-21 12:00:00', 17, 9, 'Semana dos 10 Dias de Oração - Sábado - Dia de Culto.\nEvento Presencial.', 'approved'),
(182, 'Reunião Clube Desbravadores', '2026-07-25 15:00:00', '2026-07-25 17:30:00', 2, 2, 'Grupo Nova voz irá cantar - Faremos Social', 'approved'),
(183, 'JA - Grupo Nova Voz ', '2026-07-25 17:31:00', '2026-07-25 19:00:00', 2, 1, 'Pastor trará o grupo Nova Voz para programação especial', 'approved'),
(184, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-23 05:00:00', '2026-02-23 06:00:00', 17, 9, 'Encontro da Semana dos 10 Dias de Oração, via zoom.\nLink a ser enviado posteriormente.', 'approved'),
(185, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-24 05:00:00', '2026-02-24 06:00:00', 17, 9, 'Encontro da Semana dos 10 Dias de Oração, via zoom.\nLink a ser enviado posteriormente.', 'approved'),
(186, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-25 20:00:00', '2026-02-25 21:00:00', 2, 9, 'Semana 10 Dias de Oração - Quarta-Feira.\nEvento Presencial.', 'approved'),
(187, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-26 05:00:00', '2026-02-26 06:00:00', 17, 9, 'Encontro da Semana dos 10 Dias de Oração, via zoom.\nLink a ser enviado posteriormente.', 'approved'),
(188, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-27 05:00:00', '2026-02-27 06:00:00', 17, 9, 'Encontro da Semana dos 10 Dias de Oração, via zoom.\nLink a ser enviado posteriormente.', 'approved'),
(189, 'Reunião Clube Desbravadores', '2026-08-01 15:00:00', '2026-08-01 17:30:00', 2, 2, '', 'approved'),
(190, '10 Dias de Oração e 10 Horas de Jejum', '2026-02-28 09:00:00', '2026-02-28 12:00:00', 2, 9, 'Pregador - Daniel Dantas - Educacional da APL\nSemana 10 Dias de Oração e 10 Horas de Jejum.\nNeste sábado, será realizada as 10 horas de jejum.\nEvento Presencial.', 'approved'),
(191, 'Reunião Clube Desbravadores ', '2026-08-15 15:00:00', '2026-08-15 17:30:00', 2, 2, '', 'approved'),
(192, 'Reunião Clube Desbravadores', '2026-08-22 15:00:00', '2026-08-22 17:30:00', 2, 2, '', 'approved'),
(193, 'Reunião Clube Desbravadores', '2026-09-05 15:00:00', '2026-09-05 17:30:00', 2, 2, '', 'approved'),
(194, 'Reunião Clube Desbravadores', '2026-09-12 15:00:00', '2026-09-12 17:30:00', 2, 2, '', 'approved'),
(195, 'Reunião Clube Desbravadores', '2026-09-19 15:00:00', '2026-09-19 17:30:00', 2, 2, '', 'approved'),
(196, 'Reunião Clube Desbravadores', '2026-10-17 15:00:00', '2026-10-17 17:30:00', 2, 2, '', 'approved'),
(197, 'Reunião Clube Desbravadores', '2026-10-23 15:00:00', '2026-10-23 16:00:00', 2, 2, '', 'approved'),
(198, 'Reunião Clube Desbravadores', '2026-10-31 15:00:00', '2026-10-31 17:30:00', 2, 2, '', 'approved'),
(199, 'Reunião Clube Desbravadores', '2026-11-07 15:00:00', '2026-11-07 17:30:00', 2, 2, '', 'approved'),
(200, 'Reunião Clube Desbravadores', '2026-11-14 15:00:00', '2026-11-14 17:30:00', 2, 2, '', 'approved'),
(201, 'Reunião Clube Desbravadores', '2026-11-28 15:00:00', '2026-11-28 17:30:00', 2, 2, '', 'approved'),
(203, 'Quebrando Silencio (Programação Igreja)', '2026-10-03 16:00:00', '2026-08-15 18:00:00', 2, 28, 'Palestra', 'approved'),
(204, 'Reunião Clube Desbravadores', '2026-12-05 15:00:00', '2026-12-05 17:30:00', 2, 2, '', 'approved'),
(205, 'Reunião Clube Desbravadores', '2026-12-12 15:00:00', '2026-12-12 17:30:00', 2, 2, '', 'approved'),
(206, 'Reunião Clube Desbravadores', '2026-12-19 15:00:00', '2026-12-19 17:30:00', 2, 2, '', 'approved'),
(213, 'Culto Divino de Encerramento da Semana de Evangelismo MM', '2026-06-06 11:00:00', '2026-06-06 12:00:00', 2, 28, '', 'approved'),
(214, 'Evangelismo Semana Santa - Pr Geovanne', '2026-03-28 09:00:00', '2026-03-28 12:00:00', 2, 29, 'Evangelismo Semana Santa.', 'approved'),
(215, 'Evangelismo Semana Santa - Pr Geovanne', '2026-03-29 19:00:00', '2026-03-29 21:00:00', 2, 29, 'Evangelismo Semana Santa.', 'approved'),
(216, 'Evangelismo Semana Santa - Pr Geovanne', '2026-03-30 20:00:00', '2026-03-30 21:00:00', 2, 29, 'Evangelismo Semana Santa', 'approved'),
(217, 'Evangelismo Semana Santa - Pr Geovanne', '2026-03-31 20:00:00', '2026-03-31 21:00:00', 2, 29, 'Evangelismo Semana Santa', 'approved'),
(218, 'Evangelismo Semana Santa - Pr Geovanne', '2026-04-01 20:00:00', '2026-04-01 21:00:00', 2, 29, 'Evangelismo Semana Santa.', 'approved'),
(219, 'Evangelismo Semana Santa - Pr Geovanne', '2026-04-02 20:00:00', '2026-04-02 20:00:00', 2, 29, 'Evangelismo Semana Santa.', 'approved'),
(220, 'Evangelismo Semana Santa - Pr Geovanne', '2026-04-03 20:00:00', '2026-04-03 21:00:00', 2, 29, 'Evangelismo Semana Santa.', 'approved'),
(221, 'Evangelismo Semana Santa - Pr Geovanne', '2026-04-04 09:00:00', '2026-04-04 12:00:00', 2, 29, 'Evangelismo Semana Santa.', 'approved'),
(222, 'Impacto Esperança', '2026-03-21 09:00:00', '2026-03-21 12:00:00', 5, 9, 'Impacto Esperança.', 'approved'),
(223, 'Dia do Diácono e da Diaconisa', '2026-04-18 10:00:00', '2026-04-18 11:00:00', 2, 9, 'Celebração do Dia do Diaconato.', 'approved'),
(225, 'Culto de sabado - Pr Geovanne', '2026-06-20 10:30:00', '2026-06-20 12:00:00', 2, 29, '- Fim de semana da familia\n- Celebração do Dia do Ancionato', 'approved'),
(226, 'Palestra - Saúde da Mulher - Prevenção', '2026-10-18 16:00:00', '2026-10-18 18:00:00', 4, 28, 'A partir do dia 01/10 será lançado a campanha de arrecadação de lenços para doação. Arrecadaremos nesse encontro, lenços para serem entregues a alguma ong/hospital que apoie o tratamento contra o câncer.', 'approved'),
(227, 'ANIVERSÁRIO PR GEOVANNE MARTINS', '2026-05-10 07:00:00', '2026-05-10 07:30:00', 5, 9, 'Aniversário do Pr Geovanne Martins.', 'approved'),
(228, 'Dia dos Pais', '2026-08-09 09:30:00', '2026-08-09 10:00:00', 2, 9, 'Celebração do Dia dos Pais.', 'approved'),
(229, 'Semana do Batismo da Primavera - Início', '2026-09-19 09:00:00', '2026-09-19 12:00:00', 2, 9, 'Batismo da Primavera - Início.', 'approved'),
(230, 'Semana do Batismo da Primavera', '2026-09-20 20:00:00', '2026-02-20 21:00:00', 2, 9, 'Semana do Batismo da Primavera.', 'approved'),
(231, 'Semana do Batismo da Primavera', '2026-09-21 20:00:00', '2026-09-21 21:00:00', 2, 9, 'Semana do Batismo da Primavera', 'approved'),
(232, 'Semana do Batismo da Primavera', '2026-09-22 20:00:00', '2026-09-22 21:00:00', 2, 9, 'Semana do Batismo da Primavera', 'approved'),
(233, 'Semana do Batismo da Primavera', '2026-09-23 20:00:00', '2026-09-23 21:00:00', 2, 9, 'Semana do Batismo da Primavera', 'approved'),
(234, 'Semana do Batismo da Primavera', '2026-09-24 20:00:00', '2026-09-24 21:00:00', 2, 9, 'Semana do Batismo da Primavera', 'approved'),
(235, 'Semana do Batismo da Primavera', '2026-09-25 20:00:00', '2026-09-25 21:00:00', 2, 9, 'Semana do Batismo da Primavera', 'approved'),
(236, 'Encerramento das 10 horas de Jejum', '2026-02-28 17:00:00', '2026-02-28 18:00:00', 15, 28, 'Será servido na cozinha as frutas trazidas pelos membros para as pessoas que participarem das 10h de Jejum', 'approved'),
(237, 'Semana do Batismo da Primavera - Encerramento ', '2026-09-26 09:00:00', '2026-09-26 12:00:00', 2, 9, 'Semana do Batismo da Primavera', 'approved'),
(238, 'ANIVERSÁRIO DA IASD PENHA', '2026-09-20 09:00:00', '2026-09-20 12:00:00', 2, 9, 'Celebração do Aniversário da Igreja da Penha.', 'approved'),
(240, 'PRÁTICO APL - REGIÃO 1', '2026-12-06 15:00:00', '2026-12-06 18:00:00', 5, 9, 'Treinamento APL - PRÁTICO - Região 1 - Novos Líderes de 2027 - CAVM.', 'approved'),
(241, 'Dia D - Secretaria', '2026-02-07 07:00:00', '2026-02-07 12:00:00', 5, 9, 'Dia D - Atualização Cadastral - Secretaria.', 'approved'),
(242, 'Palestra sobre Liberdade Religiosa', '2026-07-18 17:00:00', '2026-07-18 18:00:00', 2, 16, 'Palestra sobre Liberdade Religiosa no JA', 'approved'),
(244, 'Culto Domingo - Oradora Evaneide', '2026-02-15 19:00:00', '2026-02-15 20:00:00', 2, 29, 'Tema: Aprenda a ouvir a voz de Deus claramente\nMensagem Musical: Gilmar\n', 'approved'),
(245, 'Culto Domingo - Pr. Geovanne', '2026-02-08 19:00:00', '2026-02-08 20:00:00', 2, 29, 'Pregador: Pr. Geovanne\nMensagem musical: Melissa Noilson\n', 'approved'),
(246, 'Ensaio Coral', '2026-02-07 14:30:00', '2026-02-07 15:50:00', 4, 27, 'Ensaio dos corais.', 'approved'),
(247, 'Reunião regular Aventureiros', '2026-02-21 15:00:00', '2026-02-21 17:30:00', 7, 6, 'Reunião regular Aventureiros', 'approved'),
(248, 'Reunião regular Aventureiros', '2026-02-21 15:00:00', '2026-02-21 17:30:00', 13, 6, 'Reunião regular Aventureiros', 'approved'),
(249, 'Reunião regular Aventureiros', '2026-03-07 15:00:00', '2026-03-07 17:30:00', 7, 6, 'Reunião regular Aventureiros', 'approved'),
(250, 'Reunião regular Aventureiros', '2026-03-07 15:00:00', '2026-03-07 17:30:00', 13, 6, 'Reunião regular Aventureiros', 'approved'),
(251, 'Reunião regular Aventureiros', '2026-02-21 15:00:00', '2026-02-21 17:30:00', 12, 6, 'Reunião regular Aventureiros', 'approved'),
(252, 'Reunião regular Aventureiros', '2026-03-07 15:00:00', '2026-03-07 17:30:00', 12, 6, 'Reunião regular Aventureiros', 'approved'),
(253, 'Apresentação Relatório Secretaria', '2026-06-27 10:00:00', '2026-06-27 10:30:00', 2, 9, 'Apresentar um breve relatório da Secretaria junto com a Flávia Brito', 'approved'),
(254, 'Ensaio MUSICAL DE PÁSCOA ', '2026-02-22 16:00:00', '2026-02-22 18:30:00', 4, 27, 'Musical de Páscoa ', 'approved'),
(255, 'Ensaio MUSICAL DE PÁSCOA ', '2026-02-27 19:00:00', '2026-02-27 19:30:00', 4, 27, 'Coral Ensaio Naipes.', 'approved'),
(256, 'CURSO DE CONSELHEIROS - AVENTUREIROS', '2026-03-15 08:00:00', '2026-03-15 12:00:00', 2, 9, 'Curso Regional de Aventureiros na Sede da IASD Penha - Responsável - Evaneide.', 'approved'),
(257, 'Culto Domingo - Orador Douglas', '2026-03-15 19:00:00', '2026-03-15 20:00:00', 2, 29, 'Orador: Douglas\nTema da mensagem: Senhor, abra meus olhos para que eu possa ver\nAncião Responsável: Norival \n', 'approved'),
(258, 'Culto de sábado - a definir', '2026-03-14 10:30:00', '2026-03-14 12:00:00', 2, 29, 'Pregador a definir', 'approved'),
(259, 'JA - Dia Mundial do Jovem Adventista', '2026-03-21 17:30:00', '2026-03-21 19:00:00', 2, 1, 'JA', 'approved'),
(260, 'Culto de domingo - Eduardo', '2026-04-12 19:00:00', '2026-04-12 20:30:00', 2, 29, 'Culto de domingo', 'approved'),
(261, 'Culto de domingo - Luiz Brito', '2026-04-26 19:00:00', '2026-04-26 20:30:00', 2, 29, 'Culto de domingo', 'approved'),
(262, 'Culto de sabado - a definir', '2026-05-02 10:30:00', '2026-05-02 12:00:00', 2, 29, 'Pregador a definir', 'approved'),
(263, 'Culto de domingo - Joilson Lima', '2026-05-03 19:00:00', '2026-05-03 20:30:00', 2, 29, 'Culto de domingo', 'approved'),
(264, 'Culto de sabado - a definir', '2026-05-09 10:30:00', '2026-05-09 12:00:00', 2, 29, 'Celebração Dia das Mães', 'approved'),
(265, 'Culto de domingo - a definir', '2026-05-10 19:00:00', '2026-05-10 20:30:00', 2, 29, 'a definir', 'approved'),
(266, 'Culto de domingo - a definir', '2026-05-17 19:00:00', '2026-05-17 20:30:00', 2, 29, 'a definir', 'approved'),
(267, 'Culto de sabado - a definir', '2026-05-23 10:30:00', '2026-05-23 12:00:00', 2, 29, 'a definir', 'approved'),
(268, 'Culto de sabado - Pedro', '2026-06-13 10:30:00', '2026-06-13 12:00:00', 2, 29, 'Pedro - Ancião da IASD Vila Carrão', 'approved'),
(269, 'Fim de semana da familia', '2026-06-19 20:00:00', '2026-06-19 21:00:00', 2, 26, 'fim de semana da familia', 'approved'),
(270, 'Fim de semana da familia', '2026-06-21 19:00:00', '2026-06-21 20:30:00', 2, 26, 'fim de semana da familia', 'approved'),
(271, 'Ação Missionária dia da Mulher (entrega de Rosas)', '2026-03-08 09:00:00', '2026-03-08 11:00:00', 5, 28, 'Ação Missionária dia da Mulher (entrega de Rosas)\nMinistérios envolvidos: Min. Pessoal/ Min. Mulher/Min. Lar e Família / Min. Oração / Ministério de Publicações \nPonto de encontro: igreja às 9h\nLocal da entrega das rosas: Tiquatira\nData: 08/03', 'approved'),
(272, 'Feira de Saúde - ASA e Ministério da Saúde', '2026-08-02 09:00:00', '2026-08-02 15:00:00', 2, 9, 'Feira de Saúde da IASD Penha\nSerão utilizadas as salas, pátio e nave da igreja para o evento.', 'approved'),
(273, 'Congresso Superação Jovem APL', '2026-03-28 17:51:00', '2026-03-28 21:00:00', 2, 1, 'Congresso de Jovens \"Superação Jovem\" da 1ª Região da APL', 'approved'),
(274, '2ª EDIÇÃO ARENA FORJAP 2026', '2026-04-18 17:37:00', '2026-04-18 19:00:00', 2, 1, '', 'approved'),
(275, '3ª EDIÇÃO ARENA FORJAP', '2026-05-23 17:37:00', '2026-05-23 19:00:00', 2, 1, '', 'approved'),
(276, '4ª EDIÇÃO ARENA FORJAP', '2026-06-27 17:37:00', '2026-06-27 19:00:00', 2, 1, '', 'approved'),
(277, 'Culto Divino - Abertura da Semana de Evangelismo Jovem ', '2026-07-18 10:15:00', '2026-07-18 12:00:00', 2, 1, 'Culto divino de Abertura da Semana de Evangelismo Jovem, de 18 a 25 de julho. ', 'approved'),
(278, 'Semana de Evangelismo Jovem - 2° dia', '2026-07-19 19:00:00', '2026-07-19 20:00:00', 2, 1, '', 'approved'),
(279, 'Semana de Evangelismo Jovem - 3° dia', '2026-07-20 20:00:00', '2026-07-20 21:00:00', 2, 1, '', 'approved'),
(280, 'Semana de Evangelismo Jovem - 4° dia', '2026-07-21 20:00:00', '2026-07-21 21:00:00', 2, 1, '', 'approved'),
(281, 'Semana de Evangelismo Jovem - 5° dia', '2026-07-22 20:00:00', '2026-07-22 21:00:00', 2, 1, '', 'approved'),
(282, 'Semana de Evangelismo Jovem - 6° dia', '2026-07-23 20:00:00', '2026-07-23 21:00:00', 2, 1, '', 'approved'),
(283, 'Semana de Evangelismo Jovem - 7° dia', '2026-07-24 20:00:00', '2026-07-24 21:00:00', 2, 1, '', 'approved'),
(284, '5ª EDIÇÃO ARENA FORJAP', '2026-08-22 17:37:00', '2026-08-22 19:00:00', 2, 1, '', 'approved'),
(285, '6ª EDIÇÃO ARENA FORJAP', '2026-09-26 17:37:00', '2026-09-26 19:00:00', 2, 1, '', 'approved'),
(286, '7ª EDIÇÃO ARENA FORJAP', '2026-10-17 17:37:00', '2026-10-17 19:00:00', 2, 1, '', 'approved'),
(287, 'ARENA FORJAP - ÚLTIMA DO ANO!!! ', '2026-12-12 17:37:00', '2026-12-12 19:00:00', 2, 1, '', 'approved'),
(288, '8ª EDIÇÃO ARENA FORJAP', '2026-10-31 17:37:00', '2026-10-31 19:00:00', 2, 1, '', 'pending');

-- --------------------------------------------------------

--
-- Estrutura para tabela `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `locations`
--

INSERT INTO `locations` (`id`, `name`, `photo`) VALUES
(2, 'Nave da Igreja', 'https://adventistaspenha.org/agenda/local/m/nave.jpg'),
(3, 'Quadra', 'https://adventistaspenha.org/agenda/local/m/quadra.jpg'),
(4, 'Salão de Jovens', 'https://adventistaspenha.org/agenda/local/m/jovens.jpg'),
(5, 'Saída Externa', 'https://adventistaspenha.org/agenda/local/m/externo.jpg'),
(7, 'Sala dos Adolescentes', 'https://adventistaspenha.org/agenda/local/m/adolescente.jpg'),
(9, 'Sala dos Juvenis', 'https://adventistaspenha.org/agenda/local/m/juvenis.jpg'),
(11, 'Rol do Berço', 'https://adventistaspenha.org/agenda/local/m/rol.jpg'),
(12, 'Sala do Jardim da Infância', 'https://adventistaspenha.org/agenda/local/m/infancia.jpg'),
(13, 'Sala dos Primários', 'https://adventistaspenha.org/agenda/local/m/primarios.jpg'),
(17, 'Sala Reunião (Zoom)', 'https://adventistaspenha.org/agenda/local/m/zoom.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` enum('admin','leader') NOT NULL DEFAULT 'leader',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `departmentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `created_at`, `departmentId`) VALUES
(4, 'secretaria', '2QXENXK5', 'Secretaria', 'leader', '2026-01-15 01:16:03', 9),
(5, 'administrador', 'ZIYPERL8', 'Administrador', 'admin', '2026-01-15 01:34:18', NULL),
(6, 'Tesouraria', 'X1LHWY2W', 'Tesouraria', 'leader', '2026-01-15 01:56:53', 10),
(7, 'Patrimonio', 'R5CHHJC9', 'Patrimonio', 'leader', '2026-01-15 01:57:39', 11),
(8, 'Saúde', 'IO455BX0', 'Saúde', 'leader', '2026-01-15 01:58:05', 12),
(9, 'Publicações', 'SEP5XRY5', 'Publicações', 'leader', '2026-01-15 01:58:49', 14),
(10, 'Oração', '81STXAQU', 'Oração', 'leader', '2026-01-15 01:59:19', 13),
(11, 'Escola', 'RV7VGU3S', 'Escola', 'leader', '2026-01-15 01:59:50', 4),
(12, 'Recepção', 'OCQ5XFPK', 'Recepção', 'leader', '2026-01-15 02:00:21', 15),
(13, 'Liberdade', '8Z9VGW1V', 'Liberdade', 'leader', '2026-01-15 11:29:44', 16),
(14, 'Terceira', 'SUCYDDEB', 'Terceira', 'leader', '2026-01-15 11:30:44', 16),
(15, 'Adolecentes', 'NQQY0BXQ', 'Adolecentes', 'leader', '2026-01-15 11:31:30', 18),
(16, 'Desbravadores', 'DE8UETDA', 'Desbravadores', 'leader', '2026-01-15 11:32:08', 2),
(17, 'Jovem', 'I70HZ8WK', 'Jovem', 'leader', '2026-01-15 11:33:01', 1),
(18, 'Pessoal', 'A5GU9A3I', 'Pessoal', 'leader', '2026-01-15 11:33:44', 5),
(19, 'Louvor', '3Z64SE2I', 'Louvor', 'leader', '2026-01-15 11:34:13', 19),
(20, 'Comunicação', '9BU0LVZT', 'Comunicação', 'leader', '2026-01-15 11:35:03', 7),
(21, 'Diaconato', 'IDDIO7MT', 'Diaconato', 'leader', '2026-01-15 11:35:47', 21),
(22, 'Mordomia', 'N2C0U1CD', 'Mordomia', 'leader', '2026-01-15 11:36:26', 22),
(25, 'Aventureiros', 'QIWAENWX', 'Aventureiros', 'leader', '2026-01-15 11:37:38', 6),
(26, 'Criança', '2D494TXC', 'Criança', 'leader', '2026-01-15 11:40:04', 23),
(27, 'Possibilidades', 'AZTPPBFO', 'Possibilidades', 'leader', '2026-01-15 11:40:35', 24),
(28, 'Asa', 'VU1MT7VA', 'Asa', 'leader', '2026-01-15 11:41:01', 25),
(29, 'Lar', 'JB8JL5UD', 'Lar', 'leader', '2026-01-15 11:41:27', 26),
(31, 'Ancionato', '9R2OWUU4', 'Ancionato', 'leader', '2026-01-15 11:42:18', 29),
(32, 'Coral', '60NS6ET5', 'Coral', 'leader', '2026-01-15 11:42:48', 27),
(33, 'Mulher', '971BAAO0', 'Mulher', 'leader', '2026-01-15 11:43:22', 28),
(34, 'Musica', 'MQRLBOS9', 'Musica', 'leader', '2026-01-15 11:43:50', 28),
(35, 'Sonoplastia', 'GEFEAREP', 'Sonoplastia', 'leader', '2026-01-15 11:46:09', 30),
(36, 'Pastor', 'P2LHW32W', 'Geovane Martins', 'leader', '2026-01-22 22:32:42', 31);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT de tabela `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
