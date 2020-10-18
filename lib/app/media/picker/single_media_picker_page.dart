import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/media/picker/media_picker_gallery_folder_widget.dart';
import 'package:fedi/app/media/picker/media_picker_service.dart';
import 'package:fedi/app/navigation/navigation_slide_bottom_route_builder.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:fedi/app/ui/permission/fedi_grant_permission_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/folder/media_device_folder_bloc.dart';
import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:fedi/media/device/folder/photo_manager/photo_manager_media_device_folder_bloc_impl.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:fedi/media/device/gallery/photo_manager/photo_manager_device_gallery_bloc_impl.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleMediaPickerPage extends StatelessWidget {
  final MediaDeviceFileCallback fileSelectedCallback;

  SingleMediaPickerPage({@required this.fileSelectedCallback});

  @override
  Widget build(BuildContext context) {
    var mediaDeviceGalleryBloc =
        IMediaDeviceGalleryBloc.of(context, listen: false);
    return Scaffold(
      appBar: FediSubPageCustomAppBar(
        centerTitle: true,
        child: _buildAppBarTitle(context),
        leading: FediBackIconButton(),
      ), //      body: SingleFilePickerWidget(),
      body: SafeArea(
        child: FediGrantPermissionWidget(
          grantedBuilder: (BuildContext context) {
            return FediAsyncInitLoadingWidget(
              loadingFinishedBuilder: (BuildContext context) {
                if (mediaDeviceGalleryBloc.folders?.isNotEmpty != true) {
                  return Center(child: Text("file.picker.empty".tr()));
                }
                var storagePermissionBloc =
                    IStoragePermissionBloc.of(context, listen: false);
                return StreamBuilder<IMediaDeviceFolder>(
                    stream: mediaDeviceGalleryBloc.selectedFolderStream
                        .distinct((old, current) => old?.id == current?.id),
                    initialData: mediaDeviceGalleryBloc.selectedFolder,
                    builder: (context, snapshot) {
                      var folder = snapshot.data;
                      if (folder == null) {
                        return Center(child: FediCircularProgressIndicator());
                      }
                      return Provider<IMediaDeviceFolder>.value(
                        value: folder,
                        child: DisposableProxyProvider<IMediaDeviceFolder,
                            IMediaDeviceFolderBloc>(
                          update: (BuildContext context, value, previous) {
                            var folderBloc = PhotoManagerFileGalleryFolderBloc(
                              storagePermissionBloc: storagePermissionBloc,
                              folder: value,
                            );
                            folderBloc.performAsyncInit();
                            return folderBloc;
                          },
                          child: FileGalleryFolderWidget(
                            headerItemBuilder: (BuildContext context) {
                              return InkWell(
                                onTap: () async {
                                  var mediaPickerService =
                                      IMediaPickerService.of(context,
                                          listen: false);

                                  var pickedFile = await mediaPickerService
                                      .pickImageFromCamera();

                                  if (pickedFile != null) {
                                    fileSelectedCallback(
                                      FileMediaDeviceFile(
                                        type: MediaDeviceFileType.image,
                                        isNeedDeleteAfterUsage: true,
                                        originalFile: pickedFile,
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                    color: Colors.white,
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Icon(
                                      FediIcons.camera,
                                      color: IFediUiColorTheme.of(context)
                                          .darkGrey,
                                      size: 40.0,
                                    )),
                              );
                            },
                            onFileSelectedCallback:
                                (IMediaDeviceFile mediaDeviceFile) {
                              fileSelectedCallback(mediaDeviceFile);
                            },
                            loadingWidget: FediCircularProgressIndicator(),
                            permissionButtonBuilder: (context, grantedBuilder) {
                              return FediGrantPermissionWidget(
                                grantedBuilder: grantedBuilder,
                                permissionBloc: storagePermissionBloc,
                              );
                            },
//                        galleryFileTapped: galleryFileTapped,
                          ),
                        ),
                      );
                    });
              },
              asyncInitLoadingBloc: mediaDeviceGalleryBloc,
            );
          },
          permissionBloc: IStoragePermissionBloc.of(context, listen: false),
        ),
      ),
//      bottomNavigationBar: FilePickerBottomNavBarWidget(),
    );
  }

  Widget _buildAppBarTitle(BuildContext context) {
    var mediaDeviceGalleryBloc =
        IMediaDeviceGalleryBloc.of(context, listen: false);
    return StreamBuilder<List<IMediaDeviceFolder>>(
        stream: mediaDeviceGalleryBloc.foldersStream,
        initialData: mediaDeviceGalleryBloc.folders,
        builder: (context, snapshot) {
          var folders = snapshot.data;

          if (folders?.isNotEmpty == true) {
            return StreamBuilder<IMediaDeviceFolder>(
                stream: mediaDeviceGalleryBloc.selectedFolderStream,
                initialData: mediaDeviceGalleryBloc.selectedFolder,
                builder: (context, snapshot) {
                  var selectedFolder = snapshot.data;

                  return InkWell(
                    onTap: () {
                      _showFolderChooserModalBottomSheet(
                          context, mediaDeviceGalleryBloc);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FediSubHeaderText(
                            _calculateFolderTitle(selectedFolder)),
                        FediSmallHorizontalSpacer(),
                        Icon(
                          FediIcons.chevron_down,
                          color: IFediUiColorTheme.of(context).darkGrey,
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

  String _calculateFolderTitle(IMediaDeviceFolder selectedFolder) =>
      "${selectedFolder.name} (${selectedFolder.assetCount})";

  void _showFolderChooserModalBottomSheet(
      BuildContext context, IMediaDeviceGalleryBloc mediaDeviceGalleryBloc) {
    return showFediModalBottomSheetDialog(
        context: context,
        child: Provider.value(
          value: mediaDeviceGalleryBloc,
          child: Padding(
            padding: FediPadding.allBigPadding,
            child: ListView(
              shrinkWrap: true,
              children: mediaDeviceGalleryBloc.folders
                  .map((folder) => ListTile(
                        onTap: () {
                          mediaDeviceGalleryBloc.selectFolder(folder);
                          Navigator.of(context).pop();
                        },
                        title: Text(
                          _calculateFolderTitle(folder),
                          style: folder == mediaDeviceGalleryBloc.selectedFolder
                              ? IFediUiTextTheme.of(context)
                                  .mediumShortBoldDarkGrey
                              : IFediUiTextTheme.of(context)
                                  .mediumShortDarkGrey,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}

void goToSingleMediaPickerPage(BuildContext context,
    {@required MediaDeviceFileCallback onFileSelectedCallback,
    List<MediaDeviceFileType> typesToPick = const [
      MediaDeviceFileType.image,
      MediaDeviceFileType.video
    ]}) {
  Navigator.push(
    context,
    NavigationSlideBottomRouteBuilder(
      page: DisposableProvider<IMediaDeviceGalleryBloc>(
        create: (context) {
          return PhotoManagerMediaDeviceGalleryBloc(
              typesToPick: typesToPick,
              storagePermissionBloc:
                  IStoragePermissionBloc.of(context, listen: false));
        }, // provide parent abstract implementation by type
        child:
            SingleMediaPickerPage(fileSelectedCallback: onFileSelectedCallback),
      ),
    ),
  );
}
