import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:who_is_cahil/game_state.dart';
import 'package:who_is_cahil/reveal_button.dart';

class GameSessionPage extends StatefulWidget {
  const GameSessionPage({super.key});

  @override
  State<GameSessionPage> createState() => _GameSessionPageState();
}

class _GameSessionPageState extends State<GameSessionPage> {
  int currentPlayerIndex = 0;
  bool isWorldRevealed = false;

  @override
  Widget build(BuildContext context) {
    var gameState = context.watch<GameState>();
    bool isCurrentPlayerIgnorant() =>
        gameState.ignorantPlayerIndex == currentPlayerIndex;
    bool isFinished() => currentPlayerIndex >= gameState.playerNames.length;

    void revealWord() {
      setState(() {
        isWorldRevealed = true;
      });
    }

    void hideWord() {
      setState(() {
        isWorldRevealed = false;
      });
    }

    void exitGame() {
      gameState.exitGame();
      Navigator.pop(context);
    }

    void nextPlayer() {
      setState(() {
        currentPlayerIndex++;
      });
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Game Page"),
        ),
        body: Center(
          child: Column(
            children: [
              isFinished()
                  ? const Text("Players Completed")
                  : Column(
                      children: [
                        Text(
                            "User: ${gameState.playerNames[currentPlayerIndex]}"),
                        RevealButton(
                            text: "Reveal",
                            onPressed: revealWord,
                            onReleased: hideWord),
                        const SizedBox(height: 20),
                        Opacity(
                          opacity: isWorldRevealed ? 1.0 : 0.0,
                          child: Text(
                            isCurrentPlayerIgnorant()
                                ? "You are CAHIL"
                                : gameState.pickedWord,
                            style: const TextStyle(fontSize: 50),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: nextPlayer,
                            child: const Text("Next Player")),
                      ],
                    ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: exitGame, child: const Text("Exit Game"))
            ],
          ),
        ));
  }
}
