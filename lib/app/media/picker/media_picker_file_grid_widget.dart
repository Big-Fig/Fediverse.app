import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/media/picker/media_picker_file_grid_item_widget.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/media/device/file/media_device_file_bloc.dart';
import 'package:fedi/media/device/file/media_device_file_model.dart';
import 'package:fedi/media/device/file/pagination/media_device_file_pagination_list_bloc.dart';
import 'package:fedi/media/device/file/photo_manager/photo_manager_media_device_file_bloc_impl.dart';
import 'package:fedi/media/device/file/photo_manager/photo_manager_media_device_file_model.dart';
import 'package:fedi/media/device/gallery/media_device_gallery_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _logger = Logger('media_picker_file_grid_widget.dart');

class MediaPickerFileGridWidget
    extends FediPaginationListWidget<IMediaDeviceFileMetadata> {
  final WidgetBuilder? headerItemBuilder;

  MediaPickerFileGridWidget({
    Key? key,
    ScrollController? scrollController,
    required this.headerItemBuilder,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          scrollController: scrollController,
          refreshOnFirstLoad: refreshOnFirstLoad,
          isNeedToAddPaddingForUiTests: false,
        );

  @override
  Future<bool> additionalPreRefreshAction(BuildContext context) async {
    var mediaDeviceGalleryBloc =
        IMediaDeviceGalleryBloc.of(context, listen: false);
    await mediaDeviceGalleryBloc.refreshFoldersInformation();

    return true;
  }

  @override
  ScrollView buildItemsCollectionView({
    required BuildContext context,
    required List<IMediaDeviceFileMetadata> items,
    required Widget? header,
    required Widget? footer,
  }) {
    assert(header == null && footer == null,
        'Grid view dont support header or footer');

    _logger.finest(() => 'buildItemsCollectionView');

    var itemCount = items.length;
    if (headerItemBuilder != null) {
      itemCount++;
    }

    return GridView.builder(
      gridDelegate:
          // ignore: no-magic-number
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (headerItemBuilder != null) {
          if (index == 0) {
            return headerItemBuilder!(context);
          } else {
            index--;
          }
        }

        return Provider<IMediaDeviceFileMetadata>.value(
          value: items[index],
          child: const _MediaPickerFileGridItemWidget(),
        );
      },
    );
  }

  @override
  IPaginationListBloc<PaginationPage<IMediaDeviceFileMetadata>,
      IMediaDeviceFileMetadata> retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) =>
      IMediaDeviceFilePaginationListBloc.of(context, listen: listen);
}

class _MediaPickerFileGridItemWidget extends StatelessWidget {
  const _MediaPickerFileGridItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProxyProvider<IMediaDeviceFileMetadata,
        IMediaDeviceFileBloc>(
      update: (BuildContext context, fileMetadata, previous) {
        if (fileMetadata is PhotoManagerMediaDeviceFileMetadata) {
          var mediaDeviceFileBloc = PhotoManagerMediaDeviceFileBloc(
            photoManagerMediaDeviceFileMetadata: fileMetadata,
          );
          mediaDeviceFileBloc.performAsyncInit();

          return mediaDeviceFileBloc;
        } else {
          throw 'IMediaDeviceFile file type not supported $fileMetadata';
        }
      },
      child: const MediaPickerFileGridItemWidget(),
    );
  }
}
