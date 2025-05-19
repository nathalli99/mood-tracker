var logModel = require("../models/logModel");

function cadastrar(req, res) {
    var fkUser = req.body.fkUser;
    var fkEmotion = req.body.fkEmotion;
    var intensidade = req.body.intensidade;
    var anotacao = req.body.anotacao;

    if (!fkUser || !fkEmotion || !intensidade) {
        res.status(400).send("Os campos fkUser, fkEmotion e intensidade são obrigatórios!");
        return;
    }

    logModel.cadastrar(fkUser, fkEmotion, intensidade, anotacao)
        .then((resultado) => {
            res.status(201).json(resultado);
        })
        .catch((erro) => {
            console.log(erro);
            console.log("Houve um erro ao cadastrar o log: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarLogsPorUser(req, res) {
    var idUser = req.params.idUser;

    logModel.buscarLogsPorUser(idUser).then((resultado) => {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).json([]);
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os logs: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUltimosLogs(req, res) {
    var idUser = req.params.idUser;

    logModel.buscarUltimosLogs(idUser)
        .then((resultado) => {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum log encontrado.");
            }
        })
        .catch((erro) => {
            console.log("Erro ao buscar logs:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarLogDeHoje(req, res) {
    var idUser = req.params.idUser;

    logModel.buscarLogDeHoje(idUser)
        .then((resultado) => {
            if (resultado.length > 0) {
                res.status(200).json(resultado[0]);
            } else {
                res.status(204).send("Nenhum log registrado hoje.");
            }
        })
        .catch((erro) => {
            console.log("Erro ao buscar log de hoje:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    cadastrar,
    buscarLogsPorUser,
    buscarUltimosLogs,
    buscarLogDeHoje
};