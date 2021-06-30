import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/my/suggestion/my_account_suggestion_bloc.dart';
import 'package:fedi/app/account/my/suggestion/my_account_suggestion_bloc_proxy_provider.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/pleroma/api/suggestions/pleroma_api_suggestions_service.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

class MyAccountSuggestionBloc extends DisposableOwner
    implements IMyAccountSuggestionBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  MyAccountSuggestionBloc({
    required this.pleromaApiSuggestionsService,
    required this.paginationSettingsBloc,
  }) {
    myAccountSuggestionAccountListNetworkOnlyListBloc =
        MyAccountSuggestionAccountListNetworkOnlyListBloc(
      pleromaApiSuggestionsService: pleromaApiSuggestionsService,
      remoteInstanceUriOrNull: remoteInstanceUriOrNull,
      instanceLocation: instanceLocation,
    );

    myAccountSuggestionAccountListNetworkOnlyPaginationBloc =
        AccountNetworkOnlyPaginationBloc(
      listBloc: myAccountSuggestionAccountListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    accountPaginationListBloc = AccountPaginationListBloc(
      paginationBloc: myAccountSuggestionAccountListNetworkOnlyPaginationBloc,
    );

    myAccountSuggestionAccountListNetworkOnlyListBloc.disposeWith(this);
    myAccountSuggestionAccountListNetworkOnlyPaginationBloc.disposeWith(this);
    accountPaginationListBloc.disposeWith(this);

    unawaited(accountPaginationListBloc.refreshWithoutController());
  }

  final IPleromaApiSuggestionsService pleromaApiSuggestionsService;

  @override
  // ignore: avoid-late-keyword
  late IMyAccountSuggestionAccountListNetworkOnlyListBloc
      myAccountSuggestionAccountListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountNetworkOnlyPaginationBloc
      myAccountSuggestionAccountListNetworkOnlyPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountPaginationListBloc accountPaginationListBloc;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;

  static MyAccountSuggestionBloc createFromContext(BuildContext context) {
    var pleromaApiSuggestionsService =
        IPleromaApiSuggestionsService.of(context, listen: false);

    return MyAccountSuggestionBloc(
      pleromaApiSuggestionsService: pleromaApiSuggestionsService,
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
    return DisposableProvider<IMyAccountSuggestionBloc>(
      create: (context) => MyAccountSuggestionBloc.createFromContext(context),
      child: MyAccountSuggestionBlocProxyProvider(child: child),
    );
  }
}
