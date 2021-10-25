import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountSuggestionBloc
    implements IInstanceLocationBloc, IDisposable {
  static IMyAccountSuggestionBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountSuggestionBloc>(context, listen: listen);

  IMyAccountSuggestionAccountListNetworkOnlyListBloc
      get myAccountSuggestionAccountListNetworkOnlyListBloc;

  IAccountNetworkOnlyPaginationBloc
      get myAccountSuggestionAccountListNetworkOnlyPaginationBloc;

  IAccountPaginationListBloc get accountPaginationListBloc;
}
