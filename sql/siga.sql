-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Tempo de geração: 15/04/2019 às 11:55
-- Versão do servidor: 5.7.25
-- Versão do PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `siga`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Administracao`
--

CREATE TABLE `Administracao` (
  `id` bigint(20) NOT NULL,
  `descricao_funcao` varchar(255) NOT NULL,
  `funcao` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `siape` int(11) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Administracao`
--

INSERT INTO `Administracao` (`id`, `descricao_funcao`, `funcao`, `nome`, `siape`, `usuario_id`) VALUES
(1, 'Coordenador de TI', 'Administrador', 'CLÉSIO DE ARAÚJO GONÇALVES', 2216133, 1),
(2, 'Técnico de Laboratório de Informática', 'Administrador', 'CAIO HENRIQUE RODRIGUES CARVALHO', 2405768, 3),
(3, 'Diretor de Ensino', 'Diretor', 'FRANCISCO RAIMUNDO DE SOUZA NETO', 2318961, 8),
(4, 'Coordenador do Curso de Agropecuária', 'Coordenador', 'FRANCELINO NEIVA RODRIGUES', 2192905, 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Aluno`
--

CREATE TABLE `Aluno` (
  `id` bigint(20) NOT NULL,
  `matricula` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `beneficio_id` bigint(20) DEFAULT NULL,
  `situacao_id` bigint(20) NOT NULL,
  `turma_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Aluno`
--

INSERT INTO `Aluno` (`id`, `matricula`, `nome`, `telefone`, `beneficio_id`, `situacao_id`, `turma_id`, `usuario_id`) VALUES
(1, '20161ipa0177', 'MANOELA SOUSA DA PAIXÃO', '(89) 9941-29608', NULL, 1, 1, 7),
(2, '20171ipa0098', 'LARA RUTE SOUSA SILVA', '(89) 9943-98908', NULL, 1, 2, 16),
(3, '20171ipa0306', 'ADNA NERY ALVES PEREIRA', '(89) 9941-24510', NULL, 1, 2, 17),
(4, '20181IMP0233', 'VINÍCIUS RODRIGUES DE SOUSA', '', NULL, 1, 4, NULL),
(5, '20181QUIMI1T', 'EDNA MARIA SOUSA CARVALHO', '', NULL, 1, 7, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `AlunoAtendimentoMonitoria`
--

CREATE TABLE `AlunoAtendimentoMonitoria` (
  `aluno_id` bigint(20) NOT NULL,
  `atendimento_monitoria_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `AlunoExtraClasse`
--

CREATE TABLE `AlunoExtraClasse` (
  `aluno_id` bigint(20) NOT NULL,
  `extra_classe_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `AlunoSituacao`
--

CREATE TABLE `AlunoSituacao` (
  `data` datetime NOT NULL,
  `aluno_id` bigint(20) NOT NULL,
  `situacao_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `AlunoSituacao`
--

INSERT INTO `AlunoSituacao` (`data`, `aluno_id`, `situacao_id`) VALUES
('2019-03-26 13:51:01', 1, 1),
('2019-04-04 20:05:21', 2, 1),
('2019-04-04 20:09:02', 3, 1),
('2019-04-11 14:52:41', 4, 1),
('2019-04-12 21:24:56', 5, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `AtendimentoIndisciplina`
--

CREATE TABLE `AtendimentoIndisciplina` (
  `id` bigint(20) NOT NULL,
  `advertido` varchar(3) NOT NULL,
  `data` date NOT NULL,
  `descricao` text NOT NULL,
  `horario` time NOT NULL,
  `tipo_advertencia` varchar(9) DEFAULT NULL,
  `aluno_id` bigint(20) NOT NULL,
  `profissional_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `AtendimentoIndisciplina`
--

INSERT INTO `AtendimentoIndisciplina` (`id`, `advertido`, `data`, `descricao`, `horario`, `tipo_advertencia`, `aluno_id`, `profissional_id`) VALUES
(1, 'Não', '2019-04-06', 'Aluno foi embora do campus injustificadamente após às aulas da manhã, não assistindo as aulas de contraturno (à tarde).', '15:10:00', NULL, 4, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `AtendimentoMonitoria`
--

CREATE TABLE `AtendimentoMonitoria` (
  `id` bigint(20) NOT NULL,
  `conteudo` text NOT NULL,
  `data` date NOT NULL,
  `dificuldades_diagnosticadas` text NOT NULL,
  `horario_final` time NOT NULL,
  `horario_inicial` time NOT NULL,
  `local` varchar(255) NOT NULL,
  `status_atendimento` bit(1) NOT NULL,
  `disciplina_id` bigint(20) DEFAULT NULL,
  `monitor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `AtendimentoPedagogiaAluno`
--

CREATE TABLE `AtendimentoPedagogiaAluno` (
  `id` bigint(20) NOT NULL,
  `ausencia_professor` bit(1) NOT NULL,
  `data` date NOT NULL,
  `dificuldades_ensino_aprendizagem` bit(1) NOT NULL,
  `encaminhamento` text NOT NULL,
  `exposicao_motivos` text NOT NULL,
  `horario_final` time NOT NULL,
  `horario_inicial` time NOT NULL,
  `indisciplina` bit(1) NOT NULL,
  `outros` varchar(255) DEFAULT NULL,
  `relacao_professor_aluno` bit(1) NOT NULL,
  `aluno_id` bigint(20) NOT NULL,
  `profissional_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `AtendimentoPedagogiaFamilia`
--

CREATE TABLE `AtendimentoPedagogiaFamilia` (
  `id` bigint(20) NOT NULL,
  `data` date NOT NULL,
  `encaminhamento` text NOT NULL,
  `horario_final` time NOT NULL,
  `horario_inicial` time NOT NULL,
  `relato` text NOT NULL,
  `responsavel` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `aluno_id` bigint(20) NOT NULL,
  `profissional_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `AtendimentoSaude`
--

CREATE TABLE `AtendimentoSaude` (
  `id` bigint(20) NOT NULL,
  `data` date NOT NULL,
  `esse_problema_dificulta_aprendizado` varchar(255) DEFAULT NULL,
  `horario_final` time NOT NULL,
  `horario_inicial` time NOT NULL,
  `possui_problema` varchar(255) NOT NULL,
  `aluno_id` bigint(20) NOT NULL,
  `profissional_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Beneficio`
--

CREATE TABLE `Beneficio` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Beneficio`
--

INSERT INTO `Beneficio` (`id`, `nome`) VALUES
(2, 'Eventual'),
(1, 'Permanente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Curso`
--

CREATE TABLE `Curso` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Curso`
--

INSERT INTO `Curso` (`id`, `nome`) VALUES
(8, 'Bacharelado em Zootecnia'),
(9, 'Licenciatura em Química'),
(3, 'Técnico em Administração Integrado ao Médio'),
(6, 'Técnico em Administração Subsequente'),
(1, 'Técnico em Agropecuária Integrado ao Médio'),
(7, 'Técnico em Agropecuária Subsequente'),
(4, 'Técnico em Informática para a Internet Subsequente'),
(2, 'Técnico em Mineração Integrado ao Médio'),
(5, 'Técnico em Mineração Subsequente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Disciplina`
--

CREATE TABLE `Disciplina` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `monitor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Docente`
--

CREATE TABLE `Docente` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `siape` int(11) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Docente`
--

INSERT INTO `Docente` (`id`, `nome`, `siape`, `usuario_id`) VALUES
(1, 'FLÁVIA DE FREITAS BASTOS', 2151539, 2),
(2, 'SANEY MÁRIO PEREIRA NERI', 3048026, 6),
(3, 'FRANCISCO RAIMUNDO DE SOUZA NETO', 2318961, 9),
(4, 'THIAGO DE SOUSA FONSECA ', 1999962, 10),
(5, 'VINÍCIUS IGOR ALBUQUERQUE BATISTA DE ARAÚJO', 2998646, 11),
(6, 'MARLI FERREIRA DE CARVALHO DAMASCENO', 1869520, 12),
(7, 'JANIEL MARTINS NEVES', 2298511, 13),
(8, 'FRANCELINO NEIVA RODRIGUES', 2192905, 14),
(9, 'WERNEY AYALA LUZ LIRA', 3000799, 18);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ExtraClasse`
--

CREATE TABLE `ExtraClasse` (
  `id` bigint(20) NOT NULL,
  `conteudo` text NOT NULL,
  `data` date NOT NULL,
  `dificuldades_diagnosticadas` text NOT NULL,
  `horario_final` time NOT NULL,
  `horario_inicial` time NOT NULL,
  `local` varchar(255) NOT NULL,
  `status_atendimento` bit(1) NOT NULL,
  `disciplina_id` bigint(20) DEFAULT NULL,
  `docente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Monitor`
--

CREATE TABLE `Monitor` (
  `id` bigint(20) NOT NULL,
  `matricula` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Perfil`
--

CREATE TABLE `Perfil` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Perfil`
--

INSERT INTO `Perfil` (`id`, `nome`) VALUES
(1, 'Administrador'),
(11, 'Aluno'),
(5, 'Assistência Social'),
(12, 'Coordenação de Disciplina'),
(2, 'Coordenador'),
(3, 'Diretor'),
(9, 'Docente'),
(6, 'Enfermagem'),
(10, 'Monitor'),
(8, 'Odontologia'),
(7, 'Pedagogia'),
(4, 'Psicologia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Profissional`
--

CREATE TABLE `Profissional` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `siape` int(11) NOT NULL,
  `tipo_atendimento` varchar(255) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Profissional`
--

INSERT INTO `Profissional` (`id`, `nome`, `siape`, `tipo_atendimento`, `usuario_id`) VALUES
(1, 'RAQUELINE CASTRO DE SOUSA SAMPAIO', 1808267, 'Pedagogia', 4),
(2, 'FERNANDA PEREIRA DA SILVA', 2151185, 'Pedagogia', 5),
(3, 'ADENILDO RODRIGUES GONÇALVES', 2151671, 'Coordenação de Disciplina', 20),
(4, 'JOÃO DA COSTA CARVALHO', 3007299, 'Coordenação de Disciplina', 21);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Situacao`
--

CREATE TABLE `Situacao` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Situacao`
--

INSERT INTO `Situacao` (`id`, `nome`) VALUES
(2, 'Aprovado no Conselho'),
(3, 'Aprovado no Conselho com Pendência'),
(1, 'Cursando'),
(4, 'Retido');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Turma`
--

CREATE TABLE `Turma` (
  `id` bigint(20) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `curso_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Turma`
--

INSERT INTO `Turma` (`id`, `ativo`, `nome`, `curso_id`) VALUES
(1, b'1', 'Técnico em Agropecuária Integrado ao Médio - 2018.1 - Única', 1),
(2, b'1', 'Técnico em Agropecuária Integrado ao Médio - 2017.1 - Única', 1),
(3, b'1', 'Técnico em Agropecuária Integrado ao Médio - 2019.1 - Única', 1),
(4, b'1', 'Técnico em Mineração Integrado ao Médio - 2018.1 - Única', 2),
(5, b'1', 'Licenciatura em Química - 2016.1 - Única', 9),
(6, b'1', 'Licenciatura em Química - 2017.1 - Única', 9),
(7, b'1', 'Licenciatura em Química - 2018.1 - Única', 9),
(8, b'1', 'Licenciatura em Química - 2019.1 - Única', 9),
(9, b'1', 'Bacharelado em Zootecnia - 2017.1 - Única', 8),
(10, b'1', 'Bacharelado em Zootecnia - 2018.1 - Única', 8),
(11, b'1', 'Bacharelado em Zootecnia - 2019.1 - Única', 8),
(12, b'1', 'Técnico em Mineração Integrado ao Médio - 2017.1 - A', 2),
(13, b'1', 'Técnico em Mineração Integrado ao Médio - 2017.1 - B', 2),
(14, b'1', 'Técnico em Mineração Integrado ao Médio - 2019.1 - Única', 2),
(15, b'1', 'Técnico em Administração Integrado ao Médio - 2018.1 - Única', 3),
(16, b'1', 'Técnico em Administração Integrado ao Médio - 2019.1 - Única', 3),
(17, b'1', 'Técnico em Mineração Subsequente - 2017.2 - Única', 5),
(19, b'1', 'Técnico em Mineração Subsequente - 2018.1 - Única', 5),
(20, b'1', 'Técnico em Mineração Subsequente - 2019.1 - Única', 5),
(21, b'1', 'Técnico em Agropecuária Subsequente - 2018.1 - Única', 7),
(22, b'1', 'Técnico em Agropecuária Subsequente - 2018.2 - Única', 7),
(23, b'1', 'Técnico em Agropecuária Subsequente - 2019.1 - Única', 7),
(24, b'1', 'Técnico em Administração Subsequente - 2018.1 - Única', 6),
(25, b'1', 'Técnico em Administração Subsequente - 2018.2 - Única', 6),
(27, b'1', 'Técnico em Informática para a Internet Subsequente - 2018.1 - Única', 4),
(28, b'1', 'Técnico em Informática para a Internet Subsequente - 2018.2 - Única', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TurmaDisciplinaDocente`
--

CREATE TABLE `TurmaDisciplinaDocente` (
  `disciplina_id` bigint(20) NOT NULL,
  `docente_id` bigint(20) NOT NULL,
  `turma_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Usuario`
--

CREATE TABLE `Usuario` (
  `id` bigint(20) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Usuario`
--

INSERT INTO `Usuario` (`id`, `ativo`, `email`, `senha`, `perfil_id`) VALUES
(1, b'1', 'clesio.goncalves@ifpi.edu.br', '$2a$10$bRHXvb97c2b4avC31ISmF.4xZkCgUsVMS./xsWvDL83OE8WIVpxX6', 1),
(2, b'1', 'flaviaf.bastos@ifpi.edu.br', '$2a$10$fjOXnOV0VfR68zoCge0ad.3Pw94NL7WcCnQ7YM33pAMaoFf5LjmBS', 9),
(3, b'1', 'caiohenriquerc@ifpi.edu.br', '$2a$10$Jyq2AF1DvmxZQwpWBMDXVOtip8rsRcR3pBN5adVYG5tuhp6BWD0/O', 1),
(4, b'1', 'raquelinecastro@ifpi.edu.br', '$2a$10$M0jPKrGIqAK9tHOvwuV6ZuHly94IfO1JzXWOJoSLW1cW/QclDDmIu', 7),
(5, b'1', 'fernanda.pereira@ifpi.edu.br', '$2a$10$beF6B2iBz6p/zH6Gf0O.1u/7EZRH0rBZV4LV36.6VsRPY7bKIQcxm', 7),
(6, b'1', 'saney.neri@ifpi.edu.br', '$2a$10$CVhNY8.zJqB7KtOyyjC5XujqnHcb8OX3MGCSDAjwlT3knabMKSAeK', 9),
(7, b'1', 'manueladapaixao@gmail.com', '$2a$10$tXJ9sR71SkJtJIvfDseVvOMVuiZu4/P7clIZcOR7DKL8owNKrp5SO', 11),
(8, b'1', 'dens.capau@ifpi.edu.br', '$2a$10$pTW2F.xIxeQBIOV01Dw3PeyGqkBLdv7tsilOH.iL0wwOaZ0nYOCuC', 3),
(9, b'1', 'francisconeto@ifpi.edu.br', '$2a$10$9HYbKRm./Qye5SWM7opzEuRxjA.XX1JNm0cFB9WDIboIBioXxoZzS', 9),
(10, b'1', 'thiago.fonseca@ifpi.edu.br', '$2a$10$4LnXG.EgbRwc.BHHd03iaO.IrlFAkFPWl/fddyrExmLcqvIDvn3Sq', 9),
(11, b'1', 'viniciusigor@ifpi.edu.br', '$2a$10$o1kabBMiyMri/.hPZXhIVe1BPWEFKTDBqM17fOpusIr4VzP8vdIEu', 9),
(12, b'1', 'marlinegreiros@ifpi.edu.br', '$2a$10$Pb1NimF0JD3KEyCD6gfJTuT3E1Rg93gYnOKqa7mscRIFaRSuKx8nq', 9),
(13, b'1', 'jani.martins@ifpi.edu.br', '$2a$10$esvmeQhkE2mTa4vERRcuaOiGOdFFsxCFQHWQ4bg80c2SpPKLG18me', 9),
(14, b'1', 'francelino.neiva@ifpi.edu.br', '$2a$10$xLp0C92OpZHtewAnGl05M.GT5RPpYPIOoRqgZLIe6NHCVnwqXcn/u', 9),
(15, b'1', 'agro.capau@ifpi.edu.br', '$2a$10$eHRQJnIqB1e5fxLJ5gUxFeQfcxBVncA1l2UyNbi0szN5DqKDsYXpO', 2),
(16, b'1', 'lr446409@gmail.com', '$2a$10$wCFgzU5tm2WYIsAK5QWRYutKaEmKCdCurNNLwGJjJeMoruTlHs.xu', 11),
(17, b'1', 'adnaalves0902@gmail.com', '$2a$10$HasofFj1opG6AkPji7LNNugVwqm5xH8ZyVUqgL3netozIg0tc8o0a', 11),
(18, b'1', 'werney@ifpi.edu.br', '$2a$10$A6C0h9IW8HM19rUNawi42ebvCbQDxxsgAfocnX4nvZ49BWA8jhBe2', 9),
(20, b'1', 'adenildo@ifpi.edu.br', '$2a$10$k2eexKNWie57Er97Se1CoOiFlet2lB8GubrKm7KP12WOUOZb8Bgnq', 12),
(21, b'1', 'joao.costa@ifpi.edu.br', '$2a$10$f2AD.CAwLzHOFPcgDmBPsePiuVkFvzmNLRxuTD9r4ku8.Ndf7FNFq', 12);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `Administracao`
--
ALTER TABLE `Administracao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_h4u0djuvdsb0rayip4a7lda` (`siape`),
  ADD KEY `FKd2usnsmt4hgn0kls88sb9bjl3` (`usuario_id`);

--
-- Índices de tabela `Aluno`
--
ALTER TABLE `Aluno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_2yc6wv6b5w2aph89au30mw6gj` (`matricula`),
  ADD KEY `FK6epebghcd6des1y0rvl0wu4jn` (`beneficio_id`),
  ADD KEY `FKlqqhupusunkbmrol8c6eeep8v` (`situacao_id`),
  ADD KEY `FKc2jbyom2ws00xwire0hms5bny` (`turma_id`),
  ADD KEY `FK9g93732bbv72in0j76lcm9qqs` (`usuario_id`);

--
-- Índices de tabela `AlunoAtendimentoMonitoria`
--
ALTER TABLE `AlunoAtendimentoMonitoria`
  ADD PRIMARY KEY (`aluno_id`,`atendimento_monitoria_id`),
  ADD KEY `FKcxkjdsx5vyvkl5dl6j6gxv6rt` (`atendimento_monitoria_id`);

--
-- Índices de tabela `AlunoExtraClasse`
--
ALTER TABLE `AlunoExtraClasse`
  ADD PRIMARY KEY (`aluno_id`,`extra_classe_id`),
  ADD KEY `FKnjew2bkivhyxponx5do270rpx` (`extra_classe_id`);

--
-- Índices de tabela `AlunoSituacao`
--
ALTER TABLE `AlunoSituacao`
  ADD PRIMARY KEY (`aluno_id`,`data`,`situacao_id`),
  ADD KEY `FKg7lgk8if8kc91s3bnidvjj16h` (`situacao_id`);

--
-- Índices de tabela `AtendimentoIndisciplina`
--
ALTER TABLE `AtendimentoIndisciplina`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7r7dp8g5rtelc4sj9f8j9ktoo` (`aluno_id`),
  ADD KEY `FKpfj8pdcu9y4o4p9l46xyinjhe` (`profissional_id`);

--
-- Índices de tabela `AtendimentoMonitoria`
--
ALTER TABLE `AtendimentoMonitoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcuya1gewy2fctyx6ve5qmqk0q` (`disciplina_id`),
  ADD KEY `FKj2e864yvamdmny2ayfw7lxa63` (`monitor_id`);

--
-- Índices de tabela `AtendimentoPedagogiaAluno`
--
ALTER TABLE `AtendimentoPedagogiaAluno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6wrkn6yn7ab78e5st555eqbws` (`aluno_id`),
  ADD KEY `FKp1udtciw4m1jmk7jw7137onqp` (`profissional_id`);

--
-- Índices de tabela `AtendimentoPedagogiaFamilia`
--
ALTER TABLE `AtendimentoPedagogiaFamilia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2ua24rfgv62cu3fuh0100wt4h` (`aluno_id`),
  ADD KEY `FKnxtcuf7ka1cohwuyyirq1itq5` (`profissional_id`);

--
-- Índices de tabela `AtendimentoSaude`
--
ALTER TABLE `AtendimentoSaude`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKb5wfb5v7sfg8lnjnxuujyb01f` (`aluno_id`),
  ADD KEY `FK56tkaqhbr49rihec9imni54hk` (`profissional_id`);

--
-- Índices de tabela `Beneficio`
--
ALTER TABLE `Beneficio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_tdn0ix4lq9od7hp3e3qi6k069` (`nome`);

--
-- Índices de tabela `Curso`
--
ALTER TABLE `Curso`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_o7iw08duv7h299c3w99e3do4d` (`nome`);

--
-- Índices de tabela `Disciplina`
--
ALTER TABLE `Disciplina`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ph91bk31kl6hpw0e2vovbs94s` (`nome`),
  ADD KEY `FKgb43x7s9f9pdcgajxjric4iq0` (`monitor_id`);

--
-- Índices de tabela `Docente`
--
ALTER TABLE `Docente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ondspjewfoyb5trbruqup9si8` (`siape`),
  ADD KEY `FKq5el32tplvrwyqk5xqm95oay4` (`usuario_id`);

--
-- Índices de tabela `ExtraClasse`
--
ALTER TABLE `ExtraClasse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4bb8qym7b27ye1ditv9tajna9` (`disciplina_id`),
  ADD KEY `FKri7od0peha1pfb1qx3owqv6aq` (`docente_id`);

--
-- Índices de tabela `Monitor`
--
ALTER TABLE `Monitor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_aertaclm68l1a6i66kcymch55` (`matricula`),
  ADD KEY `FKnfygluur2ritmpgangy2e0hee` (`usuario_id`);

--
-- Índices de tabela `Perfil`
--
ALTER TABLE `Perfil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ewskde8c1ixva207gu93jtwhe` (`nome`);

--
-- Índices de tabela `Profissional`
--
ALTER TABLE `Profissional`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_5gbrvxs6lubmgsk07tsvc806o` (`siape`),
  ADD KEY `FK2rpa94kyrmwj8bxfckxvceuu4` (`usuario_id`);

--
-- Índices de tabela `Situacao`
--
ALTER TABLE `Situacao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_p9libjflm9xtbpkiq7vrqhx99` (`nome`);

--
-- Índices de tabela `Turma`
--
ALTER TABLE `Turma`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ix2ugfeyrltyors96yp2nv5l8` (`nome`),
  ADD KEY `FKfh64j0pkcjkjl9h6vbakpwt31` (`curso_id`);

--
-- Índices de tabela `TurmaDisciplinaDocente`
--
ALTER TABLE `TurmaDisciplinaDocente`
  ADD PRIMARY KEY (`disciplina_id`,`docente_id`,`turma_id`),
  ADD KEY `FK2kxx4c3cqaqemkxkadynmlpjl` (`docente_id`),
  ADD KEY `FK5j3wnd9adgeseehb2i718ty0w` (`turma_id`);

--
-- Índices de tabela `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_4tdehxj7dh8ghfc68kbwbsbll` (`email`),
  ADD KEY `FKb0s6qtq0ga0u7y0nxqd4x6133` (`perfil_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `Administracao`
--
ALTER TABLE `Administracao`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Aluno`
--
ALTER TABLE `Aluno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `AtendimentoIndisciplina`
--
ALTER TABLE `AtendimentoIndisciplina`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `AtendimentoMonitoria`
--
ALTER TABLE `AtendimentoMonitoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `AtendimentoPedagogiaAluno`
--
ALTER TABLE `AtendimentoPedagogiaAluno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `AtendimentoPedagogiaFamilia`
--
ALTER TABLE `AtendimentoPedagogiaFamilia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `AtendimentoSaude`
--
ALTER TABLE `AtendimentoSaude`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Beneficio`
--
ALTER TABLE `Beneficio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `Curso`
--
ALTER TABLE `Curso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `Disciplina`
--
ALTER TABLE `Disciplina`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Docente`
--
ALTER TABLE `Docente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `ExtraClasse`
--
ALTER TABLE `ExtraClasse`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Monitor`
--
ALTER TABLE `Monitor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Perfil`
--
ALTER TABLE `Perfil`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `Profissional`
--
ALTER TABLE `Profissional`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Situacao`
--
ALTER TABLE `Situacao`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Turma`
--
ALTER TABLE `Turma`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `Administracao`
--
ALTER TABLE `Administracao`
  ADD CONSTRAINT `FKd2usnsmt4hgn0kls88sb9bjl3` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`);

--
-- Restrições para tabelas `Aluno`
--
ALTER TABLE `Aluno`
  ADD CONSTRAINT `FK6epebghcd6des1y0rvl0wu4jn` FOREIGN KEY (`beneficio_id`) REFERENCES `Beneficio` (`id`),
  ADD CONSTRAINT `FK9g93732bbv72in0j76lcm9qqs` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`),
  ADD CONSTRAINT `FKc2jbyom2ws00xwire0hms5bny` FOREIGN KEY (`turma_id`) REFERENCES `Turma` (`id`),
  ADD CONSTRAINT `FKlqqhupusunkbmrol8c6eeep8v` FOREIGN KEY (`situacao_id`) REFERENCES `Situacao` (`id`);

--
-- Restrições para tabelas `AlunoAtendimentoMonitoria`
--
ALTER TABLE `AlunoAtendimentoMonitoria`
  ADD CONSTRAINT `FKa1tqa388jky582ed21p1rxfxo` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`),
  ADD CONSTRAINT `FKcxkjdsx5vyvkl5dl6j6gxv6rt` FOREIGN KEY (`atendimento_monitoria_id`) REFERENCES `AtendimentoMonitoria` (`id`);

--
-- Restrições para tabelas `AlunoExtraClasse`
--
ALTER TABLE `AlunoExtraClasse`
  ADD CONSTRAINT `FKm0ys2k017thirvqd2ymb3d2rg` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`),
  ADD CONSTRAINT `FKnjew2bkivhyxponx5do270rpx` FOREIGN KEY (`extra_classe_id`) REFERENCES `ExtraClasse` (`id`);

--
-- Restrições para tabelas `AlunoSituacao`
--
ALTER TABLE `AlunoSituacao`
  ADD CONSTRAINT `FK1a9cyyd2xpc9hbcq6dg84h5mw` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`),
  ADD CONSTRAINT `FKg7lgk8if8kc91s3bnidvjj16h` FOREIGN KEY (`situacao_id`) REFERENCES `Situacao` (`id`);

--
-- Restrições para tabelas `AtendimentoIndisciplina`
--
ALTER TABLE `AtendimentoIndisciplina`
  ADD CONSTRAINT `FK7r7dp8g5rtelc4sj9f8j9ktoo` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`),
  ADD CONSTRAINT `FKpfj8pdcu9y4o4p9l46xyinjhe` FOREIGN KEY (`profissional_id`) REFERENCES `Profissional` (`id`);

--
-- Restrições para tabelas `AtendimentoMonitoria`
--
ALTER TABLE `AtendimentoMonitoria`
  ADD CONSTRAINT `FKcuya1gewy2fctyx6ve5qmqk0q` FOREIGN KEY (`disciplina_id`) REFERENCES `Disciplina` (`id`),
  ADD CONSTRAINT `FKj2e864yvamdmny2ayfw7lxa63` FOREIGN KEY (`monitor_id`) REFERENCES `Monitor` (`id`);

--
-- Restrições para tabelas `AtendimentoPedagogiaAluno`
--
ALTER TABLE `AtendimentoPedagogiaAluno`
  ADD CONSTRAINT `FK6wrkn6yn7ab78e5st555eqbws` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`),
  ADD CONSTRAINT `FKp1udtciw4m1jmk7jw7137onqp` FOREIGN KEY (`profissional_id`) REFERENCES `Profissional` (`id`);

--
-- Restrições para tabelas `AtendimentoPedagogiaFamilia`
--
ALTER TABLE `AtendimentoPedagogiaFamilia`
  ADD CONSTRAINT `FK2ua24rfgv62cu3fuh0100wt4h` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`),
  ADD CONSTRAINT `FKnxtcuf7ka1cohwuyyirq1itq5` FOREIGN KEY (`profissional_id`) REFERENCES `Profissional` (`id`);

--
-- Restrições para tabelas `AtendimentoSaude`
--
ALTER TABLE `AtendimentoSaude`
  ADD CONSTRAINT `FK56tkaqhbr49rihec9imni54hk` FOREIGN KEY (`profissional_id`) REFERENCES `Profissional` (`id`),
  ADD CONSTRAINT `FKb5wfb5v7sfg8lnjnxuujyb01f` FOREIGN KEY (`aluno_id`) REFERENCES `Aluno` (`id`);

--
-- Restrições para tabelas `Disciplina`
--
ALTER TABLE `Disciplina`
  ADD CONSTRAINT `FKgb43x7s9f9pdcgajxjric4iq0` FOREIGN KEY (`monitor_id`) REFERENCES `Monitor` (`id`);

--
-- Restrições para tabelas `Docente`
--
ALTER TABLE `Docente`
  ADD CONSTRAINT `FKq5el32tplvrwyqk5xqm95oay4` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`);

--
-- Restrições para tabelas `ExtraClasse`
--
ALTER TABLE `ExtraClasse`
  ADD CONSTRAINT `FK4bb8qym7b27ye1ditv9tajna9` FOREIGN KEY (`disciplina_id`) REFERENCES `Disciplina` (`id`),
  ADD CONSTRAINT `FKri7od0peha1pfb1qx3owqv6aq` FOREIGN KEY (`docente_id`) REFERENCES `Docente` (`id`);

--
-- Restrições para tabelas `Monitor`
--
ALTER TABLE `Monitor`
  ADD CONSTRAINT `FKnfygluur2ritmpgangy2e0hee` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`);

--
-- Restrições para tabelas `Profissional`
--
ALTER TABLE `Profissional`
  ADD CONSTRAINT `FK2rpa94kyrmwj8bxfckxvceuu4` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`);

--
-- Restrições para tabelas `Turma`
--
ALTER TABLE `Turma`
  ADD CONSTRAINT `FKfh64j0pkcjkjl9h6vbakpwt31` FOREIGN KEY (`curso_id`) REFERENCES `Curso` (`id`);

--
-- Restrições para tabelas `TurmaDisciplinaDocente`
--
ALTER TABLE `TurmaDisciplinaDocente`
  ADD CONSTRAINT `FK2kxx4c3cqaqemkxkadynmlpjl` FOREIGN KEY (`docente_id`) REFERENCES `Docente` (`id`),
  ADD CONSTRAINT `FK5j3wnd9adgeseehb2i718ty0w` FOREIGN KEY (`turma_id`) REFERENCES `Turma` (`id`),
  ADD CONSTRAINT `FKl5oriafrbfdtnvd4jjh0k7sqv` FOREIGN KEY (`disciplina_id`) REFERENCES `Disciplina` (`id`);

--
-- Restrições para tabelas `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `FKb0s6qtq0ga0u7y0nxqd4x6133` FOREIGN KEY (`perfil_id`) REFERENCES `Perfil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
