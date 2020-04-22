import 'package:fedi/refactored/app/account/list/cached/account_cached_list_service.dart';
import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class ISelectAccountListService extends IAccountCachedListService {
  ISearchInputBloc get searchInputBloc;

  static ISelectAccountListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ISelectAccountListService>(context, listen: listen);
}
