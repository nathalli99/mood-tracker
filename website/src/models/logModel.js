var database = require("../database/config");

function cadastrar(fkUser, fkEmotion, intensidade) {
    var instrucaoSql = `
        INSERT INTO log (fkUser, fkEmotion, intensidade, dtRegistro) 
        VALUES (${fkUser}, ${fkEmotion}, ${intensidade}, NOW());
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarLogsPorEmotion(idEmotion) {
    var instrucaoSql = `
        SELECT * FROM log WHERE fkEmotion = ${idEmotion};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarLogsPorUser(idUser) {
    var instrucaoSql = `
        SELECT * FROM log WHERE fkUser = ${idUser};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimosLogs(idUser) {
    var instrucaoSql = `
        SELECT 
            l.intensidade,
            e.nome AS emocao,
            DATE_FORMAT(l.dtRegistro, '%d/%m/%Y') AS data 
        FROM log l
        JOIN emotion e ON l.fkEmotion = e.idEmotion
        WHERE l.fkUser = ${idUser}
        ORDER BY l.dtRegistro DESC
        LIMIT 7;
    `;
    return database.executar(instrucaoSql);
}

function buscarLogDeHoje(idUser) {
    var instrucaoSql = `
        SELECT 
            l.intensidade,
            e.nome AS emocao,
            l.dtRegistro
        FROM log l
        JOIN emotion e ON l.fkEmotion = e.idEmotion
        WHERE l.fkUser = ${idUser}
        AND DATE(l.dtRegistro) = CURDATE()
        ORDER BY l.dtRegistro DESC
        LIMIT 1;
    `;
    return database.executar(instrucaoSql);
}

function intensidadeMediaPorEmocao(idUser) {
    const sql = `
        SELECT 
            e.nome AS emocao,
            ROUND(AVG(l.intensidade), 2) AS media_intensidade
        FROM log l
        JOIN emotion e ON l.fkEmotion = e.idEmotion
        WHERE l.fkUser = ${idUser}
        GROUP BY e.nome
        ORDER BY media_intensidade DESC;
    `;
    return database.executar(sql);
}

function frequenciaMensalPorEmocao(idUser) {
    const sql = `
        SELECT 
            e.nome AS emocao,
            COUNT(*) AS total
        FROM log l
        JOIN emotion e ON l.fkEmotion = e.idEmotion
        WHERE l.fkUser = ${idUser}
        AND MONTH(l.dtRegistro) = MONTH(NOW())
        AND YEAR(l.dtRegistro) = YEAR(NOW())
        GROUP BY e.nome;
    `;
    return database.executar(sql);
}

module.exports = {
    cadastrar,
    buscarLogsPorEmotion,
    buscarLogsPorUser,
    buscarUltimosLogs,
    buscarLogDeHoje,
    intensidadeMediaPorEmocao,
    frequenciaMensalPorEmocao

};