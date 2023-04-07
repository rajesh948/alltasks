const express = require("express");
const mysql = require("mysql2");
const app = express();
const bodyparser = require("body-parser");

app.set("view engine","ejs");
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({extended:false}));
const con = mysql.createConnection ({
    host:"localhost",
    user:"root",
    password:"root",
    database:"collageDB"
});

con.connect((err)=>{
    if(err) throw err;
    console.log("success");
})

app.get("/showform",(req,res)=>{
    res.render("demo.ejs");
});

app.post("/saveData",(req,res)=>{
var studentData = req.body;
console.log(studentData);
con.query(`insert into StudentData(firstname,lastname,email,collage,city) value(${studentData.firstname},${studentData.lastname},${studentData.email},${studentData.collage},${studentData.city})`,(err,data)=>{
    res.json(data);
})

})

app.listen(7676);