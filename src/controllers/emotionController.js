var emotionModel = require("../models/emotionModel");

function listar(req, res) {
    emotionModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhuma emoção cadastrada.");
            }
        })
        .catch(function (erro) {
            console.log("Erro ao listar emoções:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    listar
};