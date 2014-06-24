/*
var http = require('http'), util = require('util');
http.createServer(function(req, res){
	console.log(util.inspect(req));
	res.writeHead(200, {'Content-Type': 'text/plain'});
	res.end('Hello World\n');	
}).listen(8086, "127.0.0.1");
console.log('Server running at http://127.0.0.1:8086');
*/

var net = require('net');

var server = net.createServer(function(socket){	
	socket.write("Echo server\r\n");
	socket.pipe(socket);
}).listen(8086, "127.0.0.1").on("listening", function(){
	console.log('listening event occur.');
}).on("connection", function(socket){
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
	console.log("connection event : " + typeof socket);
}).on("error", function(error){
	console.log("error event: " + typeof error);
}).on("close", function(){
	cosole.log("server close event.");
});