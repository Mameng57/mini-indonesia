import 'package:flutter/material.dart';
import 'package:lovo_photography/screens/landing_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image(
            width: deviceWidth,
            height: deviceHeight,
            image: const AssetImage(
              "assets/images/background_1.png",
            ),
          ),
          Container(
            width: deviceWidth,
            height: deviceHeight,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  width: deviceWidth / 2,
                  height: deviceHeight / 4,
                  image: const AssetImage(
                    "assets/images/lovo.png",
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Text(
                        "Lovo Photography",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                      ),
                      Text(
                        "Capture your moment",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ],
                  ),
                ),
                Image(
                  width: deviceWidth / 1.5,
                  height: deviceHeight / 2,
                  image: const AssetImage("assets/images/camera.png"),
                ),
                SizedBox(
                  height: deviceHeight / 8,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 50,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, LandingPage.routeName);
                        },
                        child: const Text("Get Started"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Syarat & Ketentuan",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
