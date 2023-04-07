const express = require('express');
const mysql = require('mysql2');
const { isNull } = require('util');
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
   var stringsearch = req.query.stringsearch || '';
   var stringsearch2 = req.query.str || '';
   var option = req.query.option || 'or';
   console.log('option : '+option);
console.log("1 stringsearch ::",stringsearch);
   stringsearch = stringsearch.trim();
   console.log("2 stringsearch ::",stringsearch);
   const values = stringsearch.split(" "); 

   var stringjoint = values.join(`" ${option} `);
   console.log("3 stringsearch ::",stringjoint);
 stringjoint = " where " +stringjoint + '"';
 console.log("4 stringsearch ::",stringjoint);
// stringjoint = stringjoint.replace(/=/g,'="');

if(stringsearch == ''){
    stringjoint='';
}


    con.query(`select * from student_express ${stringjoint} limit ${((10 * key) - 10)},10`, (err, result) => {
        if (err) throw err;
        con.query(`select count(student_id) as total from student_express ${stringjoint} `, (err, result2) => {

            if (err) throw err;
            res.render('pages', { option,stringsearch,stringsearch2,result,key,total:Math.ceil(parseInt(result2[0].total)/10)})   
        
           
        });
              
  
    });
});




app.listen(5005);