"use strict";

var express = require("express");

var http = require("http");

var mongoose = require("mongoose");

var app = express();
var port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require("socket.io")(server); //middleware


app.use(express.json());
var db = "mongodb+srv://sj15sourav:sourav2000@cluster0.oz6hg1a.mongodb.net/?retryWrites=true&w=majority";
io.on("connection", function (socket) {
  // console.log("Socket connected");
  socket.on("createRoom", function (_ref) {
    var nickname = _ref.nickname;
    console.log(nickname);
  });
});
mongoose.connect(db).then(function () {
  console.log("DB Connected");
})["catch"](function (e) {
  console.log(e);
});
server.listen(port, "0.0.0.0", function () {
  console.log("server started and running on port " + port);
});