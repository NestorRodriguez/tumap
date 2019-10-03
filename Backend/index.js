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

//Llamado de encuesta social 
app.route('/encuesta_social')
    .get(function(req, res) {
        console.log('Método de encuesta social');
        var query = db.query('select SEC_Encuesta_Social.id_Encuesta, SEC_Encuesta_Social.Vinculo_Territorial, SEC_Necesidades_Basicas.Nombre_Necesidad, SEC_Encuesta_Necesidades.Importancia  from SEC_Encuesta_Necesidades inner join SEC_Encuesta_Social on SEC_Encuesta_Necesidades.id_Encuesta = SEC_Encuesta_Social.id_Encuesta inner join SEC_Necesidades_Basicas on SEC_Encuesta_Necesidades.id_Necesidades = SEC_Necesidades_Basicas.id_Necesidades;', function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result)
            }
        });
    })

.post(function(req, res) {
    res.send('Add a encuesta_social');
})

/*.post(function(req, res) {
    res.send('Add a encuesta social');*/


// NUESTRO POST

//post(function(req, res) {
// console.log('Vinculo_Territorial');
// })

// para manejar la ruta /encuesta_social, e imprimir el vinculo territorial
//app.post('/encuesta_social', function(req, res, next) {
//res.end(req.params.id_Encuesta)
//var sSQLCreate = "INSERT INTO SEC_Encuesta_Social (id_Encuesta, Vinculo_Territorial) VALUES (NULL, ";
//sSQLCreate += "'" + oDataSEC_Encuesta_Social.Vinculo_Territorial + "', ";


//})

app.put(function(req, res) {
    res.send('Update the encuesta social');
});

//Llamado de SEC_Establecimiento_Comercial
app.route('/Establecimiento_Comercial')
    .get(function(req, res) {
        console.log('Método de Establecimiento_Comercial ');
        var query = db.query('select * from SEC_Establecimiento_Comercial', function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result)
            }
        });
    })
    .post(function(req, res) {
        res.send('Add a Establecimiento_Comercial');
    })
    .put(function(req, res) {
        res.send('Update the Establecimiento_Comercial');
    });

//Llamado de SEC_Comercio_Informal
app.route('/Comercio_Informal')
    .get(function(req, res) {
        console.log('Método de Comercio_Informal');
        var query = db.query('select * from SEC_Comercio_Informal', function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result)
            }
        });
    })
    .post(function(req, res) {
        res.send('Add a Comercio_Informal');
    })
    .put(function(req, res) {
        res.send('Update the Comercio_Informal');
    });


//Llamado de puerto
app.listen(3000, function() {
    console.log(`Server running at port ${PORT}`);
});