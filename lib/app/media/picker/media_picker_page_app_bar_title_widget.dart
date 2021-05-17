import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/media/device/folder/media_device_folder_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MediaPickerPageAppBarTitle extends StatelessWidget {
  final Widget emptyTitleWidget;

  const MediaPickerPageAppBarTitle({
    Key? key,
    required this.emptyTitleWidget,
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
          return StreamBuilder<MediaDeviceGallerySelectedFolderData?>(
            stream: mediaDeviceGalleryBloc.selectedFolderDataStream,
            builder: (context, snapshot) {
              var selectedFolderData = snapshot.data;
              var selectedFolder = selectedFolderData?.folder;

              if (selectedFolder == null) {
                return const SizedBox.shrink();
              }

              return InkWell(
                onTap: () {
                  _showFolderChooserModalBottomSheet(
                    context,
                    mediaDeviceGalleryBloc,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FediSubHeaderText(
                      _calculateFolderTitle(
                        selectedFolder,
                      ),
                    ),
                    const FediSmallHorizontalSpacer(),
                    Icon(
                      FediIcons.chevron_down,
                      color: IFediUiColorTheme.of(context).darkGrey,
                      // todo: refactor
                      // ignore: no-magic-number
                      size: 14.0,
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return emptyTitleWidget;
        }
      },
    );
  }
}

Future<T?> _showFolderChooserModalBottomSheet<T>(
  BuildContext context,
  IMediaDeviceGalleryBloc mediaDeviceGalleryBloc,
) {
  var fediUiTextTheme = IFediUiTextTheme.of(context, listen: false);

  return showFediModalBottomSheetDialog<T>(
    context: context,
    child: Provider<IMediaDeviceGalleryBloc>.value(
      value: mediaDeviceGalleryBloc,
      child: Padding(
        padding: FediPadding.allBigPadding,
        child: ListView(
          shrinkWrap: true,
          children: mediaDeviceGalleryBloc.folders!.map((folder) {
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

String _calculateFolderTitle(IMediaDeviceFolder selectedFolder) =>
    "${selectedFolder.name} (${selectedFolder.assetCount})";
