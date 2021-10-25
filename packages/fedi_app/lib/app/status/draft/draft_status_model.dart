import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/pending/pending_model.dart';
import 'package:fedi_app/app/status/post/post_status_data_status_status_adapter.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'draft_status_model.freezed.dart';

@freezed
class DbDraftStatusPopulated with _$DbDraftStatusPopulated {
  const DbDraftStatusPopulated._();

  const factory DbDraftStatusPopulated({
    required DbDraftStatus dbDraftStatus,
  }) = _DbDraftStatusPopulated;
}

abstract class IDraftStatus {
  int? get localId;

  DateTime get updatedAt;

  PostStatusData get postStatusData;
}

@freezed
class DbDraftStatusPopulatedWrapper
    with _$DbDraftStatusPopulatedWrapper
    implements IDraftStatus {
  const DbDraftStatusPopulatedWrapper._();
  const factory DbDraftStatusPopulatedWrapper({
    required DbDraftStatusPopulated dbDraftStatusPopulated,
  }) = _DbDraftStatusPopulatedWrapper;

  DbDraftStatus get dbDraftStatus => dbDraftStatusPopulated.dbDraftStatus;

  @override
  int? get localId => dbDraftStatus.id;

  @override
  PostStatusData get postStatusData => dbDraftStatus.data;

  @override
  DateTime get updatedAt => dbDraftStatus.updatedAt;
}

class DraftStatusAdapterToStatus extends PostStatusDataStatusStatusAdapter {
  final IDraftStatus draftStatus;

  DraftStatusAdapterToStatus({
    required IAccount account,
    required this.draftStatus,
  }) : super(
          localId: draftStatus.localId,
          account: account,
          postStatusData: draftStatus.postStatusData,
          createdAt: draftStatus.updatedAt,
          pendingState: PendingState.notSentYet,
          oldPendingRemoteId: null,
          wasSentWithIdempotencyKey: null,
        );

  @override
  bool get hiddenLocallyOnDevice => false;
}

extension IDraftStatusExtension on IDraftStatus {
  DbDraftStatusPopulatedWrapper toDbDraftStatusPopulatedWrapper() {
    if (this is DbDraftStatusPopulatedWrapper) {
      var dbDraftStatusPopulatedWrapper = this as DbDraftStatusPopulatedWrapper;

      return dbDraftStatusPopulatedWrapper;
    } else {
      return DbDraftStatusPopulatedWrapper(
        dbDraftStatusPopulated: toDbDraftStatusPopulated(),
      );
    }
  }

  DbDraftStatusPopulated toDbDraftStatusPopulated() {
    if (this is DbDraftStatusPopulatedWrapper) {
      var dbDraftStatusPopulatedWrapper = this as DbDraftStatusPopulatedWrapper;

      return dbDraftStatusPopulatedWrapper.dbDraftStatusPopulated;
    } else {
      return DbDraftStatusPopulated(
        dbDraftStatus: toDbDraftStatus(),
      );
    }
  }

  DbDraftStatus toDbDraftStatus() {
    if (this is DbDraftStatusPopulatedWrapper) {
      var dbDraftStatusPopulatedWrapper = this as DbDraftStatusPopulatedWrapper;

      return dbDraftStatusPopulatedWrapper.dbDraftStatusPopulated.dbDraftStatus;
    } else {
      return DbDraftStatus(
        id: localId,
        updatedAt: updatedAt,
        data: postStatusData,
      );
    }
  }
}

extension DbDraftStatusPopulatedExtension on DbDraftStatusPopulated {
  DbDraftStatusPopulatedWrapper toDbDraftStatusPopulatedWrapper() =>
      DbDraftStatusPopulatedWrapper(dbDraftStatusPopulated: this);
}

extension DbDraftStatusPopulatedListExtension on List<DbDraftStatusPopulated> {
  List<DbDraftStatusPopulatedWrapper> toDbDraftStatusPopulatedWrapperList() =>
      map((item) => item.toDbDraftStatusPopulatedWrapper()).toList();
}

enum DraftStatusState {
  draft,
  canceled,
  alreadyPosted,
}

const _draftDraftStatusStateJsonValue = 'draft';
const _canceledDraftStatusStateJsonValue = 'canceled';
const _alreadyPostedDraftStatusStateJsonValue = 'alreadyPosted';

extension DraftStatusStateExtension on DraftStatusState {
  String toJsonValue() {
    String result;

    switch (this) {
      case DraftStatusState.canceled:
        result = _canceledDraftStatusStateJsonValue;
        break;
      case DraftStatusState.draft:
        result = _draftDraftStatusStateJsonValue;
        break;
      case DraftStatusState.alreadyPosted:
        result = _alreadyPostedDraftStatusStateJsonValue;
        break;
    }

    return result;
  }
}

extension DraftStatusStateStringExtension on String {
  DraftStatusState toDraftStatusState() {
    DraftStatusState result;

    switch (this) {
      case _draftDraftStatusStateJsonValue:
        result = DraftStatusState.draft;
        break;
      case _canceledDraftStatusStateJsonValue:
        result = DraftStatusState.canceled;
        break;
      case _alreadyPostedDraftStatusStateJsonValue:
        result = DraftStatusState.alreadyPosted;
        break;
      // cant parse
      default:
        throw ArgumentError('Invalid DraftStatusState $DraftStatusState');
    }

    return result;
  }
}

class DraftStatusStateTypeConverter
    implements JsonConverter<DraftStatusState, String> {
  const DraftStatusStateTypeConverter();

  @override
  DraftStatusState fromJson(String value) => value.toDraftStatusState();

  @override
  String toJson(DraftStatusState value) => value.toJsonValue();
}
