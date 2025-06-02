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
    enunciado VARCHAR(500) NOT NULL,
    tema VARCHAR(100)
);

-- Tabela de respostas
CREATE TABLE resposta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fkpergunta INT NOT NULL,
    letra CHAR(1) NOT NULL,
    texto TEXT NOT NULL,
    correta BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (fkpergunta) REFERENCES pergunta(id) ON DELETE CASCADE
);

-- Tabela para registrar respostas do usuário (opcional, para estatísticas)
CREATE TABLE usuario_resposta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fkusuario INT NOT NULL,
    fkpergunta INT NOT NULL,
    fkresposta INT NOT NULL,
    correta BOOLEAN,
    data_resposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fkusuario) REFERENCES usuario(id),
    FOREIGN KEY (fkpergunta) REFERENCES pergunta(id),
    FOREIGN KEY (fkresposta) REFERENCES resposta(id)
);


-- INSERTS DAS PERGUNTAS --
-- PÁGINA 1
INSERT INTO pergunta (enunciado, tema) VALUES
('Qual é considerada por muitos estudiosos como a primeira denominação cristã?', 'pagina1'),
('Qual é o nome dado ao conjunto de cinco livros escritos por Moisés, considerados sagrados no judaísmo?', 'pagina1'),
('Segundo os cristãos, quantas profecias cumpriu Jesus (também chamado de Yeshua)?', 'pagina1'),
('O que significa a palavra "católico"?', 'pagina1'),
('Qual foi uma das principais contribuições da Igreja Católica para a sociedade ocidental?', 'pagina1');
-- PÁGINA 2
INSERT INTO pergunta (enunciado, tema) VALUES
('Qual foi a causa da morte de Jesus?', 'pagina2'),
('Qual foi o apóstolo considerado o primeiro Papa da Igreja Católica?', 'pagina2'),
('Qual era a língua mais utilizada no mundo mediterrâneo durante a expansão inicial do cristianismo?', 'pagina2'),
('Qual imperador romano legalizou o cristianismo através do Édito de Milão?', 'pagina2'),
('Qual foi a principal causa do Grande Cisma de 1054?', 'pagina2');
-- PÁGINA 3
INSERT INTO pergunta (enunciado, tema) VALUES
('O que define o mistério da Santíssima Trindade no Cristianismo?', 'pagina3'),
('Quais são os três pilares fundamentais da fé católica?', 'pagina3'),
('Qual é o significado de "Latria" na teologia católica?', 'pagina3'),
('Quais são os sete sacramentos reconhecidos pela Igreja Católica?', 'pagina3'),
('Qual é um dos motivos de Maria ser chamada de Nova Arca da Aliança?', 'pagina3');
-- PÁGINA 4
INSERT INTO pergunta (enunciado, tema) VALUES
('Onde está localizada a cidade de Lourdes?', 'pagina4'),
('Qual foi o nome da jovem que presenciou as aparições de Nossa Senhora em Lourdes?', 'pagina4'),
('Como Nossa Senhora se identificou durante as aparições em Lourdes?', 'pagina4'),
('O que surgiu após Bernadette cavar o chão da Gruta de Massabielle?', 'pagina4'),
('O que inspirou a textura crocante do Ferrero Rocher?', 'pagina4');

