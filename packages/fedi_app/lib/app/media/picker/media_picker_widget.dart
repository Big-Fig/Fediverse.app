import 'package:fedi_app/app/list/local_only/local_only_list_bloc.dart';
import 'package:fedi_app/app/media/camera/camera_media_service.dart';
import 'package:fedi_app/app/media/picker/media_picker_bloc.dart';
import 'package:fedi_app/app/media/picker/media_picker_gallery_folder_widget.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/permission/fedi_grant_permission_widget.dart';
import 'package:fedi_app/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:fedi_app/media/device/file/pagination/media_device_file_local_only_list_bloc.dart';
import 'package:fedi_app/media/device/file/pagination/media_device_file_pagination_bloc.dart';
import 'package:fedi_app/media/device/file/pagination/media_device_file_pagination_list_bloc.dart';
import 'package:fedi_app/media/device/folder/media_device_folder_bloc.dart';
import 'package:fedi_app/media/device/folder/media_device_folder_model.dart';
import 'package:fedi_app/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:fedi_app/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaPickerWidget extends StatelessWidget {
  const MediaPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaDeviceGalleryBloc = IMediaDeviceGalleryBloc.of(context);

    return FediGrantPermissionWidget(
      grantedBuilder: (BuildContext context) => FediAsyncInitLoadingWidget(
        loadingFinishedBuilder: (BuildContext context) {
          if (mediaDeviceGalleryBloc.folders?.isNotEmpty != true) {
            return const _MediaPickerPageNoFoldersWidget();
          } else {
            return const _MediaPickerPageFoldersWidget();
          }
        },
        asyncInitLoadingBloc: mediaDeviceGalleryBloc,
      ),
      permissionBloc: IStoragePermissionBloc.of(context, listen: false),
    );
  }
}

class _MediaPickerPageNoFoldersWidget extends StatelessWidget {
  const _MediaPickerPageNoFoldersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          S.of(context).file_picker_empty,
        ),
      );
}

class _MediaPickerPageFolderLoadingWidget extends StatelessWidget {
  const _MediaPickerPageFolderLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: FediCircularProgressIndicator(),
      );
}

class _MediaPickerPageFoldersWidget extends StatelessWidget {
  const _MediaPickerPageFoldersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaDeviceGalleryBloc = IMediaDeviceGalleryBloc.of(context);

    return StreamBuilder<MediaDeviceGallerySelectedFolderData?>(
      stream: mediaDeviceGalleryBloc.selectedFolderDataStream
          .distinct((old, current) => old?.folder.id == current?.folder.id),
      builder: (context, snapshot) {
        var folderData = snapshot.data;
        var folder = folderData?.folder;
        if (folder == null) {
          return const _MediaPickerPageFolderLoadingWidget();
        }

        return Provider<IMediaDeviceFolder>.value(
          value: folder,
          child: Provider<IMediaDeviceFolderBloc>.value(
            value: folderData!.folderBloc,
            child: Provider<IMediaDeviceFileLocalOnlyListBloc>.value(
              value: folderData.filesListBloc,
              child: Provider<IMediaDeviceFilePaginationBloc>.value(
                value: folderData.filesPaginationBloc,
                child: Provider<IMediaDeviceFilePaginationListBloc>.value(
                  value: folderData.filesPaginationListBloc,
                  child: ProxyProvider<IMediaDeviceFileLocalOnlyListBloc,
                      ILocalOnlyListBloc<IMediaDeviceFileMetadata?>>(
                    update: (context, value, previous) => value,
                    child: ProxyProvider<
                        IMediaDeviceFilePaginationBloc,
                        ILocalOnlyPaginationBloc<
                            PaginationPage<IMediaDeviceFileMetadata>,
                            IMediaDeviceFileMetadata>>(
                      update: (context, value, previous) => value,
                      child: ProxyProvider<
                          IMediaDeviceFilePaginationListBloc,
                          IPaginationListBloc<
                              PaginationPage<IMediaDeviceFileMetadata>,
                              IMediaDeviceFileMetadata>>(
                        update: (context, value, previous) => value,
                        child: ProxyProvider<IMediaDeviceFilePaginationListBloc,
                            IPaginationListBloc>(
                          update: (context, value, previous) => value,
                          child: const _MediaPickerPageGalleryFolderWidget(),
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

class _MediaPickerPageGalleryFolderWidget extends StatelessWidget {
  const _MediaPickerPageGalleryFolderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var storagePermissionBloc = IStoragePermissionBloc.of(context);

    return FileGalleryFolderWidget(
      headerItemBuilder: (BuildContext context) =>
          const _FileGalleryFolderPickFromCameraHeaderItemWidget(),
      permissionButtonBuilder: (context, grantedBuilder) =>
          FediGrantPermissionWidget(
        grantedBuilder: grantedBuilder,
        permissionBloc: storagePermissionBloc,
      ),
    );
  }
}

class _FileGalleryFolderPickFromCameraHeaderItemWidget extends StatelessWidget {
  const _FileGalleryFolderPickFromCameraHeaderItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return InkWell(
      onTap: () async {
        var cameraMediaService = ICameraMediaService.of(context, listen: false);

        var pickedFile = await cameraMediaService.pickImageFromCamera();

        if (pickedFile != null) {
          var mediaPickerBloc = IMediaPickerBloc.of(context, listen: false);

          await mediaPickerBloc.toggleFileMetadataSelection(
            FileMediaDeviceFileMetadata(
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
        // ignore: no-equal-arguments
        height: double.infinity,
        child: Icon(
          FediIcons.camera,
          color: IFediUiColorTheme.of(context).darkGrey,
          // ignore: no-magic-number
          size: 40.0,
        ),
      ),
    );
  }
}
