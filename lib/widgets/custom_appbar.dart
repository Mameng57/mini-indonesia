import 'package:flutter/material.dart';
import 'package:lovo_photography/models/promotion.dart';
import 'package:lovo_photography/widgets/promotion_card.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    required this.username,
    Key? key,
  }) : super(key: key);

  final String? username;
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
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    return Container(
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
                        "Hello $username",
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
                children: promotions.map(
                  (promotion) => PromotionCard(promotion)
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
