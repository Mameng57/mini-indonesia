import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withAlpha(245),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  width: deviceWidth / 1.2,
                  height: deviceHeight / 2,
                  margin: const EdgeInsets.only(top: 75),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withAlpha(255),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  top: deviceHeight / 6,
                  child: Image(
                    width: deviceWidth / 1.2,
                    image: const AssetImage("assets/images/camera.png"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: deviceHeight / 3,
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Semua foto anda, dalam satu tempat",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.download,
                      color: const Color.fromARGB(255, 209, 33, 108,),
                      size: deviceWidth / 8,
                    ),
                    FaIcon(
                      FontAwesomeIcons.print,
                      color: const Color.fromARGB(255, 40, 109, 159,),
                      size: deviceWidth / 8,
                    ),
                    FaIcon(
                      FontAwesomeIcons.peopleGroup,
                      color: const Color.fromARGB(255, 89, 164, 35,),
                      size: deviceWidth / 8,
                    ),
                  ],
                ),
                Text(
                  "Unduh, cetak, ataupun abadikan, terserah anda selama "
                  "menjadi member dari Lovo Photography",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
