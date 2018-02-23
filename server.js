// just quick webserver to serve www (in production)

var express = require('express'), serveStatic = require('serve-static'), app = express();
// static assets first
app.use(serveStatic('build', {index: ['index.html']}));

app.listen(process.env.SERVER_PORT || 8080).on('error', function(e) {
  if (e.code == "EADDRINUSE") {
    console.log("WARN: Port is already in use and the server was not restarted ... proceeding anyway.");
  }
});

console.log('Listening on :8080');
