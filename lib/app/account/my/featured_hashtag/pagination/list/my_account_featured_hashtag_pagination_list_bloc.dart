import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountFeaturedHashtagPaginationListBloc
    implements
        IPaginationListBloc<PaginationPage<IAccountFeaturedHashtag>,
            IAccountFeaturedHashtag> {
  static IAccountFeaturedHashtagPaginationListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountFeaturedHashtagPaginationListBloc>(
        context,
        listen: listen,
      );
}
