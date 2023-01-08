import 'package:flutter/material.dart';
import 'package:pokedex/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pokedex',
      home: Home(),
    );
  }
}
