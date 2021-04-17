import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_learning/app.dart';

main() {
  // runApp(AppWidget(title: 'João Augusto'));
  runApp(
    MaterialApp(title: 'Contador de Pessoas', home: Home()),
  );
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int people = 0;
  String infoText = "Pode Entrar!";

  void changePeople(int delta) {
    setState(() {
      people += delta;
      infoText = people < 0 ? "Pode Entrar!" : "Pode Sair!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/bg1.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pessoas: $people",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        changePeople(1);
                      },
                      child: Text(
                        '+1',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        changePeople(-1);
                      },
                      child: Text(
                        '-1',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class AppWidget extends StatelessWidget {
//   final String title;

//   const AppWidget({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text(
//           title,
//           textDirection: TextDirection.ltr,
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
