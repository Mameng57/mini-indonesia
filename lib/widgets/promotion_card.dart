import 'package:flutter/material.dart';
import 'package:lovo_photography/models/promotion.dart';
import 'package:lovo_photography/widgets/capsule_button.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard(this.promotionData, {Key? key}) : super(key: key);
  final Promotion promotionData;

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: w / 1.3,
            height: w * .450,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10.0),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(promotionData.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
                const SizedBox(height: 7.0),
                SizedBox(
                  width: w * .425,
                  child: Text(promotionData.subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary)),
                ),
                const Spacer(),
                CapsuleButton(
                  color: Theme.of(context).colorScheme.primary,
                  onTap: () {},
                  child: const Text(
                    "Booking",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50.0,
            right: 30.0,
            child: SizedBox(
              height: w * .4,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary,
                  BlendMode.darken
                ),
                child: Image.asset(
                  promotionData.image,
                  width: w / 4,
                  height: h / 4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
