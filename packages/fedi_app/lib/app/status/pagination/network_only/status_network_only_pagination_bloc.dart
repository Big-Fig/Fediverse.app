import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusNetworkOnlyPaginationBloc
    implements INetworkOnlyUnifediPaginationBloc<IStatus> {
  static IStatusNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusNetworkOnlyPaginationBloc>(context, listen: listen);
}
