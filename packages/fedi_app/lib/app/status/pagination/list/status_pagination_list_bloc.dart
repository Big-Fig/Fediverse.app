import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusPaginationListBloc
    implements IPaginationListBloc<PaginationPage<IStatus>, IStatus> {
  static IStatusPaginationListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusPaginationListBloc>(context, listen: listen);
}
