const express = require('express')
const exphbs = require('express-handlebars')
const mysql = require('mysql')

const app = express()

app.use(
    express.urlencoded({
        extended: true,
    }),
)

app.use(express.json())

const hbs = exphbs.create();

app.engine("handlebars", hbs.engine);
app.set("view engine", "handlebars");

app.use(express.static('public'))

app.get('/', (req, res) => {

    const sqlRestaurante = `
        SELECT
            R.CNPJ,
            R.Nome_Restaurante,
            C.Nome AS Nome_Categoria,
            R.Endereco,
            R.Cidade,
            R.Estado,
            R.Avaliação
        FROM
            RESTAURANTES R
        INNER JOIN 
            CATEGORIA C ON R.Id_Categoria_Rest = C.Id_Categoria
        ORDER BY R.Avaliação DESC; 
        `;



    const sqlPratos = `SELECT PRATOS.Id_Pratos, RESTAURANTES.Nome_Restaurante AS Nome_Rest, PRATOS.Nome_Prato, TIPO_PRATO.Nome AS Tipo_Prato, PRATOS.Descrição, PRATOS.Valor
    FROM PRATOS
    JOIN TIPO_PRATO ON PRATOS.Id_Tipo_Prato = TIPO_PRATO.Id_Tipo
    JOIN RESTAURANTES ON PRATOS.Id_Restaurante = RESTAURANTES.CNPJ
    ORDER BY
    Id_Restaurante
    `;

    const sqlpratosRollUp = `
    SELECT
        C.Nome AS Nome_Categoria,
        R.Nome_Restaurante,
        AVG(R.Avaliação) AS Total_Avaliacao
    FROM
        CATEGORIA C
        JOIN
        RESTAURANTES R ON C.Id_Categoria = R.Id_Categoria_Rest
    GROUP BY
    C.Nome, R.Nome_Restaurante WITH ROLLUP;`;

    const mediaPrecoDesejada = req.query.mediaPreco || 0;

    const sqlRestauranteMedia = `
    SELECT
        R.Nome_Restaurante,
        AVG(P.Valor) AS Media_Preco,
        SUM(P.Valor) AS Total_PrecoPratosRest,

        R.Avaliação AS Avaliacao
    FROM
        RESTAURANTES R
    JOIN
        PRATOS P ON R.CNPJ = P.Id_Restaurante
    GROUP BY
        R.Nome_Restaurante
    HAVING
        AVG(P.Valor) > ${mediaPrecoDesejada};
`;
    const sqlCategorias = `SELECT * FROM categoria`;

    const sqlTipoPrato = `SELECT * FROM tipo_prato`;






    conn.query(sqlRestaurante, (err, resultsRestaurante) => {
        if (err) {
            console.log(err);
            // Trate o erro aqui, se necessário
            return res.status(500).send('Erro ao obter dados de restaurantes');
        }

        conn.query(sqlPratos, (err, resultPrato) => {
            if (err) {
                console.log(err);
                // Trate o erro aqui, se necessário
                return res.status(500).send('Erro ao obter dados de pratos');
            }

            conn.query(sqlpratosRollUp, (err, resultPratoRollUp) => {   
                if (err) {
                    console.log(err);
                    // Trate o erro aqui, se necessário
                    return res.status(500).send('Erro ao obter dados de pratos');
                }

                conn.query(sqlRestauranteMedia, (err, resultsRestauranteMedia) => {
                    if (err) {
                        console.log(err);
                        // Trate o erro aqui, se necessário
                        return res.status(500).send('Erro ao obter dados de pratos');
                    }

                    conn.query(sqlCategorias, (err, resultsCategoria) => {
                        if (err) {
                            console.log(err);
                            // Trate o erro aqui, se necessário
                            return res.status(500).send('Erro ao obter dados de pratos');
                        }
                        
                        conn.query(sqlTipoPrato, (err, resultTipoPrato) => {
                            if (err) {
                                console.log(err);
                                // Trate o erro aqui, se necessário
                                return res.status(500).send('Erro ao obter dados de pratos');
                            }
    
    
                            res.render('home', {
                                restaurantes: resultsRestaurante, pratos: resultPrato, resultPratoRollUp: resultPratoRollUp,
                                resultsRestauranteMedia: resultsRestauranteMedia, resultsCategoria: resultsCategoria, mediaPrecoDesejada: mediaPrecoDesejada, resultTipoPrato: resultTipoPrato
                            });
                        })

                    })


                })

            })


        });
    });
});




// Select para os pratos




app.post('/restaurantes/DeleteRestaurante', (req, res) => {
    const CNPJ = req.body.CNPJ
    const sql = `DELETE FROM RESTAURANTES WHERE CNPJ = '${CNPJ}'`

    conn.query(sql, function (err) {
        if (err) {
            console.log(err)
        }
        res.redirect('/')
    })
})


app.post('/restaurantes/insertRestaurante', (req, res) => {
    const CNPJ = req.body.CNPJ
    const Nome_Restaurante = req.body.Nome_Restaurante
    const Id_Categoria_Rest = req.body.Id_Categoria_Rest
    const Endereco = req.body.Endereco
    const Cidade = req.body.Cidade
    const Estado = req.body.Estado
    const Avaliação = req.body.Avaliação

    const sql = ` INSERT INTO restaurantes (CNPJ,Nome_Restaurante, Id_Categoria_Rest, Endereco, Cidade, Estado, Avaliação) VALUES ('${CNPJ}','${Nome_Restaurante}','${Id_Categoria_Rest}','${Endereco}','${Cidade}','${Estado}','${Avaliação}') `

    conn.query(sql, function (err) {
        if (err) {
            console.log(err)
        }
        res.redirect('/')
    })
})



app.post('/restaurantes/InsertPratos', (req, res) => {
    const CNPJ = req.body.CNPJ
    const Nome_Prato = req.body.Nome_Prato
    const Id_TipoPrato = req.body.Id_TipoPrato
    const Descrição = req.body.Descrição
    const Valor = req.body.Valor

    const sql = ` INSERT INTO Pratos (Id_Restaurante,Nome_Prato, Id_Tipo_Prato, Descrição, Valor) VALUES ('${CNPJ}','${Nome_Prato}','${Id_TipoPrato}','${Descrição}','${Valor}') `

    conn.query(sql, function (err) {
        if (err) {
            console.log(err)
        }
        res.redirect('/')
    })
})

app.post('/restaurantes/editaAvaliacao', (req, res) => {
    const CNPJ = req.body.CNPJ
    const Avaliação = req.body.Avaliação

    const sql = `UPDATE RESTAURANTES
    SET Avaliação = ${Avaliação}
    WHERE CNPJ = ${CNPJ};`

    conn.query(sql, function (err) {
        if (err) {
            console.log(err)
        }
        res.redirect('/')
    })
})



//conectando o MYSQL

const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123',
    database: 'bdrestaurantes',
    port: '1337'
})

conn.connect(function (err) {
    if (err) {
        console.error("Erro de conexão com o MySQL:", err);
    }

    console.log('conectou ao MySQL!')

    app.listen(3000)
})