var express = require("express");
var router = express.Router();

var emotionController = require("../controllers/emotionController");

router.get("/listar", function (req, res) {
    emotionController.listar(req, res);
});

module.exports = router;