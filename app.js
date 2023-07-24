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
app.delete('/borrarproducto/:id', function (req, res){
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
app.put('/actualizarproducto/:id', (req, res) =>{
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
app.delete('/borrardiseno/:id', function (req, res){
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
app.put('/actualizardiseno/:id', (req, res) =>{
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

//Agregar tipo
app.post('/agregartipo', function (req, res) {
    let datosTipo = {
        tipo: req.body.tipo,
        imageUrl: req.body.imageUrl
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
app.delete('/borrart/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM tipo WHERE id_tipo = ?", id, function (error, result){
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
app.put('/actualizart/:id', (req, res) =>{
    let id = req.params.id;
    let tipo = req.body;
    console.log(id);
    console.log(tipo);
    if (!id || !tipo){
        return res.status(400).send({error: tipo, message: 'Debe proveer un id y los datos de un tipo'});
    }
    mc.query("UPDATE tipo SET ? WHERE id_tipo = ?", [tipo, id], function (error, results, fields){
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

//Agregar base
app.post('/agregarbase', function (req, res) {
    let datosBase = {
        tipo_id: req.body.tipo_id,
        talla_id: req.body.talla_id,
        color_id: req.body.color_id
    };

    if (mc) {
        mc.query("INSERT INTO base SET ?", datosBase, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar la base"});
            } else {
                res.status(201).json({"Mensaje": "Base insertada correctamente"});
            }
        });
    }
});

//Borrar base
app.delete('/borrarb/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM base WHERE id_base = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar base
app.put('/actualizarb/:id', (req, res) =>{
    let id = req.params.id;
    let base = req.body;
    console.log(id);
    console.log(base);
    if (!id || !base){
        return res.status(400).send({error: base, message: 'Debe proveer un id y los datos de una base'});
    }
    mc.query("UPDATE base SET ? WHERE id_base = ?", [base, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todas las bases
app.get('/base', function (req, res) {
    mc.query('SELECT * FROM base', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de bases pedida.'
        });
    });
})

//Agregar talla
app.post('/agregartalla', function (req, res) {
    let datosTalla = {
        talla: req.body.talla
    };

    if (mc) {
        mc.query("INSERT INTO talla SET ?", datosTalla, function (error, result) {
            if (error) {
                res.status(500).json({"Mensaje": "Error al insertar la talla"});
            } else {
                res.status(201).json({"Mensaje": "Talla insertada correctamente"});
            }
        });
    }
});

//Borrar base
app.delete('/borrart/:id', function (req, res){
    let id = req.params.id;
    if(mc){
        console.log(id);
        mc.query("DELETE FROM talla WHERE id_talla = ?", id, function (error, result){
            if(error){
                return res.status(500).json({"Mensaje": "Error"});
            }
            else{
                return res.status(200).json({"Mensaje": "Registro con id = " + id + " Borrado"});
            }
        });
    }
});

//Actualizar base
app.put('/actualizart/:id', (req, res) =>{
    let id = req.params.id;
    let talla = req.body;
    console.log(id);
    console.log(talla);
    if (!id || !talla){
        return res.status(400).send({error: talla, message: 'Debe proveer un id y los datos de una talla'});
    }
    mc.query("UPDATE talla SET ? WHERE id_talla = ?", [talla, id], function (error, results, fields){
        if (error) throw error;
        return res.status(200).json({"Mensaje": "Registro con id = " + id + " ha sido actualizado"});
    });
});

//Recuperar todas las tallas
app.get('/talla', function (req, res) {
    mc.query('SELECT * FROM talla', function(error, results, fields){
        if(error) throw error;
        return res.send({
            error: false,
            data: results,
            message: 'Lista de tallas pedida.'
        });
    });
})

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