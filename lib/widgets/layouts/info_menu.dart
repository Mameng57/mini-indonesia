import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              height: size.height / 1.43,
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
            ),
            Text(
              "Informasi Harga",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Informasi lengkap harap hubungi kontak di bawah ini.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Divider(thickness: 3),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  ListTile(
                    selected: true,
                    selectedTileColor: const Color(0xFF25D366).withOpacity(0.5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 50,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    title: Text(
                      "+62 813-2823-8881",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: Text(
                      "Akun WhatsApp Bisnis.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  ListTile(
                    selected: true,
                    selectedTileColor: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    title: Text(
                      "Dilayani pada jam buka.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: Text(
                      "09:00 - 15:00",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: const Color(0xFF25D366).withOpacity(0.5),
                      child: Icon(
                        Icons.chat,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.transparent, height: 30,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  ListTile(
                    selected: true,
                    selectedTileColor: const Color(0xFF5B51D8).withOpacity(0.5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 50,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    title: Text(
                      "@lovophotography",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: Text(
                      "Akun Instagram Studio.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  ListTile(
                    selected: true,
                    selectedTileColor: Theme.of(context).colorScheme.primary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    title: Text(
                      "Dilayani pada jam terbang admin.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: Text(
                      "09:00 - 20:00",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: const Color(0xFF5B51D8).withOpacity(0.5),
                      child: FaIcon(
                        FontAwesomeIcons.solidMessage,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
