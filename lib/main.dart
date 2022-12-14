import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Startup Name Generator",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white
        ),
      ),
      home: const WordGenerator(),
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
  final _saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (BuildContext context, int idx) {
            if (idx.isOdd) {
              return const Divider();
            }

            final index = idx ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }

            final alreadySaved = _saved.contains(_suggestions[index]);

            return ListTile(
              title: Text(_suggestions[index].asPascalCase, style: _fontSize,),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                semanticLabel: alreadySaved ? "Remove from saved" : "Save",
              ),
              onTap: () {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                }
                else {
                  _saved.add(_suggestions[index]);
                }
              },
            );
          }),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (BuildContext context) {
          final tiles = _saved.map((pair) {
            return ListTile(
              title: Text(
              pair.asPascalCase,
              style: _fontSize),
          );
          });

          final divided = tiles.isNotEmpty ?
          ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
                title: const Text('Saved Suggestion')
            ),
            body: ListView(children: divided),
          );
        })
    );
  }
}
