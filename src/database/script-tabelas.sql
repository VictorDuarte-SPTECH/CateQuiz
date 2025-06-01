create database catequiz;
use catequiz;

-- Tabela de usuários
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de perguntas
CREATE TABLE pergunta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enunciado VARCHAR(500) NOT NULL
);

-- Tabela de respostas
CREATE TABLE resposta (
    id INT PRIMARY KEY,
    fkpergunta INT,
    texto TEXT NOT NULL,
    correta BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (fkpergunta) REFERENCES pergunta(id) ON DELETE CASCADE
);

-- Tabela para registrar respostas do usuário (opcional, para estatísticas)
CREATE TABLE usuario_resposta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fkusuario INT,
    fkpergunta INT,
    fkresposta INT,
    correta BOOLEAN,
    data_resposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fkusuario) REFERENCES usuario(id),
    FOREIGN KEY (fkpergunta) REFERENCES pergunta(id),
    FOREIGN KEY (fkresposta) REFERENCES resposta(id)
);