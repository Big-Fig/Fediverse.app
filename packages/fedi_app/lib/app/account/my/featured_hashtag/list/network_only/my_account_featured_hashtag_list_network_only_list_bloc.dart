import 'package:fedi_app/app/account/my/featured_hashtag/list/my_account_featured_hashtag_list_bloc.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountFeaturedHashtagListNetworkOnlyListBloc
    extends INetworkOnlyListBloc<IMyAccountFeaturedHashtag>
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
