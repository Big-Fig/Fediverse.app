import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISuggestionSelectAccountBloc implements IDisposable {
  static ISuggestionSelectAccountBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ISuggestionSelectAccountBloc>(context, listen: listen);

  IAccountCachedListBloc get accountCachedListBloc;
}
