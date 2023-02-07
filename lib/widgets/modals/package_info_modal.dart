import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PackageInfoModal extends StatelessWidget {
  const PackageInfoModal({
    required this.packageName,
    required this.downloadCount,
    required this.printCount,
    required this.dateTaken,
    required this.dateDue,
    Key? key
  }) : super(key: key);

  final String? packageName;
  final int? downloadCount;
  final int? printCount;
  final DateTime? dateTaken;
  final DateTime? dateDue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 666,
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/pk_${packageName?.toLowerCase()}.png",
                            ),
                            scale: 5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 25,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Paket $packageName",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              "by Lovo Photography",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Text(
              "Anda mendapatkan : ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 25,),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(7)
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.image, size: 50,),
                    title: Text(
                      "Foto Digital",
                        style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Text(
                      downloadCount.toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.photo_camera_front_rounded,
                      size: 50,
                    ),
                    title: Text(
                      "Foto Fisik",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Text(
                      printCount.toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Text(
              "Informasi Tanggal : ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10,),
            ListTile(
              title: Text(
                "Sesi Foto dilakukan pada : ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat(
                      "EEEE, d MMMM yyyy", "id_ID"
                    ).format(dateTaken!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Cetak foto fisik diambil pada : ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat(
                      "EEEE, d MMMM yyyy", "id_ID"
                    ).format(dateDue!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
