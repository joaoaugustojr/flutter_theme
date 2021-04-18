import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() responderNovamente;

  Resultado(this.responderNovamente);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Parabens!!',
          style: TextStyle(fontSize: 28),
        ),
        ElevatedButton(
          onPressed: () {
            responderNovamente();
          },
          child: Text('Responder Novamente'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          ),
        ),
      ],
    );
  }
}
