require('dotenv').config({ path: process.env.AMBIENTE_PROCESSO === 'producao' ? '.env' : '.env.dev' });
var mysql = require("mysql2");

var conexao = mysql.createConnection({
    host: process.env.DB_HOST,
    database: process.env.DB_DATABASE,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT
});

function executar(instrucao) {
    return new Promise((resolve, reject) => {
        conexao.query(instrucao, (erro, resultados) => {
            if (erro) {
                reject(erro);
            } else {
                resolve(resultados);
            }
        });
    });
}

module.exports = {
    executar
};
