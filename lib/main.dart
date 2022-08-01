import 'package:flutter/material.dart';
import 'package:mini_indonesia/landing_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 153, 117, 136);
    const secondaryColor = Color.fromARGB(255, 247, 238, 231);
    const additionalColor = Color.fromARGB(255, 214, 193, 184);

    return MaterialApp(
      title: "Mini Indonesia",
      theme: ThemeData(
        backgroundColor: secondaryColor,
        primaryColor: primaryColor,
        primaryTextTheme: const TextTheme(
          headline1: TextStyle(
            color: primaryColor,
            fontFamily: "Rubik",
            fontSize: 55,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: secondaryColor,
            fontFamily: "Rubik",
            fontWeight: FontWeight.w600,
          ),
          bodyText2: TextStyle(
            color: additionalColor,
            fontFamily: "Rubik",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      routes: {
        '/': (context) => const SafeArea(child: LandingPage()),
      },
    );
  }
}
