//Requires
var express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

//Inicializar variables
var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

//Configuracion de la conexion
const mc = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'estampatiburones'
});

//conectar a la base de datos
mc.connect();

//Rutas
//Recuperar todos los productos
app.get('/producto', function (req, res) {
    mc.query('SELECT * FROM producto', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de productos.'
        });
    });
})

app.get('/',(req,res,next) => {
    res.status(200).json({
        ok:true,
        mensaje: 'Peticion reañizada correctamente'
    })
});

//Escuchar peticiones
app.listen(3000, ()=>{
    console.log('Express Server - puerto 3000 online');
});