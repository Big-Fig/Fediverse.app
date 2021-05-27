import 'package:fedi/app/account/featured_hashtag/account_featured_hashtag_model.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountFeaturedHashtagNetworkOnlyPaginationBloc
    implements INetworkOnlyPleromaPaginationBloc<IAccountFeaturedHashtag> {
  static IAccountFeaturedHashtagNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountFeaturedHashtagNetworkOnlyPaginationBloc>(context,
          listen: listen);
}
