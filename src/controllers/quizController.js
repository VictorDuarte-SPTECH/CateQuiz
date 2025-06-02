// src/controllers/quizController.js
const quizModel = require('../models/quizModel');

async function listarPerguntas(req, res) {
    try {
        const perguntas = await quizModel.obterPerguntasComRespostas();
        res.json(perguntas);
    } catch (error) {
        console.error('Erro ao buscar perguntas:', error);
        res.status(500).json({ erro: 'Erro ao buscar perguntas' });
    }
}

module.exports = {
    listarPerguntas
};