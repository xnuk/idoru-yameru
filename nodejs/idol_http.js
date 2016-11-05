var http = require('http');

var server = http.createServer(function(req, res) {
	res.writeHead(200);
	res.end('나 아이돌 그만둘래!');
});

server.listen(8080);
