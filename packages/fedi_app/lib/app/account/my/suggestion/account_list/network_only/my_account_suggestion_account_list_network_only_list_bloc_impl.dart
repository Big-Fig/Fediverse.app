import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger(
  'my_account_suggestion_account_list_network_only_list_bloc_impl.dart',
);

class MyAccountSuggestionAccountListNetworkOnlyListBloc extends DisposableOwner
    implements IMyAccountSuggestionAccountListNetworkOnlyListBloc {
  final IUnifediApiMyAccountService unifediApiMyAccountService;

  final BehaviorSubject<List<IAccount>> removedAccountSuggestionsSubject =
      BehaviorSubject.seeded([]);

  List<IAccount> get removedAccountSuggestions =>
      removedAccountSuggestionsSubject.value;

  Stream<List<IAccount>> get removedAccountSuggestionsStream =>
      removedAccountSuggestionsSubject.stream;

  @override
  IUnifediApiService get unifediApi => unifediApiMyAccountService;

  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  MyAccountSuggestionAccountListNetworkOnlyListBloc({
    required this.unifediApiMyAccountService,
    required this.instanceLocation,
    required this.remoteInstanceUriOrNull,
  }) {
    removedAccountSuggestionsSubject.disposeWith(this);
  }

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage({
    required int pageIndex,
    required int? itemsCountPerPage,
    required String? minId,
    required String? maxId,
  }) async {
    var unifediApiAccounts = await unifediApiMyAccountService.getMySuggestions(
      limit: itemsCountPerPage,
    );
    List<IAccount> result = unifediApiAccounts
        .map(
          (unifediApiAccount) => unifediApiAccount.toDbAccountWrapper(),
        )
        .toList();

    _logger.finest(
      () => 'loadItemsFromRemoteForPage \n'
          'result ${result.length} ',
    );

    return result;
  }

  @override
  Future<void> removeSuggestion({
    required IAccount account,
  }) async {
    await unifediApiMyAccountService.removeMyAccountSuggestion(
      accountId: account.remoteId,
    );

    removedAccountSuggestionsSubject.add(
      [
        ...removedAccountSuggestions,
        account,
      ],
    );
  }

  @override
  bool isSuggestionForAccountRemoved({
    required IAccount account,
  }) =>
      _calculateIsSuggestionForAccountRemoved(
        removedAccountSuggestions,
        account,
      );

  @override
  Stream<bool> isSuggestionForAccountRemovedStream({
    required IAccount account,
  }) =>
      removedAccountSuggestionsStream.map(
        (removedAccountSuggestions) => _calculateIsSuggestionForAccountRemoved(
          removedAccountSuggestions,
          account,
        ),
      );

  static bool _calculateIsSuggestionForAccountRemoved(
    List<IAccount> accountSuggestions,
    IAccount account,
  ) {
    var found = accountSuggestions.firstWhereOrNull(
      (currentAccount) => currentAccount.remoteId == account.remoteId,
    );

    return found != null;
  }
}
