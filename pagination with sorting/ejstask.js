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



// /:page --> req.params.page
// /page?no=4 --> req.query.no
//pagination API

app.get('/page', (req, res) => {
    var key = parseInt(req.query.no) || 1;
    var sort = req.query.sort || 'student_id';
    var order = req.query.order || 'asc';

    var limit =100;
    if(key >=16){
        key=16;
    }
    con.query(`select * from student_express order by ${sort} ${order} limit ${((100 * key) - 100)},${limit}`, (err, result) => {
        if (err) throw err;
        con.query(`select count(student_id) as total from student_express `, (err, result2) => {

            if (err) throw err;
            
            res.render('pages', { result,key,total:Math.ceil(parseInt(result2[0].total)/limit),sort,order});

           
        });
    });
});




app.listen(5000);