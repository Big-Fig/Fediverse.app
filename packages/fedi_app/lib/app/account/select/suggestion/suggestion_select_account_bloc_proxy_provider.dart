import 'package:fedi_app/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi_app/app/account/list/cached/account_cached_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/account/select/suggestion/suggestion_select_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SuggestionSelectAccountBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const SuggestionSelectAccountBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<ISuggestionSelectAccountBloc, IAccountCachedListBloc>(
        update: (context, value, previous) => value.accountCachedListBloc,
        child: AccountCachedListBlocProxyProvider(child: child),
      );
}
