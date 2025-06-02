// src/routes/quiz.js
const express = require('express');
const router = express.Router();
const quizController = require('../controllers/quizController');

// Rota para buscar perguntas e respostas
router.get('/perguntas', quizController.listarPerguntas);

module.exports = router;