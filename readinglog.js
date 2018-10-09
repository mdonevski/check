var express = require('express')
var formidable = require('formidable')
var request = require('request')
var app = express()
var ejs = require('ejs');
var mysql = require('mysql');
var fs = require('fs');
var json2csv = require('json2csv');

//Config
var data = fs.readFileSync('./readinglogconfig.json'),Config;
try {
  Config = JSON.parse(data);
}
catch (err) {
  console.log('Error parsing config')
  console.log(err);
}

//Setup DB pool
var pool  = mysql.createPool({
  host     : Config.host,
  user     : Config.user,
  password : Config.password,
  database : Config.database
});

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

//INSERT INTO readinglog.readinglog (`userid`, `isbn`, `title`, `date`) VALUES ('3', '12', 'guy',concat(year(now()),'-',month(now()),'-',day(now()) ) );

app.post('/user/:id/upload', function (req, res){
    var form = new formidable.IncomingForm();

    form.parse(req);

    form.on('fileBegin', function (name, file){
        file.path = __dirname + '/uploads/' + file.name;
    });

    form.on('file', function (name, file){
        console.log('Uploaded ' + file.name);
        bardecoder.decode(__dirname +'/uploads/'+file.name,
			function(err, isbn) {
				console.log(err);
				console.log(isbn);
				if (isbn.length>1) {
					request('https://www.googleapis.com/books/v1/volumes?q='+isbn, function (error, response, body) {
						//console.log('error:', error); // Print the error if one occurred
						//console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
						//console.log('body:', body); // Print the HTML for the Google homepage.
						var book = JSON.parse(body);
						console.log(book);
						if ((book.totalItems > 0)&&(typeof book.items) !== 'undefined') {
							pool.getConnection(function(err, connection) {
								title=connection.escape(book.items[0].volumeInfo.title)
								author=connection.escape(book.items[0].volumeInfo.authors[0])
								strQuery = "INSERT INTO readinglog.readinglog (`userid`, `isbn`,`author`, `title`, `date`) VALUES ("+req.params.id+","+isbn+", "+author+", "+title+",concat(year(now()),'-',month(now()),'-',day(now()) ) );";

								console.log(strQuery);
								connection.query( strQuery, function(err, rows) {
								connection.release();
								});
							});
						res.redirect('/user/'+req.params.id+'?status=bookadded');
						}
						else {
							res.redirect('/user/'+req.params.id+'?status=booknotfound');	
						}
						
						//console.log(body.items[0].volumeInfo.title)
						//console.log(body.items[0].volumeInfo.author)
						});
					}
				else {
					res.redirect('/user/'+req.params.id+'?status=barcodeerror');
				}
			}
		);
        
    });

});

app.post('/user/:id/addbook', function (req, res){
    var form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
		author = fields.author;
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

app.delete('/readinglog/:id', function(req, res){
	pool.getConnection(function(err, connection) {
		connection.query("delete from readinglog where idreadinglog = "+req.params.id , function(err, row) {
		res.sendStatus(200); 
		connection.release();
		});
	});
});	

app.get('/user/:id/csv', function(req, res){

fields = ['isbn', 'author', 'title', 'date'];

var whereclause=""
var year =""
var month=""

if (typeof req.query.year !== 'undefined') {
    year=req.query.year;
}

if (typeof req.query.month !== 'undefined') {
    month=req.query.month;
}
if (year.length>0 && year != "ALL") {whereclause=" AND year(date) = "+year}
if (month.length>0 && month != "ALL") {whereclause=whereclause+" AND month(date) = "+month}
strQuery = "SELECT * FROM readinglog.readinglog where userid="+req.params.id+whereclause+"  order by date desc, idreadinglog desc";

	pool.getConnection(function(err, connection) {
		connection.query(strQuery , function(err, row) {
			json2csv({ data: row, fields: fields }, function(err, csv) {
				res.setHeader('Content-disposition', 'attachment; filename=readinglog.csv');
				res.set('Content-Type', 'text/csv');
				res.status(200).send(csv);
				console.log(err);
				console.log(csv);
				});
			});
		connection.release();

	});


});	

app.get('/user/:id', function(req, res){	

strQuery= "select username from user where userid = "+req.params.id;

var username
var readinglog
var whereclause=""
var year =""
var month=""

if (typeof req.query.year !== 'undefined') {
    year=req.query.year;
}

if (typeof req.query.month !== 'undefined') {
    month=req.query.month;
}
				res.render('user.ejs', {
					id: req.params.id,
					username: username,
					year: year,
					month: month, 
					booklist: readinglog
					});
 



});	





