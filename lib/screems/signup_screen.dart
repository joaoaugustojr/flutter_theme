import 'package:flutter/material.dart';
import 'package:flutter_learning/components/already_have_an_account_check.dart';
import 'package:flutter_learning/components/or_divider.dart';
import 'package:flutter_learning/components/rounded_button.dart';
import 'package:flutter_learning/components/rounded_input_field.dart';
import 'package:flutter_learning/components/rounded_password_field.dart';
import 'package:flutter_learning/components/social_icon.dart';
import 'package:flutter_learning/consts/consts_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              child: Image.asset("assets/images/signup_top.png"),
              width: size.width * 0.35,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png"),
              width: size.width * 0.23,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SignUp",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SvgPicture.asset(
                      "assets/images/signup.svg",
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
                      text: "Criar Conta",
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      press: () {},
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      login: false,
                    ),
                    OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIcon(
                          iconSrc: "assets/icons/facebook.svg",
                          press: () {},
                        ),
                        SocialIcon(
                          iconSrc: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                        SocialIcon(
                          iconSrc: "assets/icons/google-plus.svg",
                          press: () {},
                        ),
                      ],
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
