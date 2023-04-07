const { render } = require('ejs');
const express = require('express');
const mysql = require('mysql2');
const app = express();
const util = require('util');
var bodyParser = require('body-parser');


app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));
//Database Connection

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'job_application_db'
});

con.connect((err) => {
    if (err) { console.log(err); }
    console.log("success connection");

});


const sendquery = util.promisify(con.query.bind(con));

app.get('/form', (req, res) => {
    con.query('select * from state_master ', (err, result) => {
        if (err) throw err;
        //console.log(result);
        con.query('select option_name as rel, id from option_master  where select_key="relationkey"', (err, result1) => {
            if (err) throw err;
          //  console.log(result1);
            con.query('select option_name as course,id from option_master  where select_key="coursekey"', (err, result2) => {
                if (err) throw err;
              //  console.log(result2);
                con.query('select option_name as lang,id from option_master  where select_key="languagekey"', (err, result3) => {
                    if (err) throw err;
                 //   console.log(result3);
                    con.query('select option_name as tech,id from option_master  where select_key="technologykey"', (err, result4) => {
                        if (err) throw err;
                     //   console.log(result4);
                        con.query('select option_name as preflocation,id from option_master  where select_key="preflocationkey"', (err, result5) => {
                            if (err) throw err;
                         //   console.log(result5);
                            con.query('select option_name as department,id from option_master  where select_key="departmentkey"', (err, result6) => {
                                if (err) throw err;
                             //   console.log(result6);
                        
                                res.render('jobapplicationform.ejs', { state: result,relstatus:result1,course:result2,language:result3,technology:result4,preflocation:result5,department:result6});
                            });
                        });
                    });
                });
                
            });
          
        });
      
    });
});

