var database = require("../database/config");

function buscarLogsPorEmotion(idEmotion) {

  var instrucaoSql = `SELECT * FROM log WHERE fkEmotion = ${idEmotion}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(idEmotion, intensidade) {
  
  var instrucaoSql = `INSERT INTO (descricao, fk_empresa) log VALUES (${descricao}, ${empresaId})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarLogsPorEmpresa,
  cadastrar
}
