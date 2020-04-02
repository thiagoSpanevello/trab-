console.log("ola mundo");
const bodyparser = require("body-parser");
const express = require("express");
const app = express();
const moment = require('moment');
const path = require('path');
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
app.get('/home', function (req, res) {
    console.log(req.url);
    res.sendFile(path.join(__dirname, "public", 'home.html'));
})

app.get('/cadUsuario', function (req, res) {
    console.log(req.url);
    res.sendFile(path.join(__dirname, "public", 'cadUsuario.html'));
})
app.post('/cadUsuario', function (req, res) {
    let usuario = req.body.nome;
    let senha = req.body.senha;
    console.log(usuario);
    console.log(senha);
    connection.query(`insert into usuario(usuario, senha) values ('${usuario}', '${senha}')`, function (error, results, fields) {
        if (error) {
            res.json(error)
        } else {
            res.json(results.insertId);
        }
    })
})

//post prod
app.post('/produtos', function (req, res) {
    console.log(req.body.nome);
    console.log('valor banco');
    console.log(req.body.valor);
    if (req.body.nome.length != 0) {
        if (parseFloat(req.body.valor) > 0) {
            connection.query(`insert into produtos(nome, valor) values ('${req.body.nome}', '${req.body.valor}')`, function (error, results, fields) {
                if (error)
                    res.send(error);
                else
                    res.send({ "valor": "funfo" })
            });
        } else {
            res.send({ res: "valor precisa ser maior que zero" });
            console.log('maior q zero');
        }
    } else {
        res.send({ res: "nome obrigatorio" });
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
    connection.query(`select venda.id, venda.data_hora, sum(iv.valor) as valor, sum(iv.quantidade) as quantidade from vendas venda
    join item_venda iv on(iv.venda_id = venda.id)
    where MONTH(venda.data_hora) = MONTH(now())
    group by venda.id
    order by venda.data_hora desc`, function (error, results, fields) {
        if (error)
            res.json(error);
        else
            res.json(results)
    })
})
app.get('/BuscaVendas/:data_inicial/:data_fim', function (req, res) {
    let data_ini = req.params.data_inicial;
    let data_final = req.params.data_fim;
    connection.query(`select venda.id, venda.data_hora, coalesce(sum(iv.valor), 0) as valor, coalesce(sum(iv.quantidade), 0) as quantidade from vendas venda
    left join item_venda iv on(iv.venda_id = venda.id)
    where venda.data_hora between ('${data_ini}') and ('${data_final}')
    group by venda.id
    order by venda.data_hora desc;`, function (error, results, fields) {
        if (error)
            res.json(error);
        else
            res.json(results)
        console.log(results);
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
app.get('/updateProd/:id', function (req, res) {
    let ide = req.params.id;
    console.log(req.body);
    connection.query(`select p.nome, p.valor from produtos p where id = ${ide}`, function (error, results, fields) {
        if (error) {
            res.json(error)
        } else {
            res.json(results)
        }
    })

})
app.post('/updateProd/:id', function (req, res) {
    let ide = req.params.id;
    let nom = req.body.nome;
    let val = req.body.valor;
    console.log(nom);
    console.log(ide);
    console.log(val);
    if (req.body.nome.length != 0) {
        if (parseFloat(req.body.valor) > 0) {
            connection.query(`update produtos set nome = '${nom}', valor = ${val} where id = ${ide}`, function (error, results, fields) {
                if (error) {
                    res.json(error)
                } else {
                    res.json(results)
                }
            })
        } else {
            res.send({ res: "valor precisa ser maior que zero" });
            console.log('maior q zero');
        }
    } else {
        res.send({ res: "nome obrigatorio" });
        console.log('nome');

    }
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
app.post('/valSenha', function (req, res) {
    let usu = req.body.usuario;
    let senha = req.body.senha;
    console.log(usu);
    console.log(senha);
    connection.query(`select * from usuario where usuario = "${usu}" and senha = "${senha}"`, function (error, results, fields) {
        if (results.length == 0) {
            res.json({ "res": error })
            console.log('porra');
        } else {
            console.log('aloo');
            res.json(results)
            console.log(results);

        }
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
            if(i == null){

            }  else {
            let idProd = i.id;
            console.log(idProd);
            i.idVenda = vendaId;
            console.log(i.idVenda);
            console.log('array');
            console.log(array);
            connection.query(`select valor from produtos where id = ${idProd}`, function (error, results, fields) {
                if (error)
                    console.log(error);
                else
                    console.log(results);
                console.log(results);
                i.valorTotal = results[0].valor * i.quantidade;
                console.log('objeto item venda');
                console.log(i);
                connection.query(`insert into item_venda(venda_id, produto_id, quantidade, valor) values ("${i.idVenda}", "${idProd}","${i.quantidade}", "${i.valorTotal}")`,
                    function (error, results, fields) {
                        if (error) {
                            console.log(error);
                        } else {
                            console.log('foi');
                        }
                    })

            })
        }
        })
    })

})

app.get('/grafProd', function (req, res) {
    connection.query(`select p.nome, round(sum(i.quantidade)*100/(select sum(quantidade) from item_venda)) as porcentagem, (select sum(i.valor)) as valor, (select sum(valor) from item_venda) as total from item_venda i 
    join produtos p on (p.id = i.produto_id) 
    group by p.id
    order by porcentagem desc`, function (error, results, fields) {
        if (error)
            res.json(error)
        else
            res.json(results)
    })
})
app.get('/grafVenda', function (req, res) {
    connection.query(`select MONTH(v.data_hora) as mes, sum(i.valor) as total from item_venda i 
    join vendas v on (v.id = i.venda_id) where Year(v.data_hora) = Year(now())
    group by mes;`, function (error, results, fields) {
        if (error) {
            res.json(error)
        } else {
            res.json(results)
            console.log(results);
        }
    })
})
app.use(`/editarProd`, function (req, res) {
    res.sendFile(path.join(__dirname, "public", 'updateProd.html'))
})
app.listen(process.env.PORT || 3000);