import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/list/account_list_bloc.dart';
import 'package:fedi_app/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/search/result/search_result_model.dart';
import 'package:fedi_app/app/status/list/status_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

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
  IUnifediApiService get unifediApi;
}
