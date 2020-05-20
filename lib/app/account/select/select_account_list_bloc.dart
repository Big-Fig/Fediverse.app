import 'package:fedi/app/account/list/cached/account_cached_list_service.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class ISelectAccountCachedListBloc extends IAccountCachedListBloc {
  ISearchInputBloc get searchInputBloc;

  static ISelectAccountCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ISelectAccountCachedListBloc>(context, listen: listen);
}
