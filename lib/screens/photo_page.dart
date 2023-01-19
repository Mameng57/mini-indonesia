import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lovo_photography/models/session.dart';
import 'package:lovo_photography/models/photo.dart';
import 'package:lovo_photography/services/base_client.dart';
import 'package:lovo_photography/widgets/layouts/photo_grid_view.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage(this.sessionData, {Key? key}) : super(key: key);
  static const routeName = "/photo";

  final Session sessionData;

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  bool isLoading = true;
  List<Photo> listPhoto = [];

  Future<List<Photo>> getPhotos() async {
    var response = jsonDecode(
      await BaseClient().get("/photo/${widget.sessionData.idSession}"),
    );

    if (response['photo'].runtimeType == String) {
      return [];
    }

    return List.generate(response['photo'].length,
      (index) => Photo.fromJson(response['photo'][index])
    );
  }

  @override
  void initState() {
    super.initState();

    getPhotos().then((list) => {
      setState(() {
        listPhoto = list;
        isLoading = false;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.asset("assets/images/background_2.png"),
        isLoading
        ? const CircularProgressIndicator()
        : Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.15),
          appBar: PreferredSize(
            preferredSize: Size(w, h / 7.5),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: h / 10),
                child: Text(
                  "Paket foto : ${widget.sessionData.packageInfo}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Divider(
                height: 25,
                thickness: 2.5,
                indent: 50,
                endIndent: 50,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Expanded(
                child: listPhoto.isEmpty
                ? const Center(child: Text("Foto tidak ada..."),)
                : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PhotoGridView(listPhoto),
                ),
              ),
              Container(
                width: w,
                height: h / 11,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          )
        ),
        Positioned(
          left: w / 2.775,
          top: h / 15,
          child: CircleAvatar(
            radius: 75,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            backgroundImage: const AssetImage("assets/images/lovo.png"),
          ),
        )
      ],
    );
  }
}
