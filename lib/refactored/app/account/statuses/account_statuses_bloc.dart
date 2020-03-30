import 'package:fedi/refactored/app/status/pagination/status_pagination_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountStatusesBloc implements IStatusPaginationBloc {
  static IAccountStatusesBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountStatusesBloc>(context, listen: listen);

}
