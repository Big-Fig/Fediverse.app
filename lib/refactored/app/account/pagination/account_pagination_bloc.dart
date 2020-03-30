import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/pagination/cached_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountPaginationBloc
    implements ICachedPleromaPaginationBloc<IAccount> {
  static IAccountPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAccountPaginationBloc>(context, listen: listen);
}
