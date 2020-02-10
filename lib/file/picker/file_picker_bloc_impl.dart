import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/file/file_model.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

abstract class FilePickerBloc extends DisposableOwner
    implements IFilePickerBloc {
  final List<FilePickerFileType> fileTypesToPick;
  final bool captureEnabled;

  // ignore: close_sinks
  BehaviorSubject<FilePickerTab> selectedTabSubject;

  @override
  FilePickerTab get selectedTab => selectedTabSubject.value;

  @override
  Stream<FilePickerTab> get selectedTabStream => selectedTabSubject.stream;

  // ignore: close_sinks
  BehaviorSubject<List<FilePickerTab>> availableTabsSubject;

  @override
  List<FilePickerTab> get availableTabs => availableTabsSubject.value;

  @override
  Stream<List<FilePickerTab>> get availableTabsStream =>
      availableTabsSubject.stream;
  FilePickerBloc(
      {@required this.fileTypesToPick,
      @required this.captureEnabled,
      @required FilePickerTab startActiveTab}) {
    var tabs = calculateFilePickerTabs(
        fileTypesToPick: fileTypesToPick, captureEnabled: captureEnabled);

    if (!tabs.contains(startActiveTab)) {
      throw "Can't select startActiveTab $startActiveTab, because it don't "
          "exist in tabs = $tabs";
    }

    availableTabsSubject = BehaviorSubject.seeded(tabs);
    addDisposable(subject: availableTabsSubject);

    selectedTabSubject = BehaviorSubject.seeded(startActiveTab);
    addDisposable(subject: selectedTabSubject);
  }

  static List<FilePickerTab> calculateFilePickerTabs(
      {@required List<FilePickerFileType> fileTypesToPick,
      @required bool captureEnabled}) {
    var tabs = Set<FilePickerTab>();

    fileTypesToPick.forEach((type) {
      switch (type) {
        case FilePickerFileType.image:
          tabs.add(FilePickerTab.gallery);
          if (captureEnabled) {
            tabs.add(FilePickerTab.captureImage);
          }
          break;
        case FilePickerFileType.video:
          tabs.add(FilePickerTab.gallery);
          if (captureEnabled) {
            tabs.add(FilePickerTab.captureVideo);
          }
          break;
        case FilePickerFileType.other:
         // TODO: not implemented yet
          break;
      }
    });

    return tabs.toList();
  }

  onTabSelected(FilePickerTab tab) {
    selectedTabSubject.add(tab);
  }

//  FilePickerBloc._private(this.fileTypesToPick, this.captureEnabled,
//      this.mode);
//
//  final List<FileType> fileTypesToPick;
//  final bool captureEnabled;
//  final FilePickerMode mode;
//  FilePickerBloc.singlePicker({
//    @required List<FileType> fileTypesToPick,
//    @required bool captureEnabled,
//  }) : this._private(fileTypesToPick, captureEnabled, FilePickerMode.single);
//
//  FilePickerBloc.multiPicker({
//    @required List<FileType> fileTypesToPick,
//    @required bool captureEnabled,
//  }) : this._private(fileTypesToPick, captureEnabled, FilePickerMode.single);

}
