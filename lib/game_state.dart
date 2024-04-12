import 'dart:math';

import 'package:flutter/material.dart';

class GameState extends ChangeNotifier {
  List<String> playerNames = [];
  int ignorantPlayerIndex = -1;
  

  void addNewPlayer(String name) {
    playerNames.add(name);
    notifyListeners();
  }

  void clearUsers() {
    playerNames = [];
    notifyListeners();
  }

  void startGame(){
    if (playerNames.isNotEmpty) {
      final random = Random();
      ignorantPlayerIndex = random.nextInt(playerNames.length);
      notifyListeners();
    }
  }
}
