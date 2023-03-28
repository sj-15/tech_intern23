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
            roomId = room._id.toString();
            socket.join(roomId); // io -> send data to everyone
            // socket -> sending data to yourself

            io.to(roomId).emit("createRoomSuccess", room);
            _context.next = 18;
            break;

          case 15:
            _context.prev = 15;
            _context.t0 = _context["catch"](2);
            console.log(_context.t0);

          case 18:
          case "end":
            return _context.stop();
        }
      }
    }, null, null, [[2, 15]]);
  });
  socket.on("joinRoom", function _callee2(_ref2) {
    var nickname, roomId, room, player;
    return regeneratorRuntime.async(function _callee2$(_context2) {
      while (1) {
        switch (_context2.prev = _context2.next) {
          case 0:
            nickname = _ref2.nickname, roomId = _ref2.roomId;
            _context2.prev = 1;

            if (roomId.match(/^[0-9a-fA-F]{24}$/)) {
              _context2.next = 5;
              break;
            }

            socket.emit("errorOccurred", "Please enter a valid room Id");
            return _context2.abrupt("return");

          case 5:
            _context2.next = 7;
            return regeneratorRuntime.awrap(Room.findById(roomId));

          case 7:
            room = _context2.sent;

            if (!room.isJoin) {
              _context2.next = 21;
              break;
            }

            player = {
              nickname: nickname,
              socketId: socket.id,
              playerType: "O"
            };
            socket.join(roomId);
            room.players.push(player);
            room.isJoin = false;
            _context2.next = 15;
            return regeneratorRuntime.awrap(room.save());

          case 15:
            room = _context2.sent;
            io.to(roomId).emit("joinRoomSuccess", room);
            io.to(roomId).emit("updatePlayersState", room.players);
            io.to(roomId).emit("updateRoom", room);
            _context2.next = 22;
            break;

          case 21:
            socket.emit("errorOccurred", "Room full, try again later");

          case 22:
            _context2.next = 27;
            break;

          case 24:
            _context2.prev = 24;
            _context2.t0 = _context2["catch"](1);
            console.log(_context2.t0);

          case 27:
          case "end":
            return _context2.stop();
        }
      }
    }, null, null, [[1, 24]]);
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