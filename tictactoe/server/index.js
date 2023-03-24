const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require("./models/room");
var io = require("socket.io")(server);

//middleware
app.use(express.json());

const db = "mongodb+srv://sj15sourav:sourav2000@cluster0.oz6hg1a.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    console.log("connected!");
    socket.on("createRoom", async ({ nickname }) => {
      console.log(nickname);
      try {
        // room is created
        let room = new Room();
        let player = {
          socketID: socket.id,
          nickname,
          playerType: "X",
        };
        room.players.push(player);
        room.turn = player;
        room = await room.save();
        console.log(room);
        const roomId = room._id.toString();
  
        socket.join(roomId);
        // io -> send data to everyone
        // socket -> sending data to yourself
        io.to(roomId).emit("createRoomSuccess", room);
      } catch (e) {
        console.log(e);
      }
    });
});

mongoose.connect(db).then(() => { console.log("DB Connected"); }).catch((e) => { console.log(e); });


server.listen(port, "0.0.0.0", () => {
    console.log("server started and running on port " + port);
});