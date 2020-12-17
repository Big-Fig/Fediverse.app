import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';

IFilter mapRemoteFilterToLocalFilter(
  IPleromaFilter remoteFilter,
) =>
    DbFilterPopulatedWrapper(
      DbFilterPopulated(
        dbFilter: mapRemoteFilterToDbFilter(
          remoteFilter,
        ),
      ),
    );

DbFilter mapRemoteFilterToDbFilter(IPleromaFilter remoteFilter) {
  return DbFilter(
    id: null,
    remoteId: remoteFilter.id,
    phrase: remoteFilter.phrase,
    contextAsMastodonFilterContextType: remoteFilter.context
        ?.map(
          (contextAsString) => contextAsString.toMastodonFilterContextType(),
        )
        ?.toList(),
    irreversible: remoteFilter.irreversible,
    wholeWord: remoteFilter.wholeWord,
    expiresAt: remoteFilter.expiresAt,
  );
}

PleromaFilter mapLocalFilterToRemoteFilter(IFilter localFilter) {
  return PleromaFilter(
    id: localFilter.remoteId,
    phrase: localFilter.phrase,
    context: localFilter.contextAsMastodonFilterContextType
        ?.where(
            (contextType) => contextType != MastodonFilterContextType.unknown)
        ?.map(
          (mastodonFilterContextType) =>
              mastodonFilterContextType.toJsonValue(),
        )
        ?.toList(),
    irreversible: localFilter.irreversible,
    wholeWord: localFilter.wholeWord,
    expiresAt: localFilter.expiresAt,
  );
}
