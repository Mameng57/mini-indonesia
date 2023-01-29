import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lovo_photography/models/session.dart';
import 'package:lovo_photography/models/photo.dart';
import 'package:lovo_photography/services/base_client.dart';
import 'package:lovo_photography/widgets/capsule_button.dart';
import 'package:lovo_photography/widgets/layouts/photo_grid_view.dart';
import 'package:lovo_photography/widgets/modals/package_info_modal.dart';
import 'package:lovo_photography/widgets/modals/photo_print_modal.dart';

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
  List<Photo> listSelectedPhoto = [];

  void addSelectedPhoto(int index) {
    setState(() {
      listSelectedPhoto.add(listPhoto[index]);
    });
  }

  void removeSelectedPhoto(int index) {
    setState(() {
      listSelectedPhoto.remove(listPhoto[index]);
    });
  }

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Paket foto : ",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    CapsuleButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )
                          ),
                          builder: (context) {
                            return PackageInfoModal(
                              packageName: widget.sessionData.namePackage,
                              downloadCount: widget.sessionData.downloadCount,
                              printCount: widget.sessionData.printCount,
                              dateTaken: widget.sessionData.dateTaken,
                              dateDue: widget.sessionData.dateDue,
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.sessionData.namePackage}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Icon(Icons.info_outline, size: 20,),
                        ],
                      ),
                    ),
                  ],
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
                  child: PhotoGridView(
                    listPhoto: listPhoto,
                    listSelectedPhoto: listSelectedPhoto,
                    addSelectedPhotoHandler: addSelectedPhoto,
                    removeSelectedPhotoHandler: removeSelectedPhoto,
                  ),
                ),
              ),
              Container(
                width: w,
                height: h / 11,
                padding: const EdgeInsets.all(15),
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        listSelectedPhoto.isNotEmpty
                        ? "${listSelectedPhoto.length} foto dipilih."
                        : "Tekan dan tahan foto untuk menandai.",
                      ),
                    ),
                    listSelectedPhoto.isNotEmpty
                    ? CapsuleButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onTap: () {},
                      child: const Text(
                        "Unduh",
                          style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                    : const SizedBox(),
                    const SizedBox(width: 25,),
                    listSelectedPhoto.isNotEmpty
                    ? CapsuleButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onTap: () {
                        if (listSelectedPhoto.length > widget.sessionData.printCount!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Paket ${widget.sessionData.namePackage} "
                                "hanya dapat mencetak maksimal "
                                "${widget.sessionData.printCount} foto..."
                              ),
                            ),
                          );

                          return;
                        }

                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              )
                          ),
                          context: context,
                          builder: (context) {
                            return PhotoPrintModal(
                              packageName: widget.sessionData.namePackage,
                              listSelectedPhoto: listSelectedPhoto,
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Cetak",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                    : const SizedBox(),
                  ],
                ),
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
