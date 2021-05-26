import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceDirectoryBloc
    implements IInstanceBloc, IInstanceLocationBloc {
  static IInstanceDirectoryBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceDirectoryBloc>(context, listen: listen);

  IInstanceDirectoryAccountListNetworkOnlyListBloc
      get instanceDirectoryAccountListNetworkOnlyListBloc;

  IAccountNetworkOnlyPaginationBloc
      get instanceDirectoryAccountListNetworkOnlyPaginationBloc;

  IAccountPaginationListBloc get accountPaginationListBloc;
}

extension IInstanceDirectoryBlocExtension on IInstanceDirectoryBloc {
  String get instanceUriDomain => instanceUri.host;
}
