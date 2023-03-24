"use strict";

var mongoose = require('mongoose');

var playersSchema = new mongoose.Schema({
  nickname: {
    type: String,
    trim: true
  },
  socketId: {
    type: String
  },
  points: {
    type: Number,
    "default": 0
  },
  playerType: {
    required: true,
    type: String
  }
});
module.exports = playersSchema;