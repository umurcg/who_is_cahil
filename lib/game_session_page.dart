import 'package:flutter/material.dart';

class GameSessionPage extends StatelessWidget{
  const GameSessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Game Page"),
        ),
        body: const Column(
            children: [
              Text("Game Page")
            ],

        )
    );
  }
}

