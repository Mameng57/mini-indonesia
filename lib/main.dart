import 'package:flutter/material.dart';
import 'package:lovo_photography/screens/launch_page.dart';

void main() => runApp(const LovoApp());

class LovoApp extends StatelessWidget {
  const LovoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lovo Photography App",
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0x00f5af35),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: "Poppins",
            fontSize: 60,
            fontWeight: FontWeight.w700,
            height: 1,
            color: Color(0xFF526B89),
          ),
          headline2: TextStyle(
            fontFamily: "Poppins",
            fontSize: 30,
            fontWeight: FontWeight.w400,
            height: 1,
            color: Color(0xFF526B89),
          ),
          bodyText1: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black54,
          ),
        ),
      ),
      routes: {
        '/': (context) => const SafeArea(child: LaunchPage()),
      },
    );
  }
}
