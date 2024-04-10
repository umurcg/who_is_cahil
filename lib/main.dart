import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SetupPage(title: 'Setup Page'),
      ),
    );
  }
}

class GameState extends ChangeNotifier {
  List<String> playerNames = [];

  void addNewPlayer(String name) {
    playerNames.add(name);
    notifyListeners();
  }
}

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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Text("Number of users: ${gameState.playerNames.length}"),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Player Name",
              ),
            ),
            TextButton(
              onPressed: assignNewUser,
              style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.blue, width: 2))),
              child: const Text("Assign"),
            )
          ],
        ));
  }

  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }
}
