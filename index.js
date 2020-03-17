const express = require("express");
var app = express();
const mysql = require("mysql");
const path = require('path');
const bodyparser = require('body-parser');
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({ extended: true }));
 const connection = mysql.createConnection({
    host: "localhost",
    port: "3306",
    user: "root",
    password: "",
    database: "mydb"

 });
connection.connect(function (err) {
     if (err) {
         console.error("erro conectando banco: " + err.stack)
         return;
     }
     console.log("Banco conectado")
});


app.use(express.static('public'));


// rotas 
app.get('/', function (req, res) {
    console.log(req.url);
    
    res.sendFile(path.join(__dirname, "public", 'index.html'));
    
})

//post prod
app.post('/produtos', function(req, res){
    console.log(req.body);
    
    connection.query(`insert into produtos(nome, valor) values ('${req.body.nome}', '${req.body.valor}')`, function (error, results, fields) {
        if (error)
            res.json(error);
        else
            res.json({ "valor": "funfo" })
    });
})

//get prod
app.get('/produtos', function(req, res){
    connection.query(`select * from produtos`, function(error, results, fields){
        if(error)
        res.json(error);
        else
        res.json(results)
    })
})

// get vendas
app.get('/vendas', function(req, res){
    connection.query(`select * from vendas`, function(error, results, fields){
        if(error)
        res.json(error);
        else
        res.json(results)
    })
})


app.listen(80, function () { console.log('example app listening on port 80') });

