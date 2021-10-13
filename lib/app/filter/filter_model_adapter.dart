import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension IPleromaFilterExtension on IUnifediApiFilter {
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
  UnifediApiFilter toPleromaFilter() => UnifediApiFilter(
        id: remoteId,
        phrase: phrase,
        context: context,
        irreversible: irreversible,
        wholeWord: wholeWord,
        expiresAt: expiresAt,
      );
}
