import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_cahil/game_state.dart';

class GameSessionPage extends StatelessWidget {
  const GameSessionPage({super.key});
  

  @override
  Widget build(BuildContext context) {

    var gameState=context.watch<GameState>();

    void exitGame() {
      gameState.exitGame();
      Navigator.pop(context);
    }  

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Game Page"),
        ),
        body: Column(
          children: [          
            const Text("Picked word:"),
            Text(gameState.pickedWord),
            ElevatedButton(onPressed: exitGame, child: const Text("Exit Game"))
            ],
        ));
  }
}
