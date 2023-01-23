import 'package:flutter/material.dart';
import 'package:lovo_photography/models/package.dart';

class InfoMenu extends StatelessWidget {
  InfoMenu({
    required this.listPackage,
    Key? key,
  }) : super(key: key);

  final List<Package> listPackage;
  final List<String> listImages = [
    "assets/images/pk_daisy.png",
    "assets/images/pk_rose.png",
    "assets/images/pk_ivy.png",
    "assets/images/pk_outdoor.png",
    "assets/images/pk_formal.png",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Informasi Paket", style: Theme.of(context).textTheme.headlineMedium,),
            Text(
              "Informasi paket dapat berubah sewaktu-waktu.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Divider(thickness: 3,),
            SizedBox(
              width: size.width,
              height: size.height,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listPackage.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            image: DecorationImage(
                              scale: 5,
                              image: AssetImage(listImages[index])
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        height: 30,
                        color: Colors.white,
                        indent: 25,
                        endIndent: 25,
                      ),
                      Text(
                        "Paket ${listPackage[index].namePackage}",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        )
                      ),
                      Text(
                        "Dapat ${listPackage[index].downloadCount} foto",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary
                        ),
                      ),
                      Text(
                        "Cetak fisik ${listPackage[index].printCount} foto",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
