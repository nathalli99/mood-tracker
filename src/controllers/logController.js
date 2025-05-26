var logModel = require("../models/logModel");

function cadastrar(req, res) {
    var fkUser = req.body.fkUser;
    var fkEmotion = req.body.fkEmotion;
    var intensidade = req.body.intensidade;

    if (!fkUser || !fkEmotion || !intensidade) {
        res.status(400).send("Selecione a emoção e a intensidade para continuar!");
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
                res.status(204).send("Nenhum resultado encontrado.");
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
                res.status(204).send("Nenhuma emoção registrada hoje.");
            }
        })
        .catch((erro) => {
            console.log("Erro ao buscar a marcação de hoje:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function graficoBarras(req, res) {
    var idUser = req.params.idUser;

    logModel.intensidadeMediaPorEmocao(idUser)
        .then(resposta => res.json(resposta));
}

function graficoPizza(req, res) {
    var idUser = req.params.idUser;

    logModel.frequenciaMensalPorEmocao(idUser)
        .then(resposta => res.json(resposta));
}

module.exports = {
    cadastrar,
    buscarLogsPorUser,
    buscarUltimosLogs,
    buscarLogDeHoje,
    graficoBarras,
    graficoPizza
};