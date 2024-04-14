import 'package:flutter/material.dart';
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
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var gameState = context.watch<GameState>();

    void assignNewUser() {
      var enteredName = _nameController.text.trim();
      if (enteredName.isNotEmpty) {
        gameState.addNewPlayer(enteredName);
        _nameController.clear();
      }
    }

    void clearUsers() {
      gameState.clearUsers();
    }

    void startGame() {
      gameState.startGame();
      Navigator.pushNamed(context, '/gameSession');
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Text("There are ${gameState.playerNames.length} of users:"),
            for (String name in gameState.playerNames) Text(name),
            Row(
              children: [
                Expanded(
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
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: clearUsers, child: const Text("Clear")),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: startGame,          
              child: const Text("Start Game")
            )
          ],
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
