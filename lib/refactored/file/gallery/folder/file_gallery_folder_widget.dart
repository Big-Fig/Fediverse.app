import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/file/gallery/file/file_gallery_file_bloc.dart';
import 'package:fedi/refactored/file/gallery/file/file_gallery_file_bloc_impl.dart';
import 'package:fedi/refactored/file/gallery/file/file_gallery_file_grid_item_widget.dart';
import 'package:fedi/refactored/file/gallery/file_gallery_model.dart';
import 'package:fedi/refactored/file/gallery/folder/file_gallery_folder_bloc.dart';
import 'package:fedi/refactored/permission/grant_permission_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class FileGalleryFolderWidget extends StatelessWidget {

  final FileGalleryFileCallback galleryFileTapped;

  FileGalleryFolderWidget({@required this.galleryFileTapped});

  @override
  Widget build(BuildContext context) {
    var folderBloc = IFileGalleryFolderBloc.of(context);

    return AsyncInitLoadingWidget(
      loadingFinishedBuilder: (context) => GrantPermissionWidget(
        grantedBuilder: (context) =>
            buildPermissionGrantedView(context, folderBloc),
        permissionBloc: folderBloc,
      ),
      asyncInitLoadingBloc: folderBloc,
    );
  }

  Widget buildPermissionGrantedView(
      BuildContext context, IFileGalleryFolderBloc folderBloc) {
    return StreamBuilder<FileGalleryState>(
        stream: folderBloc.galleryStateStream,
        initialData: folderBloc.galleryState,
        builder: (context, snapshot) {
          var galleryState = snapshot.data;

          switch (galleryState) {
            case FileGalleryState.loadingNotStarted:
              return Center(child: Text(AppLocalizations.of(context)
                  .tr("file.gallery.state.loading_not_started")));
              break;
            case FileGalleryState.loading:
              return Center(child: CircularProgressIndicator());
              break;
            case FileGalleryState.loaded:
              return buildFilesWidget(context, folderBloc);
              break;
            default:
              // null
              return Center(child: CircularProgressIndicator());
              break;
          }
        });
  }

  Widget buildFilesWidget(
      BuildContext context, IFileGalleryFolderBloc folderBloc) {
    return StreamBuilder<List<AssetEntity>>(
        stream: folderBloc.filesStream,
        initialData: folderBloc.files,
        builder: (context, snapshot) {
          var files = snapshot.data;

          if (files.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context)
                  .tr("file.gallery.folder.empty")),
            );
          } else {
            return GridView.builder(
              itemCount: files.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) =>
                  _buildItem(context, files[index]),
            );
          }
        });
  }

  Widget _buildItem(BuildContext context, AssetEntity assetEntity) =>
      DisposableProvider<IFileGalleryFileBloc>(
          create: (BuildContext context) {
            var galleryFileBloc = FileGalleryFileBloc(assetEntity: assetEntity);
            galleryFileBloc.performAsyncInit();
            return galleryFileBloc;
          },
          child: FileGalleryFolderGridItemWidget(galleryFileTapped: galleryFileTapped));
}
