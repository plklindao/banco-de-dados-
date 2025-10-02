-- DataBase Inicial
CREATE DATABASE escola;

USE escola;

CREATE TABLE professor (
id_professor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
espcialidade VARCHAR(100),
salario DECIMAL(10,2),
uf CHAR(2)
);


CREATE TABLE diciplina(
id_diciplina INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
id_professor INT,
carga_horaria INT,
FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE aluno(
id_aluno INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
sexo CHAR(1),
data_nascimento DATE,
nota_final DECIMAL(4,2),
ativo BOOLEAN
);


CREATE TABLE curso(
id_curso INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
carga_horaria INT,
modalidade VARCHAR(50)
);

CREATE TABLE matricula(
id_matricula INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_aluno INT,
id_curso INT,
data_matricula DATE,
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE login(
id_login INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_aluno INT,
data_hora DATETIME,
ip VARCHAR(40),
sucesso BOOLEAN,
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

SHOW TABLES;



-- Dados Fakes para popular as tabelas
-- Insere professores (mínimo 5)
INSERT INTO professor (nome, espcialidade, salario, uf) VALUES
('Mariana Silva', 'Programação', 4500.00, 'SP'),
('Carlos Pereira', 'Redes de Computadores', 5200.50, 'RJ'),
('Ana Beatriz', 'Banco de Dados', 4800.75, 'MG'),
('João Oliveira', 'Eletrônica', 4300.00, 'RS'),
('Patrícia Gomes', 'Sistemas Embarcados', 5000.00, 'PR');

-- Insere cursos (mínimo 5)
INSERT INTO curso (nome, carga_horaria, modalidade) VALUES
('Técnico em Informática', 1200, 'Presencial'),
('Técnico em Eletrônica', 1100, 'Presencial'),
('Desenvolvimento de Sistemas', 800, 'EAD'),
('Redes de Computadores', 900, 'Presencial'),
('Automação Industrial', 1000, 'Híbrido');

-- Insere alunos (mínimo 5)
INSERT INTO aluno (nome, sexo, data_nascimento, nota_final, ativo) VALUES
('Lucas Almeida', 'M', '2005-04-12', 8.75, TRUE),
('Mariana Costa', 'F', '2004-11-23', 9.20, TRUE),
('Rafael Souza', 'M', '2005-01-30', 6.40, FALSE),
('Beatriz Fernandes', 'F', '2006-06-05', 7.85, TRUE),
('Gustavo Ramos', 'M', '2004-09-19', 5.30, TRUE);

-- Insere disciplinas (mínimo 5)
-- OBS: usa id_professor existentes (1..5 conforme inserts acima)
INSERT INTO diciplina (nome, id_professor, carga_horaria) VALUES
('Lógica de Programação', 1, 80),
('Protocolos e Roteamento', 2, 60),
('Modelagem de Dados', 3, 90),
('Circuitos Digitais', 4, 70),
('Microcontroladores', 5, 100);

-- Insere matriculas (mínimo 5)
-- Usa id_aluno (1..5) e id_curso (1..5) conforme acima
INSERT INTO matricula (id_aluno, id_curso, data_matricula) VALUES
(1, 1, '2024-02-15'),
(2, 3, '2024-03-01'),
(3, 4, '2023-08-20'),
(4, 1, '2024-01-10'),
(5, 5, '2024-04-05');

-- Insere logins (mínimo 5) para alunos (referenciando id_aluno 1..5)
INSERT INTO login (id_aluno, data_hora, ip, sucesso) VALUES
(1, '2024-09-10 07:45:23', '192.168.0.21', TRUE),
(2, '2024-09-11 08:12:05', '192.168.0.45', TRUE),
(3, '2024-09-12 12:30:10', '10.0.0.12', FALSE),
(4, '2024-09-13 14:55:00', '172.16.1.5', TRUE),
(5, '2024-09-14 16:05:37', '200.89.120.3', TRUE);




-- UPDATE (Atualizar dados) Atualizar o salário de um professor:
UPDATE professor
SET salario = 5500.00
WHERE id_professor = 1;

-- Alterar o curso de um aluno (exemplo aluno id=2 vai para o curso 4):
UPDATE matricula
SET id_curso = 4
WHERE id_aluno = 2;

-- Corrigir nota final de um aluno:
UPDATE aluno
SET nome = "adryan"
WHERE id_aluno = 3;

-- Ativar/Inativar um aluno:
UPDATE aluno
SET ativo = FALSE
WHERE id_aluno = 5;


-- DELETE (Apagar dados)
-- Apagar um login específico:
DELETE FROM login
WHERE id_login = 3;

-- Remover um aluno (️ só funciona se ele não tiver vínculos em matricula ou login):
DELETE FROM aluno
WHERE id_aluno = 4;

-- Excluir uma disciplina:
DELETE FROM diciplina
WHERE id_diciplina = 2;

-- Apagar todos os logins de um aluno:
DELETE FROM login
WHERE id_aluno = 1;


-- consultas com SELECT, WHERE, JOIN, COUNT, AVG, MAX
-- 1. Selecionar todos os professores
SELECT * FROM professor;
-- 2. Mostrar apenas o nome e a especialidade dos professores
SELECT nome, espcialidade FROM professor;
-- 3. Listar apenas os cursos presenciais
SELECT * FROM curso WHERE modalidade = 'Presencial';
-- 4. Mostrar alunos ativos
SELECT nome, ativo FROM aluno WHERE ativo = TRUE;
-- 5. Mostrar alunos com nota final maior ou igual a 7
SELECT nome, nota_final FROM aluno WHERE nota_final >= 7.0;
-- 6. Listar os alunos e os cursos em que estão matriculados
SELECT a.nome AS aluno, c.nome AS curso
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
JOIN curso c ON m.id_curso = c.id_curso;
-- 7. Listar as disciplinas e seus professores
SELECT d.nome AS disciplina, p.nome AS professor
FROM diciplina d
JOIN professor p ON d.id_professor = p.id_professor;
-- 8. Quantidade de alunos cadastrados
SELECT COUNT(*) AS total_alunos FROM aluno;
-- 9. Média de notas finais dos alunos
SELECT AVG(nota_final) AS media_notas FROM aluno;
-- 10. Maior salário entre os professores
SELECT MAX(salario) AS maior_salario FROM professor;
-- 11. Mostrar todos os logins com sucesso
SELECT * FROM login
WHERE sucesso = TRUE;
-- 12. Listar os alunos que tiveram tentativa de login sem sucesso
SELECT a.nome, l.data_hora, l.ip
FROM login l
JOIN aluno a ON l.id_aluno = a.id_aluno
WHERE l.sucesso = FALSE
