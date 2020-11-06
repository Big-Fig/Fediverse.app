import 'package:fedi/app/list/local_only/network_only_list_bloc.dart';
import 'package:fedi/app/media/picker/media_picker_gallery_folder_widget.dart';
import 'package:fedi/app/media/picker/media_picker_service.dart';
import 'package:fedi/app/media/picker/single_media_picker_bloc.dart';
import 'package:fedi/app/media/picker/single_media_picker_bloc_impl.dart';
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
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_local_only_list_bloc.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_pagination_bloc.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_pagination_list_bloc.dart';
import 'package:fedi/media/device/folder/media_device_folder_bloc.dart';
import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:fedi/media/device/gallery/photo_manager/photo_manager_device_gallery_bloc_impl.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleMediaPickerPage extends StatelessWidget {
  const SingleMediaPickerPage();

  @override
  Widget build(BuildContext context) {
    var mediaDeviceGalleryBloc = IMediaDeviceGalleryBloc.of(context);

    return Scaffold(
      appBar: const _SingleMediaPickerPageAppBar(), //      body:
      // SingleFilePickerWidget(),
      body: SafeArea(
        child: FediGrantPermissionWidget(
          grantedBuilder: (BuildContext context) {
            return FediAsyncInitLoadingWidget(
              loadingFinishedBuilder: (BuildContext context) {
                if (mediaDeviceGalleryBloc.folders?.isNotEmpty != true) {
                  return const _SingleMediaPickerPageNoFoldersWidget();
                } else {
                  return const _SingleMediaPickerPageFoldersWidget();
                }
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
}

class _SingleMediaPickerPageFoldersWidget extends StatelessWidget {
  const _SingleMediaPickerPageFoldersWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaDeviceGalleryBloc = IMediaDeviceGalleryBloc.of(context);
    return StreamBuilder<MediaDeviceGallerySelectedFolderData>(
      stream: mediaDeviceGalleryBloc.selectedFolderDataStream
          .distinct((old, current) => old?.folder?.id == current?.folder?.id),
      builder: (context, snapshot) {
        var folderData = snapshot.data;
        var folder = folderData?.folder;
        if (folder == null) {
          return const _SingleMediaPickerPageFolderLoadingWidget();
        }

        return Provider<IMediaDeviceFolder>.value(
          value: folder,
          child: Provider<IMediaDeviceFolderBloc>.value(
            value: folderData.folderBloc,
            child: Provider<IMediaDeviceFileLocalOnlyListBloc>.value(
              value: folderData.filesListBloc,
              child: Provider<IMediaDeviceFilePaginationBloc>.value(
                value: folderData.filesPaginationBloc,
                child: Provider<IMediaDeviceFilePaginationListBloc>.value(
                  value: folderData.filesPaginationListBloc,
                  child: ProxyProvider<IMediaDeviceFileLocalOnlyListBloc,
                      ILocalOnlyListBloc<IMediaDeviceFile>>(
                    update: (context, value, previous) => value,
                    child: ProxyProvider<
                        IMediaDeviceFilePaginationBloc,
                        ILocalOnlyPaginationBloc<
                            PaginationPage<IMediaDeviceFile>,
                            IMediaDeviceFile>>(
                      update: (context, value, previous) => value,
                      child: ProxyProvider<
                          IMediaDeviceFilePaginationListBloc,
                          IPaginationListBloc<PaginationPage<IMediaDeviceFile>,
                              IMediaDeviceFile>>(
                        update: (context, value, previous) => value,
                        child: ProxyProvider<IMediaDeviceFilePaginationListBloc,
                            IPaginationListBloc>(
                          update: (context, value, previous) => value,
                          child:
                              const _SingleMediaPickerPageGalleryFolderWidget(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SingleMediaPickerPageNoFoldersWidget extends StatelessWidget {
  const _SingleMediaPickerPageNoFoldersWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).file_picker_empty,
      ),
    );
  }
}

class _SingleMediaPickerPageFolderLoadingWidget extends StatelessWidget {
  const _SingleMediaPickerPageFolderLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: FediCircularProgressIndicator());
  }
}

class _SingleMediaPickerPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SingleMediaPickerPageAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediSubPageCustomAppBar(
      centerTitle: true,
      child: const _SingleMediaPickerPageAppBarTitle(),
      leading: const FediBackIconButton(),
    );
  }

  @override
  Size get preferredSize => FediSubPageCustomAppBar.calculatePreferredSize();
}

class _SingleMediaPickerPageGalleryFolderWidget extends StatelessWidget {
  const _SingleMediaPickerPageGalleryFolderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var storagePermissionBloc = IStoragePermissionBloc.of(context);
    var singleMediaPickerBloc = ISingleMediaPickerBloc.of(context);
    return FileGalleryFolderWidget(
      headerItemBuilder: (BuildContext context) {
        return const _FileGalleryFolderPickFromCameraHeaderItemWidget();
      },
      onFileSelectedCallback: singleMediaPickerBloc.fileSelectedCallback,
      loadingWidget: const FediCircularProgressIndicator(),
      permissionButtonBuilder: (context, grantedBuilder) {
        return FediGrantPermissionWidget(
          grantedBuilder: grantedBuilder,
          permissionBloc: storagePermissionBloc,
        );
      },
//                        galleryFileTapped: galleryFileTapped,
    );
  }
}

class _FileGalleryFolderPickFromCameraHeaderItemWidget extends StatelessWidget {
  const _FileGalleryFolderPickFromCameraHeaderItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return InkWell(
      onTap: () async {
        var mediaPickerService = IMediaPickerService.of(context, listen: false);

        var pickedFile = await mediaPickerService.pickImageFromCamera();

        if (pickedFile != null) {
          var singleMediaPickerBloc =
              ISingleMediaPickerBloc.of(context, listen: false);
          singleMediaPickerBloc.fileSelectedCallback(
            context,
            FileMediaDeviceFile(
              type: MediaDeviceFileType.image,
              isNeedDeleteAfterUsage: true,
              originalFile: pickedFile,
            ),
          );
        }
      },
      child: Container(
          color: fediUiColorTheme.white,
          width: double.infinity,
          height: double.infinity,
          child: Icon(
            FediIcons.camera,
            color: IFediUiColorTheme.of(context).darkGrey,
            size: 40.0,
          )),
    );
  }
}

void goToSingleMediaPickerPage(
  BuildContext context, {
  @required MediaDeviceFileCallback onFileSelectedCallback,
  List<MediaDeviceFileType> typesToPick = const [
    MediaDeviceFileType.image,
    MediaDeviceFileType.video
  ],
}) {
  Navigator.push(
    context,
    NavigationSlideBottomRouteBuilder(
      page: DisposableProvider<IMediaDeviceGalleryBloc>(
        create: (context) {
          return PhotoManagerMediaDeviceGalleryBloc(
            typesToPick: typesToPick,
            storagePermissionBloc:
                IStoragePermissionBloc.of(context, listen: false),
          );
        }, // provide parent abstract implementation by type
        child: DisposableProvider<ISingleMediaPickerBloc>(
          create: (context) => SingleMediaPickerBloc(
              fileSelectedCallback: onFileSelectedCallback),
          child: const SingleMediaPickerPage(),
        ),
      ),
    ),
  );
}

String _calculateFolderTitle(IMediaDeviceFolder selectedFolder) =>
    "${selectedFolder.name} (${selectedFolder.assetCount})";

class _SingleMediaPickerPageAppBarTitle extends StatelessWidget {
  const _SingleMediaPickerPageAppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaDeviceGalleryBloc = IMediaDeviceGalleryBloc.of(context);

    return StreamBuilder<List<IMediaDeviceFolder>>(
      stream: mediaDeviceGalleryBloc.foldersStream,
      initialData: mediaDeviceGalleryBloc.folders,
      builder: (context, snapshot) {
        var folders = snapshot.data;

        if (folders?.isNotEmpty == true) {
          return StreamBuilder<MediaDeviceGallerySelectedFolderData>(
              stream: mediaDeviceGalleryBloc.selectedFolderDataStream,
              builder: (context, snapshot) {
                var selectedFolderData = snapshot.data;
                var selectedFolder = selectedFolderData?.folder;

                if (selectedFolder == null) {
                  return SizedBox.shrink();
                }

                return InkWell(
                  onTap: () {
                    _showFolderChooserModalBottomSheet(
                        context, mediaDeviceGalleryBloc);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FediSubHeaderText(_calculateFolderTitle(selectedFolder)),
                      const FediSmallHorizontalSpacer(),
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
          return Text(
            S.of(context).file_picker_single_title,
          );
        }
      },
    );
  }
}

void _showFolderChooserModalBottomSheet(
    BuildContext context, IMediaDeviceGalleryBloc mediaDeviceGalleryBloc) {
  var fediUiTextTheme = IFediUiTextTheme.of(context, listen: false);
  return showFediModalBottomSheetDialog(
    context: context,
    child: Provider.value(
      value: mediaDeviceGalleryBloc,
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: ListView(
          shrinkWrap: true,
          children: mediaDeviceGalleryBloc.folders.map((folder) {
            return ListTile(
              onTap: () {
                mediaDeviceGalleryBloc.selectFolder(folder);
                Navigator.of(context).pop();
              },
              title: Text(
                _calculateFolderTitle(folder),
                style:
                    folder == mediaDeviceGalleryBloc.selectedFolderData?.folder
                        ? fediUiTextTheme.mediumShortBoldDarkGrey
                        : fediUiTextTheme.mediumShortDarkGrey,
              ),
            );
          }).toList(),
        ),
      ),
    ),
  );
}
