const express = require('express');
const mysql = require('mysql2');
const app = express();
const ejs = require('ejs');

app.set('view engine','ejs');

const con = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'root',
    database:'job_application_db'
});

con.connect((err)=>{
    if(err) throw err;
    console.log("connected !!");
});

app.get('/demo',async (req,res)=>{

var tname = req.query.tname || 'candidate_master';
  
    var table = await generateTable(tname);
    res.render('demo.ejs',{tablequery: table});
    
   console.log(generateTable('candidate_master'));
});
   

generateTable('candidate_master');

////TableGenerator
async function generateTable(tablename){

var query = `SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '${tablename}';`;
 var columnName = await getdata(query);

 console.log(columnName);

 var query1 = `SELECT * from ${tablename};`;
 var data = await getdata(query1);

var tableQuery = '';
tableQuery +=`<fieldset><legend>${tablename}</legend><table><tr>`;
for(let i=0;i<columnName.length;i++){
tableQuery+=`<td>${columnName[i].COLUMN_NAME}</td>`
}
tableQuery+='</tr>';


for(let i=0;i<data.length;i++){

    tableQuery+="<tr>";

for(let j=0;j<columnName.length;j++){
    tableQuery+=`<td>${data[i][columnName[j].COLUMN_NAME]}</td> `;
}
tableQuery+="</tr>";
}

tableQuery+='</table></fieldset>';

return tableQuery;
}

var getdata = (query)=>{
    return new Promise((resolve,reject)=>{
        con.query(query,(err,result)=>{
            if(err) throw err;
            resolve(result);
        });
    });
}

app.listen(7080);