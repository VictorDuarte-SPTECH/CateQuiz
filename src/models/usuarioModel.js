var database = require("../database/config");

function cadastrar(nome, email, senha) {
    var instrucao = `
        INSERT INTO usuario (nome, email, senha)
        VALUES ('${nome}', '${email}', '${senha}');
    `;
    return database.executar(instrucao);
}

function autenticar(email, senha) {
    var instrucao = `
        SELECT * FROM usuario
        WHERE email = '${email}' AND senha = '${senha}';
    `;
    return database.executar(instrucao);
}

module.exports = {
    cadastrar,
    autenticar
};