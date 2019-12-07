import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:phaze/Views/SelectedBorder.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryImageContainer extends StatefulWidget {
  final AssetEntity entity;
  final int index;
  final ValueNotifier<bool> isSelected;
  final Function(GalleryImageContainer, int) updateParent;

  GalleryImageContainer(
      {this.entity, this.index, this.isSelected, this.updateParent});

  @override
  State<StatefulWidget> createState() {
    return _GalleryImageContainer();
  }
}

class _GalleryImageContainer extends State<GalleryImageContainer> {
  
  Uint8List imageData;
  Image image;
  Border border;

  @override
  Widget build(BuildContext context) {
    return _buildItem(widget.index);
  }

  Future<Uint8List> getImagedata() async {
    if (imageData == null) {
      imageData = await widget.entity.thumbDataWithSize(150, 150);
      return imageData;
    } else {
      return imageData;
    }
  }

  Image getImage(Uint8List data) {
    if (image == null) {
      image = Image.memory(
        data,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );

      return image;
    } else {
      return image;
    }
  }

  Widget _buildItem(int index) {
    return FutureBuilder<Uint8List>(
      //key: PageStorageKey<String>("imagecontainer${widget.index}"),
      future: getImagedata(),
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
              
          return Stack(
            children: <Widget>[
              getImage(snapshot.data),
              InkWell(
                onTap: () => itemTapped(),
                child:SelectedBorder(widget.isSelected),
              ),
              IgnorePointer(
                child: Container(
                  alignment: Alignment.center,
                  child: Opacity(
                    child: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                    ),
                    opacity: widget.entity.type == AssetType.video ? 1 : 0,
                  ),
                ),
              ),
            ],
          );
        }
        return Center(
          child: Text('loading...'),
        );
      },
    );
  }

  itemTapped() {
    widget.updateParent(widget, widget.index);
  }
}

