import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/filter/filter_bloc.dart';
import 'package:fedi/app/filter/filter_bloc_impl.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/list/filter_list_item_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/cached/cached_pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FilterPaginationListWidget extends FediPaginationListWidget<IFilter> {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const FilterPaginationListWidget({
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
          isNeedToAddPaddingForUiTests: false,
        );

  @override
  ScrollView buildItemsCollectionView({
    BuildContext? context,
    required List<IFilter> items,
    Widget? header,
    Widget? footer,
  }) =>
      PaginationListWidget.buildItemsListView(
        context: context,
        keyboardDismissBehavior: keyboardDismissBehavior,
        items: items,
        header: header,
        footer: footer,
        itemBuilder: (context, index) {
          var item = items[index];

          return Provider<IFilter>.value(
            value: item,
            child: DisposableProxyProvider<IFilter, IFilterBloc>(
              update: (context, value, previous) =>
                  FilterBloc.createFromContext(
                context,
                value,
              ),
              child: const FediListTile(
                child: FilterListItemWidget(),
              ),
            ),
          );
        },
      );

  @override
  IPaginationListBloc<PaginationPage<IFilter>, IFilter>
      retrievePaginationListBloc(BuildContext context, {bool? listen}) =>
          Provider.of<
              ICachedPaginationListBloc<CachedPaginationPage<IFilter>,
                  IFilter>>(context, listen: false);
}
