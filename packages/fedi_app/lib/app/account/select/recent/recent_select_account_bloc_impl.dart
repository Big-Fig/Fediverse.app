import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/account/select/recent/local_preferences/recent_select_account_local_preference_bloc.dart';
import 'package:fedi_app/app/account/select/recent/recent_select_account_bloc.dart';
import 'package:fedi_app/app/account/select/recent/recent_select_account_model.dart';
import 'package:fedi_app/app/account/select/select_account_list_bloc.dart';

class RecentSelectAccountBloc extends DisposableOwner
    implements IRecentSelectAccountBloc {
  final ISelectAccountListBloc selectAccountListBloc;
  final IRecentSelectAccountLocalPreferenceBloc
      recentSelectAccountLocalPreferenceBloc;
  final int recentCountLimit;

  @override
  RecentSelectAccountList? get recentSelectAccountList =>
      recentSelectAccountLocalPreferenceBloc.value;

  @override
  Stream<RecentSelectAccountList?> get recentSelectAccountListStream =>
      recentSelectAccountLocalPreferenceBloc.stream;

  RecentSelectAccountBloc({
    // ignore: no-magic-number
    this.recentCountLimit = 20,
    required this.selectAccountListBloc,
    required this.recentSelectAccountLocalPreferenceBloc,
  }) {
    selectAccountListBloc.accountSelectedStream.listen(
      (selectedAccount) {
        var oldValue = recentSelectAccountList ??
            const RecentSelectAccountList(recentItems: []);

        var recentItems = oldValue.recentItems!;
        if (recentItems.length > recentCountLimit) {
          recentItems = recentItems.sublist(0, recentCountLimit);
        }

        if (selectedAccount != null) {
          // ignore: avoid-ignoring-return-values
          recentItems.removeWhere(
            // ignore: avoid-ignoring-return-values
            (account) => account.id == selectedAccount.remoteId,
          );

          // ignore: cascade_invocations, avoid-ignoring-return-values
          recentItems.add(selectedAccount.toUnifediApiAccount());
        }

        recentSelectAccountLocalPreferenceBloc.setValue(
          RecentSelectAccountList(
            recentItems: recentItems,
          ),
        );
      },
    ).disposeWith(this);
  }

  @override
  bool get isRecentSelectAccountListEmpty =>
      _calculateIsRecentSelectAccountListEmpty(recentSelectAccountList);

  @override
  Stream<bool> get isRecentSelectAccountListEmptyStream =>
      recentSelectAccountListStream.map(
        _calculateIsRecentSelectAccountListEmpty,
      );

  static bool _calculateIsRecentSelectAccountListEmpty(
    RecentSelectAccountList? list,
  ) {
    var recentItems = list?.recentItems;
    var isEmpty = !(recentItems?.isNotEmpty == true);

    return isEmpty;
  }

  @override
  void clear() {
    recentSelectAccountLocalPreferenceBloc
        .setValue(const RecentSelectAccountList(recentItems: []));
  }
}
