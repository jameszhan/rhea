console.time("Started");
for(var key in global){
	console.log("%s: %s\n", key, global[key]);
}
console.time("Started");
var h = setInterval(function(){
	console.log("Hello World.");
}, 1000);

fs = require('fs'), util = require('util');

fs.watchFile("hello.js", function(curr, prev){	
	console.log('%s <=> %s',  util.inspect(curr),  util.inspect(prev));
});

fs.readFile('/etc/passwd', function(err, data){
	if(err) throw err;
	console.log(data.toString('utf8', 0, data.length));
});

clearInterval(h);