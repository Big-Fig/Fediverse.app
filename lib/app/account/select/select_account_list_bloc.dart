import 'package:fedi/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class ISelectAccountListBloc extends IAccountCachedListBloc {
  ISearchInputBloc get searchInputBloc;

  static ISelectAccountListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ISelectAccountListBloc>(context, listen: listen);
}
