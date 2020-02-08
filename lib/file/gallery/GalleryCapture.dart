import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fedi/media/gallery/GalleryImageContainer.dart';
import 'package:fedi/media/gallery/GalleryPreview.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryCapture extends StatefulWidget {
  final Function(AssetEntity) assetSelected;
  final bool showVideo;
  GalleryCapture(this.assetSelected, {this.showVideo});

  @override
  State<StatefulWidget> createState() {
    return _GalleryCapture();
  }
}

enum CameraPermisionStatus { waiting, success, failure }

class _GalleryCapture extends State<GalleryCapture> {
  var initalSet = false;
  List<AssetEntity> galleryList = <AssetEntity>[];
  GalleryImageContainer selectedContainer;
  ValueNotifier<AssetEntity> selectedEntity = ValueNotifier(null);
  var selectedIndex = 0;
  CameraPermisionStatus permission = CameraPermisionStatus.waiting;
  BuildContext currentContext;
  void getPermision() async {
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success
      permission = CameraPermisionStatus.success;
    } else {
      permission = CameraPermisionStatus.failure;
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
    if (this.mounted) {
      setState(() {});
    }
  }

  void fetchImages() async {
    if (galleryList.length > 0) {
      return;
    }
    if (permission == CameraPermisionStatus.success) {
      List<AssetPathEntity> list;
      if (widget.showVideo == false){
        list =
          await PhotoManager.getAssetPathList(type: RequestType.all);
      }else {
       list =
          await PhotoManager.getAssetPathList(type: RequestType.all);
      }
       
      galleryList = await list[0].getAssetListRange(start:0, end:1500);
      selectedEntity.value = galleryList[0];
      widget.assetSelected(selectedEntity.value);
    }
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // final double deviceWidth = MediaQuery.of(context).size.width;
    // final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    currentContext = context;

    if (permission == CameraPermisionStatus.waiting) {
      getPermision();
      return Container(
        color: Colors.black,
        child: new Center(
          child: new Text(
            AppLocalizations.of(context).tr("post.gallery.capture.fetching")
          ),
        ),
      );
    } else if (permission == CameraPermisionStatus.success) {
      fetchImages();
      return Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: GalleryPreview(selectedEntity),
              ),
            ),
          ),
          Container(
            height: 300,
            child: GridView.builder(
              itemCount: galleryList.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: _buildItem,
            ),
          ),
        ],
      );
    } else {
      return Container(
        color: Colors.teal,
        child: new Center(
          child: new Text(
            AppLocalizations.of(context)
                .tr("post.gallery.capture.no_permission")
          ),
        ),
      );
    }
  }

  Widget _buildItem(BuildContext context, int index) {
   // var i = galleryList.length - 1 - index;

    ValueNotifier<bool> isSelected = ValueNotifier(false);
    isSelected.value = selectedIndex == index ? true : false;

    AssetEntity entity = galleryList[index];
    var container = GalleryImageContainer(
        entity: entity,
        index: index,
        updateParent: updateParent,
        isSelected: isSelected);
    if (index == 0) {
      selectedContainer = container;
      selectedIndex = index;
    }
    return container;
  }

  updateParent(GalleryImageContainer container, int index) {
    selectedIndex = index;

    selectedContainer.isSelected.value = false;
    selectedContainer = container;
    selectedContainer.isSelected.value = true;
    selectedEntity.value = container.entity;
    widget.assetSelected(selectedEntity.value);
  }

  showInfo(AssetEntity container, int index) async {
    // if (entity.type == AssetType.video) {
    //   var file = await entity.file;
    //   var length = file.lengthSync();
    //   var size = await entity.size;
    //   print(
    //       "${entity.id} length = $length , size = $size , dateTime = ${entity.createDateTime}");
    // } else {
    //   var size = await entity.size;
    //   print("${entity.id} size = $size, dateTime = ${entity.createDateTime}");
    // }

    /// copy log id , and create AssetEntity with id from main.dart
  }

}
