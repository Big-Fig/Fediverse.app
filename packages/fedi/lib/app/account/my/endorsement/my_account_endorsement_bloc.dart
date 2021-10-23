import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/my/endorsement/account_list/network_only/my_account_endorsement_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountEndorsementBloc
    implements IInstanceLocationBloc, IDisposable {
  static IMyAccountEndorsementBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountEndorsementBloc>(context, listen: listen);

  IMyAccountEndorsementAccountListNetworkOnlyListBloc
      get myAccountEndorsementAccountListNetworkOnlyListBloc;

  IAccountNetworkOnlyPaginationBloc
      get myAccountEndorsementAccountListNetworkOnlyPaginationBloc;

  IAccountPaginationListBloc get accountPaginationListBloc;
}
