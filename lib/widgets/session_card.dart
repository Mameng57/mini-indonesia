import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lovo_photography/models/session.dart';
import 'package:lovo_photography/screens/photo_page.dart';

class SessionCard extends StatelessWidget {
  const SessionCard(this.sessionData, {Key? key}) : super(key: key);
  final Session sessionData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            PhotoPage.routeName,
            arguments: sessionData,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 15),
        color: Theme.of(context).colorScheme.secondary,
        elevation: 6,
        child: ListTile(
          isThreeLine: true,
          leading: Image.asset("assets/images/camera.png"),
          title: Text(
            "Paket ${sessionData.namePackage}",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat("dd-MM-yyyy").format(
                  sessionData.dateTaken as DateTime
                ).toString(),
                style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              ),
              Text(
                "Total ${sessionData.downloadCount} Foto",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                  color:
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
