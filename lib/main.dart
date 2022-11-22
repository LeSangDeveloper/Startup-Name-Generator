import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "Startup Name Generator",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Startup Name")
        ),
        body: Center(
          child: Text(wordPair.asPascalCase)
        )
      ),
    );
  }
}

class WordGenerator extends StatefulWidget {
  const WordGenerator({Key? key}) : super(key: key);

  @override
  State<WordGenerator> createState() => _WordGeneratorState();
}

class _WordGeneratorState extends State<WordGenerator> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int idx) {
        return const Divider();
    });
  }
}
