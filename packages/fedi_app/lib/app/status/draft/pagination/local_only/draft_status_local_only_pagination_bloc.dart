import 'package:fedi_app/app/status/draft/draft_status_model.dart';
import 'package:fedi_app/pagination/local_only/local_only_pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDraftStatusLocalOnlyPaginationBloc
    implements
        ILocalOnlyPaginationBloc<PaginationPage<IDraftStatus>, IDraftStatus> {
  static IDraftStatusLocalOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IDraftStatusLocalOnlyPaginationBloc>(context, listen: listen);
}
