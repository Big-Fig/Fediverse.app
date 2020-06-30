import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/single_camera_picker.dart';
import 'package:fedi/app/navigation/navigation_slide_bottom_route_builder.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/app/ui/model_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:fedi/async/loading/init/async_init_loading_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/gallery/file_gallery_bloc.dart';
import 'package:fedi/file/gallery/file_gallery_bloc_impl.dart';
import 'package:fedi/file/gallery/file_gallery_model.dart';
import 'package:fedi/file/gallery/folder/file_gallery_folder_bloc.dart';
import 'package:fedi/file/gallery/folder/file_gallery_folder_bloc_impl.dart';
import 'package:fedi/file/gallery/folder/file_gallery_folder_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/gallery/file_picker_gallery_adapter.dart';
import 'package:fedi/permission/grant_permission_widget.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

class SingleMediaPickerPage extends StatelessWidget {
  final FilePickerSelectedFileCallback fileSelectedCallback;

  SingleMediaPickerPage({@required this.fileSelectedCallback});

  @override
  Widget build(BuildContext context) {
    var fileGalleryBloc = IFileGalleryBloc.of(context, listen: false);
    return Scaffold(
      appBar: FediSubPageCustomAppBar(
        centerTitle: true,
        child: _buildAppBarTitle(context),
        leading: FediBackIconButton(),
      ), //      body: SingleFilePickerWidget(),
      body: GrantPermissionWidget(
        grantedBuilder: (BuildContext context) {
          return AsyncInitLoadingWidget(
            loadingFinishedBuilder: (BuildContext context) {
              return StreamBuilder<AssetPathEntity>(
                  stream: fileGalleryBloc.selectedFolderStream,
                  initialData: fileGalleryBloc.selectedFolder,
                  builder: (context, snapshot) {
                    var folder = snapshot.data;
                    if (folder == null) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Provider<AssetPathEntity>.value(
                      value: folder,
                      child: DisposableProxyProvider<AssetPathEntity,
                          IFileGalleryFolderBloc>(
                        update: (BuildContext context, value, previous) {
                          var folderBloc = FileGalleryFolderBloc(
                              folder: value,
                              storagePermissionBloc: IStoragePermissionBloc.of(
                                  context,
                                  listen: false));
                          folderBloc.performAsyncInit();
                          return folderBloc;
                        },
                        child: FileGalleryFolderWidget(
                          headerItemBuilder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () async {
                                var pickedFile = await pickImageFromCamera();

                                if (pickedFile != null) {
                                  fileSelectedCallback(FilePickerFile(
                                    type: FilePickerFileType.image,
                                    isNeedDeleteAfterUsage: true,
                                    file: pickedFile,
                                  ));
                                }
//                                _showFolderChooserModalBottomSheet(
//                                    context, fileGalleryBloc);
                              },
                              child: Container(
                                  color: Colors.white,
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Icon(
                                    FediIcons.camera,
                                    color: FediColors.darkGrey,
                                    size: 40.0,
                                  )),
                            );
                          },
                          galleryFileTapped: (FileGalleryFile galleryFile) {
                            fileSelectedCallback(
                                mapGalleryToFilePickerFIle(galleryFile));
                          },
//                        galleryFileTapped: galleryFileTapped,
                        ),
                      ),
                    );
                  });
            },
            asyncInitLoadingBloc: fileGalleryBloc,
          );
        },
        permissionBloc: IStoragePermissionBloc.of(context, listen: false),
      ),
//      bottomNavigationBar: FilePickerBottomNavBarWidget(),
    );
  }



  Widget _buildAppBarTitle(BuildContext context) {
    var fileGalleryBloc = IFileGalleryBloc.of(context, listen: false);
    return StreamBuilder<List<AssetPathEntity>>(
        stream: fileGalleryBloc.foldersStream,
        initialData: fileGalleryBloc.folders,
        builder: (context, snapshot) {
          var folders = snapshot.data;

          if (folders?.isNotEmpty == true) {
            return StreamBuilder<AssetPathEntity>(
                stream: fileGalleryBloc.selectedFolderStream,
                initialData: fileGalleryBloc.selectedFolder,
                builder: (context, snapshot) {
                  var selectedFolder = snapshot.data;

                  return GestureDetector(
                    onTap: () {
                      _showFolderChooserModalBottomSheet(
                          context, fileGalleryBloc);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FediSubHeaderText(
                            _calculateFolderTitle(selectedFolder)),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          FediIcons.chevron_down,
                          color: FediColors.darkGrey,
                          size: 14.0,
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Text(tr("file.picker.single.title"));
          }
        });
  }

  String _calculateFolderTitle(AssetPathEntity selectedFolder) =>
      "${selectedFolder.name} (${selectedFolder.assetCount})";

  void _showFolderChooserModalBottomSheet(
      BuildContext context, IFileGalleryBloc fileGalleryBloc) {
    return showFediModalBottomSheetDialog(
        context: context,
        child: Provider.value(
          value: fileGalleryBloc,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              shrinkWrap: true,
              children: fileGalleryBloc.folders
                  .map((folder) => ListTile(
                        onTap: () {
                          fileGalleryBloc.selectFolder(folder);
                          Navigator.of(context).pop();
                        },
                        title: Text(
                          _calculateFolderTitle(folder),
                          style: TextStyle(
                              fontWeight:
                                  folder == fileGalleryBloc.selectedFolder
                                      ? FontWeight.w500
                                      : FontWeight.w300),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}

void goToSingleMediaPickerPage(BuildContext context,
    {@required FilePickerSelectedFileCallback fileSelectedCallback,
    List<FilePickerFileType> fileTypesToPick = const [
      FilePickerFileType.image,
      FilePickerFileType.video
    ]}) {
  Navigator.push(
    context,
    NavigationSlideBottomRouteBuilder(
        page: DisposableProvider<IFileGalleryBloc>(
            create: (context) {
              return FileGalleryBloc(
                  fileTypesToPick: fileTypesToPick,
                  storagePermissionBloc:
                      IStoragePermissionBloc.of(context, listen: false));
            }, // provide parent abstract implementation by type
            child: SingleMediaPickerPage(
                fileSelectedCallback: fileSelectedCallback))),
  );
}
