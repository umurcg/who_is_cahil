import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:who_is_cahil/game_state.dart';
import 'package:who_is_cahil/main.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key, required this.title});
  final String title;


  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {

  late AnimationController _controller;
  late Animation<double> _fadeAnimations;

  @override
  Widget build(BuildContext context) {
    var gameState = context.watch<GameState>();

    void clearUsers() {
      gameState.clearUsers();
    }

    void startGame() {
      gameState.startGame();
      Navigator.pushNamed(context, '/gameSession');
    }

    void openInstructions(){
      Navigator.pushNamed(context, "/instructionPage");
    }

    const buttonDelta=30.0;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          PlayerList(gameState: gameState),              
          const SizedBox(height: buttonDelta),
          ElevatedButton(onPressed: startGame, child: const Text("Start Local Game")),
          const SizedBox(height: buttonDelta),
          ElevatedButton(onPressed: startGame, child: const Text("Start Online Game")),
          const SizedBox(height: buttonDelta),
          ElevatedButton(onPressed: openInstructions, child: const Text("Instructions")),
        ],
      ),
    ));
  }
}

class PlayerList extends StatefulWidget {
  const PlayerList({
    super.key,
    required this.gameState,
  });

  final GameState gameState;

  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  final TextEditingController _nameController = TextEditingController();

  void assignNewUser() {
    var enteredName = _nameController.text.trim();
    if (enteredName.isNotEmpty) {
      widget.gameState.addNewPlayer(enteredName);
      _nameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Players:"),
        for (String name in widget.gameState.playerNames) Text(name),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Player Name",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: assignNewUser,
              child: const Text("Assign"),
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}




