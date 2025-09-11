CREATE DATABASE escola;
USE escola;

CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,                 
    especialidade VARCHAR(100),                
    salario DECIMAL(10,2),                    
    uf CHAR(2)                                   
);

CREATE TABLE disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_professor INT,                           
    carga_horaria INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo CHAR(1),
    data_nascimento DATE,
    nota_final DECIMAL(4,2),
    ativo BOOLEAN
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    modalidade VARCHAR(50)
);

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE login (
    id_login INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    data_hora DATETIME,
    ip VARCHAR(45),
    sucesso BOOLEAN,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

-- Professores
INSERT INTO professor (nome, especialidade, salario, uf) VALUES
('Maria Silva', 'Front-end', 5500.00, 'SP'),
('Marinho', 'Banco de Dados', 4500.00, 'MT'),
('Gdrake', 'Português', 4800.00, 'PR'),
('Pastor Vinicius', 'Inglês', 4000.00, 'BH'),
('Bigodeles', 'Quimíca', 2000.00, 'PB'),
('Alexota', 'Geografica', 10000.00, 'AC'),
('Richalinda', 'Sociologia', 6000.00, 'RJ'),
('Alecharlison', 'Educação Fisíca', 9000.00, 'SP'),
('Abner', 'Fisíca', 2800.00, 'PR'),
('Flaflu', 'Matemática', 10000.00, 'RJ');
SELECT * FROM professor;
-- Disciplinas
INSERT INTO disciplina (nome, id_professor, carga_horaria) VALUES
('Front-end script', 10, 100),
('Banco de Dados', 11, 20),
('Português Acentuação', 12, 90),
('Inglês Intercambista', 13, 400),
('Química Organica', 14, 100),
('Geografia Fisíca', 15, 50),
('Sociologia do Trabalho', 16, 70),
('Educação Fisíca Futebol', 17, 90),
('Fisíca Humana', 18, 30),
('Matemática Algebra', 19, 50);
SELECT * FROM disciplina;



-- Alunos
INSERT INTO aluno (nome, sexo, data_nascimento, nota_final, ativo) VALUES
('Gabigordo', 'M', '2002-05-10', 8.0, TRUE),
('Jojo Todinho', 'F', '2003-09-09', 9.0, TRUE),
('Bara Bara', 'M', '2003-12-31', 4.2, TRUE),
('Xandão', 'M', '2003-11-02', 9.2, TRUE),
('Uno Henrique', 'M', '2003-12-12', 4.2, TRUE),
('Robinho Bate', 'M', '2003-02-02', 7.0, TRUE),
('Laurinha Camarão', 'F', '2003-08-22', 7.5, TRUE),
('Goleiro Bruno', 'M', '2003-06-22', 1.2, TRUE),
('Pitibul', 'M', '2003-05-20', 10.0, TRUE),
('Mauro', 'M', '2003-03-12', 8.2, TRUE);
SELECT * FROM aluno;

-- Cursos
INSERT INTO curso (nome, carga_horaria, modalidade) VALUES
('Engenharia', 1000, 'Presencial'),
('Direito', 3400, 'EAD'),
('Engenharia', 3890, 'EAD'),
('Humanas', 3800, 'Presencial'),
('Pedagogia', 4000, 'EAD'),
('Design', 3000, 'Presencial'),
('Saúde', 9000, 'Presencial'),
('Contabilidade', 4000, 'EAD'),
('Técnico de Informatica', 2000, 'EAD'),
('Negócios', 5000, 'Presencial');
SELECT * FROM curso;

-- Matrículas
INSERT INTO matricula (id_aluno, id_curso, data_matricula) VALUES
(10, 20, '2024-01-01'),
(11, 21, '2024-07-20'),
(12, 22, '2024-06-18'),
(13, 23, '2024-02-12'),
(14, 24, '2024-04-13'),
(15, 25, '2024-05-23'),
(16, 26, '2024-02-03'),
(17, 27, '2024-12-09'),
(18, 28, '2024-11-12'),
(19, 29, '2024-08-30');

-- Logins
INSERT INTO login (id_aluno, data_hora, ip, sucesso) VALUES
(1, '2024-05-01 08:30:00', '192.168.1.10', TRUE),
(2, '2024-05-01 09:15:00', '192.168.1.11', FALSE);
