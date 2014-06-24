#openssl genrsa -out server-key.pem 1024
#openssl req -new -key server-key.pem -out server-csr.pem
#openssl x509 -req -in server-csr.pem -signkey server-key.pem -out server-cert.pem


#openssl genrsa -out server.key 2048
#openssl req -new -x509 -key server.key -out server.crt -days 1095