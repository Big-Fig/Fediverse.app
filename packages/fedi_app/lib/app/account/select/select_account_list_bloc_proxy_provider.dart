import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi_app/app/account/list/cached/account_cached_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/account/select/select_account_list_bloc.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/search/input/search_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SelectAccountListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const SelectAccountListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<ISelectAccountListBloc, ICachedListBloc<IAccount>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<ISelectAccountListBloc, IAccountCachedListBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<ISelectAccountListBloc, ISearchInputBloc>(
            update: (context, value, previous) => value.searchInputBloc,
            child: AccountCachedListBlocProxyProvider(child: child),
          ),
        ),
      );
}
