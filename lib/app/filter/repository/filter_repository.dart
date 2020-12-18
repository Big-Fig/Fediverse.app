import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/repository/filter_repository_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilterRepository
    implements
        IReadIdListRepository<IFilter, int>,
        IWriteIdListRepository<DbFilter, int>,
        IDisposable {
  static IFilterRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFilterRepository>(context, listen: listen);

  Future<IFilter> findByRemoteId(String remoteId);

  Future upsertRemoteFilters(
    List<IPleromaFilter> remoteFilters,
  );

  Stream<IFilter> watchByRemoteId(String remoteId);

  Future updateLocalFilterByRemoteFilter({
    @required IFilter oldLocalFilter,
    @required IPleromaFilter newRemoteFilter,
  });

  Future upsertRemoteFilter(IPleromaFilter remoteFilter);

  Future<List<DbFilterPopulatedWrapper>> getFilters({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required int limit,
    @required int offset,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  });

  Stream<List<DbFilterPopulatedWrapper>> watchFilters({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required int limit,
    @required int offset,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  });

  Future<DbFilterPopulatedWrapper> getFilter({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  });

  Stream<DbFilterPopulatedWrapper> watchFilter({
    @required IFilter olderThanFilter,
    @required IFilter newerThanFilter,
    @required FilterOrderingTermData orderingTermData,
    @required List<MastodonFilterContextType> onlyWithContextTypes,
  });
}
