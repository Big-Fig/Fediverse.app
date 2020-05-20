import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/file/gallery/file/file_gallery_file_bloc.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

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

  Widget buildLoadedWidget(BuildContext context, IFileGalleryFileBloc 
  galleryFileBloc) {
    return GestureDetector(
      onTap: () async {
        galleryFileTapped(await galleryFileBloc.retrieveFile());
      },
      child: Stack(
        children: <Widget>[
          buildPreviewImage(galleryFileBloc),
          Center(child: buildIcon(galleryFileBloc))
        ],
      ),
    );
  }

  Widget buildIcon(IFileGalleryFileBloc fileBloc) {
    return fileBloc.type == AssetType.video
        ? Icon(
            Icons.play_circle_outline,
            color: Colors.white,
          )
        : SizedBox.shrink();
  }

  Image buildPreviewImage(IFileGalleryFileBloc fileBloc) {
    return Image.memory(
      fileBloc.thumbImageData,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
