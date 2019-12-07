import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewPage extends StatefulWidget {
  final ImageProvider imageProvider;
  ImageViewPage(this.imageProvider);

  @override
  State<StatefulWidget> createState() {
    return _ImageViewPage();
  }
}

class _ImageViewPage extends State<ImageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: PhotoView(
          imageProvider: widget.imageProvider,
        ),
      ),
    );
  }
}
