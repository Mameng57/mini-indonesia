import 'package:flutter/material.dart';

import 'package:lovo_photography/models/description.dart';
import 'package:lovo_photography/widgets/custom_card.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final Map<String, double> size = {
      'width': deviceWidth,
      'height': deviceHeight,
    };
    const List<Color> colors = [
      Color(0xFF1C79A9),
      Color(0xFFC05C9D),
      Color(0xFFB98E5B),
    ];
    const List<Description> descriptions = [
      Description(
        image: "assets/images/s_camera.png",
        title: "Download Foto",
        subtitle: "Semua foto anda, dapat diunduh dengan mudah "
            "kapanpun di manapun",
      ),
      Description(
        image: "assets/images/s_printer.png",
        title: "Pilih Cetak Foto",
        subtitle: "Setelah sesi foto studio, pilih foto yang ingin dicetak "
            "berdasarkan keinginan anda.",
      ),
      Description(
        image: "assets/images/s_people.png",
        title: "Bagikan Foto",
        subtitle: "Bagikan kenangan indahmu yang abadi "
            "agar dikenang juga oleh orang-orang yang kamu sayangi.",
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            width: deviceWidth,
            height: deviceHeight,
            image: const AssetImage(
              "assets/images/background_2.png",
            ),
          ),
          SizedBox(
            width: deviceWidth,
            height: deviceHeight / 1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Pada Lovo Photography app ini kamu bisa :",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
                ...colors
                    .asMap()
                    .map(
                      (index, color) => MapEntry(
                        index,
                        CustomCard(
                          size,
                          color,
                          descriptions[index],
                        ),
                      ),
                    )
                    .values
                    .toList(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colors[0],
                          colors[1],
                        ],
                      )),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 50,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Masuk Akun"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
