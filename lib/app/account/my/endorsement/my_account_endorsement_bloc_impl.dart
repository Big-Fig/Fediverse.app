import 'package:fedi/app/account/my/endorsement/account_list/network_only/my_account_endorsement_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/endorsement/account_list/network_only/my_account_endorsement_account_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/my/endorsement/my_account_endorsement_bloc.dart';
import 'package:fedi/app/account/my/endorsement/my_account_endorsement_bloc_proxy_provider.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountEndorsementBloc extends DisposableOwner
    implements IMyAccountEndorsementBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  MyAccountEndorsementBloc({
    required this.unifediApiMyAccountService,
    required this.paginationSettingsBloc,
  }) {
    myAccountEndorsementAccountListNetworkOnlyListBloc =
        MyAccountEndorsementAccountListNetworkOnlyListBloc(
      unifediApiMyAccountService: unifediApiMyAccountService,
      remoteInstanceUriOrNull: remoteInstanceUriOrNull,
      instanceLocation: instanceLocation,
    );

    myAccountEndorsementAccountListNetworkOnlyPaginationBloc =
        AccountNetworkOnlyPaginationBloc(
      listBloc: myAccountEndorsementAccountListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    accountPaginationListBloc = AccountPaginationListBloc(
      paginationBloc: myAccountEndorsementAccountListNetworkOnlyPaginationBloc,
    );
    myAccountEndorsementAccountListNetworkOnlyListBloc.disposeWith(this);
    myAccountEndorsementAccountListNetworkOnlyPaginationBloc.disposeWith(this);
    accountPaginationListBloc.disposeWith(this);

    // ignore: unawaited_futures
    accountPaginationListBloc.refreshWithoutController();
  }

  final IUnifediApiMyAccountService unifediApiMyAccountService;

  @override
  // ignore: avoid-late-keyword
  late IMyAccountEndorsementAccountListNetworkOnlyListBloc
      myAccountEndorsementAccountListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountNetworkOnlyPaginationBloc
      myAccountEndorsementAccountListNetworkOnlyPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountPaginationListBloc accountPaginationListBloc;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;

  static MyAccountEndorsementBloc createFromContext(BuildContext context) {
    var unifediApiMyAccountService =
        Provider.of<IUnifediApiMyAccountService>(context, listen: false);

    return MyAccountEndorsementBloc(
      unifediApiMyAccountService: unifediApiMyAccountService,
      paginationSettingsBloc: IPaginationSettingsBloc.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IMyAccountEndorsementBloc>(
      create: (context) => MyAccountEndorsementBloc.createFromContext(context),
      child: MyAccountEndorsementBlocProxyProvider(child: child),
    );
  }
}
