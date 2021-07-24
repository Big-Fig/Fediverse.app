import 'package:fedi/app/moor/moor_converters.dart';
import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName('DbAccount')
class DbAccounts extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get remoteId => text().customConstraint('UNIQUE NOT NULL')();

  TextColumn get username => text()();

  TextColumn get url => text()();

  TextColumn get note => text().nullable()();

  BoolColumn get locked => boolean()();

  TextColumn get headerStatic => text()();

  TextColumn get header => text()();

  IntColumn get followingCount => integer()();

  IntColumn get followersCount => integer()();

  IntColumn get statusesCount => integer()();

  TextColumn get displayName => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  BoolColumn get bot => boolean().nullable()();

  TextColumn get avatarStatic => text()();

  TextColumn get avatar => text()();

  TextColumn get acct => text()();

  DateTimeColumn get lastStatusAt => dateTime().nullable()();

  TextColumn get fields => text()
      .nullable()
      .map(PleromaApiFieldListDatabaseConverter())
      .nullable()();

  TextColumn get emojis => text()
      .nullable()
      .map(PleromaApiEmojiListDatabaseConverter())
      .nullable()();

  TextColumn get pleromaBackgroundImage => text().nullable()();

  TextColumn get pleromaTags =>
      text().nullable().map(PleromaApiTagListDatabaseConverter()).nullable()();

  TextColumn get pleromaRelationship => text()
      .nullable()
      .map(PleromaApiAccountRelationshipDatabaseConverter())
      .nullable()();

  BoolColumn get pleromaIsAdmin => boolean().nullable()();

  BoolColumn get pleromaIsModerator => boolean().nullable()();

  BoolColumn get pleromaConfirmationPending => boolean().nullable()();

  BoolColumn get pleromaHideFavorites => boolean().nullable()();

  BoolColumn get pleromaHideFollowers => boolean().nullable()();

  BoolColumn get pleromaHideFollows => boolean().nullable()();

  BoolColumn get pleromaHideFollowersCount => boolean().nullable()();

  BoolColumn get pleromaHideFollowsCount => boolean().nullable()();

  BoolColumn get pleromaDeactivated => boolean().nullable()();

  BoolColumn get pleromaAllowFollowingMove => boolean().nullable()();

  BoolColumn get pleromaSkipThreadContainment => boolean().nullable()();

  BoolColumn get pleromaAcceptsChatMessages => boolean().nullable()();
}
