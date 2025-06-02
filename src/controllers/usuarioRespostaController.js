var usuarioRespostaModel = require("../models/usuarioRespostaModel");

async function salvarRespostas(req, res) {
    const { fkusuario, respostas } = req.body;

    if (!fkusuario || !respostas || !Array.isArray(respostas)) {
        return res.status(400).send("Dados incompletos!");
    }

    try {
        const promessas = respostas.map(async (resposta) => {
            const { fkpergunta, letraResposta } = resposta;

            // Buscar no banco a resposta correta da pergunta
            const resultado = await usuarioRespostaModel.buscarRespostaPorLetra(fkpergunta, letraResposta);

            if (resultado.length === 0) {
                throw new Error(`Resposta não encontrada para pergunta ${fkpergunta} e letra ${letraResposta}`);
            }

            const fkresposta = resultado[0].id;
            const acertou = resultado[0].correta == 1 ? 1 : 0;

            return usuarioRespostaModel.registrarResposta(fkusuario, fkpergunta, fkresposta, acertou);
        });

        await Promise.all(promessas);

        res.status(200).send("Respostas registradas com sucesso");
    } catch (erro) {
        console.error(erro);
        res.status(500).send("Erro ao salvar respostas");
    }
}

module.exports = {
    salvarRespostas
};