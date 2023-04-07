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
    if (err) { console.log(err); }
    console.log("success connection");

});

//Retrive Record

app.get(`/student/get`, (req, res) => {
    con.query(`select * from studentMaster`, (err, result) => {
        if (err) {
            console.log(err);
        }else{
        res.send(result);
        
        }
    });
});


//ADD Record

app.post('/student/add', (req, res) => {
    const arr = req.body;
    console.log(arr.sFirstName);
    con.query(`insert into studentMaster(sFirstName,sLastName,sContact,sEmail,sCollage,sCity) 
          value("${arr.sFirstName}","${arr.sLastName}","${arr.sContact}","${arr.sEmail}","${arr.sCollage}","${arr.sCity}")`,
           (err, result) => {
        if (err) {
            console.log(err);
        }else{
            res.send("Successfully Inserted")
        console.log("successfully insert");
        }
    });

});


//Update Record

app.put('/student/update', (req, res) => {
    const arr = req.body;
    console.log(arr.sFirstName);
    con.query(`update studentMaster set sFirstName = "${arr.sFirstName}",sLastName = "${arr.sLastName}",
    sContact = "${arr.sContact}",sEmail = "${arr.sEmail}",sCollage = "${arr.sCollage}",sCity = "${arr.sCity}" 
    where student_id = ${arr.student_id}`, (err, result) => {
        if (err) {
            console.log(err);
        }else{
            res.send("Successfully Updated");
        console.log("Successfully updated");
        }
    });

});

//Delete Record

app.delete('/student/delete', (req, res) => {
    const arr = req.body;
    console.log(arr.student_id);
    con.query(`delete from studentMaster where student_id = ${arr.student_id}`, (err, result) => {
        if (err) {
            console.log(err);
        }else{
            res.send("Successfully Delete");
        console.log("Successfully Delete");
        }
    });

});

app.listen(4500);