import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/select/recent/recent_select_account_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRecentSelectAccountBloc extends IDisposable {
  static IRecentSelectAccountBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRecentSelectAccountBloc>(
        context,
        listen: listen,
      );

  RecentSelectAccountList? get recentSelectAccountList;

  Stream<RecentSelectAccountList?> get recentSelectAccountListStream;

  Stream<bool> get isRecentSelectAccountListEmptyStream;

  bool get isRecentSelectAccountListEmpty;

  void clear();
}
