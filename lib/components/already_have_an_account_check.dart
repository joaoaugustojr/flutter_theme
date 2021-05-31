import 'package:flutter/material.dart';
import 'package:flutter_learning/consts/consts_theme.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;

  const AlreadyHaveAnAccountCheck({Key key, this.login, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Não tem uma conta? " : "Tem uma conta? ",
          style: TextStyle(color: kPrimaryColor, fontSize: 14),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Criar Conta" : "Fazer Login",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
