import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc
    extends INetworkOnlyListBloc<IHashtag> implements IHashtagListBloc {
  static IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<
          IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc>(
        context,
        listen: listen,
      );
}
