import 'dart:io';

import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/file_model.dart';
import 'package:fedi/file/picker/file_picker_bloc_impl.dart';
import 'package:fedi/file/picker/file_picker_bottom_nav_bar_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/multi/multi_file_picker_bloc.dart';
import 'package:fedi/file/picker/multi/multi_file_picker_bloc_impl.dart';
import 'package:fedi/file/picker/single/single_file_picker_body_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef ImageFileSelectedCallback(File file);

class StatusEditAttachImagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DisposableProvider<IMultiFilePickerBloc>(
        create: (context) => MultiFilePickerBloc(
            fileTypesToPick: [FilePickerFileType.image],
            captureEnabled: true,
            startActiveTab: FilePickerTab.gallery),
        // provide parent abstract implementation by type
        child: ProxyProvider<IMultiFilePickerBloc, IMultiFilePickerBloc>(
          update: (_, IMultiFilePickerBloc value, __) => value,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text("Attach media"),
            ),
            body: SingleFilePickerBodyWidget(),
            bottomNavigationBar: FilePickerBottomNavBarWidget(),
          ),
        ));
  }

}
