import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage(this.imagePath, {Key? key}) : super(key: key);
  static const routeName = "/preview";

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(imagePath),
    );
  }
}