app.post('/formdata',(req,res)=>{

    var str = req.body;
   console.log(str);
   
    var candidate = `insert into candidate_master(firstname,lastname,designation,address1,email,city,gender,state,relation,zipcode,address2,phone,dob,isdeleted) value ('${str.firstname}','${str.lastname}','${str.designation}','${str.address1}','${str.email}','${str.city}','${str.gender}','${str.state}','${str.relation}','${str.zipcode}','${str.address2}','${str.phone}','${str.dob}','0')`;
  //  console.log(candidate);

    //education
    var education;
      if(typeof(str.course) == 'object'){
        education=`insert into education_master(course,board,passingyear,percentage,cnd_id) values`;
        for(let i = 0;i<str.course.length;i++){
            education += `('${str.course[i]}','${str.board[i]}','${str.year[i]}','${str.percentage[i]}','4'),`;
        }
        education = education.slice(0,education.length-1);
    }else{
        education = `insert into education_master(course,board,passingyear,percentage,cnd_id) value('${str.course}','${str.board}','${str.year}','${str.percentage}','4'); `;
    }

  console.log(education);


    //experience
    var experience='';
    if(typeof(str.compname) == 'object'){
        experience = `insert into experience_master(com_name,designation,startdate,enddate,cnd_id) values `;
        for(let i = 0;i<str.compname.length;i++){
            experience += `('${str.compname[i]}','${str.expedesignation[i]}','${str.fdate[i]}','${str.todate[i]}','4'),`;
        }
experience = experience.slice(0,experience.length-1);
    }else{
        experience = `insert into experience_master(com_name,designation,startdate,enddate,cnd_id) value('${str.compname}','${str.expedesignation}','${str.fdate}','${str.todate}','4'); `;
    }
  //console.log(experience);


    //language
    var language='';
    if(typeof(str.language) == 'object'){
        language =`insert into language_master(lang_known,lang_read,lang_write,lang_speak,cnd_id) values `;
           for(let i = 0;i<str.language.length;i++){
            if(!str.read){ str.read = "abc" }  if(!str.write){ str.write = "abc" }  if(!str.speak){ str.speak = "abc" }
            language += `('${str.language[i]}','${ str.read.includes(str.language[i]) ? 'yes' : 'no'}','${ str.write.includes(str.language[i]) ? 'yes' : 'no'}','${ str.speak.includes(str.language[i]) ? 'yes' : 'no'}','4'),`;
        }
        language = language.slice(0,language.length-1);
    }else{
        language = `insert into language_master(lang_known,lang_read,lang_write,lang_speak,cnd_id) value('${str.language}','${ str.read==str.language ? 'yes' : 'no'}','${ str.write == str.language ? 'yes' : 'no'}','${ str.speak==str.language ? 'yes' : 'no'}','4') `;
    }
  // console.log(language);


    //technology
    var technology='';
        if(typeof(str.technology) == 'object'){
        technology=`insert into technology_master(technology,level,cnd_id) values `;
           for(let i = 0;i<str.technology.length;i++){
      

          
            technology += `('${str.technology[i]}','${str['level'+str.technology[i]]}','4'),`;
        }
        technology=technology.slice(0,technology.length-1);
    }else{
        technology = `insert into technology_master(technology,level,cnd_id) value('${str.technology}','${str['level'+str.technology]}','4'); `;
    }
 //console.log(technology);


    //referance
    var referance='';
    if(typeof(str.refname) == 'object'){
        referance=`insert into reference_master(ref_name,ref_contact,relation,cnd_id) values`;
           for(let i = 0;i<str.refname.length;i++){
            referance += `('${str.refname[i]}','${str.refcontact[i]}','${str.refrelation[i]}','4'),`;
        }
        referance=referance.slice(0,referance.length-1); 
    }else{
        referance = `insert into reference_master(ref_name,ref_contact,relation,cnd_id) value('${str.refname}','${str.refcontact}','${str.refrelation}','4'); `;
    }
    //console.log(referance);


    //preferance
    var preferance=`insert into preferance_master(location_prf,current_ctc,department,notice_period,expected_ctc,cnd_id) value('${str.prflocation}','${str.currentctc}','${str.department}','${str.noticeperiod}','${str.expactedctc}','4'); `;
   //  console.log(preferance);
con.query(candidate,(err,result1)=>{
    if(err) throw err;

   education= education.replace(/'4'/g,`'${result1.insertId}'`);
   experience= experience.replace(/'4'/g,`'${result1.insertId}'`);
   language= language.replace(/'4'/g,`'${result1.insertId}'`);
   technology= technology.replace(/'4'/g,`'${result1.insertId}'`);
   referance= referance.replace(/'4'/g,`'${result1.insertId}'`);
   preferance= preferance.replace(/'4'/g,`'${result1.insertId}'`);

    con.query(education,(err1,result2)=>{
        if(err1) throw err1;
        con.query(experience,(err2,result3)=>{
            if(err2) throw err2;
            con.query(language,(err3,result4)=>{
                if(err3) throw err3;
                con.query(technology,(err4,result5)=>{
                    if(err4) throw err4;
                    con.query(referance,(err5,result6)=>{
                        if(err5) throw err5;
                        con.query(preferance,(err6,result7)=>{
                            if(err6) throw err6;
        
                                 res.render('datalist.ejs');
  
                        });
                    });
                });
            });
        });
    });
});

});

app.get('/showtable',(req,res)=>{
    res.render('datalist.ejs');
})

app.get('/datalist', (req, res) => {
    
    var key = parseInt(req.query.no) || 1;
   var stringsearch = req.query.stringsearch || '';
   var stringsearch2 = req.query.str || '';
   var option = req.query.option || 'or';
   var sort = req.query.sort || 'cnd_id';
   var order = req.query.order || 'asc';
   console.log('option : '+option);
console.log("1stringsearch",stringsearch);
   stringsearch = stringsearch.trim();
 
   const values = stringsearch.split(" "); 

   var stringjoint = values.join(`" ${option} `);
console.log("2stringjoint",stringjoint);
 stringjoint =stringjoint + '"';
stringjoint = stringjoint.replace(/=/g,'="');
stringjoint =  ` where isdeleted = '0' and `+stringjoint;
if(stringsearch == ''){
    stringjoint='where isdeleted = "0"';
}
 console.log("3stringjoint "+stringjoint);

    con.query(`select * from candidate_master ${stringjoint} order by ${sort} ${order} limit ${((10 * key) - 10)},10`, (err, result) => {
        if (err) throw err;
        con.query(`select count(cnd_id) as total from candidate_master ${stringjoint} `, (err, result2) => {

            if (err) throw err;
            var total=Math.ceil(parseInt(result2[0].total)/10)
            var abc = [{
                result:result,
                 total:total,
                 stringsearch:stringsearch,
                 stringsearch2:stringsearch2,
                 option:option,
                 order:order,
                 sort:sort,
                 key:key}];
            

            res.send(abc);         
           
        });    
  
    });
});

