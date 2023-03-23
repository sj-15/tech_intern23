"use strict";

var express = require("express");

var http = require("http");

var app = express();
var port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require("socket.io")(server); //middleware


app.use(express.json());
server.listen(port, "0.0.0.0", function () {
  console.log("server started and running on port " + port);
});