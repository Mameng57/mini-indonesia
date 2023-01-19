import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lovo_photography/models/session.dart';
import 'package:lovo_photography/services/base_client.dart';
import 'package:lovo_photography/widgets/promotion_card.dart';
import 'package:lovo_photography/widgets/session_card.dart';
import 'package:lovo_photography/models/user.dart';
import 'package:lovo_photography/models/promotion.dart';

class HomePage extends StatefulWidget {
  HomePage(this.userData, {Key? key}) : super(key: key);
  static const routeName = "/home";

  final User userData;
  final List<Promotion> promotions = [
    Promotion(
      title: "Promo Baru!",
      subtitle: "Dapatkan diskon 30% paket foto graduasi!",
      image: "assets/images/p_graduate.png",
    ),
    Promotion(
      title: "Selamat Hari Ibu!",
      subtitle: "Diskon 30% untuk semua paket dengan sang Ibu",
      image: "assets/images/p_mother.png",
    ),
    Promotion(
      title: "Selamat Anniversary!",
      subtitle:
          "Dapatkan diskon 15% dan bonus 1 change untuk semua paket couple.",
      image: "assets/images/p_lover.png",
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<Session> listSession = [];

  Future<List<Session>> getSessions() async {
    var response = jsonDecode(await BaseClient()
        .post("/session/${widget.userData.idUser}", {}));

    if (response['session'].runtimeType == String) {
      return [];
    }

    return List.generate(response['session'].length, (index) {
      return Session.fromJson(response['session'][index]);
    });
  }

  @override
  void initState() {
    super.initState();

    getSessions().then((list) => {
      setState(() {
        listSession = list;
        isLoading = false;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return isLoading
    ? Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
    )
    : Stack(
      children: [
        Image(
          width: w,
          height: h,
          image: const AssetImage("assets/images/background_2.png"),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.15),
          appBar: PreferredSize(
            preferredSize: Size(w, h / 2.2),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hello ${widget.userData.name}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  "Apa kabarnya kamu hari ini?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall,
                                )
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: const AssetImage(
                                "assets/images/lovo.png"),
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: w,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.primary,
                          offset: const Offset(5, 7),
                          blurRadius: 250,
                        )
                      ]),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widget.promotions.map(
                                  (promotion) => PromotionCard(promotion)
                          ).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Text(
                  "Sesi Foto Anda",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Divider(
                  height: 25,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: listSession
                          .map((session) => SessionCard(session))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
