import 'dart:io';

import 'package:fedi/media/media_model.dart';
import 'package:fedi/media/picker/media_picker_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef SinglePickedFileCallback(File file);
typedef MultiPickedFileCallback(File file);

class MediaPickerWidget extends StatelessWidget {
  final List<MediaFileType> fileTypesToPick;
  final bool captureEnabled;
  final MediaPickerMode mode;
  final SinglePickedFileCallback singlePickedFileCallback;
  final MultiPickedFileCallback multiPickedFileCallback;

  MediaPickerWidget._private(this.fileTypesToPick, this.captureEnabled,
      this.mode, this.singlePickedFileCallback, this.multiPickedFileCallback);

  MediaPickerWidget.singlePicker({
    @required List<MediaFileType> fileTypesToPick,
    @required bool captureEnabled,
    @required SinglePickedFileCallback callback,
  }) : this._private(fileTypesToPick, captureEnabled, MediaPickerMode.single,
            callback, null);

  MediaPickerWidget.multiPicker({
    @required List<MediaFileType> fileTypesToPick,
    @required bool captureEnabled,
    @required MultiPickedFileCallback callback,
  }) : this._private(fileTypesToPick, captureEnabled, MediaPickerMode.single,
            null, callback);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar[_currentIndex],
      body: Container(
        child: _children[_currentIndex],
        color: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        // new
        currentIndex: _currentIndex,
        //
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          new BottomNavigationBarItem(
            title: Container(height: 0.0),
            icon: Icon(Icons.videocam),
          ),
          new BottomNavigationBarItem(
            title: Container(height: 0.0),
            icon: Icon(Icons.camera_alt),
          ),
          new BottomNavigationBarItem(
            title: Container(height: 0.0),
            icon: Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}
