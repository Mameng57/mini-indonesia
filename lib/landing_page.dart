import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(111),
        child: Container(
          width: double.infinity,
          height: 500,
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FeatherIcons.settings,
                color: Theme.of(context).primaryColor,
              ),
              Icon(
                FeatherIcons.menu,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Align(
            alignment: Alignment.bottomCenter,
            child: Image(
              image: AssetImage("assets/images/background.jpg"),
            ),
          ),
          Text(
            "READY TO EXPLORE INDONESIA ?",
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          Positioned(
            top: 200,
            child: TextButton(
              onPressed: () {},
              child: Container(
                width: 125,
                height: 50,
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Text(
                  "LET'S GO !",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
