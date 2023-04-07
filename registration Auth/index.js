const express = require("express");
const mysql = require("mysql2");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const cookieparser = require("cookie-parser");
const app = express();
const bodyparser = require("body-parser");
const util = require('util');

app.use(express.static("public"));


app.set("view engine","ejs");
app.use(cookieparser());
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({extended:false}));
const con = mysql.createConnection ({
    host:"localhost",
    user:"root",
    password:"root",
    database:"registration"
});

con.connect((err)=>{
    if(err) throw err;
    console.log("success");
})


const sendquery = util.promisify(con.query.bind(con));

app.get("/registration",(req,res)=>{

    let getcookie = req.cookies;
    console.log("getcookie",getcookie);
    
    if(!getcookie.cookie){
        res.render("registration.ejs");
    }else{
        res.redirect("/home");
    }
  
});

app.get("/checkmail",async (req,res)=>{
    let email = req.query.email ;
    let check_email =await sendquery(`select * from registration where email = "${email}"`);
    console.log(check_email);
if(check_email != ""){

    res.send({is:true});
}else{
    res.send({is:false});
}
});



app.post("/register",async (req,res)=>{
    console.log(req.body);
    var studentData = req.body;
    let check_email =await sendquery(`select id from registration where email = "${req.body.email}"`);
    console.log("Check Email ::::::::::::::",check_email);
    let Encpassword = await bcryptjs.hash(studentData.password,10);
   console.log(Encpassword);
let insertquery = await sendquery(`insert into registration(name,email,password,isActive) values('${studentData.name}','${studentData.email}','${Encpassword}','0')`);
console.log(insertquery);
// res.send(`<h2>Thank You For Registration</h2><br><a href='/activate?id=${insertquery.insertId}'>Active Account</a>`);
res.render("active.ejs",{id:insertquery.insertId,message:"Thank You For Registration"});
});

app.get("/activate",async (req,res)=>{
    let id= req.query.id ;
    if(id){

        await sendquery(`Update registration set isActive = "1" where id = ${id}`);
        res.redirect("/login");
    }else{
        res.redirect("/registration");
    }
})

app.get("/login",(req,res)=>{
    let getcookie = req.cookies;
    console.log("getcookie",getcookie);
    
    if(!getcookie.cookie){
        res.render("login.ejs",{errorMessage:"",password:"",email:""});
    }else{
        res.redirect("/home");
    }

});

app.post("/login", async (req,res)=>{
var email = req.body.email;
var password = req.body.password;
// console.log(req.body);
var checkemail = await sendquery(`select * from registration where email = '${req.body.email}'`);

console.log("checkmail::::::::::;",checkemail);
// console.log(checkemail[0].isActive);


if(checkemail == ""){
    
   return res.render("login.ejs",{errorMessage:"invalid password Or Email",password,email});
}

 let checkpass = await bcryptjs.compare(req.body.password,checkemail[0].password);
console.log("checkpass ::::::::",checkpass);
 if(checkpass){
    if(!checkemail[0].isActive){
       return res.render("active.ejs",{id:checkemail[0].id,message:"First Active Your Account"});
        // return res.send(`<h2>First Active Your Account</h2><br><a href='/activate?id=${checkemail[0].id}'>Active Account</a>`);
    }
  let token=   jwt.sign(checkemail[0],"rajeshparmar");
  console.log("token  :::",token);
res.cookie("cookie",token);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  res.redirect("/home");
 }else{
   return res.render("login.ejs",{errorMessage:"invalid password Or Email",password,email});
 }

});

app.get("/home",(req,res)=>{
let getcookie = req.cookies;
console.log("getcookie",getcookie);

if(!getcookie.cookie){
    return res.redirect("/registration");
}
let checktoken = jwt.verify(getcookie.cookie,"rajeshparmar");
console.log("checktoken",checktoken);
    res.render("index.ejs",{name:checktoken.name});
});

app.get("/logout",(req,res)=>{
    res.clearCookie("cookie");
    res.redirect("/registration");

})


app.listen(7676);