import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/list/network_only/my_account_featured_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/pagination/network_only/my_account_featured_hashtag_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_bloc.dart';
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
