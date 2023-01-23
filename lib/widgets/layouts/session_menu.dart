import 'package:flutter/material.dart';
import 'package:lovo_photography/models/session.dart';
import 'package:lovo_photography/widgets/session_card.dart';

class SessionMenu extends StatelessWidget {
  const SessionMenu({
    required this.listSession,
    Key? key
  }) : super(key: key);

  final List<Session> listSession;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
