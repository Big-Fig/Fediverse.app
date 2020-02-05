// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  Account read(BinaryReader reader) {
    var obj = Account();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.username = reader.read() as String;
          break;
        case 1:
          obj.url = reader.read() as String;
          break;
        case 2:
          obj.statusesCount = reader.read() as int;
          break;
        case 3:
          obj.note = reader.read() as String;
          break;
        case 4:
          obj.locked = reader.read() as bool;
          break;
        case 5:
          obj.id = reader.read() as String;
          break;
        case 6:
          obj.headerStatic = reader.read() as String;
          break;
        case 7:
          obj.header = reader.read() as String;
          break;
        case 8:
          obj.followingCount = reader.read() as int;
          break;
        case 9:
          obj.followersCount = reader.read() as int;
          break;
        case 10:
          obj.fields = (reader.read() as List)?.cast<Field>();
          break;
        case 11:
          obj.emojis = (reader.read() as List)?.cast<Emoji>();
          break;
        case 12:
          obj.displayName = reader.read() as String;
          break;
        case 13:
          obj.createdAt = reader.read() as DateTime;
          break;
        case 14:
          obj.bot = reader.read() as bool;
          break;
        case 15:
          obj.avatarStatic = reader.read() as String;
          break;
        case 16:
          obj.avatar = reader.read() as String;
          break;
        case 17:
          obj.acct = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer.writeByte(18);
    writer.writeByte(0);
    writer.write(obj.username);
    writer.writeByte(1);
    writer.write(obj.url);
    writer.writeByte(2);
    writer.write(obj.statusesCount);
    writer.writeByte(3);
    writer.write(obj.note);
    writer.writeByte(4);
    writer.write(obj.locked);
    writer.writeByte(5);
    writer.write(obj.id);
    writer.writeByte(6);
    writer.write(obj.headerStatic);
    writer.writeByte(7);
    writer.write(obj.header);
    writer.writeByte(8);
    writer.write(obj.followingCount);
    writer.writeByte(9);
    writer.write(obj.followersCount);
    writer.writeByte(10);
    writer.write(obj.fields);
    writer.writeByte(11);
    writer.write(obj.emojis);
    writer.writeByte(12);
    writer.write(obj.displayName);
    writer.writeByte(13);
    writer.write(obj.createdAt);
    writer.writeByte(14);
    writer.write(obj.bot);
    writer.writeByte(15);
    writer.write(obj.avatarStatic);
    writer.writeByte(16);
    writer.write(obj.avatar);
    writer.writeByte(17);
    writer.write(obj.acct);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    username: json['username'] as String,
    url: json['url'] as String,
    statusesCount: json['statuses_count'] as int,
    note: json['note'] as String,
    locked: json['locked'] as bool,
    id: json['id'] as String,
    headerStatic: json['header_static'] as String,
    header: json['header'] as String,
    followingCount: json['following_count'] as int,
    followersCount: json['followers_count'] as int,
    fields: (json['fields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    emojis: (json['emojis'] as List)
        ?.map(
            (e) => e == null ? null : Emoji.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    displayName: json['display_name'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    bot: json['bot'] as bool,
    avatarStatic: json['avatar_static'] as String,
    avatar: json['avatar'] as String,
    acct: json['acct'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'username': instance.username,
      'url': instance.url,
      'statuses_count': instance.statusesCount,
      'note': instance.note,
      'locked': instance.locked,
      'id': instance.id,
      'header_static': instance.headerStatic,
      'header': instance.header,
      'following_count': instance.followingCount,
      'followers_count': instance.followersCount,
      'fields': instance.fields,
      'emojis': instance.emojis,
      'display_name': instance.displayName,
      'created_at': instance.createdAt?.toIso8601String(),
      'bot': instance.bot,
      'avatar_static': instance.avatarStatic,
      'avatar': instance.avatar,
      'acct': instance.acct,
    };
