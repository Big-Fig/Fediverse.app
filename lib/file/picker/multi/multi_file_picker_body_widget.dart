import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/gallery/file_gallery_bloc.dart';
import 'package:fedi/file/gallery/file_gallery_bloc_impl.dart';
import 'package:fedi/file/gallery/file_gallery_widget.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_body_widget.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/widgets.dart';

class MultiFilePickerBodyWidget extends FilePickerBodyWidget {
  @override
  Widget build(BuildContext context) => buildBody(context);

  @override
  Widget buildBodyGalleryWidget(
      BuildContext context, IFilePickerBloc filePickerBloc) {
    return DisposableProvider<IFileGalleryBloc>(
        create: (BuildContext context) {
          var fileGalleryBloc = FileGalleryBloc(
              storagePermissionBloc: IStoragePermissionBloc.of(context));

          fileGalleryBloc.performAsyncInit();

          return fileGalleryBloc;
        },
        child: FileGalleryWidget());
  }
}
