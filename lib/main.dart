import 'package:flutter/material.dart';
import 'package:lovo_photography/models/user.dart';
import 'package:lovo_photography/screens/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lovo_photography/screens/launch_page.dart';
import 'package:lovo_photography/screens/landing_page.dart';
import 'package:lovo_photography/screens/login_page.dart';

void main() => runApp(const LovoApp());

class LovoApp extends StatelessWidget {
  const LovoApp({Key? key}) : super(key: key);
  final Color _primaryColor = const Color(0xFF567189);
  final Color _primaryContainerColor = const Color(0xFF7B8FA1);
  final Color _secondaryColor = const Color(0xFFCFB997);
  final Color _secondaryContainerColor = const Color(0xFFFAD6A5);
  final Color _textWhite = const Color(0xFFF7F5EB);
  final Color _bgColor = const Color(0xFF343F49);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lovo Photography App",
      theme: ThemeData.dark().copyWith(
        primaryColor: _primaryColor,
        backgroundColor: _bgColor,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: _primaryColor,
          primaryContainer: _primaryContainerColor,
          onPrimary: _textWhite,
          secondary: _secondaryColor,
          secondaryContainer: _secondaryContainerColor,
          onSecondary: _primaryColor,
          background: _bgColor,
        ),
        scaffoldBackgroundColor: _bgColor,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: "Poppins",
            fontSize: 55,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
          headlineMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
          bodyLarge: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _secondaryColor,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.5, color: _primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: _primaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
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
          case HomePage.routeName:
            final User userData = routeSettings.arguments as User;

            return PageTransition(
              type: PageTransitionType.fade,
              child: HomePage(userData),
            );
          default:
            return null;
        }
      },
    );
  }
}
