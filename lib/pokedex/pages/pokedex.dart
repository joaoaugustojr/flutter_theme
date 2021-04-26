import 'package:flutter/material.dart';
import 'package:flutter_learning/consts/consts_app.dart';
import 'package:flutter_learning/models/pokeapi.dart';
import 'package:flutter_learning/pokedex/components/app_bar.dart';
import 'package:flutter_learning/pokedex/components/poke_item.dart';
import 'package:flutter_learning/stores/pokeapi_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
                child: Container(
                  child: Observer(
                    name: 'ListaHomePage',
                    builder: (BuildContext context) {
                      return (pokeApiStore.pokeAPI != null)
                          ? AnimationLimiter(
                              child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.all(12),
                              addAutomaticKeepAlives: true,
                              itemCount: pokeApiStore.pokeAPI.pokemon.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                Pokemon pokemon = pokeApiStore.getPokemon(
                                  index: index,
                                );
                                return AnimationConfiguration.staggeredGrid(
                                  position: index,
                                  columnCount: 2,
                                  duration: Duration(milliseconds: 200),
                                  child: ScaleAnimation(
                                    child: GestureDetector(
                                      child: PokeItem(
                                        index: index,
                                        name: pokemon.name,
                                        types: pokemon.type,
                                        image: pokeApiStore.getImage(
                                          number: pokemon.num,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) {
                                              return Container();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ))
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
