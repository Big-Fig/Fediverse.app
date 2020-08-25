import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<IAccount> {
  static IAccountCachedPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAccountCachedPaginationBloc>(context, listen: listen);
}
