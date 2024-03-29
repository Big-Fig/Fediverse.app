import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/suggestion/hashtag_list/network_only/my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi_app/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountFeaturedHashtagSuggestionBloc
    implements IInstanceLocationBloc, IDisposable {
  static IMyAccountFeaturedHashtagSuggestionBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountFeaturedHashtagSuggestionBloc>(
        context,
        listen: listen,
      );

  IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc
      get myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc;

  IHashtagNetworkOnlyPaginationBloc
      get myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc;

  IHashtagPaginationListBloc get hashtagPaginationListBloc;
}
