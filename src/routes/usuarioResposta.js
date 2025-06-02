var express = require("express");
var router = express.Router();
var usuarioRespostaController = require("../controllers/usuarioRespostaController");

router.post("/salvar", function (req, res) {
    usuarioRespostaController.salvarRespostas(req, res);
});

module.exports = router;