class PokemonModel {
  String name;
  String image;
  List<String> type;

  PokemonModel(this.name, this.image, this.type);

  PokemonModel.fromJSON(Map<String, dynamic> json) {
    this.name = json['name'];
    this.image = json['imageUrl'];
    this.type = json.containsKey('types') ? json['types'].cast<String>() : [''];
  }
}
