const express = require('express');
const mysql = require('mysql2');
const app = express();

app.use(express.json());


const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'studentDB'
});

con.connect((err) => {
    if (err) { console.log(err); } else {
        console.log("success connection");
    }

});



console.log();

app.post("/student/add", (req, res) => {

    const firstname = ["rajesh", "ravi", "rakesh", "chintan", "nisharg", "sanjay", "ramesh", "manoj", "rutik", "anjali", "aruna", "kavya", "drasti", "raghav", "savera", "shubham", "arjun", "sagar", "suraj", "shani", "prachi", "seerat", "abhay", "sham", "seema", "kavita", "sunakshi", "reema", "aditi", "seerat", "sagar", "rocky", "raj", "meet", "keval", "disha", "poonam", "darshan", "kishan", "rutvi", "krishna", "mital", "rushi", "khushi", "meera", "ram", "vivek", "vijay", "samir", "tushar", "sheeta", "geeta", "sumit", "shital", "shangita", "ajay", "arvind"];
    const lastname = ["khan", "grover", "shah", "gupta", "bhatt", "kohli", "rajput", "bhan", "sojitra", "gor", "rathod", "patel", "chavda", "parmar", "dabhi", "kansagara", "dave", "yadav", "kadival", "makheja"];
    const city = ["rajkot", "morbi", "surat", "j&k", "bhavnagar", "banaskatha", "bhuj", "tankara", "mumbai", "delhi", "vadorad", "kathua", "lakhnav", "chennai", "pune", "bengalor", "telangan", "kolkata"];
    const collage = ["GEC", "Marwadi University", "silver oak", "stanford", "lj", "brown", "parul", "baylor", "banaras", "GEC bhavnagar", "GEC rajkot", "GEC modasa", "MSU", "LDCE", "LE collage", "darshan", "SGGU", "HNGU", "saurashtra", "BKNM", "viswakarma", "GEC ahmdabad", "GAC", "UID", "GTU", "nabajyoti", "synergem power plant institute", "BIT", "MGM", "JNTUK", "kongunadu", "sitaram harijan"];
    const year = [1999,1998,1997,2001,2000,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,1996];
    const month = [1,2,3,4,5,6,7,8,9,10,11,12];
    const day = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29];

    for (let i = 0; i < 1500; i++) {

        var firstRandom = firstname[Math.floor(Math.random() * firstname.length)];
        var lastRandom = lastname[Math.floor(Math.random() * lastname.length)];
        var collageRandom = collage[Math.floor(Math.random() * collage.length)];
        var email = `${firstRandom}${lastRandom}${100 + Math.floor(Math.random() * 100)}@gmail.com`;
        var contact = Math.floor(9000000000 + Math.floor(Math.random() * 999999999));
        var cityrandom = city[Math.floor(Math.random() * city.length)];
        var dob = year[Math.floor(Math.random() * year.length)]+ "/" + month[Math.floor(Math.random() * month.length)]+ "/" + day[Math.floor(Math.random() * day.length)];
        
        

        var querystring = `insert into student_express (firstname,lastname,dob,contact,email,collage,city) value ("${firstRandom}","${lastRandom}","${dob}","${contact}","${email}","${collageRandom}","${cityrandom}");`;

        con.query(querystring, (err, result) => {
            if (err) {
                console.log(err);
            } else {
                console.log("successfully insert");
            }
        });

    }




}).listen(8080);