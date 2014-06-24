//curl -k http://localhost:8000/


var https = require('https'),  
	util = require('util'), 
	fs = require('fs'), 
	url = require('url'), 
	qs = require("querystring");

var options = {
	key: fs.readFileSync('conf/server.key'),
	cert: fs.readFileSync('conf/server.crt')
};

https.createServer(options, function(rq, rs){
	var params = qs.parse(url.parse(rq.url).query);
	rq.setEncoding("utf-8");	
	rq.on('data', function(postBody){
		console.log("Get postBody: '" + postBody + "'.");
		params = qs.parse(postBody);
	}).on("end", function(){		
		rs.writeHead(200, {'Content-Type': 'application/json'});
		var i, cnt = (params && params.loop) || 0;
		for(i = 0; i < cnt; i++){
			console.log(params);
		}
		if("james" == params.username){
			rs.end('{"success": true}');
		}else{
			rs.end('{"success": false}');
		}		
	});
		
}).listen(443);