const { render } = require('ejs');
const express = require('express');
const mysql = require('mysql2');
const app = express();
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
        technology = `insert into technology_master(technology,level,cnd_id) value('${str.technology}','${str.level}','4'); `;
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
//    console.log('option : '+option);
// console.log(stringsearch);
   stringsearch = stringsearch.trim();
 
   const values = stringsearch.split(" "); 

   var stringjoint = values.join(`" ${option} `);

 stringjoint =stringjoint + '"';
stringjoint = stringjoint.replace(/=/g,'="');
stringjoint =  ` where isdeleted = '0' and `+stringjoint;
if(stringsearch == ''){
    stringjoint='where isdeleted = "0"';
}
 console.log("stringjoint "+stringjoint);

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
})

app.listen(8070);