-- INSERTS DAS RESPOSTAS --
-- Pergunta 1
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(1, 'A', 'Protestantismo', false),
(1, 'B', 'Ortodoxia', false),
(1, 'C', 'Anglicanismo', false),
(1, 'D', 'Catolicismo', true),
(1, 'E', 'Pentecostalismo', false);
-- Pergunta 2
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(2, 'A', 'Torá', true),
(2, 'B', 'Talmude', false),
(2, 'C', 'Pentecostes', false),
(2, 'D', 'Apócrifos', false),
(2, 'E', 'Evangelhos', false);
-- Pergunta 3
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(3, 'A', '12', false),
(3, 'B', '53', false),
(3, 'C', '100', false),
(3, 'D', 'Mais de 330', true),
(3, 'E', '613', false);
-- Pergunta 4
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(4, 'A', 'Antigo', false),
(4, 'B', 'Autêntico', false),
(4, 'C', 'Universal', true),
(4, 'D', 'Apostólico', false),
(4, 'E', 'Divino', false);
-- Pergunta 5
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(5, 'A', 'A fundação de escolas públicas', false),
(5, 'B', 'A criação de sistemas de irrigação', false),
(5, 'C', 'A fundação das primeiras universidades', true),
(5, 'D', 'A invenção da imprensa', false),
(5, 'E', 'A construção de cidades fortificadas', false);
-- Pergunta 6
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(6, 'A', 'Apedrejamento', false),
(6, 'B', 'Envenenamento', false),
(6, 'C', 'Crucificação', true),
(6, 'D', 'Decapitação', false),
(6, 'E', 'Suicídio', false);
-- Pergunta 7
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(7, 'A', 'João', false),
(7, 'B', 'Paulo', false),
(7, 'C', 'Tiago', false),
(7, 'D', 'Pedro', true),
(7, 'E', 'André', false);
-- Pergunta 8
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(8, 'A', 'Hebraico', false),
(8, 'B', 'Latim', false),
(8, 'C', 'Árabe', false),
(8, 'D', 'Aramaico', false),
(8, 'E', 'Grego', true);
-- Pergunta 9
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(9, 'A', 'Nero', false),
(9, 'B', 'Augusto', false),
(9, 'C', 'Constantino', true),
(9, 'D', 'Teodósio', false),
(9, 'E', 'Trajano', false);
-- Pergunta 10
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(10, 'A', 'Disputas teológicas e políticas', true),
(10, 'B', 'A Reforma Protestante', false),
(10, 'C', 'A conversão de Constantino', false),
(10, 'D', 'A criação do Édito de Milão', false),
(10, 'E', 'A morte de Pedro em Roma', false);
-- Pergunta 11
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(11, 'A', 'Deus como três seres distintos', false),
(11, 'B', 'Deus como um único ser em três pessoas', true),
(11, 'C', 'Deus como uma força impessoal', false),
(11, 'D', 'Deus como apenas Pai e Filho', false),
(11, 'E', 'Deus como uma entidade única sem distinções', false);
-- Pergunta 12
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(12, 'A', 'Tradição Apostólica, Sagradas Escrituras e Magistério da Igreja', true),
(12, 'B', 'Tradição Apostólica, Concílios Ecumênicos e Santos', false),
(12, 'C', 'Sagradas Escrituras, Sacramentos e Santos', false),
(12, 'D', 'Magistério da Igreja, Sacramentos e Concílios Ecumênicos', false),
(12, 'E', 'Tradição Apostólica, Santos e Eucaristia', false);
-- Pergunta 13
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(13, 'A', 'Honra especial dedicada à Virgem Maria', false),
(13, 'B', 'Veneração dedicada aos santos e anjos', false),
(13, 'C', 'Adoração reservada exclusivamente a Deus', true),
(13, 'D', 'Honra especial a São José', false),
(13, 'E', 'Veneração dedicada aos mártires', false);
-- Pergunta 14
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(14, 'A', 'Batismo, Confirmação, Eucaristia, Reconciliação, Hiperdulia, Dulia, Latria', false),
(14, 'B', 'Eucaristia, Batismo, Ordem, Matrimônio, Santo Agostinho, São Tomás de Aquino, Santo Antônio', false),
(14, 'C', 'Batismo, Confirmação, Eucaristia, Reconciliação, Unção dos Enfermos, Ordem, Matrimônio', true),
(14, 'D', 'Eucaristia, Batismo, Ordem, Hiperdulia, Santo Agostinho, São José, Dulia', false),
(14, 'E', 'Batismo, Reconciliação, Ordem, Matrimônio, Dulia, Hiperdulia, São Pedro', false);
-- Pergunta 15
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(15, 'A', 'Porque carregou as tábuas da Lei', false),
(15, 'B', 'Porque carregou o próprio Deus encarnado em seu ventre', true),
(15, 'C', 'Porque foi escolhida como sumo sacerdote', false),
(15, 'D', 'Porque simboliza o maná do deserto', false),
(15, 'E', 'Porque liderou o povo de Israel no deserto', false);
-- Pergunta 16
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(16, 'A', 'Norte da Itália', false),
(16, 'B', 'Sudoeste da Alemanha', false),
(16, 'C', 'Sul da França', true),
(16, 'D', 'Centro de Portugal', false),
(16, 'E', 'Oeste da Espanha', false);
-- Pergunta 17
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(17, 'A', 'Teresa de Ávila', false),
(17, 'B', 'Bernadette Soubirous', true),
(17, 'C', 'Clara de Assis', false),
(17, 'D', 'Catarina Labouré', false),
(17, 'E', 'Joana d’Arc', false);
-- Pergunta 18
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(18, 'A', 'Nossa Senhora da Paz', false),
(18, 'B', 'A Virgem Dolorosa', false),
(18, 'C', 'A Rainha do Céu', false),
(18, 'D', 'A Imaculada Conceição', true),
(18, 'E', 'A Senhora das Graças', false);
-- Pergunta 19
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(19, 'A', 'Uma imagem da Virgem', false),
(19, 'B', 'Uma árvore com frutos', false),
(19, 'C', 'Um altar de pedra', false),
(19, 'D', 'Um relicário antigo', false),
(19, 'E', 'Uma fonte de água milagrosa', true);
-- Pergunta 20
INSERT INTO resposta (fkpergunta, letra, texto, correta) VALUES
(20, 'A', 'A formação rochosa da gruta', true),
(20, 'B', 'Os seixos do rio Gave', false),
(20, 'C', 'As velas dos peregrinos', false),
(20, 'D', 'A aparência do altar da gruta', false),
(20, 'E', 'As folhas secas da região', false);


-- QUERIES --