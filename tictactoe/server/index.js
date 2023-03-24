const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require("socket.io")(server);

//middleware
app.use(express.json());

const db = "mongodb+srv://sj15sourav:sourav2000@cluster0.oz6hg1a.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
    // console.log("Socket connected");
    socket.on("createRoom", ({nickname}) => {
        console.log(nickname);
    });
});
mongoose.connect(db).then(() => { console.log("DB Connected"); }).catch((e) => { console.log(e); });


server.listen(port, "0.0.0.0", () => {
    console.log("server started and running on port " + port);
});