import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lovo_photography/screens/launch_page.dart';
import 'package:lovo_photography/screens/landing_page.dart';
import 'package:lovo_photography/screens/login_page.dart';

void main() => runApp(const LovoApp());

class LovoApp extends StatelessWidget {
  const LovoApp({Key? key}) : super(key: key);
  final Color _primaryColor = const Color(0xFF526B89);
  final Color _bgColor = const Color(0xFF343F49);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lovo Photography App",
      theme: ThemeData.dark().copyWith(
        primaryColor: _primaryColor,
        backgroundColor: _bgColor,
        scaffoldBackgroundColor: _bgColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: "Poppins",
            fontSize: 55,
            fontWeight: FontWeight.w700,
            height: 1,
            color: _primaryColor,
          ),
          headline2: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: _primaryColor,
          ),
          headline3: TextStyle(
            fontFamily: "Poppins",
            fontSize: 25,
            fontWeight: FontWeight.w400,
            height: 1,
            color: _primaryColor,
          ),
          headline4: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: _primaryColor,
          ),
          bodyText1: TextStyle(
            fontFamily: "Poppins",
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: _primaryColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFCDBFAA),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.5, color: _primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: _primaryColor),
            borderRadius: BorderRadius.circular(15),
          )
        ),
      ),
      initialRoute: "/",
      routes: {
        LaunchPage.routeName: (context) => const LaunchPage(),
      },
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case LandingPage.routeName:
            return PageTransition(
              type: PageTransitionType.topToBottomPop,
              duration: const Duration(milliseconds: 500),
              childCurrent: const LaunchPage(),
              child: const LandingPage(),
            );
          case LoginPage.routeName:
            return PageTransition(
              type: PageTransitionType.fade,
              child: const LoginPage(),
            );
          default:
            return null;
        }
      },
    );
  }
}
