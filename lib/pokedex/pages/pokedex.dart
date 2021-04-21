import 'package:flutter/material.dart';
import 'package:flutter_learning/consts/consts_app.dart';
import 'package:flutter_learning/models/pokeapi.dart';
import 'package:flutter_learning/pokedex/components/app_bar.dart';
import 'package:flutter_learning/stores/pokeapi_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokedex - João Augusto",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore pokeApiStore;

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -(240 / 4.5),
            left: MediaQuery.of(context).size.width - (240 / 1.6),
            child: Opacity(
              child: Image.asset(
                ConstsApp.darkPokeball,
                height: 240,
                width: 240,
              ),
              opacity: .1,
            ),
          ),
          Container(
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).padding.top,
              ),
              AppBarWidget(),
              Expanded(
                child: Observer(
                  builder: (BuildContext context) {
                    PokeAPI _pokeAPI = pokeApiStore.pokeAPI;
                    return (_pokeAPI != null)
                        ? ListView.builder(
                            itemCount: _pokeAPI.pokemon.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_pokeAPI.pokemon[index].name),
                              );
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
