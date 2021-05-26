import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/directory/account_list/network_only/instance_directory_account_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/directory/instance_directory_bloc.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/directory/pleroma_api_directory_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:pedantic/pedantic.dart';
import 'package:rxdart/rxdart.dart';

abstract class InstanceDirectoryBloc extends DisposableOwner
    implements IInstanceDirectoryBloc {
  @override
  final Uri instanceUri;

  final BehaviorSubject<IPleromaApiInstance?> instanceSubject;
  final IPaginationSettingsBloc paginationSettingsBloc;

  InstanceDirectoryBloc({
    required IPleromaApiInstance? initialInstance,
    required this.instanceUri,
    required this.paginationSettingsBloc,
  }) : instanceSubject = BehaviorSubject.seeded(initialInstance) {
    addDisposable(subject: instanceSubject);

    instanceDirectoryAccountListNetworkOnlyListBloc =
        InstanceDirectoryAccountListNetworkOnlyListBloc(
      pleromaApiDirectoryService: pleromaApiDirectoryService,
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

    addDisposable(disposable: instanceDirectoryAccountListNetworkOnlyListBloc);
    addDisposable(
        disposable: instanceDirectoryAccountListNetworkOnlyPaginationBloc);
    addDisposable(disposable: accountPaginationListBloc);

    unawaited(accountPaginationListBloc.refreshWithoutController());
  }

  IPleromaApiDirectoryService get pleromaApiDirectoryService;

  @override
  IPleromaApiInstance? get instance => instanceSubject.value;

  @override
  Stream<IPleromaApiInstance?> get instanceStream => instanceSubject.stream;

  @override
  bool get isPleroma => instance!.isPleroma;

  @override
  bool get isMastodon => instance!.isMastodon;

  @override
  // ignore: avoid-late-keyword
  late IInstanceDirectoryAccountListNetworkOnlyListBloc
      instanceDirectoryAccountListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountNetworkOnlyPaginationBloc
      instanceDirectoryAccountListNetworkOnlyPaginationBloc;

  // ignore: avoid-late-keyword
  @override
  late IAccountPaginationListBloc accountPaginationListBloc;
}
