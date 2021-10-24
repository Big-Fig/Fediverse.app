import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/pagination/network_only/network_only_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountFeaturedHashtagNetworkOnlyPaginationBloc
    implements INetworkOnlyUnifediPaginationBloc<IMyAccountFeaturedHashtag> {
  static IAccountFeaturedHashtagNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountFeaturedHashtagNetworkOnlyPaginationBloc>(
        context,
        listen: listen,
      );
}
