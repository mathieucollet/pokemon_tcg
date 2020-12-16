import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tcg/api/pokemon_api.dart';
import 'package:pokemon_tcg/model/pokemon_model.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: getPokemons(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> data = snapshot.data;
          return _pokemonListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _pokemonListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].name, data[index].image);
        });
  }

  ListTile _tile(String title, String imageUrl) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        leading: CachedNetworkImage(imageUrl: imageUrl),
      );
}
