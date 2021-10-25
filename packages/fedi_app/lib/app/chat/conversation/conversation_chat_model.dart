import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/chat_model.dart';
import 'package:fedi_app/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi_app/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_chat_model.freezed.dart';

abstract class IConversationChat implements IChat {
  static int compareItemsToSort(
    IConversationChat? a,
    IConversationChat? b,
  ) {
    if (a?.updatedAt == null && b?.updatedAt == null) {
      return 0;
    } else if (a?.updatedAt != null && b?.updatedAt == null) {
      return 1;
    } else if (a?.updatedAt == null && b?.updatedAt != null) {
      return -1;
    } else {
      return a!.updatedAt!.compareTo(b!.updatedAt!);
    }
  }

  static bool isItemsEqual(
    IConversationChat a,
    IConversationChat b,
  ) =>
      a.remoteId == b.remoteId;
}

@freezed
class DbConversationPopulated with _$DbConversationPopulated {
  const factory DbConversationPopulated({
    required DbConversation dbConversation,
  }) = _DbConversationPopulated;
}

@freezed
class DbConversationChatPopulatedWrapper
    with _$DbConversationChatPopulatedWrapper
    implements IConversationChat {
  const DbConversationChatPopulatedWrapper._();
  const factory DbConversationChatPopulatedWrapper({
    required DbConversationPopulated dbConversationPopulated,
  }) = _DbConversationChatPopulatedWrapper;

  @override
  int? get localId => dbConversationPopulated.dbConversation.id;

  @override
  String get remoteId => dbConversationPopulated.dbConversation.remoteId;

  @override
  int get unread => dbConversationPopulated.dbConversation.unread ? 1 : 0;

  @override
  DateTime? get updatedAt => dbConversationPopulated.dbConversation.updatedAt;

  @override
  List<IAccount> get accounts => throw Exception(
        'accounts not included in ConversationChat '
        'and should be manually fetched from repository',
      );
}

@freezed
class DbConversationChatWithLastMessagePopulated
    with _$DbConversationChatWithLastMessagePopulated {
  const factory DbConversationChatWithLastMessagePopulated({
    required DbConversationPopulated dbConversationPopulated,
    required DbStatusPopulated? dbStatusPopulated,
  }) = _DbConversationChatWithLastMessagePopulated;
}

@freezed
class DbConversationChatWithLastMessagePopulatedWrapper
    with _$DbConversationChatWithLastMessagePopulatedWrapper
    implements IConversationChatWithLastMessage {
  const DbConversationChatWithLastMessagePopulatedWrapper._();
  const factory DbConversationChatWithLastMessagePopulatedWrapper({
    required DbConversationChatWithLastMessagePopulated
        dbConversationChatWithLastMessagePopulated,
  }) = _DbConversationChatWithLastMessagePopulatedWrapper;

  @override
  IConversationChat get chat => DbConversationChatPopulatedWrapper(
        dbConversationPopulated:
            dbConversationChatWithLastMessagePopulated.dbConversationPopulated,
      );

  @override
  IConversationChatMessage? get lastChatMessage =>
      dbConversationChatWithLastMessagePopulated.dbStatusPopulated != null
          ? ConversationChatMessageStatusAdapter(
              status: DbStatusPopulatedWrapper(
                dbStatusPopulated: dbConversationChatWithLastMessagePopulated
                    .dbStatusPopulated!,
              ),
            )
          : null;

  @override
  int compareTo(IConversationChatWithLastMessage b) =>
      IConversationChat.compareItemsToSort(chat, b.chat);

  @override
  bool isEqualTo(IConversationChatWithLastMessage b) =>
      IConversationChat.isItemsEqual(chat, b.chat);
}

extension IConversationChatExtension on IConversationChat {
  DbConversationChatPopulatedWrapper toDbConversationChatPopulatedWrapper() {
    if (this is DbConversationChatPopulatedWrapper) {
      return this as DbConversationChatPopulatedWrapper;
    } else {
      return DbConversationChatPopulatedWrapper(
        dbConversationPopulated: toDbConversationPopulated(),
      );
    }
  }

  DbConversationPopulated toDbConversationPopulated() {
    if (this is DbConversationPopulated) {
      var dbConversationChatPopulatedWrapper =
          this as DbConversationChatPopulatedWrapper;

      return dbConversationChatPopulatedWrapper.dbConversationPopulated;
    } else {
      return DbConversationPopulated(
        dbConversation: toDbConversation(),
      );
    }
  }

  DbConversation toDbConversation() {
    if (this is DbConversationPopulated) {
      var dbConversationChatPopulatedWrapper =
          this as DbConversationChatPopulatedWrapper;

      return dbConversationChatPopulatedWrapper
          .dbConversationPopulated.dbConversation;
    } else {
      return DbConversation(
        id: localId,
        remoteId: remoteId,
        unread: unread > 0,
        updatedAt: updatedAt,
      );
    }
  }
}

extension DbConversationExtension on DbConversationPopulated {
  DbConversationChatPopulatedWrapper toDbConversationChatPopulatedWrapper() =>
      DbConversationChatPopulatedWrapper(
        dbConversationPopulated: this,
      );
}

extension DbConversationListExtension on List<DbConversationPopulated> {
  List<DbConversationChatPopulatedWrapper>
      toDbConversationChatPopulatedWrapperList() => map(
            (item) => item.toDbConversationChatPopulatedWrapper(),
          ).toList();
}

extension DbConversationChatPopulatedWrapperExtension
    on DbConversationChatPopulatedWrapper {
  DbConversation toDbConversation() => dbConversationPopulated.dbConversation;

  DbConversationPopulated toDbConversationPopulated() =>
      dbConversationPopulated;
}

extension DbConversationChatWithLastMessagePopulatedExtension
    on DbConversationChatWithLastMessagePopulated {
  DbConversationChatWithLastMessagePopulatedWrapper
      toDbConversationChatWithLastMessagePopulatedWrapper() =>
          DbConversationChatWithLastMessagePopulatedWrapper(
            dbConversationChatWithLastMessagePopulated: this,
          );
}

extension DbConversationChatWithLastMessagePopulatedListExtension
    on List<DbConversationChatWithLastMessagePopulated> {
  List<DbConversationChatWithLastMessagePopulatedWrapper>
      toDbConversationChatWithLastMessagePopulatedWrapperList() => map(
            (value) =>
                value.toDbConversationChatWithLastMessagePopulatedWrapper(),
          ).toList();
}
