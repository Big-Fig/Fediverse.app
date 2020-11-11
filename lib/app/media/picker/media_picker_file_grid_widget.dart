import 'package:fedi/app/media/picker/media_picker_file_grid_item_widget.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
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
import 'package:provider/provider.dart';

class MediaPickerFileGridWidget
    extends FediPaginationListWidget<IMediaDeviceFile> {
  final WidgetBuilder headerItemBuilder;

  MediaPickerFileGridWidget({
    Key key,
    ScrollController scrollController,
    @required this.headerItemBuilder,
  }) : super(
          key: key,
          scrollController: scrollController,
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
    @required BuildContext context,
    @required List<IMediaDeviceFile> items,
    @required Widget header,
    @required Widget footer,
  }) {
    assert(header == null && footer == null,
        "Grid view don't support header or footer");

    var itemCount = items.length;
    if (headerItemBuilder != null) {
      itemCount++;
    }
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (headerItemBuilder != null) {
          if (index == 0) {
            return headerItemBuilder(context);
          } else {
            index--;
          }
        }
        return Provider<IMediaDeviceFile>.value(
          value: items[index],
          child: const _MediaPickerFileGridItemWidget(),
        );
      },
    );
  }

  @override
  IPaginationListBloc<PaginationPage<IMediaDeviceFile>, IMediaDeviceFile>
      retrievePaginationListBloc(
    BuildContext context, {
    bool listen,
  }) =>
          IMediaDeviceFilePaginationListBloc.of(context, listen: listen);
}

class _MediaPickerFileGridItemWidget extends StatelessWidget {
  const _MediaPickerFileGridItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DisposableProxyProvider<IMediaDeviceFile, IMediaDeviceFileBloc>(
      update: (BuildContext context, file, previous) {
        if (file is PhotoManagerMediaDeviceFile) {
          var mediaDeviceFileBloc = PhotoManagerMediaDeviceFileBloc(
              photoManagerMediaDeviceFile: file);
          mediaDeviceFileBloc.performAsyncInit();
          return mediaDeviceFileBloc;
        } else {
          throw "IMediaDeviceFile file type not supported $file";
        }
      },
      child: const MediaPickerFileGridItemWidget(),
    );
  }
}
