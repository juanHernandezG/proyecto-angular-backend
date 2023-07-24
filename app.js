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

//Agregar productos
app.post('/agregarproducto', function (req, res) {
    let datosProducto = {
        base_id: req.body.base_id,
        diseno_id: req.body.diseno_id,
        precio: parseInt(req.body.precio)
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
app.delete('/borrarp/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM producto WHERE id_producto = ?", id, function (error, result){
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
app.put('/actualizarp/:id', (req, res) =>{
    let id = req.params.id;
    let producto = req.body;
    console.log(id);
    console.log(producto);
    if (!id || !producto){
        return res.status(400).send({error: producto, message: 'Debe proveer un id y los datos de un producto'});
    }
    mc.query("UPDATE producto SET ? WHERE id_producto = ?", [producto, id], function (error, results, fields){
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
    mc.query("SELECT * FROM producto WHERE id_producto = ?", id, function (err, result, fields) {
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
        diseno: req.body.diseno
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
app.delete('/borrard/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM diseno WHERE id_diseno = ?", id, function (error, result){
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
app.put('/actualizard/:id', (req, res) =>{
    let id = req.params.id;
    let diseno = req.body;
    console.log(id);
    console.log(diseno);
    if (!id || !diseno){
        return res.status(400).send({error: diseno, message: 'Debe proveer un id y los datos de un diseno'});
    }
    mc.query("UPDATE diseno SET ? WHERE id_diseno = ?", [diseno, id], function (error, results, fields){
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

//Agregar color
app.post('/agregarcolor', function (req, res) {
    let datosColor = {
        color: req.body.color
    };

    if (mc) {
        mc.query("INSERT INTO color SET ?", datosColor, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el color"});
            } else {
                res.status(201).json({"Mensaje": "Color insertado correctamente"});
            }
        });
    }
});

//Borrar color
app.delete('/borrarc/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM color WHERE id_color = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar color
app.put('/actualizarc/:id', (req, res) =>{
    let id = req.params.id;
    let color = req.body;
    console.log(id);
    console.log(color);
    if (!id || !color){
        return res.status(400).send({error: color, message: 'Debe proveer un id y los datos de un color'});
    }
    mc.query("UPDATE color SET ? WHERE id_color = ?", [color, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todos los colores
app.get('/color', function (req, res) {
    mc.query('SELECT * FROM color', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de colores.'
        });
    });
})

//Agregar pedido
app.post('/agregarpedido', function (req, res) {
    let datosPedido = {
        detalles_pedido_id: req.body.detalles_pedido_id,
        fecha: req.body.fecha,
        estado: req.body.estado
    };

    if (mc) {
        mc.query("INSERT INTO pedidos SET ?", datosPedido, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el pedido"});
            } else {
                res.status(201).json({"Mensaje": "Pedido insertado correctamente"});
            }
        });
    }
});

//Borrar pedido
app.delete('/borrarp/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM pedidos WHERE id_pedido = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar pedido
app.put('/actualizarp/:id', (req, res) =>{
    let id = req.params.id;
    let pedido = req.body;
    console.log(id);
    console.log(pedido);
    if (!id || !pedido){
        return res.status(400).send({error: pedido, message: 'Debe proveer un id y los datos de un pedido'});
    }
    mc.query("UPDATE pedidos SET ? WHERE id_pedido = ?", [pedido, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todos los pedidos
app.get('/pedidos', function (req, res) {
    mc.query('SELECT * FROM pedidos', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de pedidos.'
        });
    });
})

//Agregar detalles pedido
app.post('/agregardetalles', function (req, res) {
    let datosDetalles = {
        producto_id: req.body.producto_id,
        nombre: req.body.nombre,
        rut: req.body.rut,
        direccion: req.body.direccion,
        telefono: req.body.telefono,
        correo: req.body.correo
    };

    if (mc) {
        mc.query("INSERT INTO detallespedido SET ?", datosDetalles, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar el detalle"});
            } else {
                res.status(201).json({"Mensaje": "Detalle insertado correctamente"});
            }
        });
    }
});

//Borrar detalle
app.delete('/borrard/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM detallespedido WHERE id_detalles_pedido = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar detalle
app.put('/actualizard/:id', (req, res) =>{
    let id = req.params.id;
    let detalle = req.body;
    console.log(id);
    console.log(detalle);
    if (!id || !detalle){
        return res.status(400).send({error: detalle, message: 'Debe proveer un id y los datos de un detalle'});
    }
    mc.query("UPDATE detallespedido SET ? WHERE id_detalles_pedido = ?", [detalle, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todos los pedidos
app.get('/detalles', function (req, res) {
    mc.query('SELECT * FROM detallespedido', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de detalles pedido.'
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