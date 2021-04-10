import 'package:flutter/material.dart';
import 'package:flutter_learning/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage'), actions: [
        CustomSwitch(),
      ]),
      // body: Center(
      //   child: GestureDetector(
      //     child: Text(
      //       'Contador: $counter',
      //       style: TextStyle(color: Colors.black, fontSize: 20),
      //     ),
      //     onTap: () {
      //       setState(() {
      //         counter++;
      //       });
      //     },
      //   ),
      // ),
      body: Center(
        child: CustomSwitch(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
