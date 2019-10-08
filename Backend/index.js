const express = require('express');
const app = express();
const PORT = 3000;
const mysql = require('mysql');
const bodyParser = require('body-parser');

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
    user: "root",
    password: "12345",
    database: "tumap",
    port: 3306,
    multipleStatements: true
});

//Realizar la conexión a la base de datos
db.connect(function(error) {
    if (error)
        console.log(error);
    else
        console.log(`Base de datos conectada!`);
});

app.get('/', function(req, res) {
    console.log('Página de Inicio ');
    res.send("Bienvenidos al servidor <strong> TuMap </strong>")
});

//Manejo de Rutas Select users
app.route('/users')
    .get((req, res) => {
        console.log('Consultar datos ');
        var query = db.query('select * from users', (error, result) => {
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

//Manejo de Rutas Select users por id
app.route('/users/:id')
    .get((req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM users WHERE id_User='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })

//Agregar Usuarios
app.route('/users')
    .post((req, res) => {
        const dato = {
            name: req.body.name,
            lastname: req.body.lastname,
            identification_card: req.body.identification_card,
            email: req.body.email,
            Rol_idRol: req.body.Rol_idRol,
        };

        const sql = `INSERT INTO users SET name='${dato.name}', lastname='${dato.lastname}', identification_card='${dato.identification_card}', email='${dato.email}', Rol_idRol='${dato.Rol_idRol}'`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Actualizar Usuarios
app.route('/users/:id')
    .put((req, res) => {
        const id = req.params.id;
        const dato = {
            name: req.body.name,
            lastname: req.body.lastname,
            identification_card: req.body.identification_card,
            email: req.body.email,
            Rol_idRol: req.body.Rol_idRol,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE users SET ${sets.join(', ')} WHERE id_User='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Eliminar Usuarios
app.route('/users/:id')
    .delete((req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM users WHERE id_User='${id}';`;
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
    })


// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

//Manejo de Rutas Select coverages // Coverturas
app.route('/coverages')
    .get((req, res) => {
        console.log('Consultar datos');
        var query = db.query('select * from coverages', (error, result) => {
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

//Manejo de Rutas Select coverages por id
app.route('/coverages/:id')
    .get((req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM coverages WHERE id_Coverage='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })

//Agregar coverages
app.route('/coverages')
    .post((req, res) => {
        const dato = {
            color: req.body.color,
            other_color: req.body.other_color,
            pressure: req.body.pressure,
            type: req.body.type,
            Users_id_User: req.body.Users_id_User,
        };

        const sql = `INSERT INTO coverages SET color='${dato.color}', other_color='${dato.other_color}', 
        pressure='${dato.pressure}', type='${dato.type}', Users_id_User='${dato.Users_id_User}'`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Actualizar coverages
app.route('/coverages/:id')
    .put((req, res) => {
        const id = req.params.id;
        const dato = {
            color: req.body.color,
            other_color: req.body.other_color,
            pressure: req.body.pressure,
            type: req.body.type,
            Users_id_User: req.body.Users_id_User,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE coverages SET ${sets.join(', ')} WHERE id_Coverage='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Eliminar coverages
app.route('/coverages/:id')
    .delete((req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM coverages WHERE id_Coverage='${id}';`;
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
    })

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

//Manejo de Rutas Select without_coverage // Coverturas
app.route('/without_coverage')
    .get((req, res) => {
        console.log('Consultar datos');
        var query = db.query('select * from without_coverage', (error, result) => {
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

//Manejo de Rutas Select without_coverage por id
app.route('/without_coverage/:id')
    .get((req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM without_coverage WHERE id_Without_coverage='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })

//Agregar without_coverage
app.route('/without_coverage')
    .post((req, res) => {
        const dato = {
            state: req.body.state,
            Users_id_User: req.body.Users_id_User,
        };

        const sql = `INSERT INTO without_coverage SET state='${dato.state}', Users_id_User='${dato.Users_id_User}   '`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Actualizar without_coverage
app.route('/without_coverage/:id')
    .put((req, res) => {
        const id = req.params.id;
        const dato = {
            state: req.body.state,
            Users_id_User: req.body.Users_id_User,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE without_coverage SET ${sets.join(', ')} WHERE id_Without_coverage='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Eliminar without_coverage
app.route('/without_coverage/:id')
    .delete((req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM without_coverage WHERE id_Without_coverage='${id}';`;
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
    })


// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

//Manejo de Rutas Select grown // Crecidas
app.route('/grown')
    .get((req, res) => {
        console.log('Consultar datos');
        var query = db.query('select * from grown', (error, result) => {
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

//Manejo de Rutas Select grown por id
app.route('/grown/:id')
    .get((req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM grown WHERE id_Grown='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })

//Agregar grown
app.route('/grown')
    .post((req, res) => {
        const dato = {
            level: req.body.level,
            Users_id_User: req.body.Users_id_User,
        };

        const sql = `INSERT INTO grown SET level='${dato.level}', Users_id_User='${dato.Users_id_User}'`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Actualizar grown
app.route('/grown/:id')
    .put((req, res) => {
        const id = req.params.id;
        const dato = {
            level: req.body.level,
            Users_id_User: req.body.Users_id_User,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE grown SET ${sets.join(', ')} WHERE id_Grown='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Eliminar grown
app.route('/grown/:id')
    .delete((req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM grown WHERE id_Grown='${id}';`;
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
    })

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

//Manejo de Rutas Select connections // Conexiones
app.route('/connections')
    .get((req, res) => {
        console.log('Consultar datos');
        var query = db.query('select * from connections', (error, result) => {
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

//Manejo de Rutas Select connections por id
app.route('/connections/:id')
    .get((req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM connections WHERE id_Connections='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })

//Agregar grown
app.route('/connections')
    .post((req, res) => {
        const dato = {
            description: req.body.description,
            image: req.body.image,
            Users_id_User: req.body.Users_id_User,
        };

        const sql = `INSERT INTO connections SET description='${dato.description}', image='${dato.image}', Users_id_User='${dato.Users_id_User}'`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Actualizar connections
app.route('/connections/:id')
    .put((req, res) => {
        const id = req.params.id;
        const dato = {
            description: req.body.description,
            image: req.body.image,
            Users_id_User: req.body.Users_id_User,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE connections SET ${sets.join(', ')} WHERE id_Connections='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Eliminar connections
app.route('/connections/:id')
    .delete((req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM connections WHERE id_Connections='${id}';`;
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
    })

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

//Manejo de Rutas Select ethnobotany // Conexiones
app.route('/ethnobotany')
    .get((req, res) => {
        console.log('Consultar datos');
        var query = db.query('select * from ethnobotany', (error, result) => {
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

//Manejo de Rutas Select ethnobotany por id
app.route('/ethnobotany/:id')
    .get((req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM ethnobotany WHERE id_Ethnobotany='${id}';`;
        const query = db.query(sql, (error, result) => {
            try {
                if (error) {
                    throw error;
                } else {
                    console.log(result);
                    const [data] = result;
                    res.json(result)
                }
            } catch (error) {
                res.json({ error: error.message })
            }
        });
    })

//Agregar ethnobotany
app.route('/ethnobotany')
    .post((req, res) => {
        const dato = {
            common_name: req.body.common_name,
            image: req.body.image,
            use: req.body.use,
            users_id_User: req.body.users_id_User,
        };

        const sql = `INSERT INTO ethnobotany SET common_name='${dato.common_name}', image='${dato.image}', use='${dato.use}', users_id_User='${dato.users_id_User}'`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Actualizar ethnobotany
app.route('/ethnobotany/:id')
    .put((req, res) => {
        const id = req.params.id;
        const dato = {
            common_name: req.body.common_name,
            image: req.body.image,
            use: req.body.use,
            users_id_User: req.body.users_id_User,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE ethnobotany SET ${sets.join(', ')} WHERE id_Ethnobotany='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })

//Eliminar ethnobotany
app.route('/ethnobotany/:id')
    .delete((req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM ethnobotany WHERE id_Ethnobotany='${id}';`;
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
    })


/********************************************************************** 
 * Servicios para levantamiento infromación predial
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

app.use(router);
/********************************************************************** 
 * FIN Servicios para levantamiento infromación predial
 ***********************************************************************/

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

/***********************************************************
 * Servicio para la consulta de inventario de uso de Suelos*
 **********************************************************/

app.route('/suelos')
    .get((req, res) => {
        const sql = `SELECT r.ID, NOMBRE_PROPIETARIO, NOMBRE_PREDIO, AREA, DIRECCION, 
        asText(p.PREDIO) as PREDIO, asText(u.POLIGONO) as POLIGONOS, DESCRIPCION FROM IM_registros r, IM_predio p, 
        IM_tipo_usos t, IM_usos_predio u WHERE r.ID = p.ID_REGISTROS AND u.ID_PREDIO = p.ID AND u.ID_TIPO_USOS = t.ID`;
        db.query(sql, (error, result) => {
            if (error) {
                res.json({
                    error: true,
                    message: error.message
                });
            } else {
                res.json(result);
            }
        });
    })
    .post((req, res) => {
        let data = req.body;
        const sql = `INSERT INTO IM_REGISTROS (NOMBRE_PROPIETARIO, NOMBRE_PREDIO, AREA, DIRECCION)
        VALUES('${data.nombrePropietario}', '${data.nombrePredio}','${data.area}','${data.direccion}')`;
        db.query(sql, (error, result) => {
            if (error) {
                res.json({
                    error: true,
                    message: error.message
                })
            } else {
                res.json(result);
            }
        })
    });
// POST Para agregar Polígono principal 

app.post('/predio/:id', (req, res) => {
    let polygon = (req.body.polygon);
    let sql = `SET @g = 'POLYGON(${polygon})';`;
    sql += `INSERT INTO IM_PREDIO (PREDIO,ID_REGISTROS) VALUES( ST_PolygonFromText(@g),${req.params.id});`;
    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: error.message
            });
        } else {
            res.json(result);
        }
    })
});
// POST Para agregar subpolígonos 
app.post('/usosuelos/:id', (req, res) => {
    let data = (req.body);
    let sql = `SET @g = 'POLYGON(${data.polygon})';`;
    sql += `INSERT INTO IM_USOS_PREDIO (POLIGONO, ID_PREDIO, ID_TIPO_USOS) VALUES( ST_PolygonFromText(@g),${req.params.id}, ${data.idTipoUso});`;
    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: error.message
            });
        } else {
            res.json(result);
        }
    })
});

// POST Para consultar el tipo de uso de suelos

app.get('/tipousosuelos', (req, res) => {
    let data = (req.body);
    let sql = `SELECT * FROM IM_TIPO_USOS`;
    db.query(sql, (error, result) => {
        if (error) {
            res.json({
                error: true,
                message: error.message
            });
        } else {
            res.json(result);
        }
    })
});
/***************************************************
 * Fin de servicios para el inventario de suelos   *
 **************************************************/
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

//**************************************************************************
// * SERVICIOS PARA SENALIZACION | MOBILIARIO URBANO 
//**************************************************************************

/* MANEJADOR DE RUTA CATEGORIA DEL ITEM */
app.route('/categoria')
    .get(function(req, res) {
        console.log('Página de Validar Información ');
        var query = db.query('select * from jyd_categoria', function(error, result) {
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

/* MANEJADOR DE RUTA ITEMS SENALIZACION */
app.route('/item_senalizacion')
    .get(function(req, res) {
        console.log('Página de Validar Información ');
        var query = db.query('select * from jyd_item where fk_categoria=1', function(error, result) {
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

/* MANEJADOR DE RUTA ITEMS MOBILIARIO URBANO */
app.route('/item_mobiliario')
    .get(function(req, res) {
        console.log('Página de Validar Información ');
        var query = db.query('select * from jyd_item where fk_categoria=2', function(error, result) {
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

/* MANEJADOR DE RUTA ESTADO DE REGISTRO DEL ITEM */
app.route('/estado')
    .get(function(req, res) {
        console.log('Página de Validar Información ');
        var query = db.query('select * from jyd_estado', function(error, result) {
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

/* MANEJADOR DE RUTA REGISTRO DEL ITEM */
app.route('/registro')
    .get(function(req, res) {
        console.log('Página de Validar Información ');
        var query = db.query('select i.nombre, a.latitud, a.longitud, e.descripcion estado, a.descripcion descripcion from jyd_registro r, jyd_registro_has_item a, jyd_item i, jyd_estado e where pk_id_registro=fk_id_registro and pk_id_estado=fk_estado and pk_id_item=fk_id_item', function(error, result) {
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
/*************************************************************
 * FIN DE SERVICIOS PARA SENALIZACION | MOBILIARIO URBANO    *
 ************************************************************/

/***************************************************
 * Comienzo de servicios para vias   *
 **************************************************/

// Manejador de ruta vias

router
    .get('/vias', (req, res) => {
        console.log('Consultar datos jf_descripcion_via');
        var query = db.query('select * from jf_descripcion_via', (error, result) => {
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
    .get('/vias/:id', (req, res) => {
        const id = req.params.id;
        const sql = `SELECT * FROM jf_descripcion_via WHERE id='${id}';`;
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
    .post('/vias', (req, res) => {
        const dato = req.body

        const sql = `INSERT INTO jf_descripcion_via (ubicacion, nombre_via, detalle, imagen, estado)
            values (${dato.ubicacion}, ${dato.nombre_via}, ${dato.detalle}, ${dato.imagen}, ${dato.estado})`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/vias/:id', (req, res) => {

        const id = req.params.id;
        const dato = {
            ubicacion: req.body.ubicacion,
            nombre_via: req.body.nombre_via,
            detalle: req.body.detalle,
            imagen: req.body.imagen,
            estado: req.body.estado,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE jf_descripcion_via SET ${sets.join(', ')} WHERE id='${id}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/vias/:id', (req, res) => {
        const id = req.params.id;
        const sql = `DELETE FROM jf_descripcion_via WHERE id='${id}';`;
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
app.use(router);

/***************************************************
 * Fin de servicios para vias   *
 **************************************************/

/***************************************************
 * Comienzo de servicios para Minas   *
 **************************************************/
// MP_EstadoActual_mina

router
    .get('/Minas/EstadoActual', (req, res) => {
        console.log('Consultar datos MP_EstadoActual_mina');
        var query = db.query('select * from MP_EstadoActual_mina', (error, result) => {
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
    .get('/Minas/EstadoActual/:id_estadomina', (req, res) => {
        const id_estadomina = req.params.id_estadomina;
        const sql = `SELECT * FROM MP_EstadoActual_mina WHERE id_estadomina='${id_estadomina}';`;
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
    .post('/Minas/EstadoActual', (req, res) => {
        const dato = req.body

        const sql = `INSERT INTO MP_EstadoActual_mina (nombre_estadomina)
        values (${dato.nombre_estadomina})`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('Minas/EstadoActual/:id_estadomina', (req, res) => {

        const id_estadomina = req.params.id_estadomina;
        const dato = {
            nombre: req.body.nombre_estadomina,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE MP_EstadoActual_mina SET ${sets.join(', ')} WHERE id_estadomina='${id_estadomina}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('Minas/EstadoActual/:id_estadomina', (req, res) => {
        const id_estadomina = req.params.id_estadomina;
        const sql = `DELETE FROM MP_EstadoActual_mina WHERE id_estadomina='${id_estadomina}';`;
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

// MP_tipo_material 

router
    .get('/Minas/TipoMaterial', (req, res) => {
        console.log('Consultar datos MP_tipo_material');
        var query = db.query('select * from MP_tipo_material', (error, result) => {
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
    .get('/Minas/TipoMaterial/:id_tipomaterial', (req, res) => {
        const id_tipomaterial = req.params.id_tipomaterial;
        const sql = `SELECT * FROM MP_tipo_material WHERE id_tipomaterial='${id_tipomaterial}';`;
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
    .post('/Minas/TipoMaterial', (req, res) => {
        const dato = req.body

        const sql = `INSERT INTO MP_tipo_material (nombre_tipomaterial)
        values (${dato.nombre_tipomaterial})`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/Minas/TipoMaterial/:id_tipomaterial', (req, res) => {

        const id_tipomaterial = req.params.id_tipomaterial;
        const dato = {
            nombre_tipomaterial: req.body.nombre_tipomaterial,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE MP_tipo_material SET ${sets.join(', ')} WHERE id_tipomaterial='${id_tipomaterial}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/Minas/TipoMaterial/:id_tipomaterial', (req, res) => {
        const id_tipomaterial = req.params.id_tipomaterial;
        const sql = `DELETE FROM MP_tipo_material WHERE id_tipomaterial='${id_tipomaterial}';`;
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

//MP_Sistema_Explotacion

router
    .get('/Minas/SistemaExplotacion', (req, res) => {
        console.log('Consultar datos MP_Sistema_Explotacion');
        var query = db.query('select * from MP_Sistema_Explotacion', (error, result) => {
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
    .get('/Minas/SistemaExplotacion:id_sistemaexplotacion', (req, res) => {
        const id_sistemaexplotacion = req.params.id_sistemaexplotacion;
        const sql = `SELECT * FROM MP_Sistema_Explotacion WHERE id_sistemaexplotacion='${id_sistemaexplotacion}';`;
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
    .post('/Minas/SistemaExplotacion', (req, res) => {
        const dato = req.body

        const sql = `INSERT INTO MP_Sistema_Explotacion (nombre_sistemaexplotacion)
        values (${dato.nombre_sistemaexplotacion})`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/Minas/SistemaExplotacion:id_sistemaexplotacion', (req, res) => {

        const id_sistemaexplotacion = req.params.id_sistemaexplotacion;
        const dato = {
            nombre_sistemaexplotacion: req.body.nombre_sistemaexplotacion,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE MP_Sistema_Explotacion SET ${sets.join(', ')} WHERE id_sistemaexplotacion='${id_sistemaexplotacion}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/Minas/SistemaExplotacion:id_sistemaexplotacion', (req, res) => {
        const id_sistemaexplotacion = req.params.id_sistemaexplotacion;
        const sql = `DELETE FROM MP_Sistema_Explotacion WHERE id_sistemaexplotacion='${id_sistemaexplotacion}';`;
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

//MP_Registro_Mina

router
    .get('/Minas/RegistroMina', (req, res) => {
        console.log('Consultar datos MP_Registro_Mina');
        var query = db.query('select * from MP_Registro_Mina', (error, result) => {
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
    .get('/Minas/RegistroMina/:id_registromina', (req, res) => {
        const id_registromina = req.params.id_registromina;
        const sql = `SELECT * FROM MP_Registro_Mina WHERE id_registromina='${id_registromina}';`;
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
    .post('/Minas/RegistroMina', (req, res) => {
        const dato = req.body

        const sql = `INSERT INTO MP_Registro_Mina (ubicacion, mineral, trabajadores, observacion, id_sistemaexplotacion, id_tipomaterial, id_estadomina)
            values (${dato.ubicacion}, ${dato.mineral}, ${dato.trabajadores}, ${dato.observacion}, ${dato.id_sistemaexplotacion}, ${dato.id_tipomaterial}, ${dato.id_estadomina})`;

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .put('/Minas/RegistroMina/:id_registromina', (req, res) => {

        const id_registromina = req.params.id_registromina;
        const dato = {
            ubicacion: req.body.ubicacion,
            mineral: req.body.mineral,
            trabajadores: req.body.trabajadores,
            observacion: req.body.observacion,
            id_sistemaexplotacion: req.body.id_sistemaexplotacion,
            id_tipomaterial: req.body.id_tipomaterial,
            id_estadomina: req.body.id_estadomina,
        };

        let sets = [];
        for (i in dato) {
            if (dato[i] || dato[i] == 0) {
                sets.push(`${i}='${dato[i]}'`);
            }
        }

        const sql = `UPDATE MP_Registro_Mina SET ${sets.join(', ')} WHERE id_registromina='${id_registromina}';`;

        console.log(sql);

        db.query(sql, (error, result) => {
            if (error) {
                res.json({ error: error })
            } else {
                res.json(result)
            }
        });
    })
    .delete('/Minas/RegistroMina/:id_registromina', (req, res) => {
        const id_registromina = req.params.id_registromina;
        const sql = `DELETE FROM MP_Registro_Mina WHERE id_registromina='${id_registromina}';`;
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
app.use(router);

/***************************************************
 * Fin servicio Minas   *
 **************************************************/

//Inicio de servidor NodeJS
app.listen(3000, function() {
    console.log(`Server running at port ${PORT}`);
});