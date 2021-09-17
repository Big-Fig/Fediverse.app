import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';

import 'package:rxdart/rxdart.dart';

abstract class InstanceDirectoryBloc extends DisposableOwner
    implements IInstanceDirectoryBloc {
  @override
  final Uri instanceUri;

  final BehaviorSubject<IUnifediApiInstance?> instanceSubject;
  final IPaginationSettingsBloc paginationSettingsBloc;

  InstanceDirectoryBloc({
    required IUnifediApiInstance? initialInstance,
    required this.instanceUri,
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

    // ignore: unawaited_futures
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
