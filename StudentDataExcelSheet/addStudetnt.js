const { render } = require('ejs');
const express = require('express');
const mysql = require('mysql2');
const app = express();
const util = require("util");
var bodyParser = require('body-parser');

app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));


//Database Connection

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'collageDB'
});

con.connect((err) => {
    if (err) { console.log(err); }
    console.log("success connection");

});

const sendQuery = util.promisify(con.query.bind(con));

app.get("/showtable",(req,res)=>{

    res.render("studentTable.ejs");
});

app.get("/addstudent",async (req,res)=>{
var studentRec = req.query.studentdata;
studentRecord = studentRec.split(",");
// console.log(studentRecord);
 await sendQuery(`insert into StudentData (firstname,lastname,email,collage,city) value('${studentRecord[0]}','${studentRecord[1]}','${studentRecord[2]}','${studentRecord[3]}','${studentRecord[4]}')`);
 res.json({});
});



app.get("/getstudent",async (req,res)=>{
    var studentdata =await sendQuery('select * from StudentData');
res.send(studentdata);
});

app.get("/updatestudent",async (req,res)=>{
    var studentRec = req.query.studentdata;
    studentRecord = studentRec.split(",");
    // console.log(studentRecord);
     await sendQuery(`UPDATE StudentData SET firstname='${studentRecord[0]}',lastname='${studentRecord[1]}',email='${studentRecord[2]}',collage='${studentRecord[3]}',city='${studentRecord[4]}' where id = '${studentRecord[5]}'` );
    res.json({});
    });


app.listen(7878);
