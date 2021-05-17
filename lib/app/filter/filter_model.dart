import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';

class FilterState {
  final bool? dismissed;
  final bool? unread;

  FilterState({
    this.dismissed,
    this.unread,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterState &&
          runtimeType == other.runtimeType &&
          dismissed == other.dismissed &&
          unread == other.unread;

  @override
  int get hashCode => dismissed.hashCode ^ unread.hashCode;

  @override
  String toString() {
    return 'FilterState{dismissed: $dismissed, unread: $unread}';
  }
}

abstract class IFilter {
  int? get localId;

  String get remoteId;

  String get phrase;

  List<String> get context;

  List<MastodonApiFilterContextType> get contextAsMastodonApiFilterContextType;

  DateTime? get expiresAt;

  bool get irreversible;

  bool get wholeWord;

  IFilter copyWith({
    int? localId,
    String? remoteId,
    List<String>? context,
    DateTime? expiresAt,
    bool? irreversible,
    String? phrase,
    bool? wholeWord,
  });
}

class DbFilterPopulatedWrapper implements IFilter {
  final DbFilterPopulated dbFilterPopulated;

  DbFilterPopulatedWrapper({
    required this.dbFilterPopulated,
  });

  @override
  // ignore: long-parameter-list
  DbFilterPopulatedWrapper copyWith({
    List<String>? context,
    DateTime? expiresAt,
    int? localId,
    String? remoteId,
    bool? irreversible,
    String? phrase,
    bool? wholeWord,
  }) =>
      DbFilterPopulatedWrapper(
        dbFilterPopulated: DbFilterPopulated(
          dbFilter: dbFilterPopulated.dbFilter.copyWith(
            id: localId ?? this.localId,
            remoteId: remoteId ?? this.remoteId,
            context: context ?? this.context,
            phrase: phrase ?? this.phrase,
            irreversible: irreversible ?? this.irreversible,
            wholeWord: wholeWord ?? this.wholeWord,
            expiresAt: expiresAt ?? this.expiresAt,
          ),
        ),
      );

  @override
  String toString() {
    return 'DbFilterPopulatedWrapper{'
        'dbFilterPopulated: $dbFilterPopulated'
        '}';
  }

  @override
  List<MastodonApiFilterContextType> get contextAsMastodonApiFilterContextType =>
      context
          .map(
            (contextString) => contextString.toMastodonApiFilterContextType(),
          )
          .toList();

  @override
  DateTime? get expiresAt => dbFilterPopulated.dbFilter.expiresAt;

  @override
  bool get irreversible => dbFilterPopulated.dbFilter.irreversible;

  @override
  int? get localId => dbFilterPopulated.dbFilter.id;

  @override
  String get phrase => dbFilterPopulated.dbFilter.phrase;

  @override
  String get remoteId => dbFilterPopulated.dbFilter.remoteId;

  @override
  bool get wholeWord => dbFilterPopulated.dbFilter.wholeWord;

  @override
  List<String> get context => dbFilterPopulated.dbFilter.context;
}

class DbFilterPopulated {
  final DbFilter dbFilter;

  DbFilterPopulated({
    required this.dbFilter,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbFilterPopulated &&
          runtimeType == other.runtimeType &&
          dbFilter == other.dbFilter;

  @override
  int get hashCode => dbFilter.hashCode;

  @override
  String toString() {
    return 'DbFilterPopulated{dbFilter: $dbFilter}';
  }
}

extension IFilterExtension on IFilter {
  bool get isExpired {
    if (expiresAt == null) {
      return false;
    } else {
      return DateTime.now().isAfter(expiresAt!);
    }
  }

  DbFilterPopulatedWrapper toDbFilterPopulatedWrapper() {
    if (this is DbFilterPopulatedWrapper) {
      return this as DbFilterPopulatedWrapper;
    } else {
      return DbFilterPopulatedWrapper(
        dbFilterPopulated: toDbFilterPopulated(),
      );
    }
  }

  DbFilterPopulated toDbFilterPopulated() {
    if (this is DbFilterPopulatedWrapper) {
      var dbFilterPopulatedWrapper = this as DbFilterPopulatedWrapper;

      return dbFilterPopulatedWrapper.dbFilterPopulated;
    } else {
      return DbFilterPopulated(
        dbFilter: toDbFilter(),
      );
    }
  }

  DbFilter toDbFilter() {
    if (this is DbFilterPopulatedWrapper) {
      var dbFilterPopulatedWrapper = this as DbFilterPopulatedWrapper;

      return dbFilterPopulatedWrapper.dbFilterPopulated.dbFilter;
    } else {
      return DbFilter(
        id: localId,
        remoteId: remoteId,
        phrase: phrase,
        context: context,
        irreversible: irreversible,
        wholeWord: wholeWord,
        expiresAt: expiresAt,
      );
    }
  }
}
