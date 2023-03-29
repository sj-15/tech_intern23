"use strict";

var mongoose = require('mongoose');

var playersSchema = require('./player');

var roomSchema = new mongoose.Schema({
  occupancy: {
    type: Number,
    "default": 2
  },
  maxRounds: {
    type: Number,
    "default": 5
  },
  currentRounds: {
    required: true,
    type: Number,
    "default": 1
  },
  players: [playersSchema],
  isJoin: {
    type: Boolean,
    "default": true
  },
  turn: playersSchema,
  turnIndex: {
    type: Number,
    "default": 0
  }
});
var roomModel = mongoose.model("Room", roomSchema);
module.exports = roomModel;