import 'package:flutter/material.dart';
import 'package:tictactoe/models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomdata = {};
  Map<String, dynamic> get roomdata => _roomdata;

  Player _player1 = Player(
    nickname: '',
    socketId: '',
    points: 0,
    playerType: 'X',
  );
  Player _player2 = Player(
    nickname: '',
    socketId: '',
    points: 0,
    playerType: 'O',
  );

  Player get player1 => _player1;
  Player get player2 => _player2;

  void updateRoomData(Map<String, dynamic> data) {
    _roomdata = data;
    notifyListeners();
  }

  void updatePlayer1Data(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2Data(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }
}