app.get('/getcity',(req,res)=>{
    var state = req.query.statename || "";
   
    con.query(`select cityname from city_master join state_master on city_master.state_id = state_master.id where state_master.statename = "${state}" `,(err,result1)=>{
        if(err) throw err;

        res.send(result1);
        res.end();
    });
});


app.get('/deleterecord',(req,res)=>{
    var cd_id = req.query.cd_id;



    con.query(`update candidate_master set isdeleted = '1' where cnd_id in (${cd_id})`,(err,result)=>{
        if(err) throw err;


    });
});




app.get('/editform',async (req,res)=>{
    var cnd_id = req.query.cndId;
var cd_data = await sendquery(`select * from candidate_master where cnd_id = ${cnd_id}`);
var edu_data = await sendquery(`select * from education_master where cnd_id = ${cnd_id}`);
var exp_data = await sendquery(`select * from experience_master where cnd_id = ${cnd_id}`);
var lang_data =await sendquery(`select * from language_master where cnd_id = ${cnd_id}`);
var pref_data = await sendquery(`select * from preferance_master where cnd_id = ${cnd_id}`);
var ref_data =await sendquery(`select * from reference_master where cnd_id = ${cnd_id}`);
var tech_data = await sendquery(`select * from technology_master where cnd_id = ${cnd_id}`);
var state = await sendquery(`select * from state_master`);
var course = await sendquery(`select option_name as course,id from option_master  where select_key="coursekey"`);
var relstatus = await sendquery(`select option_name as rel, id from option_master  where select_key="relationkey"`);
var genderRadio = await generateCombo('genderkey','radio',cd_data[0].gender); 
var langCheck = await generateCombo('languagekey','check',lang_data); 
var techRadio = await generateCombo('technologykey','check2',tech_data);
var preflocation = await sendquery(`select option_name as preflocation,id from option_master  where select_key="preflocationkey"`);
var department = await sendquery(`select option_name as department,id from option_master  where select_key="departmentkey"`);


    res.render('editjobappform.ejs',{locationpre:pref_data[0].location_prf.split(","),department,preflocation,techRadio,langCheck,course,genderRadio,relstatus,state,cd_data,edu_data,exp_data,lang_data,pref_data,ref_data,tech_data});
})


