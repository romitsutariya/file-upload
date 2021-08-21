var express	=	require("express");
var multer	=	require('multer');
var app	=	express();
require("dotenv").config();
const FILE_UPLOAD_URI =process.env.FILE_UPLOAD_URI
var storage	=	multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, FILE_UPLOAD_URI);
  },
  filename: function (req, file, callback) {
	callback(null, file.originalname);
  }
});
var upload = multer({ storage : storage}).single('myfile');

app.get('/',function(req,res){
      res.sendFile(__dirname + "/index.html");
});

app.post('/upload',function(req,res){
	upload(req,res,function(err) {
		if(err) {
			return res.end("Error uploading file.");
		}
		res.end("File is uploaded successfully!");
	});
});
const PORT = process.env.PORT || 5000
app.listen(PORT, console.log(`server started, listening PORT ${PORT}`))
