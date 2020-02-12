import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/gallery/file/file_gallery_file_bloc.dart';
import 'package:fedi/file/gallery/file/file_gallery_file_bloc_impl.dart';
import 'package:fedi/file/gallery/file/file_gallery_file_grid_item_widget.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:fedi/file/gallery/folder/file_gallery_folder_bloc.dart';
import 'package:fedi/permission/grant_permission_widget.dart';
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
            case FileGalleryState.notStarted:
              return Text("Loading not started");
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
            return Text("This folder doesn't have media");
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
