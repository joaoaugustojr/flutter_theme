import 'package:flutter/material.dart';
import 'package:flutter_learning/questao.dart';
import 'package:flutter_learning/resposta.dart';

class Questionario extends StatelessWidget {
  final perguntas;
  final perguntaSelecionada;
  final respostas;
  final Function() responder;

  Questionario(
      this.perguntas, this.perguntaSelecionada, this.respostas, this.responder);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Questao(perguntas[perguntaSelecionada]['pergunta']),
          ...respostas.map((r) => Resposta(r, responder)).toList()
        ],
      ),
    );
  }
}
