import 'package:flutter/material.dart';

import '../pages/Game.dart';
import '../pages/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hitori Game',
      debugShowCheckedModeBanner: false,
      routes: {
        // décrit la liste des routes
        '/': (context) => const Home(),
        '/game': (context) => const Game(title: 'Hitori'),
      },
    );
  }
}
