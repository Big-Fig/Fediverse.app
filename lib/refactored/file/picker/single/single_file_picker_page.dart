import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Transitions/SlideBottomRoute.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/file/picker/file_picker_bloc.dart';
import 'package:fedi/refactored/file/picker/file_picker_bottom_nav_bar_widget.dart';
import 'package:fedi/refactored/file/picker/file_picker_model.dart';
import 'package:fedi/refactored/file/picker/single/single_file_picker_bloc.dart';
import 'package:fedi/refactored/file/picker/single/single_file_picker_bloc_impl.dart';
import 'package:fedi/refactored/file/picker/single/single_file_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleFilePickerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(AppLocalizations.of(context)
            .tr("app.status.edit.attach_media.title")),
      ),
      body: SingleFilePickerWidget(),
      bottomNavigationBar: FilePickerBottomNavBarWidget(),
    );
  }
}


goToSingleFilePickerPage(BuildContext context, {@required
FilePickerSelectedFileCallback fileSelectedCallback,
  List<FilePickerFileType> fileTypesToPick = const [
    FilePickerFileType.image,
    FilePickerFileType.video
  ],
  @required FilePickerTab startActiveTab,
  bool captureEnabled = true}) {
  Navigator.push(
    context,
    SlideBottomRoute(
        page: DisposableProvider<ISingleFilePickerBloc>(
            create: (context) {
              return SingleFilePickerBloc(
                  fileTypesToPick: fileTypesToPick,
                  captureEnabled: captureEnabled,
                  startActiveTab: startActiveTab,
                  fileSelectedCallback: fileSelectedCallback);
            },
            // provide parent abstract implementation by type
            child: ProxyProvider<ISingleFilePickerBloc, IFilePickerBloc>(
              update: (_, ISingleFilePickerBloc value, __) => value,
              child: SingleFilePickerPage(),
            ))),
  );
}