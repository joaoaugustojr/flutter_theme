import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/consts/consts_app.dart';
import 'package:flutter_learning/models/pokeapi.dart';
import 'package:flutter_learning/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetais extends StatelessWidget {
  final int index;

  const PokeDetais({Key key, this.index}) : super(key: key);

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    final _pokeApiStore = Provider.of<PokeApiStore>(context);
    Pokemon _pokemon = _pokeApiStore.getPokemon(index: index);
    Color _backgroundColor = ConstsApp.getColorType(type: _pokemon.type[0]);
    CachedNetworkImage _image = _pokeApiStore.getImage(number: _pokemon.num);
    return Container(
      child: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: _backgroundColor,
          title: Opacity(
            opacity: 0,
            child: Text(
              _pokemon.name,
              style: TextStyle(fontFamily: 'Google'),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
            ),
            SlidingSheet(
              elevation: 0,
              cornerRadius: 16,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [.7, 1],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              builder: (context, state) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                );
              },
            ),
            Positioned(
              top: 60,
              child: SizedBox(
                height: 150,
                child: PageView.builder(
                    itemCount: _pokeApiStore.pokeAPI.pokemon.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: _image,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
