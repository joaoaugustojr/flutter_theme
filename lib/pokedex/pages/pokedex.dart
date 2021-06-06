import 'package:flutter/material.dart';
import 'package:flutter_learning/consts/consts_app.dart';
import 'package:flutter_learning/models/pokeapi.dart';
import 'package:flutter_learning/pokedex/components/app_bar.dart';
import 'package:flutter_learning/pokedex/components/poke_item.dart';
import 'package:flutter_learning/pokedex/pages/poke-details.dart';
import 'package:flutter_learning/stores/pokeapi_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PokeApiStore>(
          create: (_) => PokeApiStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Pokedex - João Augusto",
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pokeApiStore = Provider.of<PokeApiStore>(context);

    if (_pokeApiStore.pokeAPI == null) {
      _pokeApiStore.fetchPokemonList();
    }
    print(MediaQuery.of(context).size.width);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: MediaQuery.of(context).size.height - 193.5,
            left: MediaQuery.of(context).size.width - 155,
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
                      return (_pokeApiStore.pokeAPI != null)
                          ? AnimationLimiter(
                              child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.all(12),
                              addAutomaticKeepAlives: true,
                              itemCount: _pokeApiStore.pokeAPI.pokemon.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                Pokemon pokemon = _pokeApiStore.getPokemon(
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
                                        image: _pokeApiStore.getImage(
                                          number: pokemon.num,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) {
                                              return PokeDetais(
                                                index: index,
                                              );
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
