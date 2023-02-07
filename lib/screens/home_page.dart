import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lovo_photography/models/user.dart';
import 'package:lovo_photography/models/session.dart';
import 'package:lovo_photography/models/package.dart';
import 'package:lovo_photography/services/base_client.dart';
import 'package:lovo_photography/widgets/custom_appbar.dart';
import 'package:lovo_photography/widgets/layouts/session_menu.dart';
import 'package:lovo_photography/widgets/layouts/info_menu.dart';
import 'package:lovo_photography/widgets/layouts/account_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.userData, {Key? key}) : super(key: key);
  static const routeName = "/home";

  final User userData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<Session> listSession = [];
  List<Package> listPackage = [];
  int currentIndex = 0;

  late final List<Widget> listWidget = [
    SessionMenu(listSession: listSession),
    InfoMenu(listPackage: listPackage),
    AccountMenu(
      userId: widget.userData.idUser,
      userName: widget.userData.name,
      phone: widget.userData.phone,
      email: widget.userData.email,
      address: widget.userData.address,
    ),
  ];

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

  Future<List<Package>> getPackages() async {
    var response = jsonDecode(await BaseClient().get("/package"));

    return List.generate(response['package'].length, (index) {
      return Package.fromJson(response['package'][index]);
    });
  }

  @override
  void initState() {
    super.initState();

    getSessions().then((list) {
      listSession = list;
      getPackages().then((list) => {
        setState(() {
          listPackage = list;
          isLoading = false;
        })
      });
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
          fit: BoxFit.cover,
          image: const AssetImage("assets/images/background_2.png"),
        ),
        Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.15),
          appBar: currentIndex == 0
          ? PreferredSize(
            preferredSize: Size(w, h / 2.2),
            child: SafeArea(
              child: CustomAppBar(username: widget.userData.name,)
            ),
          )
          : PreferredSize(
            preferredSize: Size(w, 0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          body: listWidget[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
            backgroundColor: Theme.of(context).colorScheme.primary,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_filled),
              ),
              BottomNavigationBarItem(
                label: "Info",
                icon: Icon(Icons.info),
              ),
              BottomNavigationBarItem(
                label: "Akun",
                icon: Icon(Icons.account_circle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
