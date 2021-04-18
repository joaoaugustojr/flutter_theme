import 'package:flutter/material.dart';
import 'package:flutter_learning/questionario.dart';
import 'package:flutter_learning/resultado.dart';

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
              ? Questionario(
                  _perguntas, _perguntaSelecionada, respostas, _responder)
              : Resultado(_responderNovamente),
        ),
      ),
    );
  }
}
