var database = require("../database/config");

function listar() {
    var instrucaoSql = `SELECT * FROM emotion`;

    console.log("Executando SQL para listar emoções: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    listar
};