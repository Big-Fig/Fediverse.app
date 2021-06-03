import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusNetworkOnlyPaginationBloc
    implements INetworkOnlyPleromaPaginationBloc<IStatus> {
  static IStatusNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusNetworkOnlyPaginationBloc>(context, listen: listen);
}
