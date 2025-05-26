var express = require("express");
var router = express.Router();

var logController = require("../controllers/logController");

router.get("/usuario/:idUser", function (req, res) {
    logController.buscarlogsPorUser(req, res);
});

router.post("/cadastrar", function (req, res) {
    logController.cadastrar(req, res);
});

router.get("/ultimos/:idUser", function (req, res) {
    logController.buscarUltimosLogs(req, res);
});

router.get("/hoje/:idUser", function (req, res) {
    logController.buscarLogDeHoje(req, res);
});

router.get("/grafico-barras/:idUser", logController.graficoBarras);
router.get("/grafico-pizza/:idUser", logController.graficoPizza);

module.exports = router;