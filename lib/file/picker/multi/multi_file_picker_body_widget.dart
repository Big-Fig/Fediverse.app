import 'package:fedi/file/gallery/file_gallery_widget.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_body_widget.dart';
import 'package:flutter/widgets.dart';

class MultiFilePickerBodyWidget extends FilePickerBodyWidget {
  @override
  Widget build(BuildContext context) => buildBody(context);

  @override
  Widget buildBodyGalleryWidget(
      BuildContext context, IFilePickerBloc filePickerBloc) {
    return FileGalleryWidget();
  }
}
