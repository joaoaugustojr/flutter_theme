import 'package:flutter/material.dart';
import 'package:flutter_learning/consts/consts_app.dart';

class PokeItem extends StatelessWidget {
  final String name;
  final int index;
  final Color color;
  final Widget image;
  final List<String> types;

  const PokeItem({
    Key key,
    this.name,
    this.index,
    this.color,
    this.image,
    this.types,
  }) : super(key: key);

  List<Widget> getTypes() {
    return types.map((type) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(80, 255, 255, 255),
          ),
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              type.trim(),
              style: TextStyle(
                fontFamily: 'Google',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...getTypes(),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  opacity: .2,
                  child: Image.asset(
                    ConstsApp.whitePokeball,
                    height: 90,
                    width: 90,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 90,
                  width: 90,
                  child: image,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: ConstsApp.getColorType(type: types[0]),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
