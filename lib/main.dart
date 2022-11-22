import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: "Startup Name Generator",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Startup Name")
        ),
        body: const Center(
          child: Text("Apple")
        )
      ),
    );
  }
}