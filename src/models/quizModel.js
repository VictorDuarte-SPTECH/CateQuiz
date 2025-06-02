// src/models/quizModel.js
const db = require('../database/config'); // ajuste se o nome for diferente

async function obterPerguntasComRespostas() {
    const sql = `
        SELECT 
            p.id AS pergunta_id,
            p.enunciado,
            p.tema,
            r.id AS resposta_id,
            r.letra,
            r.texto,
            r.correta
        FROM pergunta p
        JOIN resposta r ON p.id = r.fkpergunta
        ORDER BY p.id, r.letra;
    `;
    const [rows] = await db.query(sql);

    const perguntasMap = new Map();

    rows.forEach(row => {
        const { pergunta_id, enunciado, tema, resposta_id, letra, texto, correta } = row;

        if (!perguntasMap.has(pergunta_id)) {
            perguntasMap.set(pergunta_id, {
                id: pergunta_id,
                enunciado,
                tema,
                respostas: []
            });
        }

        perguntasMap.get(pergunta_id).respostas.push({
            id: resposta_id,
            letra,
            texto,
            correta
        });
    });

    return Array.from(perguntasMap.values());
}

module.exports = {
    obterPerguntasComRespostas
};