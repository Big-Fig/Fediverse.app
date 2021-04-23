import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountCachedListBloc extends DisposableOwner
    implements IPleromaCachedListBloc<IAccount>, IAccountListBloc {
  static IAccountCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountCachedListBloc>(
        context,
        listen: listen,
      );

  @override
  IPleromaApi get pleromaApi;

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
