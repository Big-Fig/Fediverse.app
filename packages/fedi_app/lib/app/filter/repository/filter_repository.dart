import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/filter/repository/filter_repository_model.dart';
import 'package:fedi_app/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IFilterRepository
    implements
        IAppRemoteReadWriteRepository<DbFilter, IFilter, IUnifediApiFilter, int,
            String, FilterRepositoryFilters, FilterOrderingTermData>,
        IDisposable {
  static IFilterRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFilterRepository>(context, listen: listen);
}
