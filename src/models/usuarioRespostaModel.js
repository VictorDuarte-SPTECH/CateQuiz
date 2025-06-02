var database = require("../database/config");

function registrarResposta(fkusuario, fkpergunta, fkresposta, acertou) {
    var instrucao = `
        INSERT INTO usuario_resposta (fkusuario, fkpergunta, fkresposta, acertou)
        VALUES (${fkusuario}, ${fkpergunta}, ${fkresposta}, ${acertou});
    `;
    return database.executar(instrucao);
}

function buscarRespostaPorLetra(fkpergunta, letraResposta) {
    const instrucao = `
        SELECT id, correta
        FROM resposta
        WHERE fkpergunta = ${fkpergunta}
        AND letra = '${letraResposta}';
    `;
    return database.executar(instrucao);
}

module.exports = {
    registrarResposta,
    buscarRespostaPorLetra
};