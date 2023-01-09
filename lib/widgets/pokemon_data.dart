// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PokemonData extends StatefulWidget {
  String type;
  String data;

  PokemonData({super.key, required this.type, required this.data});

  @override
  State<PokemonData> createState() => _PokemonDataState();
}

class _PokemonDataState extends State<PokemonData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.type,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          widget.data,
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
