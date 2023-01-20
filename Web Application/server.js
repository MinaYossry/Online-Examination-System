const sql = require('mssql');
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

const path = require('path');
let St_ID;
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.use(bodyParser.json());

const config = {
    user: 'sa',
    password: '123456789',
    server: 'localhost',
    database: 'online_Exame',
    options: {
        encrypt: true
    },
    trustServerCertificate: true
}

app.post('/api/student/login', (req, res) => {
    const St_Email = req.body.email;
    const password = req.body.password;
    sql.connect(config, err => {
        if (err) console.log(err);
        const request = new sql.Request();
        request.input('St_Email', sql.NVarChar, St_Email);
        request.input('password', sql.NVarChar, password);
        request.execute('usp_student_login', (err, result) => {
            if (err) console.log(err);
            if (result.recordset.length > 0) {
                St_ID = result.recordset[0].St_ID;
                const request2 = new sql.Request();
                request2.input('St_ID', sql.Int, St_ID);
                request2.execute('usp_get_courses_without_grade', (err, result) => {
                    if (err) console.log(err);

                    res.json(result.recordset);
                });
            } else {
                res.json({ error: "user not found" })
            }
        });
    });
});

app.post('/generate_exam', function (req, res) {
    var request = new sql.Request();
    request.input('Crs_ID', sql.Int, req.body.Crs_ID);
    request.input('num_mcq', sql.Int, req.body.num_mcq);
    request.input('num_tf', sql.Int, req.body.num_tf);
    request.execute('generate_exam', function (err, recordsets, returnValue) {
        if (err) {
            console.log(err);
            res.status(500).send(err);
        } else {
            res.json({ exam_id: recordsets.recordset[0].exam_ID });
        }
    });
});

app.post('/exam', function (req, res) {
    var request = new sql.Request();
    request.input('Ex_ID', sql.Int, req.body.Ex_ID);
    request.execute('get_exam_questions_with_choices', function (err, recordsets, returnValue) {
        if (err) {
            console.log(err);
            res.status(500).send(err);
        } else {
            res.json(recordsets.recordset);
        }
    });
});


app.post("/exam_answers", async (req, res) => {
    // Get the parameters from the request body
    const exam_ID = req.body.exam_ID;
    const answers = req.body.answers;

    try {
        // Connect to the SQL server
        await sql.connect(config);

        // Create a new request
        answers.forEach(async answer => {
            const request = new sql.Request();

            // Add the parameters to the request
            request.input("exam_ID", sql.Int, exam_ID);
            request.input("st_ID", sql.Int, St_ID);
            request.input("q_ID", sql.Int, answer.Q_ID);
            request.input("answer", sql.NVarChar, answer.St_Answer);

            await request.execute('exam_answer');
        });

        const request = new sql.Request();

        // Add the parameters to the request
        request.input("Ex_ID", sql.Int, exam_ID);
        request.input("st_ID", sql.Int, St_ID);

        await request.execute('exam_correction');

        const request1 = new sql.Request();
        request1.input("id", sql.Int, St_ID);
        const result = await request1.execute('get_student_grades');
        res.json(result.recordset);
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});

app.get('/signout', (req, res) => {
    // Clear session or cookies here
    St_ID = null;

    // Redirect to index page
    res.redirect('/');
});

app.post("/see_grades", async (req, res) => {
    try {
        // Connect to the SQL server
        await sql.connect(config);

        const request = new sql.Request();
        request.input("id", sql.Int, St_ID);
        const result = await request.execute('get_student_grades');
        res.json(result.recordset);
    } catch (err) {
        console.log(err);
        res.status(500).send(err);
    }
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port ${port}...`));
