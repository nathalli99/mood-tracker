var express = require("express");
var router = express.Router();

var logController = require("../controllers/logController");

router.get("/:empresaId", function (req, res) {
  logController.buscarlogsPorEmpresa(req, res);
});

router.post("/cadastrar", function (req, res) {
  logController.cadastrar(req, res);
})

module.exports = router;