import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/dm/media/dm_media_page.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_bottom_nav_bar_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc_impl.dart';
import 'package:fedi/file/picker/single/single_file_picker_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaptureDMMediaWidget extends StatelessWidget {
  final Function(BuildContext context, String) mediaUploaded;

  final FilePickerTab selectedTab;

  CaptureDMMediaWidget(
      {@required this.mediaUploaded, @required this.selectedTab});

  @required
  Widget build(BuildContext context) {
    return DisposableProvider<ISingleFilePickerBloc>(create: (context) =>
        SingleFilePickerBloc(fileTypesToPick: [
          FilePickerFileType.image,
          FilePickerFileType.video,
        ],
            captureEnabled: true,
            startActiveTab: selectedTab,
        fileSelectedCallback: (filePickerFile) {

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DMMediaPage(filePickerFile: filePickerFile,
            popParent: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            mediaUploaded: mediaUploaded,),
          ));
        }, galleryEnabled: false),
        // provide parent abstract implementation by type
        child: ProxyProvider<ISingleFilePickerBloc, IFilePickerBloc>(
          update: (_, ISingleFilePickerBloc value, __) => value,
          child: Scaffold(appBar: AppBar(leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),),
            title: Text(AppLocalizations.of(context)
                .tr("app.dm.media.capture.title"))),
            body: SingleFilePickerBodyWidget(),
            bottomNavigationBar: FilePickerBottomNavBarWidget(),),));
  }
}
