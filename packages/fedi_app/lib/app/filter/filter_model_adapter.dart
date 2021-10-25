import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IUnifediFilterExtension on IUnifediApiFilter {
  IFilter toDbFilterPopulatedWrapper() => DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: toDbFilter(),
        ),
      );

  DbFilter toDbFilter() => DbFilter(
        id: null,
        remoteId: id,
        phrase: phrase,
        context: context,
        irreversible: irreversible,
        wholeWord: wholeWord,
        expiresAt: expiresAt,
      );
}

extension IFilterExtension on IFilter {
  UnifediApiFilter toUnifediFilter() => UnifediApiFilter(
        id: remoteId,
        phrase: phrase,
        context: context,
        irreversible: irreversible,
        wholeWord: wholeWord,
        expiresAt: expiresAt,
      );
}
