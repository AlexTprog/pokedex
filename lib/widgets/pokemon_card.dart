// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_data.dart';

class PokemonCard extends StatefulWidget {
  Pokemon pokemon;
  PokemonCard({super.key, required this.pokemon});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 300,
      margin: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.red,
          width: 5,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            color: Colors.black,
            child: Text(
              //Primera letra en mayuscula
              widget.pokemon.name.toString().replaceRange(0, 1,
                  widget.pokemon.name.toString().substring(0, 1).toUpperCase()),
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ),
          Image.network(
            widget.pokemon.sprite.toString(),
            width: 200,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
          PokemonData(
            type: "Id:",
            data: widget.pokemon.id.toString(),
          ),
          PokemonData(
            type: "Height:",
            data: widget.pokemon.height.toString(),
          ),
          PokemonData(
            type: "Weight:",
            data: widget.pokemon.weight.toString(),
          ),
          PokemonData(
            type: "Type:",
            data: widget.pokemon.type.toString(),
          ),
        ],
      ),
    );
  }
}
