import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/account/my/featured_hashtag/list/my_account_featured_hashtag_list_item_widget.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagPaginationListWidget
    extends FediPaginationListWidget<IAccountFeaturedHashtag> {
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  const AccountFeaturedHashtagPaginationListWidget({
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  });

  @override
  ScrollView buildItemsCollectionView({
    BuildContext? context,
    required List<IAccountFeaturedHashtag> items,
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

        return Provider<IAccountFeaturedHashtag>.value(
          value: item,
          child: const AccountFeaturedHashtagListItemWidget(),
        );
      },
    );
  }

  @override
  IPaginationListBloc<PaginationPage<IAccountFeaturedHashtag>,
      IAccountFeaturedHashtag> retrievePaginationListBloc(
    BuildContext context, {
    bool listen = false,
  }) =>
      Provider.of<
          IPaginationListBloc<PaginationPage<IAccountFeaturedHashtag>,
              IAccountFeaturedHashtag>>(
        context,
        listen: listen,
      );
}
