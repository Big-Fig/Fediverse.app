import 'package:fedi/app/custom_list/custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_bloc_impl.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/list/custom_list_list_item_widget.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListPaginationListWidget
    extends FediPaginationListWidget<ICustomList> {
  const CustomListPaginationListWidget();

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
              child: const CustomListListItemWidget(),
            ),
          );
        });
  }

  @override
  IPaginationListBloc<PaginationPage<ICustomList>, ICustomList>
      retrievePaginationListBloc(BuildContext context, {bool listen}) =>
          Provider.of<
              IPaginationListBloc<PaginationPage<ICustomList>,
                  ICustomList>>(context, listen: false);
}
