//curl -k http://localhost:8000/


var https = require('https'),  util = require('util'), fs = require('fs'), 
	url = require('url'), qs = require("querystring");

var options = {
	key: fs.readFileSync('server-key.pem'),
	cert: fs.readFileSync('server-cert.pem')
};


https.createServer(options, function(req, res){
	console.log(url.parse(req.url));
	
	var params;
	req.setEncoding("utf-8");	
	req.on('data', function(postBody){
		console.log("Get postBody: '" + postBody + "'.");
		params = qs.parse(postBody);
	}).on("end", function(){		
	 	for(var j = 0; j < 80000; j++){
			console.log(params);
		}
		res.writeHead(200, {'Content-Type': 'application/json'});
		if("james" == params.username){
			res.end('{"success": true}');
		}else{
			res.end('{"success": false}');
		}		
	});
		
}).listen(8000);