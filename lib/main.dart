import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_cahil/game_session_page.dart';
import 'package:who_is_cahil/game_state.dart';
import 'package:who_is_cahil/setup_page.dart';

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
        title: 'Who Is Cahil',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => const SetupPage(title: 'Setup Page'),
          '/gameSession': (context) => const GameSessionPage()
        },
      ),
    );
  }
}
