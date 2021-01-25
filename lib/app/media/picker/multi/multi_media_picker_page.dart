import 'package:fedi/app/list/local_only/local_only_list_bloc.dart';
import 'package:fedi/app/media/camera/camera_media_service.dart';
import 'package:fedi/app/media/picker/media_picker_gallery_folder_widget.dart';
import 'package:fedi/app/media/picker/multi/multi_media_picker_bloc.dart';
import 'package:fedi/app/media/picker/multi/multi_media_picker_bloc_impl.dart';
import 'package:fedi/app/media/picker/multi/multi_media_picker_bloc_proxy_provider.dart';
import 'package:fedi/app/navigation/navigation_slide_bottom_route_builder.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_bloc.dart';
import 'package:fedi/app/ui/badge/int/fedi_int_badge_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/app/ui/permission/fedi_grant_permission_widget.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
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

class MultiMediaPickerPage extends StatelessWidget {
  const MultiMediaPickerPage();

  @override
  Widget build(BuildContext context) {
    var mediaDeviceGalleryBloc = IMediaDeviceGalleryBloc.of(context);

    return Scaffold(
      appBar: const _MultiMediaPickerPageAppBar(), //      body:
      // MultiFilePickerWidget(),
      body: SafeArea(
        child: FediGrantPermissionWidget(
          grantedBuilder: (BuildContext context) {
            return FediAsyncInitLoadingWidget(
              loadingFinishedBuilder: (BuildContext context) {
                if (mediaDeviceGalleryBloc.folders?.isNotEmpty != true) {
                  return const _MultiMediaPickerPageNoFoldersWidget();
                } else {
                  return const _MultiMediaPickerPageFoldersWidget();
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

class _MultiMediaPickerPageFoldersWidget extends StatelessWidget {
  const _MultiMediaPickerPageFoldersWidget({Key key}) : super(key: key);

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
          return const _MultiMediaPickerPageFolderLoadingWidget();
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
                      ILocalOnlyListBloc<IMediaDeviceFileMetadata>>(
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
                          child:
                          const _MultiMediaPickerPageGalleryFolderWidget(),
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

class _MultiMediaPickerPageNoFoldersWidget extends StatelessWidget {
  const _MultiMediaPickerPageNoFoldersWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S
            .of(context)
            .file_picker_empty,
      ),
    );
  }
}

class _MultiMediaPickerPageFolderLoadingWidget extends StatelessWidget {
  const _MultiMediaPickerPageFolderLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: FediCircularProgressIndicator());
  }
}

class _MultiMediaPickerPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _MultiMediaPickerPageAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediPageCustomAppBar(
      centerTitle: true,
      child: const _MultiMediaPickerPageAppBarTitle(),
      leading: const FediBackIconButton(),
      actions: [
        const _MultiMediaPickerPageAppBarAttachAction(),
      ],
    );
  }

  @override
  Size get preferredSize => FediPageCustomAppBar.calculatePreferredSize();
}

class _MultiMediaPickerPageAppBarAttachActionIntBadgeBloc
    extends DisposableOwner
    implements IFediIntBadgeBloc {
  final IMultiMediaPickerBloc multiMediaPickerBloc;

  _MultiMediaPickerPageAppBarAttachActionIntBadgeBloc({
    @required this.multiMediaPickerBloc,
  });

  @override
  Stream<int> get badgeStream =>
      multiMediaPickerBloc.currentFilesMetadataSelectionCountStream;
}

class _MultiMediaPickerPageAppBarAttachAction extends StatelessWidget {
  const _MultiMediaPickerPageAppBarAttachAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multiMediaPickerBloc = IMultiMediaPickerBloc.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return StreamBuilder<bool>(
      stream: multiMediaPickerBloc.isSomethingSelectedStream,
      initialData: multiMediaPickerBloc.isSomethingSelected,
      builder: (context, snapshot) {
        var isSomethingSelected = snapshot.data;
        return DisposableProvider<IFediIntBadgeBloc>(
          create: (context) =>
              _MultiMediaPickerPageAppBarAttachActionIntBadgeBloc(
                multiMediaPickerBloc: multiMediaPickerBloc,
              ),
          child: FediIntBadgeWidget(
            child: FediIconButton(
              color: isSomethingSelected
                  ? fediUiColorTheme.darkGrey
                  : fediUiColorTheme.lightGrey,
              icon: Icon(FediIcons.check),
              onPressed: isSomethingSelected
                  ? () {
                multiMediaPickerBloc.acceptSelectedFilesMetadata();
              }
                  : null,
            ),
          ),
        );
      },
    );
  }
}

class _MultiMediaPickerPageGalleryFolderWidget extends StatelessWidget {
  const _MultiMediaPickerPageGalleryFolderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var storagePermissionBloc = IStoragePermissionBloc.of(context);

    return FileGalleryFolderWidget(
      headerItemBuilder: (BuildContext context) {
        return const _FileGalleryFolderPickFromCameraHeaderItemWidget();
      },
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
        var cameraMediaService = ICameraMediaService.of(context, listen: false);

        var pickedFile = await cameraMediaService.pickImageFromCamera();

        if (pickedFile != null) {
          var multiMediaPickerBloc =
          IMultiMediaPickerBloc.of(context, listen: false);

          await multiMediaPickerBloc.toggleFileMetadataSelection(
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
          height: double.infinity,
          child: Icon(
            FediIcons.camera,
            color: IFediUiColorTheme
                .of(context)
                .darkGrey,
            size: 40.0,
          )),
    );
  }
}

Future<List<IMediaDeviceFile>> goToMultiMediaPickerPage(BuildContext context, {
  List<MediaDeviceFileType> typesToPick = const [
    MediaDeviceFileType.image,
    MediaDeviceFileType.video
  ],
  @required int selectionCountLimit,
}) {
  return Navigator.push(
    context,
    NavigationSlideBottomRouteBuilder(
      page: DisposableProvider<IMediaDeviceGalleryBloc>(
        create: (context) {
          return PhotoManagerMediaDeviceGalleryBloc(
            typesToPick: typesToPick,
            storagePermissionBloc:
            IStoragePermissionBloc.of(context, listen: false),
            paginationSettingsBloc: IPaginationSettingsBloc.of(
              context,
              listen: false,
            ),
          );
        }, // provide parent abstract implementation by type
        child: DisposableProvider<IMultiMediaPickerBloc>(
          create: (context) {

            var multiMediaPickerBloc = MultiMediaPickerBloc(
                selectionCountLimit: selectionCountLimit);

            multiMediaPickerBloc.addDisposable(
              streamSubscription:
              multiMediaPickerBloc.acceptedFilesSelectionStream.listen(
                    (List<IMediaDeviceFile> acceptedFiles) {
                  Navigator.pop(context, acceptedFiles);
                },
              ),
            );

            multiMediaPickerBloc.addDisposable(
              streamSubscription:
              multiMediaPickerBloc.selectionCountLimitReachedStream.listen(
                    (_) {
                  var toastService = IToastService.of(context, listen: false);

                  toastService.showInfoToast(
                    context: context,
                    title: S
                        .of(context)
                        .file_picker_multi_selectionCountLimitReached_notification_title,
                    content: S
                        .of(context)
                        .file_picker_multi_selectionCountLimitReached_notification_content(
                        selectionCountLimit),
                  );
                },
              ),
            );

            return multiMediaPickerBloc;
          },
          child: MultiMediaPickerBlocProxyProvider(
            child: const MultiMediaPickerPage(),
          ),
        ),
      ),
    ),
  );
}

String _calculateFolderTitle(IMediaDeviceFolder selectedFolder) =>
    "${selectedFolder.name} (${selectedFolder.assetCount})";

class _MultiMediaPickerPageAppBarTitle extends StatelessWidget {
  const _MultiMediaPickerPageAppBarTitle({
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
                        color: IFediUiColorTheme
                            .of(context)
                            .darkGrey,
                        size: 14.0,
                      )
                    ],
                  ),
                );
              });
        } else {
          return Text(
            S
                .of(context)
                .file_picker_multi_title,
          );
        }
      },
    );
  }
}

void _showFolderChooserModalBottomSheet(BuildContext context,
    IMediaDeviceGalleryBloc mediaDeviceGalleryBloc) {
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
