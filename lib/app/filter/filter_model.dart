import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:flutter/widgets.dart';

class FilterState {
  final bool dismissed;
  final bool unread;

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
  int get localId;

  String get remoteId;

  String get phrase;

  List<MastodonFilterContextType> get contextAsMastodonFilterContextType;

  DateTime get expiresAt;

  bool get irreversible;

  bool get wholeWord;

  IFilter copyWith({
    int localId,
    String remoteId,
    List<MastodonFilterContextType> contextAsMastodonFilterContextType,
    DateTime expiresAt,
    bool irreversible,
    String phrase,
    bool wholeWord,
  });
}

class DbFilterPopulatedWrapper implements IFilter {
  final DbFilterPopulated dbFilterPopulated;

  DbFilterPopulatedWrapper(this.dbFilterPopulated);

  @override
  DbFilterPopulatedWrapper copyWith({
    List<MastodonFilterContextType> contextAsMastodonFilterContextType,
    DateTime expiresAt,
    int localId,
    String remoteId,
    bool irreversible,
    String phrase,
    bool wholeWord,
  }) =>
      DbFilterPopulatedWrapper(
        DbFilterPopulated(
          dbFilter: dbFilterPopulated.dbFilter.copyWith(
            id: localId ?? this.localId,
            remoteId: remoteId ?? this.remoteId,
            contextAsMastodonFilterContextType:
                contextAsMastodonFilterContextType ??
                    this.contextAsMastodonFilterContextType,
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
        'dbFilterPopulated: $dbFilterPopulated}';
  }

  @override
  List<MastodonFilterContextType> get contextAsMastodonFilterContextType =>
      dbFilterPopulated.dbFilter.contextAsMastodonFilterContextType;

  @override
  DateTime get expiresAt => dbFilterPopulated.dbFilter.expiresAt;

  @override
  bool get irreversible => dbFilterPopulated.dbFilter.irreversible;

  @override
  int get localId => dbFilterPopulated.dbFilter.id;

  @override
  String get phrase => dbFilterPopulated.dbFilter.phrase;

  @override
  String get remoteId => dbFilterPopulated.dbFilter.remoteId;

  @override
  bool get wholeWord => dbFilterPopulated.dbFilter.wholeWord;
}

class DbFilterPopulated {
  final DbFilter dbFilter;

  DbFilterPopulated({
    @required this.dbFilter,
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
