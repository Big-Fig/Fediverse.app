import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountNetworkOnlyPaginationBloc
    implements INetworkOnlyPleromaPaginationBloc<IAccount> {
  static IAccountNetworkOnlyPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAccountNetworkOnlyPaginationBloc>(context, listen: listen);
}
