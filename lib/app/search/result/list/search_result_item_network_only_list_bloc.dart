import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISearchResultItemNetworkOnlyListBloc extends DisposableOwner
    implements
        INetworkOnlyListBloc<ISearchResultItem>,
        IStatusListBloc,
        IAccountListBloc,
        IHashtagListBloc {
  static ISearchResultItemNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISearchResultItemNetworkOnlyListBloc>(
        context,
        listen: listen,
      );

  @override
  IPleromaApi get pleromaApi;
}
