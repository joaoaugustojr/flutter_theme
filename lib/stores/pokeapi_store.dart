import 'dart:convert';

import 'package:flutter_learning/consts/consts_api.dart';
import 'package:flutter_learning/models/pokeapi.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI pokeAPI;

  @action
  fetchPokemonList() {
    loadPokeAPI().then((pokeList) {
      pokeAPI = pokeList;
    });
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsAPI.baseURL);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("error on load data PokeAPI: ${stacktrace.toString()}");
      return null;
    }
  }
}
