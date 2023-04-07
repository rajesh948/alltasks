const express = require('express');
const mysql = require('mysql2');
const app = express();

app.set('view engine', 'ejs');

//Database Connection

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'studentDB'
});

con.connect((err) => {
    if (err) { console.log(err); }
    console.log("success connection");

});


app.get('/index', (req, res) => {

    const arr = ["ram", "rajesh", "sumit", "kailash", "prachi", "sahil"];
    res.render('index', { us: arr });
});

//One Table Display API

app.get('/table', (req, res) => {
    con.query(`select * from student_express limit 0,10`, (err, result) => {
        if (err) {
            console.log(err);
        } else {

            res.render('table', { result });
        }
    });

});


//More that 10 record display 

app.get('/alltable', (req, res) => {
    con.query(`select * from student_express limit 0,100`, (err, result) => {
        if (err) {
            console.log(err);
        } else {

            res.render('alltable', { result });
        }
    });

});


// /:page --> req.params.page
// /page?no=4 --> req.query.no
//pagination API

app.get('/page', (req, res) => {
    var key = parseInt(req.query.no) || 1;
    var limit =100;
    // console.log(key);
    if(key >=16){
        key=16;
    }
    con.query(`select * from student_express limit ${((100 * key) - 100)},${limit}`, (err, result) => {
        if (err) throw err;
        con.query(`select count(student_id) as total from student_express `, (err, result2) => {

            console.log(result2);

            if (err) throw err;
            res.render('pages', { result,key,total:Math.ceil(parseInt(result2[0].total)/limit) });

            // console.log(Math.floor(parseInt(result2[0].total)/limit));
        });
    });
});


//more than 1 database table data getting

app.get('/differenttable', (req, res) => {

    var record = [];
    con.query(`select * from student_express limit 0,10`, (err, data1) => {
        if (err) throw err;
        con.query(`select * from student_express limit 10,10`, (err, data2) => {
            if (err) throw err;
            con.query(`select * from student_express limit 20,10`, (err, data3) => {
                if (err) throw err;
                con.query(`select * from student_express limit 30,10`, (err, data4) => {
                    if (err) throw err;
                    con.query(`select * from student_express limit 40,10`, (err, data5) => {
                        if (err) throw err;
                        con.query(`select * from student_express limit 50,10`, (err, data6) => {
                            if (err) throw err;
                            con.query(`select * from student_express limit 60,10`, (err, data7) => {
                                if (err) throw err;
                                con.query(`select * from student_express limit 70,10`, (err, data8) => {
                                    if (err) throw err;
                                    con.query(`select * from student_express limit 80,10`, (err, data9) => {
                                        if (err) throw err;
                                        con.query(`select * from student_express limit 90,10`, (err, data10) => {
                                            if (err) throw err;
                                            record = record.concat(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10);
                                            res.render('differenttable.ejs', { data: record });
                                            console.log(record);
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    });

});



app.listen(5000);