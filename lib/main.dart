import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_cahil/game_session_page.dart';
import 'package:who_is_cahil/game_state.dart';
import 'package:who_is_cahil/setup_page.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<List<String>> loadWordList() async {
  // Load the JSON string
  String jsonString = await rootBundle.loadString('assets/words_tr.json');
  // Decode the JSON string into a dynamic structure
  var jsonMap = json.decode(jsonString);
  // Convert the dynamic list into a List<String>
  List<String> words = List<String>.from(jsonMap['words']);
  return words;
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  List<String> words = await loadWordList();
  runApp(MyApp(words));
  
}

class MyApp extends StatelessWidget {
  final List<String> words;

  const MyApp(this.words, {super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameState(words),
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
