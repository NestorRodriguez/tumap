const express = require('express');
const app = express();
const PORT = 3000;
var mysql = require('mysql');
//require("./config");
//require("./routes/api")(app);
//require("./routes/views")(app);

//Parámetros de la conexión a la base de datos
var db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "12345",
    database: "tumap",
    port: 3306,
});

//Realizar la conexión a la base de datos
db.connect(function(err) {
    if (err)
        throw err;
    else
        console.log(`Base de datos conectada!`);
});


app.get('/', function(req, res) {
    console.log('Página de rol ');

    res.send("Bienvenidos al servidor de <strong> TuMap </strong>")
});

//Manejador de ruta users
app.route('/users')
    .get(function(req, res) {
        console.log('Método de user ');
        var query = db.query('select * from users', function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result)
            }
        });
    })
    .post(function(req, res) {
        res.send('Add a user');
    })
    .put(function(req, res) {
        res.send('Update the user');
    });

// Manejador de ruta rol
app.route('/rol')
    .get(function(req, res) {
        console.log('Página de rol ');
        var query = db.query('select * from rol', function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result)
            }
        });
    })
    .post(function(req, res) {
        res.send('Add a rol');
    })
    .put(function(req, res) {
        res.send('Update the rol');
    });


//Llamado de puerto
app.listen(3000, function() {
    console.log(`Server running at port ${PORT}`);
});