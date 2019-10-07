const express = require('express');
const app = express();
const PORT = 3000;
var mysql = require('mysql');
var bodyParser = require('body-parser')


//Parámetros de la conexión a la base de datos
var db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "hidrico",
    port: 3306,
});

//Parse /Json
app.use(bodyParser.urlencoded({ extended: false }))

app.use(bodyParser.json())

//Realizar la conexión a la base de datos
db.connect(function (err) {
    if (err)
        throw err;
    else
        console.log(`Base de datos conectada!`);
});


app.get('/', function (req, res) {
    console.log('Página de Inicio ');

    res.send("Bienvenidos al servidor de <strong> TuMap </strong>")
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



//Llamado de puerto
app.listen(3000, function () {
    console.log(`Server running at port ${PORT}`);
});