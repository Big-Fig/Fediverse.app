import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/media/picker/media_picker_page_app_bar_title_widget.dart';
import 'package:fedi/app/media/picker/media_picker_widget.dart';
import 'package:fedi/app/media/picker/single/single_media_picker_bloc.dart';
import 'package:fedi/app/media/picker/single/single_media_picker_bloc_impl.dart';
import 'package:fedi/app/media/picker/single/single_media_picker_bloc_proxy_provider.dart';
import 'package:fedi/app/navigation/navigation_slide_bottom_route_builder.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:fedi/media/device/gallery/photo_manager/photo_manager_device_gallery_bloc_impl.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleMediaPickerPage extends StatelessWidget {
  const SingleMediaPickerPage();

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: _SingleMediaPickerPageAppBar(), //      body:
        // MultiFilePickerWidget(),
        body: SafeArea(
          child: MediaPickerWidget(),
        ),
      );
}

class _SingleMediaPickerPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SingleMediaPickerPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const FediPageCustomAppBar(
        centerTitle: true,
        leading: FediBackIconButton(),
        child: MediaPickerPageAppBarTitle(
          emptyTitleWidget: _SingleMediaPickerPageAppBarEmptyTitleWidget(),
        ),
      );

  @override
  Size get preferredSize => FediPageCustomAppBar.calculatePreferredSize();
}

class _SingleMediaPickerPageAppBarEmptyTitleWidget extends StatelessWidget {
  const _SingleMediaPickerPageAppBarEmptyTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediSubHeaderText(
        S.of(context).file_picker_single_title,
      );
}

Future<IMediaDeviceFile?> goToSingleMediaPickerPage(
  BuildContext context, {
  List<MediaDeviceFileType> typesToPick = const [
    MediaDeviceFileType.image,
    MediaDeviceFileType.video,
  ],
}) =>
    Navigator.push(
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
          child: DisposableProvider<ISingleMediaPickerBloc>(
            create: (context) {
              var singleMediaPickerBloc = SingleMediaPickerBloc();

              singleMediaPickerBloc.fileSelectionStream.listen(
                (IMediaDeviceFile file) {
                  Navigator.pop(context, file);
                },
              ).disposeWith(singleMediaPickerBloc);

              return singleMediaPickerBloc;
            },
            child: const SingleMediaPickerBlocProxyProvider(
              child: SingleMediaPickerPage(),
            ),
          ),
        ),
      ),
    );
