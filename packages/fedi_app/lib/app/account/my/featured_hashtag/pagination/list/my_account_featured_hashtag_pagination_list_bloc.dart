import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountFeaturedHashtagPaginationListBloc
    implements
        IPaginationListBloc<PaginationPage<IMyAccountFeaturedHashtag>,
            IMyAccountFeaturedHashtag> {
  static IAccountFeaturedHashtagPaginationListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountFeaturedHashtagPaginationListBloc>(
        context,
        listen: listen,
      );
}
