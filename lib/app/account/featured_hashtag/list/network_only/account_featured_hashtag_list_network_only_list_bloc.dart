import 'package:fedi/app/account/featured_hashtag/account_featured_hashtag_model.dart';
import 'package:fedi/app/account/featured_hashtag/list/account_featured_hashtag_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountFeaturedHashtagListNetworkOnlyListBloc
    extends INetworkOnlyListBloc<IAccountFeaturedHashtag>
    implements IAccountFeaturedHashtagListBloc {
  static IAccountFeaturedHashtagListNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountFeaturedHashtagListNetworkOnlyListBloc>(
        context,
        listen: listen,
      );
}
