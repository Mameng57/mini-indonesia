import 'package:flutter/material.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

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
                  width: deviceWidth / 4,
                  height: deviceHeight / 8,
                  image: const AssetImage(
                    "assets/images/lovo.png",
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Text(
                        "Lovo Photography",
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                      ),
                      Text(
                        "Capture your moment",
                        style: Theme.of(context).textTheme.headline3,
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
                  height: deviceHeight / 6,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 50,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, "/landing");
                        },
                        child: const Text("Get Started"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Syarat & Ketentuan",
                          style: Theme.of(context).textTheme.bodyText1,
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
