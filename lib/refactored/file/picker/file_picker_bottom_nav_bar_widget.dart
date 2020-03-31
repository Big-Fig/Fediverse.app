import 'package:fedi/refactored/file/picker/file_picker_bloc.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilePickerBottomNavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var filePickerBloc = IFilePickerBloc.of(context);

    return InitialDataStreamBuilder<List<FilePickerTab>>(
        stream: filePickerBloc.availableTabsStream,
        initialData: filePickerBloc.availableTabs,
        builder: (context, snapshot) {
          var tabs = snapshot.data;

          return InitialDataStreamBuilder<FilePickerTab>(
              stream: filePickerBloc.selectedTabStream,
              initialData: filePickerBloc.selectedTab,
              builder: (context, snapshot) {
                var selectedTab = snapshot.data;
                var currentIndex = tabs.indexWhere((tab) => tab == selectedTab);
                return BottomNavigationBar(
                  onTap: (index) {
                    filePickerBloc.onTabSelected(tabs[index]);
                  },
                  currentIndex: currentIndex,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey,
                  items: tabs
                      .map(
                          (tab) => _createFileTabBottomNavBarItem(context, tab))
                      .toList(),
                );
              });
        });
  }

  BottomNavigationBarItem _createFileTabBottomNavBarItem(
          BuildContext context, FilePickerTab tab) =>
      BottomNavigationBarItem(
        title: SizedBox.shrink(),
        icon: Icon(_getIconByFilePickerTab(tab)),
      );

  IconData _getIconByFilePickerTab(FilePickerTab tab) {
    switch (tab) {
      case FilePickerTab.captureVideo:
        return Icons.videocam;
        break;
      case FilePickerTab.captureImage:
        return Icons.camera_alt;
        break;
      case FilePickerTab.gallery:
        return Icons.photo_library;
        break;
    }

    throw "Invalid tab type $tab";
  }
}
