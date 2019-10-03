const express = require('express');
const app = express();
const PORT = 3000;
const mysql = require('mysql');
const bodyParser = require('body-parser');


//require("./config");
//require("./routes/api")(app);
//require("./routes/views")(app);

//Parámetros de la conexión a la base de datos
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "12345",
    database: "tumap",
    port: 3306,
});

//Realizar la conexión a la base de datos
db.connect(function(err) {
    if (err)
        console.log(err);
    else
        console.log(`Base de datos conectada!`);
});

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

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

/********************************************************************** 
 *Servicios para levantamiento infromación predial
 ***********************************************************************/
const router = express.Router();

// Manejador de ruta uso predio

router
    .get('/usopredio', (req, res) => {
        console.log('Consultar datos uso_Predio');
        var query = db.query('select * from uso_Predio', (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .get('/usopredio/:id', (req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM uso_Predio WHERE id_predio='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(data)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .post('/usopredio', (req, res) => {
        const dato = {
            descripcion: req.body.descripcion,
        };

        const sql = `INSERT INTO uso_Predio SET descripcion='${dato.descripcion}';`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/usopredio/:id', (req, res) => {

        const id = req.params.id;
        const dato = {
            descripcion: req.body.descripcion,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE uso_Predio SET ${sets.join(', ')} WHERE id_predio='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/usopredio/:id', (req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM uso_Predio WHERE id_predio='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    });

// Manejador de ruta servicios públicos

router
    .get('/sp', (req, res) => {
        console.log('Consultar datos servicios_Publicos');
        var query = db.query('select * from servicios_Publicos', (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .get('/sp/:id', (req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM servicios_Publicos WHERE id_servpub='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(data)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .post('/sp', (req, res) => {
        const dato = {
            descripcion: req.body.descripcion,
        };

        const sql = `INSERT INTO servicios_Publicos SET descripcion='${dato.descripcion}';`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/sp/:id', (req, res) => {

        const id = req.params.id;
        const dato = {
            descripcion: req.body.descripcion,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE servicios_Publicos SET ${sets.join(', ')} WHERE id_servpub='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/sp/:id', (req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM servicios_Publicos WHERE id_servpub='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    });

// Manejador de ruta Nivel vivienda

router
    .get('/nivel', (req, res) => {
        console.log('Consultar datos Nivel vivienda');
        var query = db.query('select * from nivel_Vivienda', (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .get('/nivel/:id', (req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM nivel_Vivienda WHERE id_nivel='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(data)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .post('/nivel', (req, res) => {
        const dato = {
            descripcion: req.body.descripcion,
        };

        const sql = `INSERT INTO nivel_Vivienda SET descripcion='${dato.descripcion}';`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/nivel/:id', (req, res) => {

        const id = req.params.id;
        const dato = {
            descripcion: req.body.descripcion,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE nivel_Vivienda SET ${sets.join(', ')} WHERE id_nivel='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/nivel/:id', (req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM nivel_Vivienda WHERE id_nivel='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    });

// Manejador de ruta Estratos

router
    .get('/estrato', (req, res) => {
        console.log('Consultar datos Estratos');
        var query = db.query('select * from estrato', (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .get('/estrato/:id', (req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM estrato WHERE id_estrato='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(data)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .post('/estrato', (req, res) => {
        const dato = {
            descripcion: req.body.descripcion,
        };

        const sql = `INSERT INTO estrato SET descripcion='${dato.descripcion}';`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/estrato/:id', (req, res) => {

        const id = req.params.id;
        const dato = {
            descripcion: req.body.descripcion,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE estrato SET ${sets.join(', ')} WHERE id_estrato='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/estrato/:id', (req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM estrato WHERE id_estrato='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    });

// Manejador de ruta predios

router
    .get('/predios', (req, res) => {
        console.log('Consultar datos Predios');
        var query = db.query('select * from predios', (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .get('/predios/:id', (req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM predios WHERE id_predio='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(data)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })
    .post('/predios', (req, res) => {
        const dato = {
            matricula: req.body.matricula,
            direccion: req.body.direccion,
            ide_estrato: req.body.ide_estrato,
            id_usosuelo: req.body.id_usosuelo,
            ide_nivel: req.body.ide_nivel,
            estado_Vivienda: req.body.estado_Vivienda,
            servicio_agua: req.body.servicio_agua,
            servicio_energia: req.body.servicio_energia,
            servicio_internet: req.body.servicio_internet,
            servicio_telefoniaFija: req.body.servicio_telefoniaFija,
            servicio_telefoniaMovil: req.body.servicio_telefoniaMovil,
            servicio_gasNatural: req.body.servicio_gasNatural,
            servicio_gasPropano: req.body.servicio_gasPropano,
        };

        const sql = `INSERT INTO predios SET matricula='${dato.matricula}',direccion='${dato.direccion}',ide_estrato='${dato.ide_estrato}',
        id_usosuelo='${dato.id_usosuelo}',ide_nivel='${dato.ide_nivel}',estado_Vivienda='${dato.estado_Vivienda}',servicio_agua='${dato.servicio_agua}',
        servicio_energia='${dato.servicio_energia}',servicio_internet='${dato.servicio_internet}',servicio_telefoniaFija='${dato.servicio_telefoniaFija}',
        servicio_telefoniaMovil='${dato.servicio_telefoniaMovil}',servicio_gasNatural='${dato.servicio_gasNatural}',servicio_gaspropano='${dato.servicio_gasPropano}';`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/predios/:id', (req, res) => {

        const id = req.params.id;
        const dato = {
            matricula: req.body.matricula,
            direccion: req.body.direccion,
            ide_estrato: req.body.ide_estrato,
            id_usosuelo: req.body.id_usosuelo,
            ide_nivel: req.body.ide_nivel,
            estado_Vivienda: req.body.estado_Vivienda,
            servicio_agua: req.body.servicio_agua,
            servicio_energia: req.body.servicio_energia,
            servicio_internet: req.body.servicio_internet,
            servicio_telefoniaFija: req.body.servicio_telefoniaFija,
            servicio_telefoniaMovil: req.body.servicio_telefoniaMovil,
            servicio_gasNatural: req.body.servicio_gasNatural,
            servicio_gasPropano: req.body.servicio_gasPropano,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE predios SET ${sets.join(', ')} WHERE id_predio='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/predios/:id', (req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM predios WHERE id_predio='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    });

/********************************************************************** 
 * FIN Servicios para levantamiento infromación predial
 ***********************************************************************/

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

app.use(router);

//Llamado de puerto
app.listen(3000, function() {
    console.log(`Server running at port ${PORT}`);
});