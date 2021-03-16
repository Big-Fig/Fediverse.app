import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/mastodon/notification/mastodon_notification_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:fedi/pleroma/notification/pleroma_notification_model.dart';

class NotificationState {
  final bool? dismissed;
  final bool? unread;

  NotificationState({
    this.dismissed,
    this.unread,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationState &&
          runtimeType == other.runtimeType &&
          dismissed == other.dismissed &&
          unread == other.unread;

  @override
  int get hashCode => dismissed.hashCode ^ unread.hashCode;

  @override
  String toString() {
    return 'NotificationState{dismissed: $dismissed, unread: $unread}';
  }
}

abstract class INotification {
  int? get localId;

  String get remoteId;

  bool? get unread;

  DateTime get createdAt;

  IStatus? get status;

  IAccount? get account;

  String? get chatMessageRemoteId;

  String? get chatRemoteId;

  IPleromaChatMessage? get chatMessage;

  IPleromaAccountReport? get report;

  String get type;

  PleromaNotificationType get typePleroma;

  MastodonNotificationType get typeMastodon;

  String? get emoji;

  PleromaNotificationPleromaPart? get pleroma;

  bool get isContainsChat;

  bool get isContainsStatus;

  bool get isContainsAccount;

  bool get dismissed;

  IPleromaAccount? get target;

  INotification copyWith({
    int? localId,
    String? remoteId,
    bool? unread,
    DateTime? createdAt,
    IStatus? status,
    String? emoji,
    PleromaNotificationPleromaPart? pleroma,
    IAccount? account,
    MastodonNotificationType? type,
    bool? dismissed,
  });
}

class DbNotificationPopulatedWrapper implements INotification {
  final DbNotificationPopulated dbNotificationPopulated;

  @override
  bool get isContainsChat => chatRemoteId != null;

  @override
  bool get isContainsStatus => status != null;

  @override
  bool get isContainsAccount => account != null;

  DbNotificationPopulatedWrapper({
    required this.dbNotificationPopulated,
  });

  @override
  IAccount? get account => DbAccountWrapper(
        dbAccount: dbNotificationPopulated.dbAccount,
      );

  @override
  DateTime get createdAt => dbNotificationPopulated.dbNotification.createdAt;

  @override
  int? get localId => dbNotificationPopulated.dbNotification.id;

  @override
  String get remoteId => dbNotificationPopulated.dbNotification.remoteId;

  @override
  String? get emoji => dbNotificationPopulated.dbNotification.emoji;

  @override
  PleromaNotificationPleromaPart? get pleroma =>
      dbNotificationPopulated.dbNotification.pleroma;

  @override
  MastodonNotificationType get typeMastodon =>
      type.toMastodonNotificationType();

  @override
  PleromaNotificationType get typePleroma => type.toPleromaNotificationType();

  @override
  String get type => dbNotificationPopulated.dbNotification.type;

  @override
  IStatus? get status =>
      dbNotificationPopulated.dbStatusPopulated?.toDbStatusPopulatedWrapper();

  @override
  bool get unread => dbNotificationPopulated!.dbNotification!.unread == true;

  @override
  DbNotificationPopulatedWrapper copyWith({
    int? localId,
    String? remoteId,
    bool? unread,
    DateTime? createdAt,
    IStatus? status,
    IAccount? account,
    String? emoji,
    PleromaNotificationPleromaPart? pleroma,
    MastodonNotificationType? type,
    bool? dismissed,
  }) =>
      DbNotificationPopulatedWrapper(
        dbNotificationPopulated: DbNotificationPopulated(
          dbNotification: dbNotificationPopulated.dbNotification.copyWith(
            id: localId ?? this.localId,
            remoteId: remoteId ?? this.remoteId,
            unread: unread ?? this.unread,
            createdAt: createdAt ?? this.createdAt,
            type: type as String? ?? this.type,
            pleroma: pleroma ?? this.pleroma,
            emoji: emoji ?? this.emoji,
            dismissed: dismissed ?? this.dismissed,
          ),
          dbAccount:
              account?.toDbAccount() ?? dbNotificationPopulated.dbAccount,
          dbStatusPopulated:
              dbNotificationPopulated.dbStatusPopulated!.copyWith(
            dbStatus: status?.toDbStatus() ??
                dbNotificationPopulated.dbStatusPopulated?.dbStatus,
            dbAccount: status?.account.toDbAccount() ??
                dbNotificationPopulated.dbStatusPopulated?.dbAccount,
            reblogDbStatus: status?.reblog?.toDbStatus() ??
                dbNotificationPopulated.dbStatusPopulated?.reblogDbStatus,
            reblogDbStatusAccount: status?.reblog?.account.toDbAccount() ??
                dbNotificationPopulated
                    .dbStatusPopulated?.reblogDbStatusAccount,
          ),
        ),
      );

  @override
  String? get chatMessageRemoteId =>
      dbNotificationPopulated.dbNotification.chatMessageRemoteId;

  @override
  String? get chatRemoteId =>
      dbNotificationPopulated.dbNotification.chatRemoteId;

  @override
  String toString() {
    return 'DbNotificationPopulatedWrapper{'
        'dbNotificationPopulated: $dbNotificationPopulated'
        '}';
  }

  @override
  bool get dismissed =>
      dbNotificationPopulated.dbNotification.dismissed == true;

  @override
  IPleromaChatMessage? get chatMessage =>
      dbNotificationPopulated.dbNotification.chatMessage;

  @override
  IPleromaAccountReport? get report =>
      dbNotificationPopulated.dbNotification.report;

  @override
  IPleromaAccount? get target => dbNotificationPopulated.dbNotification.target;
}

class DbNotificationPopulated {
  final DbNotification dbNotification;
  final DbAccount dbAccount;
  final DbStatusPopulated? dbStatusPopulated;

  DbNotificationPopulated({
    required this.dbNotification,
    required this.dbAccount,
    required this.dbStatusPopulated,
  });

  @override
  String toString() {
    return 'DbNotificationPopulated{'
        'dbNotification: $dbNotification, '
        'dbAccount: $dbAccount, '
        'dbStatusPopulated: $dbStatusPopulated'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DbNotificationPopulated &&
          runtimeType == other.runtimeType &&
          dbNotification == other.dbNotification &&
          dbAccount == other.dbAccount &&
          dbStatusPopulated == other.dbStatusPopulated;

  @override
  int get hashCode =>
      dbNotification.hashCode ^ dbAccount.hashCode ^ dbStatusPopulated.hashCode;
}

extension DbNotificationPopulatedExtension on DbNotificationPopulated {
  DbNotificationPopulatedWrapper toDbNotificationPopulatedWrapper() =>
      DbNotificationPopulatedWrapper(dbNotificationPopulated: this);
}
