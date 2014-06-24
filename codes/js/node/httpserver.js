var http = require("http"), util = require('util');

http.createServer().listen(8086, '127.0.0.1').on('request', function(request, response){
	request.on('data', function(data){
		console.log("data coming: %s", data);
	}).on('end', function(){
		console.log("request ending.");
	}).on("close", function(){
		console.log("request closing.");
	});
	console.log("request coming.");
	console.log("%s %s HTTP/%s", request.method, request.url, request.httpVersion);
	console.log(util.inspect(request.headers))
	request.setEncoding("iso8859-1");
	response.writeHead(200, {'Content-Type': 'text/plain'});
	response.end('Hello World\n');
}).on('connection', function(socket){
	socket.on("connect", function(){
		console.log("socket connect: " + (this == socket));
	}).on("data", function(data){
		console.log("socket data: " + data);
	}).on("timeout", function(){
		console.log("socket timeout: " + (this == socket));
	}).on("drain", function(){
		console.log("socket drain: " + (this == socket));
	}).on("error", function(error){
		console.log("socket error: " + error);
	}).on("end", function(){
		console.log("socket end: " + (this == socket));
	}).on("close", function(had_error){
		console.log("socket close: " + had_error);
	});
	console.log("connecton coming.");
}).on("close", function(){
	console.log("server colose.");
}).on('checkContinue', function(request, response){
	console.log("server check continue");
}).on("upgrade", function(request, socket, head){
	console.log("server begin upgrade socket to request.");
}).on("clientError", function(exception){
	console.log("client error: " + exception.message);
});