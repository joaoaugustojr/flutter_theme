import 'package:flutter/material.dart';
import 'package:flutter_learning/components/already_have_an_account_check.dart';
import 'package:flutter_learning/components/rounded_button.dart';
import 'package:flutter_learning/components/rounded_input_field.dart';
import 'package:flutter_learning/components/rounded_password_field.dart';
import 'package:flutter_learning/consts/consts_theme.dart';
import 'package:flutter_learning/pokedex/pages/pokedex.dart';
import 'package:flutter_learning/screems/signup_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onSignIn;

  const LoginScreen({Key key, this.onSignIn}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/main_top.png"),
              width: size.width * .35,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/login_bottom.png"),
              width: size.width * .4,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset(
                      "assets/images/login.svg",
                      height: size.height * 0.25,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundedInputField(
                      hintText: "Seu Email",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                    RoundedButton(
                      text: "Fazer Login",
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Pokedex();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ),
                        );
                      },
                      login: true,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedPasswordFiled {}
