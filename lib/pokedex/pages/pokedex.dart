import 'package:flutter/material.dart';
import 'package:flutter_learning/consts/consts_app.dart';
import 'package:flutter_learning/pokedex/components/app_bar.dart';

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

class HomePage extends StatelessWidget {
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
          AppBarWidget(),
        ],
      ),
    );
  }
}
