import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/media/picker/media_picker_page_app_bar_title_widget.dart';
import 'package:fedi_app/app/media/picker/media_picker_widget.dart';
import 'package:fedi_app/app/media/picker/multi/multi_media_picker_bloc.dart';
import 'package:fedi_app/app/media/picker/multi/multi_media_picker_bloc_impl.dart';
import 'package:fedi_app/app/media/picker/multi/multi_media_picker_bloc_proxy_provider.dart';
import 'package:fedi_app/app/media/picker/single/single_media_picker_page.dart';
import 'package:fedi_app/app/navigation/navigation_slide_bottom_route_builder.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/media/device/file/media_device_file_model.dart';
import 'package:fedi_app/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:fedi_app/media/device/gallery/photo_manager/photo_manager_device_gallery_bloc_impl.dart';
import 'package:fedi_app/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiMediaPickerPage extends StatelessWidget {
  const MultiMediaPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: _MultiMediaPickerPageAppBar(),
        body: SafeArea(
          child: _MultiMediaPickerPageBodyWidget(),
        ),
      );
}

class _MultiMediaPickerPageBodyWidget extends StatelessWidget {
  const _MultiMediaPickerPageBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var multiMediaPickerBloc = IMultiMediaPickerBloc.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return Column(
      children: [
        const Expanded(
          child: MediaPickerWidget(),
        ),
        const FediUltraLightGreyDivider(),
        StreamBuilder<int>(
          stream: multiMediaPickerBloc.currentFilesMetadataSelectionCountStream,
          builder: (context, snapshot) {
            var currentFilesMetadataSelectionCount = snapshot.data ?? 0;

            if (currentFilesMetadataSelectionCount > 0) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FediIconButton(
                    icon: const Icon(FediIcons.share_native),
                    color: fediUiColorTheme.primary,
                    onPressed: () {
                      multiMediaPickerBloc.acceptSelectedFilesMetadata();
                    },
                  ),
                  Padding(
                    padding: FediPadding.allBigPadding,
                    child: FediSubHeaderText(
                      text: S
                          .of(context)
                          .file_picker_multi_selectionCount_selected(
                            currentFilesMetadataSelectionCount,
                          ),
                    ),
                  ),
                  FediIconButton(
                    icon: const Icon(FediIcons.delete),
                    color: fediUiColorTheme.primary,
                    onPressed: () {
                      multiMediaPickerBloc.clearSelection();
                    },
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class _MultiMediaPickerPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _MultiMediaPickerPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const FediPageCustomAppBar(
        centerTitle: true,
        leading: FediBackIconButton(),
        child: MediaPickerPageAppBarTitle(
          emptyTitleWidget: _MultiMediaPickerPageAppBarEmptyTitleWidget(),
        ),
      );

  @override
  Size get preferredSize => FediPageCustomAppBar.calculatePreferredSize();
}

class _MultiMediaPickerPageAppBarEmptyTitleWidget extends StatelessWidget {
  const _MultiMediaPickerPageAppBarEmptyTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediSubHeaderText(
        text: S.of(context).file_picker_multi_title,
      );
}

Future<List<IMediaDeviceFile>?> goToMultiMediaPickerPage(
  BuildContext context, {
  List<MediaDeviceFileType> typesToPick = const [
    MediaDeviceFileType.image,
    MediaDeviceFileType.video,
  ],
  required int? selectionCountLimit,
}) async {
  if (selectionCountLimit == 1) {
    var singlePickedFile = await goToSingleMediaPickerPage(
      context,
      typesToPick: typesToPick,
    );
    if (singlePickedFile == null) {
      return null;
    } else {
      return [
        singlePickedFile,
      ];
    }
  }

  return Navigator.push(
    context,
    NavigationSlideBottomRouteBuilder(
      page: DisposableProvider<IMediaDeviceGalleryBloc>(
        create: (context) => PhotoManagerMediaDeviceGalleryBloc(
          typesToPick: typesToPick,
          storagePermissionBloc:
              IStoragePermissionBloc.of(context, listen: false),
          paginationSettingsBloc: IPaginationSettingsBloc.of(
            context,
            listen: false,
          ),
        ), // provide parent abstract implementation by type
        child: DisposableProvider<IMultiMediaPickerBloc>(
          create: (context) => _createMultiMediaPickerBloc(
            context,
            selectionCountLimit,
          ),
          child: const MultiMediaPickerBlocProxyProvider(
            child: MultiMediaPickerPage(),
          ),
        ),
      ),
    ),
  );
}

MultiMediaPickerBloc _createMultiMediaPickerBloc(
  BuildContext context,
  int? selectionCountLimit,
) {
  var multiMediaPickerBloc =
      MultiMediaPickerBloc(selectionCountLimit: selectionCountLimit);

  multiMediaPickerBloc.acceptedFilesSelectionStream.listen(
    (List<IMediaDeviceFile> acceptedFiles) {
      Navigator.pop(context, acceptedFiles);
    },
  ).disposeWith(multiMediaPickerBloc);

  multiMediaPickerBloc.selectionCountLimitReachedStream.listen(
    (_) {
      var toastService = IToastService.of(context, listen: false);

      // ignore: cascade_invocations
      toastService.showInfoToast(
        context: context,
        title: S
            .of(context)
            .file_picker_multi_selectionCountLimitReached_notification_title,
        content: S
            .of(context)
            .file_picker_multi_selectionCountLimitReached_notification_content(
              selectionCountLimit!,
            ),
      );
    },
  ).disposeWith(multiMediaPickerBloc);

  return multiMediaPickerBloc;
}
