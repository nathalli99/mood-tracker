var express = require("express");
var router = express.Router();

var usersController = require("../controllers/usersController");

//Recebendo os dados do html e direcionando para a função cadastrar de usersController.js
router.post("/cadastrar", function (req, res) {
    usersController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usersController.autenticar(req, res);
});

router.get("/buscar", function (req, res) {
    usersController.buscarPorEmail(req, res);
});

router.get("/buscar/:id", function (req, res) {
  usersController.buscarPorId(req, res);
});

router.get("/listar", function (req, res) {
  usersController.listar(req, res);
});


module.exports = router;