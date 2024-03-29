import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/account_list_bloc.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IAccountCachedListBloc extends DisposableOwner
    implements ICachedListBloc<IAccount>, IAccountListBloc {
  static IAccountCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountCachedListBloc>(
        context,
        listen: listen,
      );

  @override
  IUnifediApiService get unifediApi;

  @override
  Future<List<IAccount>> loadLocalItems({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  });

  @override
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  });
}
