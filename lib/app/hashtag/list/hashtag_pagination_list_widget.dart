import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_item_widget.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HashtagPaginationListWidget extends FediPaginationListWidget<IHashtag> {
  HashtagPaginationListWidget();

  @override
  ScrollView buildItemsCollectionView({
    BuildContext context,
    List<IHashtag> items,
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
          return Provider<IHashtag>.value(
            value: item,
            child: Builder(
                builder: (context) {
                  var hashtag = Provider.of<IHashtag>(context, listen: false);
                  return HashtagListItemWidget(
                      hashtag: hashtag,
                    );
                }),
          );
        });
  }

  @override
  IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>
      retrievePaginationListBloc(BuildContext context, {bool listen}) =>
          Provider.of<IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>>(
              context,
              listen: false);
}
