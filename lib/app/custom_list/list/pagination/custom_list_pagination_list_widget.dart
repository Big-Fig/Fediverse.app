import 'package:fedi/app/custom_list/custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/list/custom_list_list_item_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListPaginationListWidget
    extends FediPaginationListWidget<ICustomList> {
  const CustomListPaginationListWidget({
    Key key,
    ScrollController scrollController,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    Widget customEmptyWidget,
    Widget customLoadingWidget,
    bool refreshOnFirstLoad = true,
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
    BuildContext context,
    List<ICustomList> items,
    Widget header,
    Widget footer,
  }) {
    return PaginationListWidget.buildItemsListView(
      context: context,
      items: items,
      header: header,
      footer: footer,
      itemBuilder: (context, index) {
        var item = items[index];
        return Provider<ICustomList>.value(
          value: item,
          child: DisposableProxyProvider<ICustomList, ICustomListBloc>(
            update: (context, value, previous) =>
                CustomListBloc.createFromContext(
              context,
              customList: value,
            ),
            child: const FediListTile(
              child: CustomListListItemWidget(),
            ),
          ),
        );
      },
    );
  }

  @override
  IPaginationListBloc<PaginationPage<ICustomList>, ICustomList>
      retrievePaginationListBloc(BuildContext context, {bool listen}) =>
          Provider.of<
              IPaginationListBloc<PaginationPage<ICustomList>,
                  ICustomList>>(context, listen: false);
}
