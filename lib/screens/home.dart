import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/widgets/custom_app_bar.dart';
import 'package:pokedex/widgets/input_search.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  Pokemon pokemon = Pokemon("1", "charizard",
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png");

  Future<Pokemon> getPkmn(value) async {
    var url = Uri.https("www.pokeapi.co", '/api/v2/pokemon/$value');
    final response = await http.get(url);

    if (response.statusCode == 200 && value != "") {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      pokemon = Pokemon(jsonData["id"].toString(), jsonData["name"],
          jsonData["sprites"]["front_default"]);
      pokemon.weight = jsonData["weight"].toString();
      pokemon.height = jsonData["height"].toString();

      var type = "";
      for (var a in jsonData["types"]) {
        type += a["type"]["name"];
        type += " ";
      }
      pokemon.type = type;
    }
    setState(() {
      pokemon = pokemon;
    });
    return pokemon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: [
                InputSearch(
                  controller: _controller,
                  onSubmitted: getPkmn,
                ),
                PokemonCard(
                  pokemon: pokemon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
