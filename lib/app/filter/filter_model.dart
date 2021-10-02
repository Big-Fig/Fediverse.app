import 'package:fedi/app/database/app_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'filter_model.freezed.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    required bool? dismissed,
    required bool? unread,
  }) = _FilterState;
}

abstract class IFilter {
  int? get localId;

  String get remoteId;

  String get phrase;

  List<String> get context;

  List<UnifediApiFilterContextType> get contextAsUnifediApiFilterContextType;

  DateTime? get expiresAt;

  bool get irreversible;

  bool get wholeWord;

  IFilter copyWithTemp({
    int? localId,
    String? remoteId,
    List<String>? context,
    DateTime? expiresAt,
    bool? irreversible,
    String? phrase,
    bool? wholeWord,
  });
}

@freezed
class DbFilterPopulatedWrapper
    with _$DbFilterPopulatedWrapper
    implements IFilter {
  const DbFilterPopulatedWrapper._();
  const factory DbFilterPopulatedWrapper({
    required DbFilterPopulated dbFilterPopulated,
  }) = _DbFilterPopulatedWrapper;

  @override
  // ignore: long-parameter-list
  DbFilterPopulatedWrapper copyWithTemp({
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
  List<UnifediApiFilterContextType> get contextAsUnifediApiFilterContextType =>
      context
          .map(
            (contextString) => contextString.toUnifediApiFilterContextType(),
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

@freezed
class DbFilterPopulated with _$DbFilterPopulated {
  const DbFilterPopulated._();
  const factory DbFilterPopulated({
    required DbFilter dbFilter,
  }) = _DbFilterPopulated;
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
