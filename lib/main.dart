import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lovo_photography/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lovo_photography/models/session.dart';
import 'package:lovo_photography/models/user.dart';
import 'package:lovo_photography/screens/home_page.dart';
import 'package:lovo_photography/screens/photo_page.dart';
import 'package:lovo_photography/screens/launch_page.dart';
import 'package:lovo_photography/screens/landing_page.dart';
import 'package:lovo_photography/screens/login_page.dart';
import 'package:lovo_photography/screens/preview_page.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const LovoApp());
}

class LovoApp extends StatelessWidget {
  const LovoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("id", "ID"),
      ],
      title: "Lovo Photography App",
      theme: customTheme(),
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
          case PhotoPage.routeName:
            final photoData = routeSettings.arguments as Session;

            return PageTransition(
              type: PageTransitionType.fade,
              child: PhotoPage(photoData),
            );
          case PreviewPage.routeName:
            final imageUrl = routeSettings.arguments as String;

            return PageTransition(
              type: PageTransitionType.fade,
              child: PreviewPage(imageUrl),
            );
          default:
            return null;
        }
      },
    );
  }
}
