import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountSuggestionAccountListNetworkOnlyListBloc
    extends INetworkOnlyListBloc<IAccount> implements IAccountListBloc {
  static IMyAccountSuggestionAccountListNetworkOnlyListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountSuggestionAccountListNetworkOnlyListBloc>(
        context,
        listen: listen,
      );

  bool isSuggestionForAccountRemoved({
    required IAccount account,
  });

  Stream<bool> isSuggestionForAccountRemovedStream({
    required IAccount account,
  });

  Future<void> removeSuggestion({
    required IAccount account,
  });
}
