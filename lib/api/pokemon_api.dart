import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_tcg/model/pokemon_model.dart';

const String url = 'https://api.pokemontcg.io/v1/cards/';

Future<PokemonModel> getPokemon() async {
  var response = await http.get(url);
  Map<String, dynamic> responseJson = jsonDecode(response.body);
  return PokemonModel.fromJSON(responseJson);
}

Future<List<PokemonModel>> getPokemons() async {
  var response = await http.get(url);
  var pokemons = new List<PokemonModel>();
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    jsonResponse['cards'].forEach((pokemon) {
      pokemons.add(new PokemonModel.fromJSON(pokemon));
    });
    return pokemons;
  } else {
    throw Exception('Failed to load pokemons from API');
  }
}
