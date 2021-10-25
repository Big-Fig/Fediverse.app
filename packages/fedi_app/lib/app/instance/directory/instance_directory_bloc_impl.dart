import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi_app/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi_app/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi_app/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class InstanceDirectoryBloc extends DisposableOwner
    implements IInstanceDirectoryBloc {
  @override
  final Uri instanceUri;

  final BehaviorSubject<IUnifediApiInstance?> instanceSubject;
  final IPaginationSettingsBloc paginationSettingsBloc;
  final IConnectionService connectionService;
  InstanceDirectoryBloc({
    required IUnifediApiInstance? initialInstance,
    required this.instanceUri,
    required this.connectionService,
    required this.paginationSettingsBloc,
  }) : instanceSubject = BehaviorSubject.seeded(initialInstance) {
    instanceSubject.disposeWith(this);

    instanceDirectoryAccountListNetworkOnlyListBloc =
        InstanceDirectoryAccountListNetworkOnlyListBloc(
      unifediApiInstanceService: unifediApiInstanceService,
      remoteInstanceUriOrNull: instanceUri,
      instanceLocation: instanceLocation,
    );

    instanceDirectoryAccountListNetworkOnlyPaginationBloc =
        AccountNetworkOnlyPaginationBloc(
      connectionService: connectionService,
      listBloc: instanceDirectoryAccountListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    accountPaginationListBloc = AccountPaginationListBloc(
      paginationBloc: instanceDirectoryAccountListNetworkOnlyPaginationBloc,
    );

    addDisposable(instanceDirectoryAccountListNetworkOnlyListBloc);
    addDisposable(
      instanceDirectoryAccountListNetworkOnlyPaginationBloc,
    );
    addDisposable(accountPaginationListBloc);

    // ignore: unawaited_futures, avoid-ignoring-return-values
    accountPaginationListBloc.refreshWithoutController();
  }

  IUnifediApiInstanceService get unifediApiInstanceService;

  @override
  IUnifediApiInstance? get instance => instanceSubject.value;

  @override
  Stream<IUnifediApiInstance?> get instanceStream => instanceSubject.stream;

  @override
  bool get isPleroma => instance!.typeAsUnifediApi.isPleroma;

  @override
  bool get isMastodon => instance!.typeAsUnifediApi.isMastodon;

  @override
  // ignore: avoid-late-keyword
  late IInstanceDirectoryAccountListNetworkOnlyListBloc
      instanceDirectoryAccountListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountNetworkOnlyPaginationBloc
      instanceDirectoryAccountListNetworkOnlyPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountPaginationListBloc accountPaginationListBloc;
}
