import 'package:flutter/material.dart';
import 'package:lovo_photography/screens/launch_page.dart';
import 'package:lovo_photography/screens/landing_page.dart';

void main() => runApp(const LovoApp());

class LovoApp extends StatelessWidget {
  const LovoApp({Key? key}) : super(key: key);
  final Color _primaryColor = const Color(0xFF526B89);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lovo Photography App",
      theme: ThemeData.dark().copyWith(
        primaryColor: _primaryColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: "Poppins",
            fontSize: 60,
            fontWeight: FontWeight.w700,
            height: 1,
            color: _primaryColor,
          ),
          headline2: TextStyle(
            fontFamily: "Poppins",
            fontSize: 30,
            fontWeight: FontWeight.w400,
            height: 1,
            color: _primaryColor,
          ),
          bodyText1: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black54,
          ),
        ),
      ),
      routes: {
        '/': (context) => const SafeArea(child: LaunchPage()),
        '/landing': (context) => const SafeArea(child: LandingPage()),
      },
    );
  }
}
