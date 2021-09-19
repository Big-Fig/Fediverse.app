import 'package:fedi/app/moor/moor_converters.dart';
import 'package:fedi/moor/moor_json_type_converter.dart';
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

  BoolColumn get locked => boolean().nullable()();

  TextColumn get headerStatic => text().nullable()();

  TextColumn get header => text().nullable()();

  IntColumn get followingCount => integer().nullable()();

  IntColumn get followersCount => integer().nullable()();

  IntColumn get statusesCount => integer().nullable()();

  TextColumn get displayName => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  BoolColumn get bot => boolean().nullable()();

  TextColumn get avatarStatic => text()();

  TextColumn get avatar => text()();

  TextColumn get acct => text()();

  DateTimeColumn get lastStatusAt => dateTime().nullable()();

  TextColumn get fields => text()
      .nullable()
      .map(UnifediApiFieldListDatabaseConverter())
      .nullable()();

  TextColumn get emojis => text()
      .nullable()
      .map(UnifediApiEmojiListDatabaseConverter())
      .nullable()();
  TextColumn get alsoKnownAs =>
      text().nullable().map(StringListDatabaseConverter()).nullable()();

  TextColumn get backgroundImage => text().nullable()();

  TextColumn get tags =>
      text().nullable().map(UnifediApiTagListDatabaseConverter()).nullable()();

  TextColumn get relationship => text()
      .nullable()
      .map(UnifediApiAccountRelationshipDatabaseConverter())
      .nullable()();

  BoolColumn get isAdmin => boolean().nullable()();

  BoolColumn get isModerator => boolean().nullable()();

  BoolColumn get confirmationPending => boolean().nullable()();

  BoolColumn get hideFavorites => boolean().nullable()();

  BoolColumn get hideFollowers => boolean().nullable()();

  BoolColumn get hideFollows => boolean().nullable()();

  BoolColumn get hideFollowersCount => boolean().nullable()();

  BoolColumn get hideFollowsCount => boolean().nullable()();

  BoolColumn get deactivated => boolean().nullable()();

  BoolColumn get allowFollowingMove => boolean().nullable()();

  BoolColumn get skipThreadContainment => boolean().nullable()();

  BoolColumn get acceptsChatMessages => boolean().nullable()();
  BoolColumn get suspended => boolean().nullable()();
  BoolColumn get isConfirmed => boolean().nullable()();
  DateTimeColumn get muteExpiresAt => dateTime().nullable()();
  TextColumn get fqn => text().nullable()();
  TextColumn get favicon => text().nullable()();
  TextColumn get apId => text().nullable()();
}
