import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusRepository
    implements
        IReadIdListRepository<IStatus, int>,
        IWriteIdListRepository<DbStatusWrapper, int> {
  static IStatusRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusRepository>(context, listen: listen);
}
