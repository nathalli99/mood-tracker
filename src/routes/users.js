var express = require("express");
var router = express.Router();

var userController = require("../controllers/userController");

//Recebendo os dados do html e direcionando para a função cadastrar de userController.js
router.post("/cadastrar", function (req, res) {
    userController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    userController.autenticar(req, res);
});

module.exports = router;