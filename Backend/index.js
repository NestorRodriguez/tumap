const express = require('express');
const app = express();
const PORT = 3000;
const mysql = require('mysql');
const bodyParser = require('body-parser');


//require("./config");
//require("./routes/api")(app);
//require("./routes/views")(app);

const cors = require('cors');

// Se agrega la librería para habilitar cors
app.use(cors());

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

// parse application/json
app.use(bodyParser.json());

//Parámetros de la conexión a la base de datos
const db = mysql.createConnection({
    host: "localhost",
    user: "jcastrillon",
    password: "jcastrillon",
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
    const sql = 'SELECT id, nombre, icono FROM irs_tipos_redes';
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
    const sql = 'SELECT id, nombre FROM irs_estados_redes';
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
    const sql = 'SELECT id, nombre FROM irs_materiales_postes';
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
    const sql = 'SELECT id, nombre, logotipo FROM irs_operadores_celulares';
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

app.post('/irs-inventario-postes', (req, res) => {
    const data = req.body;
    const date = new Date().toISOString();
    const sql = `
    INSERT INTO irs_inventarios_postes (
        id_irs_material,
        numero,
        id_irs_estado_red,
        tiene_lampara,
        tiene_transformador,
        tipo_red,
        ubicacion,
        imagen,
        id_usuario,
        id_irs_operador_celular,
        id_irs_estado_red_celular,
        fecha,
        ip
    ) VALUES (
        '${data.id_irs_material}',
        '${data.numero}',
        '${data.id_irs_estado_red}',
        '${data.tiene_lampara}',
        '${data.tiene_transformador}',
        '${data.tipo_red}',
        '${JSON.stringify(data.ubicacion)}',
        '${data.imagen}',
        '${data.id_usuario}',
        '${data.id_irs_operador_celular}',
        '${data.id_irs_estado_red_celular}',
        '${date.substring(0, 10)}T${date.substring(11, 19)}',
        '${data.ip}'
    )`;

    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: "Ocurrió un error al guardar la encuesta."
            });
        } else {
            res.json(result);
        }
    });
});

app.post('/irs-inventario-otros', (req, res) => {
    const data = req.body;
    const date = new Date().toISOString();
    const sql = `
    INSERT INTO irs_inventarios_otros (
        tipo,
        id_irs_estado_red,
        identificador,
        id_irs_operador,
        ubicacion,
        imagen,
        id_usuario,
        id_irs_operador_celular,
        id_irs_estado_red_celular,
        fecha,
        ip
    ) VALUES (
        '${data.tipo}',
        '${data.id_irs_estado_red}',
        '${data.identificador}',
        '${data.id_irs_operador}',
        '${JSON.stringify(data.ubicacion)}',
        '${data.imagen}',
        '${data.id_usuario}',
        '${data.id_irs_operador_celular}',
        '${data.id_irs_estado_red_celular}',
        '${date.substring(0, 10)}T${date.substring(11, 19)}',
        '${data.ip}'
    )`;

    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: "Ocurrió un error al guardar la encuesta."
            });
        } else {
            res.json(result);
        }
    });
});

/*************************************************************************************
 * Fin de servicios para el inventario de redes secas
 *************************************************************************************/

//Llamado de encuesta social 
app.route('/encuesta-social')
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
    .put(function(req, res) {
        res.send('Update the encuesta social');
    });

//Llamado de SEC_Establecimiento_Comercial
app.route('/establecimiento-comercial')
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
app.route('/comercio-informal')
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