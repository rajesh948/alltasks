
const express = require('express');
const mysql = require('mysql2');
const app = express();
const ejs = require('ejs');

app.set('view engine','ejs');

const con = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'root',
    database:'comboTask'
});

con.connect((err)=>{
    if(err) throw err;
    console.log("connected !!");
});



app.get('/combo',async (req,res)=>{

      
        var combo = await generateCombo('gender','radio');      
        var combo1 = await generateCombo('language','radio');      
        var combo2 = await generateCombo('subject','check');    
        var combo3 = await generateCombo('university','combo');
        var combo4 = await generateCombo('course','combo');
        var combo5 = await generateCombo('collage','combo');
        var combo6 = await generateCombo('department','check');
        var combo7 = await generateCombo('relationstatus','check');
        var combo8 = await generateCombo('location','check');
        var combo9 = await generateCombo('result','check');
        res.render('demo.ejs',{gender: combo,language:combo1,subject:combo2,university:combo3,course:combo4,collage:combo5,department:combo6,relation:combo7,location:combo8,result:combo9});

    });


///ComboGenerator
async function generateCombo(combo,element){

   var comboname =  combo;

var query2 = `select optionvalue,option_master.id from option_master join select_master on option_master.select_id = select_master.id where select_master.selectkey ='${comboname}';`
var data = await getdata(query2);

console.log(data);
var Str = "";

if(element == "combo"){

Str += `<lable for='${comboname}'>${comboname}</lable><select id='${comboname}' name='${comboname}'>`;

for(let i=0;i<data.length;i++){
 Str+=`<option value='${data[i].id}' >${data[i].optionvalue}</option>`;
}

Str += `</select>`;
}else if(element == 'radio'){

Str = `<lable for='${comboname}'>${comboname}</lable><br>`;

for(let i=0;i<data.length;i++){
    Str+=`<input type='radio' name="${comboname}" value='${data[i].id}' >${data[i].optionvalue}  `;
   }

}else if(element == 'check'){
    Str = `<lable for='${comboname}'>${comboname}</lable><br>`;

    for(let i=0;i<data.length;i++){
        Str+=`<input type='checkbox' name="${comboname}${data[i].id}" value='${data[i].id}' >${data[i].optionvalue}  `;
       }

}
 return Str;
}

function getdata(query){
    return new Promise((resolve,reject)=>{
        con.query(query,(err,result)=>{
            if(err) throw err;
            resolve(result);
        });
    });
}

app.listen(7080);