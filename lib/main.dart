import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_learning/app.dart';
// import 'package:flutter_learning/counter_people.dart';

main() {
  print("Iniciando Projeto");
  runApp(
    // AppWidget(title: 'Learning'),
    // MaterialApp(title: 'Contador de Pessoas', home: Home()),
    PerguntaApp(),
  );
}

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  final perguntas = [
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
    'Qual é o seu hobby favorito?',
    'Qual é o sua cidade favorita?',
    'Qual é o seu jogo favorito?',
    'Qual é a sua fruta favorita?',
    'Qual é a sua comida favorita?'
  ];

  void responder() {
    setState(() {
      if (perguntaSelecionada < perguntas.length - 1) {
        perguntaSelecionada++;
      } else {
        perguntaSelecionada = 0;
      }
    });

    print("responder: $perguntaSelecionada");
    print("$perguntaSelecionada, ${perguntas.length}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('João Augusto'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(perguntas[perguntaSelecionada]),
              ElevatedButton(
                onPressed: () {
                  responder();
                },
                child: Text("Resposta 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  responder();
                },
                child: Text("Resposta 2"),
              ),
              ElevatedButton(
                onPressed: () {
                  responder();
                },
                child: Text("Resposta 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
