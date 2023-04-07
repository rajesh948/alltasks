const express = require('express');
const mysql = require('mysql2');
const app = express();

app.use(express.json());

//Database Connection

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'studentDB'
});

con.connect((err) => {
    if (err) { console.log(err); }else{
    console.log("success connection");}

});

app.post("/student/add",(req,res)=>{
    const data = req.body;
    console.log(data);
    var querystring = `insert into student_express (firstname,lastname,contact,email,collage,city) values`;
   
   let waiting = new Promise((resolve,reject)=>{
 for(let i=0;i<data.length;i++){
        querystring +=data;
     }
   });

   waiting.then(()=>{
   con.query(querystring,(err, result) => {
        if (err) {
            console.log(err);
        }else{
            res.send("Successfully Inserted");
        console.log("successfully insert");
        }
    });});

}).listen(4000);