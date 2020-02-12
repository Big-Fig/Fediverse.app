import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_bottom_nav_bar_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc_impl.dart';
import 'package:fedi/file/picker/single/single_file_picker_body_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef ImageFileSelectedCallback(FilePickerFile file);

abstract class ProfileEditSelectImagePage extends StatelessWidget {
  final ImageFileSelectedCallback selectedCallback;
  ProfileEditSelectImagePage({@required this.selectedCallback});

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<ISingleFilePickerBloc>(
        create: (context) => SingleFilePickerBloc(
            fileTypesToPick: [FilePickerFileType.image],
            captureEnabled: true,
            fileSelectedCallback: (file) => onFileSelected(context, file),
            startActiveTab: FilePickerTab.gallery),
        // provide parent abstract implementation by type
        child: ProxyProvider<ISingleFilePickerBloc, IFilePickerBloc>(
          update: (_, ISingleFilePickerBloc value, __) => value,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: createAppBarTitle(context),
            ),
            body: SingleFilePickerBodyWidget(),
            bottomNavigationBar: FilePickerBottomNavBarWidget(),
          ),
        ));
  }

  Widget createAppBarTitle(BuildContext context);

  onFileSelected(BuildContext context, FilePickerFile filePickerFile);
}
