import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_item_widget.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagPaginationListWidget extends FediPaginationListWidget<IHashtag> {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const HashtagPaginationListWidget({
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  });

  @override
  ScrollView buildItemsCollectionView({
    BuildContext? context,
    required List<IHashtag> items,
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
        return Provider<IHashtag>.value(
          value: item,
          child: const HashtagListItemWidget(),
        );
      },
    );
  }

  @override
  IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>
      retrievePaginationListBloc(BuildContext context, {bool? listen}) =>
          Provider.of<IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>>(
            context,
            listen: false,
          );
}