app.post('/editformdata',async (req,res)=>{
var candidateId = req.query.cnd_id;
    var str = req.body;
   console.log(str);
   
    var candidate = `UPDATE candidate_master SET firstname='${str.firstname}',lastname='${str.lastname}',designation='${str.designation}',address1='${str.address1}',email='${str.email}',city='${str.city}',gender='${str.gender}',state='${str.state}',relation='${str.relation}',zipcode='${str.zipcode}',address2='${str.address2}',phone='${str.phone}',dob='${str.dob}' where cnd_id = '${candidateId}'`;
   console.log(candidate);

    //education
    var education;
      if(typeof(str.course) == 'object'){
        education=`insert into education_master(course,board,passingyear,percentage,cnd_id) values`;
        for(let i = 0;i<str.course.length;i++){
            education += `('${str.course[i]}','${str.board[i]}','${str.year[i]}','${str.percentage[i]}','${candidateId}'),`;
        }
        education = education.slice(0,education.length-1);
    }else{
        education = `insert into education_master(course,board,passingyear,percentage,cnd_id) value('${str.course}','${str.board}','${str.year}','${str.percentage}','${candidateId}'); `;
    }

 // console.log(education);


    //experience
    var experience='';
    if(typeof(str.compname) == 'object'){
        experience = `insert into experience_master(com_name,designation,startdate,enddate,cnd_id) values `;
        for(let i = 0;i<str.compname.length;i++){
            experience += `('${str.compname[i]}','${str.expedesignation[i]}','${str.fdate[i]}','${str.todate[i]}','${candidateId}'),`;
        }
experience = experience.slice(0,experience.length-1);
    }else{
        experience = `insert into experience_master(com_name,designation,startdate,enddate,cnd_id) value('${str.compname}','${str.expedesignation}','${str.fdate}','${str.todate}','${candidateId}'); `;
    }
  //console.log(experience);


    //language
    var language='';
    if(typeof(str.language) == 'object'){
        language =`insert into language_master(lang_known,lang_read,lang_write,lang_speak,cnd_id) values `;
           for(let i = 0;i<str.language.length;i++){
            
            if(!str.read){ str.read = "abc" }  if(!str.write){ str.write = "abc" }  if(!str.speak){ str.speak = "abc" }

            language += `('${str.language[i]}','${ str.read.includes(str.language[i]) ? 'yes' : 'no'}','${ str.write.includes(str.language[i]) ? 'yes' : 'no'}','${ str.speak.includes(str.language[i]) ? 'yes' : 'no'}','${candidateId}'),`;
        }
        language = language.slice(0,language.length-1);
    }else{
        language = `insert into language_master(lang_known,lang_read,lang_write,lang_speak,cnd_id) value('${str.language}','${ str.read==str.language ? 'yes' : 'no'}','${ str.write == str.language ? 'yes' : 'no'}','${ str.speak==str.language ? 'yes' : 'no'}','${candidateId}') `;
    }
  // console.log(language);


    //technology
    var technology='';
        if(typeof(str.technology) == 'object'){
        technology=`insert into technology_master(technology,level,cnd_id) values `;
           for(let i = 0;i<str.technology.length;i++){
                
            technology += `('${str.technology[i]}','${str['level'+str.technology[i]]}','${candidateId}'),`;
        }
        technology=technology.slice(0,technology.length-1);
    }else{
        technology = `insert into technology_master(technology,level,cnd_id) value('${str.technology}','${str.level}','${candidateId}'); `;
    }
 //console.log(technology);


    //referance
    var referance='';
    if(typeof(str.refname) == 'object'){
        referance=`insert into reference_master(ref_name,ref_contact,relation,cnd_id) values`;
           for(let i = 0;i<str.refname.length;i++){
            referance += `('${str.refname[i]}','${str.refcontact[i]}','${str.refrelation[i]}','${candidateId}'),`;
        }
        referance=referance.slice(0,referance.length-1); 
    }else{
        referance = `insert into reference_master(ref_name,ref_contact,relation,cnd_id) value('${str.refname}','${str.refcontact}','${str.refrelation}','${candidateId}'); `;
    }
    //console.log(referance);


    //preferance
    var preferance=`UPDATE preferance_master SET location_prf='${str.prflocation}',current_ctc='${str.currentctc}',department='${str.department}',notice_period='${str.noticeperiod}',expected_ctc='${str.expactedctc}' where cnd_id='${candidateId}'; `;
   //  console.log(preferance);


 const deledu =  await sendquery(`DELETE FROM education_master WHERE   cnd_id = ${candidateId}`);
 const delex =  await sendquery(`DELETE FROM experience_master WHERE   cnd_id = ${candidateId}`);
 const dellang =  await sendquery(`DELETE FROM language_master WHERE   cnd_id = ${candidateId}`);
 const deltec =  await sendquery(`DELETE FROM technology_master WHERE  cnd_id = ${candidateId}`);
 const delref =  await sendquery(`DELETE FROM reference_master WHERE   cnd_id = ${candidateId}`);

con.query(candidate,(err,result1)=>{
    if(err) throw err;

    con.query(education,(err1,result2)=>{
        if(err1) throw err1;
        con.query(experience,(err2,result3)=>{
            if(err2) throw err2;
            con.query(language,(err3,result4)=>{
                if(err3) throw err3;
                con.query(technology,(err4,result5)=>{
                    if(err4) throw err4;
                    con.query(referance,(err5,result6)=>{
                        if(err5) throw err5;
                        con.query(preferance,(err6,result7)=>{
                            if(err6) throw err6;
        
                                 res.render('datalist.ejs');
  
                        });
                    });
                });
            });
        });
    });
});

});

