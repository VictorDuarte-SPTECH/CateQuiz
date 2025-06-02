const express = require("express");
const router = express.Router();
const dashboardController = require("../controllers/dashboardController");

router.get("/:fkusuario", dashboardController.buscarDashboard);

module.exports = router;