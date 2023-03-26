"use strict";

var express = require("express");

var http = require("http");

var mongoose = require("mongoose");

var app = express();
var port = process.env.PORT || 3000;
var server = http.createServer(app);

var Room = require("./models/room");

var io = require("socket.io")(server); //middleware


app.use(express.json());
var db = "mongodb+srv://sj15sourav:sourav2000@cluster0.oz6hg1a.mongodb.net/?retryWrites=true&w=majority";
io.on("connection", function (socket) {
  console.log("connected!");
  socket.on("createRoom", function _callee(_ref) {
    var nickname, room, player, roomId;
    return regeneratorRuntime.async(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            nickname = _ref.nickname;
            console.log(nickname);
            _context.prev = 2;
            // room is created
            room = new Room();
            player = {
              socketId: socket.id,
              nickname: nickname,
              playerType: "X"
            };
            room.players.push(player);
            room.turn = player;
            _context.next = 9;
            return regeneratorRuntime.awrap(room.save());

          case 9:
            room = _context.sent;
            console.log(room);
            roomId = room._id.toString();
            socket.join(roomId); // io -> send data to everyone
            // socket -> sending data to yourself

            io.to(roomId).emit("createRoomSuccess", room);
            _context.next = 19;
            break;

          case 16:
            _context.prev = 16;
            _context.t0 = _context["catch"](2);
            console.log(_context.t0);

          case 19:
          case "end":
            return _context.stop();
        }
      }
    }, null, null, [[2, 16]]);
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