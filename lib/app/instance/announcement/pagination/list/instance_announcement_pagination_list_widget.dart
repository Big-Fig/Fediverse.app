import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_model.dart';
import 'package:fedi/app/instance/announcement/pagination/list/instance_announcement_list_item_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementPaginationListWidget
    extends FediPaginationListWidget<IInstanceAnnouncement> {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const InstanceAnnouncementPaginationListWidget({
    Key? key,
    ScrollController? scrollController,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    Widget? customEmptyWidget,
    Widget? customLoadingWidget,
    bool refreshOnFirstLoad = true,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  }) : super(
          key: key,
          scrollController: scrollController,
          header: header,
          footer: footer,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          customEmptyWidget: customEmptyWidget,
          customLoadingWidget: customLoadingWidget,
          refreshOnFirstLoad: refreshOnFirstLoad,
        );

  @override
  ScrollView buildItemsCollectionView({
    BuildContext? context,
    required List<IInstanceAnnouncement> items,
    Widget? header,
    Widget? footer,
  }) {
    return PaginationListWidget.buildItemsListView(
      context: context,
      keyboardDismissBehavior: keyboardDismissBehavior,
      items: items,
      header: header,
      footer: footer,
      itemBuilder: (context, index) {
        var item = items[index];

        return Provider<IInstanceAnnouncement>.value(
          value: item,
          child: DisposableProxyProvider<IInstanceAnnouncement,
              IInstanceAnnouncementBloc>(
            update: (context, value, previous) =>
                InstanceAnnouncementBloc.createFromContext(
              context,
              value,
            ),
            child: const FediListTile(
              child: InstanceAnnouncementListItemWidget(),
            ),
          ),
        );
      },
    );
  }

  @override
  IPaginationListBloc<PaginationPage<IInstanceAnnouncement>,
      IInstanceAnnouncement> retrievePaginationListBloc(BuildContext context,
          {bool? listen,}) =>
      Provider.of<
          ICachedPaginationListBloc<CachedPaginationPage<IInstanceAnnouncement>,
              IInstanceAnnouncement>>(context, listen: false);
}
