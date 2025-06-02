var database = require("../database/config");

// Estatísticas da última tentativa do usuário
async function getEstatisticasUltimaTentativa(fkusuario) {
    const instrucaoUltimaData = `
        SELECT MAX(data_resposta) AS ultima_data
        FROM usuario_resposta
        WHERE fkusuario = ${fkusuario};
    `;
    const resultadoData = await database.executar(instrucaoUltimaData);
    const ultimaData = resultadoData[0].ultima_data;
    if (!ultimaData) return null;

    // Acertos e erros gerais na última tentativa
    const instrucaoGeral = `
        SELECT 
            SUM(CASE WHEN acertou = 1 THEN 1 ELSE 0 END) AS acertos,
            SUM(CASE WHEN acertou = 0 THEN 1 ELSE 0 END) AS erros
        FROM usuario_resposta
        WHERE fkusuario = ${fkusuario}
          AND data_resposta = '${ultimaData.toISOString().slice(0, 19).replace('T', ' ')}';
    `;
    const resultadoGeral = await database.executar(instrucaoGeral);

    // Acertos e erros por tema/página na última tentativa
    const paginas = ["pagina1", "pagina2", "pagina3", "pagina4"];
    let estatisticasPorPagina = [];
    for (const tema of paginas) {
        const instrucaoPagina = `
            SELECT 
                SUM(CASE WHEN ur.acertou = 1 THEN 1 ELSE 0 END) AS acertos,
                SUM(CASE WHEN ur.acertou = 0 THEN 1 ELSE 0 END) AS erros
            FROM usuario_resposta ur
            JOIN pergunta p ON ur.fkpergunta = p.id
            WHERE ur.fkusuario = ${fkusuario}
              AND ur.data_resposta = '${ultimaData.toISOString().slice(0, 19).replace('T', ' ')}'
              AND p.tema = '${tema}';
        `;
        const resultadoPagina = await database.executar(instrucaoPagina);
        estatisticasPorPagina.push({
            tema,
            acertos: resultadoPagina[0].acertos || 0,
            erros: resultadoPagina[0].erros || 0
        });
    }

    return {
        ultimaData,
        geral: {
            acertos: resultadoGeral[0].acertos || 0,
            erros: resultadoGeral[0].erros || 0
        },
        porPagina: estatisticasPorPagina
    };
}

// 2. Estatísticas médias globais de todos os usuários (todas as tentativas)
async function getEstatisticasGlobais() {
    // Total respostas gerais
    const instrucaoTotal = `SELECT COUNT(*) AS total_respostas FROM usuario_resposta;`;
    const resultadoTotal = await database.executar(instrucaoTotal);
    const totalRespostas = resultadoTotal[0].total_respostas || 0;

    // Total acertos gerais
    const instrucaoAcertos = `
        SELECT SUM(CASE WHEN acertou = 1 THEN 1 ELSE 0 END) AS total_acertos
        FROM usuario_resposta;
    `;
    const resultadoAcertos = await database.executar(instrucaoAcertos);
    const totalAcertos = resultadoAcertos[0].total_acertos || 0;

    // Média global (percentual de acertos)
    const mediaGeral = totalRespostas ? (totalAcertos / totalRespostas) * 100 : 0;

    // Estatísticas por página (tema)
    const paginas = ["pagina1", "pagina2", "pagina3", "pagina4"];
    let mediasPorPagina = [];
    for (const tema of paginas) {
        const instrucaoPagina = `
            SELECT 
                SUM(CASE WHEN ur.acertou = 1 THEN 1 ELSE 0 END) AS acertos,
                COUNT(*) AS total
            FROM usuario_resposta ur
            JOIN pergunta p ON ur.fkpergunta = p.id
            WHERE p.tema = '${tema}';
        `;
        const resultadoPagina = await database.executar(instrucaoPagina);
        const acertos = resultadoPagina[0].acertos || 0;
        const total = resultadoPagina[0].total || 0;
        mediasPorPagina.push({
            tema,
            acertos,
            total,
            percentual: total ? (acertos / total) * 100 : 0
        });
    }

    // Total tentativas estimadas (supondo 20 perguntas por tentativa)
    const totalTentativas = Math.floor(totalRespostas / 20);

    return {
        geral: {
            totalRespostas,
            totalAcertos,
            percentual: mediaGeral
        },
        porPagina: mediasPorPagina,
        totalTentativas
    };
}

module.exports = {
    getEstatisticasUltimaTentativa,
    getEstatisticasGlobais
};