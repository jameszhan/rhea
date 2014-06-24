var http = require('http'),  
	util = require('util'), 
	fs = require('fs'), 
	url = require('url'), 
	path = require("path");
var mime = require("./exports/mime").types, 
	config = require("./exports/config");
	
http.createServer(function(rq, rs){
	var pathname = url.parse(rq.url).pathname;
	var realPath = "../var/www" + pathname;
	console.log(realPath);
	path.exists(realPath, function(exists){
		if(!exists){
			rs.writeHead(404, {'Content-Type': 'text/plain'});
			rs.end("The request URL " + pathname + " was not found on this server.");
		}else{
			fs.readFile(realPath, "binary", function(err, file){
				if(err){
					rs.writeHead(500, {"Content-Type": "text/plain"});
					rs.end(err);
				}else{
					fs.stat(realPath, function (err, stat) {
					    var lastModified = stat.mtime.toUTCString();					    
						var ifModifiedSince = "If-Modified-Since";
						if (rq.headers[ifModifiedSince] && lastModified == rq.headers[ifModifiedSince]) {
						    rs.writeHead(304, "Not Modified");
						    rs.end();
						}else{
							var ext = path.extname(realPath);					
							ext = ext ? ext.slice(1) : "unknown";
							if(ext.match(config.Expires.fileMatch)){
								var expires = new Date();
								expires.setTime(expires.getTime() + config.Expires.maxAge * 1000);
								rs.setHeader("Expires", expires.toUTCString());
								rs.setHeader("Cache-Control", "max-age=" + config.Expires.maxAge);
							}
							rs.setHeader("Last-Modified", lastModified);
							var contentType = mime[ext] || "text/plain";
							rs.writeHead(200, {"Content-Type": contentType});
							rs.write(file, "binary");
							rs.end();
						}
					});
				}
			});
		}
		
	});
}).listen(8080);