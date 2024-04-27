import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;

class InstructionPage extends StatelessWidget {
  Future<String> loadInstructions() async {
    return await rootBundle.loadString('assets/instructions.txt');
  }

  const InstructionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Instructions')),
        body: FutureBuilder(
            future: loadInstructions(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(
                      child: Text("Error loading instructions"));
                } else {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      snapshot.data ?? 'No instructions found.',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
