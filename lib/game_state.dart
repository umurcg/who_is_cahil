import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';

class GameState extends ChangeNotifier {
  
  List<String> playerNames = [];
  List<String> words;
  int ignorantPlayerIndex = -1;
  String pickedWord="";
  final random= Random();

  GameState(this.words);
  

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
      pickedWord=pickRandomWord();
      notifyListeners();      
    }
  }

  void exitGame(){
    pickedWord="";
  }

  String pickRandomWord(){
    if(words.isEmpty){
        return "No words available";
    }
    return words[random.nextInt(words.length)];
  }
}
