import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tcg/api/pokemon_api.dart';
import 'package:pokemon_tcg/model/pokemon_model.dart';
import 'package:pokemon_tcg/page/home/widget/pokemon_list_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonModel _pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text('Pokemon TCG App'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              PokemonModel pokemonModel = await getPokemon();
              setState(() {
                _pokemonModel = pokemonModel;
              });
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Flexible(
            child: PokemonListView(),
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_pokemonModel == null) {
      return Center(
        child: Text('Snif snif, no pokemon'),
      );
    } else {
      return Column(
        children: [
          Text(_pokemonModel.name),
          Container(height: 21.0),
          CachedNetworkImage(imageUrl: _pokemonModel.image),
        ],
      );
    }
  }
}
