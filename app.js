//Requires
var express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
var bcrypt = require('bcrypt');
const fileUpload = require('express-fileupload');
var jwt = require('jsonwebtoken');

//Inicializar variables
var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(fileUpload());

//CORS Middleware
app.use(function(req, res, next){
    //Enabling CORS
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Aceess-Control-Allow-Methods","GET, POST, PUT, DELETE, OPTIONS");
    res.header("Access-Control-Allow-Headers",
                    "Origin, X-Requested-With, Content-Type, Accept, x-client-key, x-client-token, x-client-secret, Authorization");
    next();
});

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

//Agregar productos
app.post('/agregarproducto', function (req, res) {
    let datosProducto = {
        idproducto: req.body.idproducto,
        cantidad: req.body.cantidad,
        tipoid: req.body.tipoid,
        color: req.body.color,
        talla: req.body.talla,
        disenoid: req.body.disenoid,
        imagenprenda: req.body.imagenprenda,
        imagendiseno: req.body.imagendiseno,
        precio: req.body.precio
    };

    if (mc) {
        mc.query("INSERT INTO producto SET ?", datosProducto, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el producto"});
            } else {
                res.status(201).json({"Mensaje": "Producto insertado correctamente"});
            }
        });
    }
});

//Borrar producto
app.delete('/borrarproducto/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM producto WHERE idproducto = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar producto
app.put('/actualizarproducto/:id', (req, res) =>{
    let id = req.params.id;
    let producto = req.body;
    console.log(id);
    console.log(producto);
    if (!id || !producto){
        return res.status(400).send({error: producto, message: 'Debe proveer un id y los datos de un producto'});
    }
    mc.query("UPDATE producto SET ? WHERE idproducto = ?", [producto, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

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

//Existe producto
app.get('/existeproducto/:id', (req, res, next) => {
    let id = req.params.id;
    console.log('id:' + id);
    mc.query("SELECT * FROM producto WHERE idproducto = ?", id, function (err, result, fields) {
        return res.send({
            error: false,
            data: result,
            message: 'Producto existe'
        });
    });
});

//Agregar diseños
app.post('/agregardiseno', function (req, res) {
    let datosDiseno = {
        iddiseno: req.body.iddiseno,
        nombre: req.body.nombre,
        imagen: req.body.imagen
    };

    if (mc) {
        mc.query("INSERT INTO diseno SET ?", datosDiseno, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el diseño"});
            } else {
                res.status(201).json({"Mensaje": "Diseño insertado correctamente"});
            }
        });
    }
});

//Borrar diseño
app.delete('/borrardiseno/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM diseno WHERE iddiseno = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar diseño
app.put('/actualizardiseno/:id', (req, res) =>{
    let id = req.params.id;
    let diseno = req.body;
    console.log(id);
    console.log(diseno);
    if (!id || !diseno){
        return res.status(400).send({error: diseno, message: 'Debe proveer un id y los datos de un diseno'});
    }
    mc.query("UPDATE diseno SET ? WHERE iddiseno = ?", [diseno, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todos los diseños
app.get('/diseno', function (req, res) {
    mc.query('SELECT * FROM diseno', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de diseños.'
        });
    });
})

//Agregar envio
app.post('/agregarenvio', function (req, res) {
    let datosEnvio = {
        idenvio: req.body.idenvio,
        productosid: req.body.productosid,
        nombre: req.body.nombre,
        apellido: req.body.apellido,
        rut: req.body.rut,
        ciudad: req.body.ciudad,
        direccion: req.body.direccion,
        celular: req.body.celular,
        correo: req.body.correo,
    };

    if (mc) {
        mc.query("INSERT INTO envio SET ?", datosEnvio, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el pedido"});
            } else {
                res.status(201).json({"Mensaje": "Pedido insertado correctamente"});
            }
        });
    }
});

//Borrar envio
app.delete('/borrarenvio/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM envio WHERE idenvio = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar envio
app.put('/actualizarenvio/:id', (req, res) =>{
    let id = req.params.id;
    let envios = req.body;
    console.log(id);
    console.log(envios);
    if (!id || !envios){
        return res.status(400).send({error: envios, message: 'Debe proveer un id y los datos de un envio'});
    }
    mc.query("UPDATE envios SET ? WHERE idenvio = ?", [envios, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todos los pedidos
app.get('/envios', function (req, res) {
    mc.query('SELECT * FROM envio', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de envios.'
        });
    });
})

//Agregar tipo
app.post('/agregartipo', function (req, res) {
    let datosTipo = {
        idtipo: req.body.idtipo,
        nombre: req.body.nombre,
        imagen: req.body.imagen
    };

    if (mc) {
        mc.query("INSERT INTO tipo SET ?", datosTipo, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el tipo"});
            } else {
                res.status(201).json({"Mensaje": "Tipo insertado correctamente"});
            }
        });
    }
});

//Borrar tipo
app.delete('/borrartipo/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM tipo WHERE idtipo = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar tipo
app.put('/actualizartipo/:id', (req, res) =>{
    let id = req.params.id;
    let tipo = req.body;
    console.log(id);
    console.log(tipo);
    if (!id || !tipo){
        return res.status(400).send({error: tipo, message: 'Debe proveer un id y los datos de un tipo'});
    }
    mc.query("UPDATE tipo SET ? WHERE idtipo = ?", [tipo, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todos los tipos
app.get('/tipo', function (req, res) {
    mc.query('SELECT * FROM tipo', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de tipos pedido.'
        });
    });
})

//Agregar mangalarga
app.post('/agregarmangalarga', function (req, res) {
    let datosBase = {
        idmangalarga: req.body.idmangalarga,
        color: req.body.color,
        imagen: req.body.imagen,
        precio: parseInt(req.body.precio),
        tipo: req.body.tipo,
        talla: req.body.talla,
        stock: req.body.stock
    };

    if (mc) {
        mc.query("INSERT INTO mangalarga SET ?", datosBase, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar la base"});
            } else {
                res.status(201).json({"Mensaje": "Mangalarga insertada correctamente"});
            }
        });
    }
});

//Borrar base
app.delete('/borrarmangalarga/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM base WHERE idmangalarga = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar mangalarga
app.put('/actualizarmangalarga/:id', (req, res) =>{
    let id = req.params.id;
    let mangalarga = req.body;
    console.log(id);
    console.log(mangalarga);
    if (!id || !mangalarga){
        return res.status(400).send({error: mangalarga, message: 'Debe proveer un id y los datos de una mangalarga'});
    }
    mc.query("UPDATE mangalarga SET ? WHERE idmangalarga = ?", [mangalarga, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todas las mangalarga
app.get('/mangalarga', function (req, res) {
    mc.query('SELECT * FROM mangalarga', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de mangalarga pedida.'
        });
    });
})

//Agregar polera
app.post('/agregarpolera', function (req, res) {
    let datosPolera = {
        idpolera: req.body.idpolera,
        color: req.body.color,
        imagen: req.body.imagen,
        precio: parseInt(req.body.precio),
        tipo: req.body.tipo,
        talla: req.body.talla,
        stock: req.body.stock
    };

    if (mc) {
        mc.query("INSERT INTO polera SET ?", datosPolera, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar la polera"});
            } else {
                res.status(201).json({"Mensaje": "Base insertada correctamente"});
            }
        });
    }
});

//Borrar polera
app.delete('/borrarpolera/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM polera WHERE idpolera = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar poleras
app.put('/actualizarpolera/:id', (req, res) =>{
    let id = req.params.id;
    let poleras = req.body;
    console.log(id);
    console.log(poleras);
    if (!id || !poleras){
        return res.status(400).send({error: poleras, message: 'Debe proveer un id y los datos de una polera'});
    }
    mc.query("UPDATE polera SET ? WHERE idpolera = ?", [poleras, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todas las poleras
app.get('/polera', function (req, res) {
    mc.query('SELECT * FROM polera', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de poleras pedida.'
        });
    });
})

//Agregar poleron
app.post('/agregarpoleron', function (req, res) {
    let datosPoleron = {
        idpoleron: req.body.idpoleron,
        color: req.body.color,
        imagen: req.body.imagen,
        precio: parseInt(req.body.precio),
        tipo: req.body.tipo,
        talla: req.body.talla,
        stock: req.body.stock
    };

    if (mc) {
        mc.query("INSERT INTO poleron SET ?", datosPoleron, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el poleron"});
            } else {
                res.status(201).json({"Mensaje": "Base insertada correctamente"});
            }
        });
    }
});

//Borrar poleron
app.delete('/borrarpoleron/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM poleron WHERE idpoleron = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar poleron
app.put('/actualizarpoleron/:id', (req, res) =>{
    let id = req.params.id;
    let polerones = req.body;
    console.log(id);
    console.log(polerones);
    if (!id || !polerones){
        return res.status(400).send({error: polerones, message: 'Debe proveer un id y los datos de un poleron'});
    }
    mc.query("UPDATE poleron SET ? WHERE idpoleron = ?", [polerones, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todos los polerones
app.get('/poleron', function (req, res) {
    mc.query('SELECT * FROM poleron', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de polerones pedida.'
        });
    });
})

//Agregar polo
app.post('/agregarpolo', function (req, res) {
    let datosPolo = {
        idpolo: req.body.idpolo,
        color: req.body.color,
        imagen: req.body.imagen,
        precio: parseInt(req.body.precio),
        tipo: req.body.tipo,
        talla: req.body.talla,
        stock: req.body.stock
    };

    if (mc) {
        mc.query("INSERT INTO polo SET ?", datosPolo, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el polo"});
            } else {
                res.status(201).json({"Mensaje": "Base insertada correctamente"});
            }
        });
    }
});

//Borrar polo
app.delete('/borrarpolo/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM polo WHERE idpolo = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar poleron
app.put('/actualizarpolo/:id', (req, res) =>{
    let id = req.params.id;
    let polos = req.body;
    console.log(id);
    console.log(polos);
    if (!id || !polos){
        return res.status(400).send({error: polos, message: 'Debe proveer un id y los datos de un polo'});
    }
    mc.query("UPDATE polo SET ? WHERE idpolo = ?", [polos, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todos los polos
app.get('/polo', function (req, res) {
    mc.query('SELECT * FROM polo', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de polos pedida.'
        });
    });
})


//Login
app.post('/login', (req, res) => {
    var body = req.body;
    mc.query("SELECT * FROM usuario WHERE correo = ?", body.correo, function(error, results, fields){
        if(error){
            return res.status(500).json({
                ok:false,
                mensaje: 'Error al buscar usuario',
                errors: error
            }); 
        }
        if(!results.length){
            return res.status(400).json({
                ok:false,
                mensaje: 'Credenciales incorrectas - correo',
                errors: error
            });
        }
        console.log(results);
        // if(!bcrypt.compareSync(body.clave, results[0].clave)){
        //     return res.status(400).json({
        //         ok:false, mensaje: 'Credenciales incorrectas - clave', errors: error
        //     });
        // }

        //Crear un token!
        let SEED = 'esta-es-una-semilla';
        let token = jwt.sign({usuario:results[0].clave}, SEED, {expiresIn: 14400});

        res.status(200).json({
            ok:true,
            usuario:results,
            id: results[0].id_usuario,
            token:token
        })
    });
});

app.use('/', (req, res, next) => {
    let token = req.query.token;
    let SEED = 'esta-es-una-semilla';
    console.log(token);
    jwt.verify(token, SEED, (err, decoded) => {
        if(err){
            return res.status(401).json({
                ok:false,
                mensaje: 'Token incorrecto',
                errors:err
            });
        }
        req.usuario = decoded.usuario;
        next();
    })
})

//Añadir un usuario
app.post('/usuario',function(req,res){
    let datoUsuario = {
        //id_usuario: campo autoincremental?
        nombre: req.body.nombre,
        correo: req.body.correo,
        clave: bcrypt.hashSync(req.body.clave,10)
    };
    if(mc){
        mc.query("INSERT INTO usuario SET ?", datoUsuario, function(error, result){
            if(error){
                return res.status(400).json({
                    ok:false, mensaje: 'Error al crear usuario', errors:error
                });
            }else{
                res.status(201).json({
                    ok:true, usuario:result
                });
            }
        });
    }
});

app.get('/',(req,res,next) => {
    res.status(200).json({
        ok:true,
        mensaje: 'Peticion realizada correctamente'
    })
});

//Escuchar peticiones
app.listen(3000, ()=>{
    console.log('Express Server - puerto 3000 online');
});