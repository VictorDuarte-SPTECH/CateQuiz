var dashboardModel = require("../models/dashboardModel");

async function buscarDashboard(req, res) {
    const idUsuario = Number(req.params.fkusuario);
    if (!idUsuario) {
        return res.status(400).send("ID de usuário inválido.");
    }

    try {
        const estatUltima = await dashboardModel.getEstatisticasUltimaTentativa(idUsuario);
        const estatGlobais = await dashboardModel.getEstatisticasGlobais();

        res.json({
            ultimaTentativa: estatUltima,  // Pode ser null se não houver resposta
            estatisticasGlobais: estatGlobais
        });
    } catch (error) {
        console.error(error);
        res.status(500).send("Erro ao buscar dashboard");
    }
}

module.exports = {
    buscarDashboard
};