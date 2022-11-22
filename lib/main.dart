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
        body: const WordGenerator(),
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
  final _suggestions = <WordPair>[];
  final _fontSize = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: const EdgeInsets.all(2.0),
        itemBuilder: (BuildContext context, int idx) {
      if (idx.isOdd) {
        return const Divider();
      }

      final index = idx ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }

      return ListTile(
        title: Text(_suggestions[index].asPascalCase, style: _fontSize,),
        trailing: const Icon(
            Icons.favorite_border,
            color: Colors.red,
            semanticLabel: "save",
        ),
      );
    });
  }
}
