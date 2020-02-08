import 'dart:io';

import 'package:fedi/media/picker/media_picker_model.dart';

class IFilePickerBloc {

  List<File> selectedFiles;
  Stream<List<File>> selectedFilesStream;

  MediaPickerTab selectedTab;
  Stream<MediaPickerTab> selectedTabStream;


  List<MediaPickerTab> availableTabs;
  Stream<List<MediaPickerTab>> availableTabsStream;

}
