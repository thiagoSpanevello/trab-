const express = require("express");
var app = express();
const mysql = require("mysql");
const path = require('path');
// const connection = mysql.createConnection({
//     host: "localhost",
//     port: "3306",
//     user: "root",
//     password: "",
//     database: "mydb"

// });
// connection.connect(function (err) {
//     if (err) {
//         console.error("erro conectando banco: " + err.stack)
//         return;
//     }
//     console.log("Banco conectado")
// });


app.use(express.static('public'));


// rotas 
app.use('/', function (req, res) {
    res.sendFile(path.join(__dirname, "public", 'index.html'));
    
})


app.listen(80, function () { console.log('example app listening on port 80') });

