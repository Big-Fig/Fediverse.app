import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi_app/app/search/input/search_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class ISelectAccountListBloc extends IAccountCachedListBloc {
  static ISelectAccountListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISelectAccountListBloc>(context, listen: listen);

  ISearchInputBloc get searchInputBloc;

  Stream<IAccount?> get accountSelectedStream;

  void onAccountSelected(IAccount account);
}
