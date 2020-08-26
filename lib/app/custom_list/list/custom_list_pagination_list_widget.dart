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

class CustomListPaginationListWidget extends FediPaginationListWidget<ICustomList> {
  CustomListPaginationListWidget();

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
            child: Builder(
                builder: (context) {
                  var customList = Provider.of<ICustomList>(context, listen: false);
                  return DisposableProvider<ICustomListBloc>(
                    create: (context) => CustomListBloc(customList:customList),
                    child: CustomListListItemWidget(
                        customList: customList,
                      ),
                  );
                }),
          );
        });
  }

  @override
  IPaginationListBloc<PaginationPage<ICustomList>, ICustomList>
      retrievePaginationListBloc(BuildContext context, {bool listen}) =>
          Provider.of<IPaginationListBloc<PaginationPage<ICustomList>, ICustomList>>(
              context,
              listen: false);
}
