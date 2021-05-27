import 'package:fedi/app/account/featured_hashtag/list/network_only/account_featured_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/featured_hashtag/pagination/list/account_featured_hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/account/featured_hashtag/pagination/network_only/account_featured_hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountFeaturedHashtagListPageBloc
    implements IInstanceLocationBloc, IDisposable {
  static IAccountFeaturedHashtagListPageBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountFeaturedHashtagListPageBloc>(context, listen: listen);

  IAccountFeaturedHashtagListNetworkOnlyListBloc
      get accountFeaturedHashtagListNetworkOnlyListBloc;

  IAccountFeaturedHashtagNetworkOnlyPaginationBloc
      get accountFeaturedHashtagListNetworkOnlyPaginationBloc;

  IAccountFeaturedHashtagPaginationListBloc get hashtagPaginationListBloc;
}
