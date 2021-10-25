import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountCachedPaginationBloc
    implements ICachedUnifediPaginationBloc<IAccount> {
  static IAccountCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAccountCachedPaginationBloc>(context, listen: listen);
}
