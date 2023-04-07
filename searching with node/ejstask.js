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
   var firstname = req.query.firstname || '';
   var lastname = req.query.lastname || '';
   var contact = req.query.contact || '';
   var email = req.query.email || '';
   var collage = req.query.collage || '';
   var city = req.query.city || '';
   var stringsearch = req.query.string || '';
   const values = [];
   console.log('step 0: '+stringsearch);
   values.push(firstname,lastname,contact,email,collage,city);
   console.log('value :'+values);

   const colname = ['firstname','lastname','contact','email','collage','city'];
   var searchstring = 'where ';

   for(let i=0;i<colname.length;i++){
    if(values[i] != ''){
        searchstring += ` ${colname[i]} like '${values[i]}%' and `;
    }
   }
   console.log('step 1: '+searchstring);
   if(searchstring.endsWith('where ')){
    searchstring='';
   }
   searchstring =searchstring.slice(0,(searchstring.length-5));
   console.log('step 2: '+searchstring);

  

 

    con.query(`select * from student_express ${searchstring}`, (err, result) => {
        if (err) throw err;
       
            
            res.render('pages', { stringsearch,result});

           
  
    });
});




app.listen(5008);