async function generateCombo(combo,element,gen){

    var comboname =  combo;
 
 var query2 = `select option_name,id from option_master  where select_key="${combo}"`;
 var data = await getdata(query2);
 var Str = "";
 
 if(element == "combo"){
 
 Str += `<lable for='${comboname}'>${comboname}</lable><select id='${comboname}' name='${comboname}'>`;
 
 for(let i=0;i<data.length;i++){
  Str+=`<option value='${data[i].id}' >${data[i].optionvalue}</option>`;
 }
 
 Str += `</select>`;

 }else if(element == 'radio'){
 
 for(let i=0;i<data.length;i++){
    if(data[i].option_name == gen){
     Str+=`<input type='radio' name="gender" value='${data[i].option_name}' checked="checked">${data[i].option_name}  `;
    }else{
        Str+=`<input type='radio' name="gender" value='${data[i].option_name}' >${data[i].option_name}  `;
    }
}
 
 }else if(element == 'check'){
    var array = [];

 for(let i=0;i<gen.length;i++){
array.push(gen[i].lang_known);
 }
     for(let i=0;i<data.length;i++){
        if(array.includes(data[i].option_name)){
         Str+=`<tr><td><input type='checkbox' name="language" value="${data[i].option_name}" ${data[i].option_name==gen[i].lang_known?"checked":""} >${data[i].option_name}</td>
         <td><input type="checkbox" value="${data[i].option_name}" name="read" ${gen[i].lang_read == "yes"?"checked":""}/>Read</td>
         <td><input type="checkbox" value="${data[i].option_name}" name="write" ${gen[i].lang_write == "yes"?"checked":""}/>Write</td>
         <td><input type="checkbox" value="${data[i].option_name}" name="speak" ${gen[i].lang_speak == "yes"?"checked":""}/>Speak</td>
     </tr>`;
        }else{
            Str+=`<tr><td><input type='checkbox' name="language" value="${data[i].option_name}" >${data[i].option_name}</td>
            <td><input type="checkbox" value="${data[i].option_name}" name="read" }/>Read</td>
            <td><input type="checkbox" value="${data[i].option_name}" name="write" }/>Write</td>
            <td><input type="checkbox" value="${data[i].option_name}" name="speak" }/>Speak</td>
        </tr>`;
    }
}
 }else if(element == 'check2'){
    var array = [];
 for(let i=0;i<gen.length;i++){
array.push(gen[i].technology);

 }
var k=0;
     for(let i=0;i<data.length;i++){
        if(array.includes(data[i].option_name)){
             
            // console.log("array  ----",array[i]);
            // console.log("data ----",data[i]);
         Str+=`<tr><td><input type='checkbox' name="technology" value="${data[i].option_name}" ${data[i].option_name==array[k]?"checked":""} >${data[i].option_name}</td>
         <td><input type="radio" name="level${data[i].option_name}" value="beginer" ${gen[k].level == "beginer"?"checked":""}/>Beginner</td>
         <td><input type="radio" name="level${data[i].option_name}" value="mideater" ${gen[k].level == "mideater"?"checked":""}/>Mideater</td>
         <td><input type="radio" name="level${data[i].option_name}" value="expert" ${gen[k].level == "expert"?"checked":""}/>Expert</td>
     </tr>`;
     k++;
        }else{
            Str+=`<tr><td><input type='checkbox' name="technology" value="${data[i].option_name}" >${data[i].option_name}</td>
            <td><input type="radio" name="level${data[i].option_name}"  value="beginer" }/>Beginner</td>
            <td><input type="radio" name="level${data[i].option_name}"  value="mideater" }/>Mideater</td>
            <td><input type="radio" name="level${data[i].option_name}" value="expert" }/>Expert</td>
        </tr>`;
    }
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


app.listen(8070);