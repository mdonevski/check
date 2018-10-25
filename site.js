var express = require('express')
var formidable = require('formidable')
var request = require('request')
var app = express()
var ejs = require('ejs');
var fs = require('fs');
chequeOCR = require('./cheque-ocr.js');

//Config
var data = fs.readFileSync('./siteconfig.json'),Config;
try {
  Config = JSON.parse(data);
}
catch (err) {
  console.log('Error parsing config')
  console.log(err);
}


var server = app.listen(Config.port, function () {

  var host = server.address().address
  var port = server.address().port

  console.log('Reading Log App Listening At http://%s:%s', host, port)

})

var options = {
	ZXingLocation: "./",
    try_harder: true,
	multi: false,
	ZXingVersion: "-3.3.1"}

var bardecoder = require('./zxing.js')(options);

app.get(Config.sitefolder + '/', function(req, res){
	res.render('index.ejs', {
		serviceroot: Config.serviceroot
					});
	
});

app.get(Config.sitefolder + '/step2', function(req, res){
	res.render('step2.ejs', {
					});
	
});

app.get(Config.sitefolder + '/step3', function(req, res){
	res.render('step3.ejs', {
					});
	
});




app.post(Config.sitefolder + '/micr', function (req, res){

new formidable.IncomingForm().parse(req)
    .on('field', function(name, field) {
        console.log('Got a field:', name);
		var base64Data = field.replace(/^data:image\/jpeg;base64,/, "");
        fs.writeFile( __dirname +'/uploads/1.jpeg', base64Data, 'base64', function(err) {
			var image = fs.readFileSync(__dirname +'/uploads/1.jpeg');
			chequeOCR(image, function(err, result) {
			  if (err) {
				console.warn("Something went wrong:");
				console.warn(err);
				res.jsonp(err);
			  } else {
				console.log("Results:");
				console.log(JSON.stringify(result, null, 4));
				res.jsonp(result);
			  }
			});
            if(err){
               console.log(err);
            }
        });




    })
    .on('error', function(err) {
        next(err);
    })
//    .on('end', function() {
//        res.end();
//    });
});

app.post('/bankauthorize', function (req, res){
    var form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
		username = fields.author;
		title = fields.title;
		pool.getConnection(function(err, connection) {
			strQuery = "INSERT INTO readinglog.readinglog (`userid`, `author`, `title`, `date`) VALUES ("+req.params.id+", '"+author+"', '"+title+"',concat(year(now()),'-',month(now()),'-',day(now()) ) );";
			console.log(strQuery);
			connection.query( strQuery, function(err, rows) {
				connection.release();
				});
			});
		res.redirect('/user/'+req.params.id+'?status=bookadded');
	    });

});



//app.use('/', express.static(__dirname + '/public'));












