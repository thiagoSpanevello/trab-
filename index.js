console.log("ola mundo");
const bodyparser = require("body-parser");
const express = require("express");
const app = express();
const moment = require('moment');
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({ extended: true }));

const mysql = require("mysql");
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


// rotas
app.use(express.static('public'));


// rotas 
app.get('/', function (req, res) {
    console.log(req.url);

    res.sendFile(path.join(__dirname, "public", 'index.html'));

})

//post prod
app.post('/produtos', function (req, res) {
    if (req.body.nome.length != 0) {
        if (parseFloat(req.body.valor) > 0) {
            if ((req.body.valor).includes(',')) {
                res.send({ erro: "erro na formatação do valor" });
                console.log('formataçao');

            } else {
                connection.query(`insert into produtos(nome, valor) values ('${req.body.nome}', '${req.body.valor}')`, function (error, results, fields) {
                    if (error)
                        res.json(error);
                    else
                        res.json({ "valor": "funfo" })
                });
            }
        } else {
            res.send({ erro: "valor precisa ser maior que zero" });
            console.log('maior q zero');
        }
    } else {
        res.send({ erro: "nome obrigatorio" });
        console.log('nome');

    }
})

//get prod
app.get('/produtos', function (req, res) {
    connection.query(`select * from produtos`, function (error, results, fields) {
        if (error)
            res.json(error);
        else
            res.json(results)
    })
})

// get vendas
app.get('/vendas', function (req, res) {
    connection.query(`select * from vendas`, function (error, results, fields) {
        if (error)
            res.json(error);
        else
            res.json(results)
    })
})

// del prod
app.delete('/delProdutos/:id', function (req, res) {
    let ide = req.params.id;
    connection.query(`delete from produtos where id = ${ide}`, function (error, results, fields) {
        if (error)
            res.json(error)
        else
            res.json(results);
    })
})

// update prod
app.patch('/updateProd/:id/:nome/:valor', function (req, res) {
    let ide = req.params.id;
    let nom = req.params.nome;
    let val = req.params.val;

})

//add prod na venda
app.get('/addProdVenda/:id', function (req, res) {
    let ide = req.params.id;
    connection.query(`select * from produtos where id = ${ide}`, function (error, results, fields) {
        if (error)
            res.json(error)
        else
            res.json(results);
    })
})
app.post('/itemVenda', function (req, res) {
    let array = req.body;

    let dataFormata = moment().format('YYYY-MM-DD HH:mm:ss');
    console.log(dataFormata);
    console.log(array);
    connection.query(`insert into vendas(data_hora) values ('${dataFormata}')`, function (error, results, fields) {
        if (error)
            res.json(error)
        else
            res.json(results);
        console.log('foi porra');
        console.log(results);
        vendaId = results.insertId;
        array.forEach(i => {
            let idProd = i.id;
            console.log(idProd);
            i.idVenda = vendaId;
            console.log(i.idVenda);
            console.log(array);
            connection.query(`select valor from produtos where id = ${idProd}`, function (error, results, fields) {
                if (error)
                    console.log(error);
                else
                console.log(results);
                        console.log(results);
                        i.valorTotal = results[0].valor * i.quantidade;
                        console.log(i);
                        connection.query(`insert into item_venda(venda_id, produto_id, quantidade, valor) values ("${i.idVenda}", "${idProd}","${i.quantidade}", "${i.valorTotal}")`, 
                        function(error, results, fields){
                            if(error){
                                console.log(error);
                            } else {
                               console.log('foi');
                            }
                        })
                        
            })
        })
    })

})

app.listen(80, function () { console.log('example app listening on port 80') });