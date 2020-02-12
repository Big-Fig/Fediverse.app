import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/file/gallery/file/file_gallery_file_bloc.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:flutter/cupertino.dart';

class FileGalleryFolderGridItemWidget extends StatelessWidget {

  final FileGalleryFileCallback galleryFileTapped;


  FileGalleryFolderGridItemWidget({@required this.galleryFileTapped});

  @override
  Widget build(BuildContext context) {
    var fileBloc = IFileGalleryFileBloc.of(context);

    return AsyncInitLoadingWidget(
      loadingFinishedBuilder: (context) => buildLoadedWidget(context, fileBloc),
      asyncInitLoadingBloc: fileBloc,
    );
  }

  buildLoadedWidget(BuildContext context, IFileGalleryFileBloc fileBloc) {
    return GestureDetector(
      onTap: () async {
        galleryFileTapped(await fileBloc.retrieveFile());
      },
      child: Image.memory(
        fileBloc.thumbImageData,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
