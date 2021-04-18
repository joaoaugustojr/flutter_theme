import 'package:flutter/material.dart';
import 'package:flutter_learning/questao.dart';
import 'package:flutter_learning/resposta.dart';
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
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': ['Azul', 'Branco', 'Vermelho', 'Roxo', 'Outra']
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': ['Cavalo', 'Cachorro', 'Gato', 'Outro']
    },
    {
      'pergunta': 'Qual é o seu hobby favorito?',
      'respostas': ['Viajar', 'Desenhar', 'Praticar Esportes', 'Outro']
    },
    {
      'pergunta': 'Qual é o sua cidade favorita?',
      'respostas': ['São Paulo', 'Rio de Janeiro', 'Catalão', 'Outra']
    },
    {
      'pergunta': 'Qual é o seu jogo favorito?',
      'respostas': ['Cartas', 'Dama', 'Xadrez', 'Outro']
    },
    {
      'pergunta': 'Qual é a sua fruta favorita?',
      'respostas': ['Banana', 'Maça', 'Uva', 'Outra']
    },
    {
      'pergunta': 'Qual é a sua comida favorita?',
      'respostas': ['Arroz', 'Feijão', 'Carne', 'Outra']
    }
  ];

  void _responder() {
    if (isPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  void _responderNovamente() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  bool get isPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List respostas = isPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('João Augusto'),
        ),
        body: Center(
          child: isPerguntaSelecionada
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Questao(_perguntas[_perguntaSelecionada]['pergunta']),
                    ...respostas.map((r) => Resposta(r, _responder)).toList()
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Parabens!!',
                      style: TextStyle(fontSize: 28),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _responderNovamente();
                      },
                      child: Text('Responder Novamente'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
