//openssl genrsa -out server-key.pem 1024
//openssl req -new -key server-key.pem -out server-csr.pem
//openssl x509 -req -in server-csr.pem -signkey server-key.pem -out server-cert.pem



var tls = require('tls');
var fs = require('fs');

var options = {
	key: fs.readFileSync('server-key.pem'),
	cert: fs.readFileSync('server-cert.pem')
};

tls.createServer(options, function(s){
	s.write("welcome!\n");
	s.pipe(s);
}).listen(8000);

//openssl s_client -connect 127.0.0.1:8000