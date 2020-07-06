import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/gallery/file_gallery_bloc.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:fedi/file/gallery/folder/file_gallery_folder_bloc.dart';
import 'package:fedi/file/gallery/folder/file_gallery_folder_bloc_impl.dart';
import 'package:fedi/file/gallery/folder/file_gallery_folder_widget.dart';
import 'package:fedi/permission/grant_permission_widget.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:photo_manager/photo_manager.dart';

class FileGalleryWidget extends StatelessWidget {
  final FileGalleryFileCallback galleryFileTapped;

  FileGalleryWidget({@required this.galleryFileTapped});

  @override
  Widget build(BuildContext context) {
    var fileGalleryBloc = IFileGalleryBloc.of(context);

    return AsyncInitLoadingWidget(
      loadingFinishedBuilder: (context) => GrantPermissionWidget(
        grantedBuilder: (context) =>
            buildPermissionGrantedView(context, fileGalleryBloc),
        permissionBloc: fileGalleryBloc,
      ),
      asyncInitLoadingBloc: fileGalleryBloc,
    );
  }

  Widget buildPermissionGrantedView(
      BuildContext context, IFileGalleryBloc fileGalleryBloc) {
    return StreamBuilder<FileGalleryState>(
        stream: fileGalleryBloc.galleryStateStream,
        initialData: fileGalleryBloc.galleryState,
        builder: (context, snapshot) {
          var galleryState = snapshot.data;

          switch (galleryState) {
            case FileGalleryState.loadingNotStarted:
              return Center(
                  child: Text(tr("file.gallery.state.loading_not_started")));
              break;
            case FileGalleryState.loading:
              return Center(child: FediCircularProgressIndicator());
              break;
            case FileGalleryState.loaded:
              return buildFoldersWidget(context, fileGalleryBloc);
              break;
            default:
              // null
              return Center(child: FediCircularProgressIndicator());
              break;
          }
        });
  }

  Widget buildFoldersWidget(
      BuildContext context, IFileGalleryBloc fileGalleryBloc) {
    return StreamBuilder<List<AssetPathEntity>>(
        stream: fileGalleryBloc.foldersStream,
        initialData: fileGalleryBloc.folders,
        builder: (context, snapshot) {
          var folders = snapshot.data;

          if (folders.isEmpty) {
            return Center(child: Text(tr("file.gallery.empty")));
          } else {
            return DefaultTabController(
              length: folders.length,
              child: Column(
                children: <Widget>[
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label, //makes it better
                    isScrollable: true, //up to your taste
                    indicator: MD2Indicator(
                        //it begins here
                        indicatorHeight: 3,
                        indicatorColor: Color(0xff1a73e8),
                        indicatorSize: MD2IndicatorSize
                            .normal //3 different modes tiny-normal-full
                        ),
                    tabs: folders
                        .map((folder) => Tab(
                              child: Text(
                                folder.name,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ))
                        .toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      // Lazy load
                      children:
                          List<Widget>.generate(folders.length, (int index) {
                        var folder = folders[index];
                        return DisposableProvider<IFileGalleryFolderBloc>(
                            create: (BuildContext context) {
                              var folderBloc = FileGalleryFolderBloc(
                                  folder: folder,
                                  storagePermissionBloc:
                                      IStoragePermissionBloc.of(context,
                                          listen: false));
                              folderBloc.performAsyncInit();
                              return folderBloc;
                            },
                            child: FileGalleryFolderWidget(
                              galleryFileTapped: galleryFileTapped,
                              headerItemBuilder: null,
                            ));
                      }),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
