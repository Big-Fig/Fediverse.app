import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger(
  'my_account_suggestion_account_list_network_only_list_bloc_impl.dart',
);

class MyAccountSuggestionAccountListNetworkOnlyListBloc extends DisposableOwner
    implements IMyAccountSuggestionAccountListNetworkOnlyListBloc {
  final IPleromaApiSuggestionsService pleromaApiSuggestionsService;

  final BehaviorSubject<List<IAccount>> removedAccountSuggestionsSubject =
      BehaviorSubject.seeded([]);

  List<IAccount> get removedAccountSuggestions =>
      removedAccountSuggestionsSubject.value;

  Stream<List<IAccount>> get removedAccountSuggestionsStream =>
      removedAccountSuggestionsSubject.stream;

  @override
  IPleromaApi get pleromaApi => pleromaApiSuggestionsService;

  @override
  final InstanceLocation instanceLocation;

  @override
  final Uri? remoteInstanceUriOrNull;

  MyAccountSuggestionAccountListNetworkOnlyListBloc({
    required this.pleromaApiSuggestionsService,
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
    var pleromaAccounts = await pleromaApiSuggestionsService.getSuggestions(
      limit: itemsCountPerPage,
    );
    List<IAccount> result = pleromaAccounts
        .map(
          (pleromaAccount) => pleromaAccount.toDbAccountWrapper(),
        )
        .toList();

    _logger.finest(() => 'loadItemsFromRemoteForPage \n'
        'result ${result.length} ');

    return result;
  }

  @override
  Future removeSuggestion({
    required IAccount account,
  }) async {
    await pleromaApiSuggestionsService.removeSuggestion(
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
        (removedAccountSuggestions) {
          return _calculateIsSuggestionForAccountRemoved(
            removedAccountSuggestions,
            account,
          );
        },
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
