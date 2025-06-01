var usuarioModel = require("../models/usuarioModel");

function cadastrar(req, res) {
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (!nome || !email || !senha) {
        return res.status(400).send("Campos obrigatórios não foram preenchidos!");
    }

    usuarioModel.cadastrar(nome, email, senha)
        .then(resultado => res.json(resultado))
        .catch(erro => {
            console.error("Erro ao cadastrar:", erro.sqlMessage || erro);
            res.status(500).json(erro.sqlMessage || erro);
        });
}

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (!email || !senha) {
        return res.status(400).send("Email e senha são obrigatórios!");
    }

    usuarioModel.autenticar(email, senha)
        .then(resultado => {
            if (resultado.length === 1) {
                res.json({
                    id: resultado[0].id,
                    nome: resultado[0].nome,
                    email: resultado[0].email
                });
            } else {
                res.status(403).send("Email e/ou senha inválidos");
            }
        })
        .catch(erro => {
            console.error("Erro no login:", erro.sqlMessage || erro);
            res.status(500).json(erro.sqlMessage || erro);
        });
}

module.exports = {
    cadastrar,
    autenticar
};
