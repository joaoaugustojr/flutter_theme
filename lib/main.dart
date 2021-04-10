import 'package:flutter/material.dart';
import 'package:flutter_learning/app.dart';

main() {
  runApp(AppWidget(title: 'João Augusto'));
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
