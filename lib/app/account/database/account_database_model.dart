import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName("DbAccount")
class DbAccounts extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().autoIncrement()();

  TextColumn get remoteId => text().customConstraint("UNIQUE NOT NULL")();
  TextColumn get username => text()();
  TextColumn get url => text()();
  TextColumn get note => text()();
  BoolColumn get locked => boolean()();
  TextColumn get headerStatic => text()();
  TextColumn get header => text()();
  IntColumn get followingCount => integer()();
  IntColumn get followersCount => integer()();
  IntColumn get statusesCount => integer()();
  TextColumn get displayName => text()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get bot => boolean().nullable()();
  TextColumn get avatarStatic => text()();
  TextColumn get avatar => text()();
  TextColumn get acct => text()();
  DateTimeColumn get lastStatusAt => dateTime().nullable()();

  TextColumn get fields =>
      text().nullable().map(PleromaFieldListDatabaseConverter()).nullable()();

  TextColumn get emojis =>
      text().nullable().map(PleromaEmojiListDatabaseConverter()).nullable()();

  TextColumn get source =>
      text().nullable().map(PleromaSourceDatabaseConverter()).nullable()();

  // TODO: CHECK, was in previous implementation, but not exist at https://docs-develop.pleroma.social/backend/API/differences_in_mastoapi_responses/
  // TODO: add when type will be found
//  dynamic get pleromaBackgroundImage;
  //  TextColumn get pleromaBackgroundImage => text()();

  TextColumn get pleromaTags =>
      text().nullable().map(PleromaTagListDatabaseConverter()).nullable()();

  TextColumn get pleromaRelationship =>
      text().nullable().map(PleromaRelationshipDatabaseConverter()).nullable()();

  BoolColumn get pleromaIsAdmin => boolean().nullable()();
  BoolColumn get pleromaIsModerator => boolean().nullable()();
  BoolColumn get pleromaConfirmationPending => boolean().nullable()();
  BoolColumn get pleromaHideFavorites => boolean().nullable()();
  BoolColumn get pleromaHideFollowers => boolean().nullable()();
  BoolColumn get pleromaHideFollows => boolean().nullable()();
  BoolColumn get pleromaHideFollowersCount => boolean().nullable()();
  BoolColumn get pleromaHideFollowsCount => boolean().nullable()();

  // TODO: add when schema will be found
//  dynamic get pleromaSettingsStore;
//  TextColumn get pleromaSettingsStore => text()();

  TextColumn get pleromaChatToken => text().nullable()();

  BoolColumn get pleromaDeactivated => boolean().nullable()();
  BoolColumn get pleromaAllowFollowingMove => boolean().nullable()();
  IntColumn get pleromaUnreadConversationCount => integer().nullable()();
  BoolColumn get pleromaSkipThreadContainment => boolean().nullable()();

  TextColumn get pleromaNotificationSettings => text()
      .nullable()
      .map(PleromaAccountPleromaPartNotificationsSettingsDatabaseConverter())();
}
