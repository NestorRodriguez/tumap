const express = require('express');
const app = express();
const PORT = 3000;
var mysql = require('mysql');
//require("./config");
//require("./routes/api")(app);
//require("./routes/views")(app);

const bodyParser = require('body-parser');
const cors = require('cors');

// Se agrega la librería para habilitar cors
app.use(cors());

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

//Parámetros de la conexión a la base de datos
var db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "12345",
    database: "tumap",
    port: 3306,
});

//Realizar la conexión a la base de datos
db.connect(function(error) {
    if (error)
        console.log(error);
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

// Manejador de ruta Usuarios
app.route('/usuarios')
    .get(function(req, res) {
        console.log('Página de Usuarios ');
        var query = db.query('select * from usuarios', function(error, result) {
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

// Manejador de ruta Registro de Información
app.route('/registro_info')
    .get(function(req, res) {
        console.log('Página de Registro de Información ');
        var query = db.query('select * from registro_info', function(error, result) {
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

// Manejador de ruta Administrador
app.route('/administrador')
    .get(function(req, res) {
        console.log('Página de Administradores ');
        var query = db.query('select * from administrador', function(error, result) {
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

// Manejador de ruta Validar Información
app.route('/validar_info')
    .get(function(req, res) {
        console.log('Página de Validar Información ');
        var query = db.query('select * from validar_info', function(error, result) {
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

//**************************************************************************
// dbo inicio 
//*Ej: http://localhost:3000/dbo_pregunta/1**********************************
app.route('/dbo_pregunta/:orden')
    .get(function(req, res) {
        console.log('Página de pregunta ');
        var orden = req.params.orden;
        var query = db.query('select * from dbo_pregunta where orden = ?', orden, function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result);
            }
        });
    });
// dbo Lista las imagen por imagensuelos 30/09/2019
app.route('/dbo_imagen/:id_Pregunta')
    .get(function(req, res) {
        console.log('Página de imagen ');
        var id_Pregunta = req.params.id_Pregunta;
        var query = db.query('select * from dbo_imagen where id_Pregunta= ?', id_Pregunta, function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result);
            }
        });
    });

// dbo Lista inscripciones por documento 30/09/2019
app.route('/dbo_inscripcion/:documento')
    .get(function(req, res) {
        console.log('Página de inscripcion');
        var documento = req.params.documento;
        var query = db.query('select * from dbo_inscripcion Where documento = ?', documento, function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result);
            }
        });
    });

// dbo Lista respuestas 30/09/2019
app.route('/dbo_respuesta/:id_inscripcion')
    .get(function(req, res) {
        console.log('Página de respuesta');
        var id_inscripcion = req.params.id_inscripcion;
        var query = db.query('select * from dbo_respuesta where id_inscripcion = ?', id_inscripcion, function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result);
            }
        });
    });

// dbo Lista las respuestas con texto vlistado 30/09/2019
app.route('/dbo_vlistado')
    .get(function(req, res) {
        console.log('Página de vlistado ');
        var query = db.query('select * from dbo_vlistado', function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result);
            }
        });
    });

// dbo Listar todos las respuestas con ids vlistadotodo 30/09/2019
app.route('/dbo_vlistadotodo')
    .get(function(req, res) {
        console.log('Página de vlistadotodo ');
        var query = db.query('select * from dbo_vlistadotodo', function(error, result) {
            if (error) {
                throw error;
            } else {
                console.log(result);
                res.json(result);
            }
        });
    });

//*********************************************************************************** */
// dbo Fin 
//************************************************************************************ */


/*************************************************************************************
 * Servicios para el inventario de redes secas
 *************************************************************************************/

app.get('/irs-tipos-redes', (req, res) => {
    const sql =  'SELECT id, nombre, icono FROM irs_tipos_redes';
    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: "Ocurrió un error al consultar los tipos de redes"
            });
        } else {
            res.json(result);
        }
    });
});

app.get('/irs-estados-redes', (req, res) => {
    const sql =  'SELECT id, nombre FROM irs_estados_redes';
    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: "Ocurrió un error al consultar los estados de las redes"
            });
        } else {
            res.json(result);
        }
    });
});

app.get('/irs-tipos-materiales', (req, res) => {
    const sql =  'SELECT id, nombre FROM irs_materiales_postes';
    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: "Ocurrió un error al consultar los tipos de materiales"
            });
        } else {
            res.json(result);
        }
    });
});

app.get('/irs-operadores-celulares', (req, res) => {
    const sql =  'SELECT id, nombre, logotipo FROM irs_operadores_celulares';
    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: "Ocurrió un error al consultar los operadores celulares"
            });
        } else {
            res.json(result);
        }
    });
});

/*************************************************************************************
 * Fin de servicios para el inventario de redes secas
 *************************************************************************************/

//Llamado de puerto
app.listen(3000, function() {
    console.log(`Server running at port ${PORT}`);
});