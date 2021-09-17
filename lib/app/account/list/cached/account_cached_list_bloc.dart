import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required IAccount? newerThan,
    required IAccount? olderThan,
  });
}
