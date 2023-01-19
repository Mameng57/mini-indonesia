import 'package:flutter/material.dart';
import 'package:lovo_photography/services/base_client.dart';
import 'package:lovo_photography/models/photo.dart';
import 'package:lovo_photography/widgets/clickable_image_box.dart';

class PhotoGridView extends StatelessWidget {
  const PhotoGridView(this.listPhoto, {Key? key}) : super(key: key);
  final List<Photo> listPhoto;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: listPhoto.length,
      itemBuilder: (context, index) {
        return ClickableImageBox(
          "${listPhoto[index].idPhoto}",
          "${BaseClient.apiUrl}/${listPhoto[index].url}",
        );
      }
    );
  }
}
