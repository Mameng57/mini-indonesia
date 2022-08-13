import 'package:flutter/material.dart';
import 'package:lovo_photography/landing_page.dart';

void main() => runApp(LovoApp());

class LovoApp extends StatelessWidget {
  const LovoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lovo Photography App",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => LandingPage(),
      },
    );
  }
}
