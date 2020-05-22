import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/navigation/navigation_slide_bottom_route_builder.dart';
import 'package:fedi/app/ui/button/icon/fedi_dismiss_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_bottom_nav_bar_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc.dart';
import 'package:fedi/file/picker/single/single_file_picker_bloc_impl.dart';
import 'package:fedi/file/picker/single/single_file_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleFilePickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: AppLocalizations.of(context)
            .tr("file.picker.single.title"),
        leading: FediDismissIconButton(),
      ),
      body: SingleFilePickerWidget(),
      bottomNavigationBar: FilePickerBottomNavBarWidget(),
    );
  }
}

void goToSingleFilePickerPage(BuildContext context,
    {@required FilePickerSelectedFileCallback fileSelectedCallback,
    List<FilePickerFileType> fileTypesToPick = const [
      FilePickerFileType.image,
      FilePickerFileType.video
    ],
    @required FilePickerTab startActiveTab,
    bool captureEnabled = true}) {
  Navigator.push(
    context,
    NavigationSlideBottomRouteBuilder(
        page: DisposableProvider<ISingleFilePickerBloc>(
            create: (context) {
              return SingleFilePickerBloc(
                  fileTypesToPick: fileTypesToPick,
                  captureEnabled: captureEnabled,
                  startActiveTab: startActiveTab,
                  fileSelectedCallback: fileSelectedCallback);
            }, // provide parent abstract implementation by type
            child: ProxyProvider<ISingleFilePickerBloc, IFilePickerBloc>(
              update: (_, ISingleFilePickerBloc value, __) => value,
              child: SingleFilePickerPage(),
            ))),
  );
}
