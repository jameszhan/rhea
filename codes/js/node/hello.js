var http = require('http');
http.createServer(function(req, res){
	console.time("Request Process Start...");
	res.writeHead(200, {'Content-Type': 'text/plain'});
	res.end('Hello World\n');	
	console.time("Request Process End...");
}).listen(1337, "127.0.0.1");
console.log('Server running at http://127.0.0.1:1337');



