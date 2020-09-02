// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaInstancePleromaPartAdapter
    extends TypeAdapter<PleromaInstancePleromaPart> {
  @override
  PleromaInstancePleromaPart read(BinaryReader reader) {
    var obj = PleromaInstancePleromaPart();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.metadata = reader.read() as PleromaInstancePleromaPartMetadata;
          break;
        case 1:
          obj.vapidPublicKey = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaInstancePleromaPart obj) {
    writer.writeByte(2);
    writer.writeByte(0);
    writer.write(obj.metadata);
    writer.writeByte(1);
    writer.write(obj.vapidPublicKey);
  }
}

class PleromaInstancePleromaPartMetadataFieldLimitsAdapter
    extends TypeAdapter<PleromaInstancePleromaPartMetadataFieldLimits> {
  @override
  PleromaInstancePleromaPartMetadataFieldLimits read(BinaryReader reader) {
    var obj = PleromaInstancePleromaPartMetadataFieldLimits();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.maxFields = reader.read() as int;
          break;
        case 1:
          obj.maxRemoteFields = reader.read() as int;
          break;
        case 2:
          obj.nameLength = reader.read() as int;
          break;
        case 3:
          obj.valueLength = reader.read() as int;
          break;
      }
    }
    return obj;
  }

  @override
  void write(
      BinaryWriter writer, PleromaInstancePleromaPartMetadataFieldLimits obj) {
    writer.writeByte(4);
    writer.writeByte(0);
    writer.write(obj.maxFields);
    writer.writeByte(1);
    writer.write(obj.maxRemoteFields);
    writer.writeByte(2);
    writer.write(obj.nameLength);
    writer.writeByte(3);
    writer.write(obj.valueLength);
  }
}

class PleromaInstancePleromaPartMetadataAdapter
    extends TypeAdapter<PleromaInstancePleromaPartMetadata> {
  @override
  PleromaInstancePleromaPartMetadata read(BinaryReader reader) {
    var obj = PleromaInstancePleromaPartMetadata();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.features = (reader.read() as List)?.cast<String>();
          break;
        case 1:
          obj.federation = reader.read() as dynamic;
          break;
        case 2:
          obj.postFormats = (reader.read() as List)?.cast<String>();
          break;
        case 3:
          obj.accountActivationRequired = reader.read() as bool;
          break;
        case 4:
          obj.fieldsLimits =
              reader.read() as PleromaInstancePleromaPartMetadataFieldLimits;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaInstancePleromaPartMetadata obj) {
    writer.writeByte(5);
    writer.writeByte(0);
    writer.write(obj.features);
    writer.writeByte(1);
    writer.write(obj.federation);
    writer.writeByte(2);
    writer.write(obj.postFormats);
    writer.writeByte(3);
    writer.write(obj.accountActivationRequired);
    writer.writeByte(4);
    writer.write(obj.fieldsLimits);
  }
}

class PleromaInstancePollLimitsAdapter
    extends TypeAdapter<PleromaInstancePollLimits> {
  @override
  PleromaInstancePollLimits read(BinaryReader reader) {
    var obj = PleromaInstancePollLimits();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.maxExpiration = reader.read() as int;
          break;
        case 1:
          obj.maxOptionChars = reader.read() as int;
          break;
        case 2:
          obj.maxOptions = reader.read() as int;
          break;
        case 3:
          obj.minExpiration = reader.read() as int;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaInstancePollLimits obj) {
    writer.writeByte(4);
    writer.writeByte(0);
    writer.write(obj.maxExpiration);
    writer.writeByte(1);
    writer.write(obj.maxOptionChars);
    writer.writeByte(2);
    writer.write(obj.maxOptions);
    writer.writeByte(3);
    writer.write(obj.minExpiration);
  }
}

class PleromaInstanceAdapter extends TypeAdapter<PleromaInstance> {
  @override
  PleromaInstance read(BinaryReader reader) {
    var obj = PleromaInstance();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.approvalRequired = reader.read() as bool;
          break;
        case 1:
          obj.avatarUploadLimit = reader.read() as int;
          break;
        case 2:
          obj.backgroundUploadLimit = reader.read() as int;
          break;
        case 3:
          obj.bannerUploadLimit = reader.read() as int;
          break;
        case 4:
          obj.contactAccount = reader.read() as PleromaAccount;
          break;
        case 5:
          obj.email = reader.read() as String;
          break;
        case 6:
          obj.languages = (reader.read() as List)?.cast<String>();
          break;
        case 7:
          obj.maxTootChars = reader.read() as int;
          break;
        case 8:
          obj.pleroma = reader.read() as PleromaInstancePleromaPart;
          break;
        case 9:
          obj.pollLimits = reader.read() as PleromaInstancePollLimits;
          break;
        case 10:
          obj.registrations = reader.read() as bool;
          break;
        case 11:
          obj.shortDescription = reader.read() as String;
          break;
        case 12:
          obj.stats = reader.read() as MastodonInstanceStats;
          break;
        case 13:
          obj.thumbnail = reader.read() as String;
          break;
        case 14:
          obj.title = reader.read() as String;
          break;
        case 15:
          obj.uploadLimit = reader.read() as int;
          break;
        case 16:
          obj.uri = reader.read() as String;
          break;
        case 17:
          obj.urls = reader.read() as MastodonUrls;
          break;
        case 18:
          obj.vapidPublicKey = reader.read() as String;
          break;
        case 19:
          obj.version = reader.read() as String;
          break;
        case 20:
          obj.backgroundImage = reader.read() as String;
          break;
        case 21:
          obj.chatLimit = reader.read() as int;
          break;
        case 22:
          obj.description = reader.read() as String;
          break;
        case 23:
          obj.descriptionLimit = reader.read() as int;
          break;
        case 24:
          obj.invitesEnabled = reader.read() as bool;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaInstance obj) {
    writer.writeByte(25);
    writer.writeByte(0);
    writer.write(obj.approvalRequired);
    writer.writeByte(1);
    writer.write(obj.avatarUploadLimit);
    writer.writeByte(2);
    writer.write(obj.backgroundUploadLimit);
    writer.writeByte(3);
    writer.write(obj.bannerUploadLimit);
    writer.writeByte(4);
    writer.write(obj.contactAccount);
    writer.writeByte(5);
    writer.write(obj.email);
    writer.writeByte(6);
    writer.write(obj.languages);
    writer.writeByte(7);
    writer.write(obj.maxTootChars);
    writer.writeByte(8);
    writer.write(obj.pleroma);
    writer.writeByte(9);
    writer.write(obj.pollLimits);
    writer.writeByte(10);
    writer.write(obj.registrations);
    writer.writeByte(11);
    writer.write(obj.shortDescription);
    writer.writeByte(12);
    writer.write(obj.stats);
    writer.writeByte(13);
    writer.write(obj.thumbnail);
    writer.writeByte(14);
    writer.write(obj.title);
    writer.writeByte(15);
    writer.write(obj.uploadLimit);
    writer.writeByte(16);
    writer.write(obj.uri);
    writer.writeByte(17);
    writer.write(obj.urls);
    writer.writeByte(18);
    writer.write(obj.vapidPublicKey);
    writer.writeByte(19);
    writer.write(obj.version);
    writer.writeByte(20);
    writer.write(obj.backgroundImage);
    writer.writeByte(21);
    writer.write(obj.chatLimit);
    writer.writeByte(22);
    writer.write(obj.description);
    writer.writeByte(23);
    writer.write(obj.descriptionLimit);
    writer.writeByte(24);
    writer.write(obj.invitesEnabled);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaInstanceHistory _$PleromaInstanceHistoryFromJson(
    Map<String, dynamic> json) {
  return PleromaInstanceHistory(
    logins: json['logins'] as String,
    registrations: json['registrations'] as String,
    statuses: json['statuses'] as String,
    week: json['week'] as String,
  );
}

Map<String, dynamic> _$PleromaInstanceHistoryToJson(
        PleromaInstanceHistory instance) =>
    <String, dynamic>{
      'logins': instance.logins,
      'registrations': instance.registrations,
      'statuses': instance.statuses,
      'week': instance.week,
    };

PleromaInstancePleromaPart _$PleromaInstancePleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaInstancePleromaPart(
    metadata: json['metadata'] == null
        ? null
        : PleromaInstancePleromaPartMetadata.fromJson(
            json['metadata'] as Map<String, dynamic>),
    vapidPublicKey: json['vapid_public_key'] as String,
  );
}

Map<String, dynamic> _$PleromaInstancePleromaPartToJson(
        PleromaInstancePleromaPart instance) =>
    <String, dynamic>{
      'metadata': instance.metadata?.toJson(),
      'vapid_public_key': instance.vapidPublicKey,
    };

PleromaInstancePleromaPartMetadataFieldLimits
    _$PleromaInstancePleromaPartMetadataFieldLimitsFromJson(
        Map<String, dynamic> json) {
  return PleromaInstancePleromaPartMetadataFieldLimits(
    maxFields: json['max_fields'] as int,
    maxRemoteFields: json['max_remote_fields'] as int,
    nameLength: json['name_length'] as int,
    valueLength: json['value_length'] as int,
  );
}

Map<String, dynamic> _$PleromaInstancePleromaPartMetadataFieldLimitsToJson(
        PleromaInstancePleromaPartMetadataFieldLimits instance) =>
    <String, dynamic>{
      'max_fields': instance.maxFields,
      'max_remote_fields': instance.maxRemoteFields,
      'name_length': instance.nameLength,
      'value_length': instance.valueLength,
    };

PleromaInstancePleromaPartMetadata _$PleromaInstancePleromaPartMetadataFromJson(
    Map<String, dynamic> json) {
  return PleromaInstancePleromaPartMetadata(
    features: (json['features'] as List)?.map((e) => e as String)?.toList(),
    federation: json['federation'],
    postFormats:
        (json['post_formats'] as List)?.map((e) => e as String)?.toList(),
    accountActivationRequired: json['account_activation_required'] as bool,
    fieldsLimits: json['fields_limits'] == null
        ? null
        : PleromaInstancePleromaPartMetadataFieldLimits.fromJson(
            json['fields_limits'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaInstancePleromaPartMetadataToJson(
        PleromaInstancePleromaPartMetadata instance) =>
    <String, dynamic>{
      'features': instance.features,
      'federation': instance.federation,
      'post_formats': instance.postFormats,
      'account_activation_required': instance.accountActivationRequired,
      'fields_limits': instance.fieldsLimits?.toJson(),
    };

PleromaInstancePollLimits _$PleromaInstancePollLimitsFromJson(
    Map<String, dynamic> json) {
  return PleromaInstancePollLimits(
    maxExpiration: json['max_expiration'] as int,
    maxOptionChars: json['max_option_chars'] as int,
    maxOptions: json['max_options'] as int,
    minExpiration: json['min_expiration'] as int,
  );
}

Map<String, dynamic> _$PleromaInstancePollLimitsToJson(
        PleromaInstancePollLimits instance) =>
    <String, dynamic>{
      'max_expiration': instance.maxExpiration,
      'max_option_chars': instance.maxOptionChars,
      'max_options': instance.maxOptions,
      'min_expiration': instance.minExpiration,
    };

PleromaInstance _$PleromaInstanceFromJson(Map<String, dynamic> json) {
  return PleromaInstance(
    approvalRequired: json['approval_required'] as bool,
    avatarUploadLimit: json['avatar_upload_limit'] as int,
    backgroundUploadLimit: json['background_upload_limit'] as int,
    bannerUploadLimit: json['banner_upload_limit'] as int,
    contactAccount: json['contact_account'] == null
        ? null
        : PleromaAccount.fromJson(
            json['contact_account'] as Map<String, dynamic>),
    email: json['email'] as String,
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    maxTootChars: json['max_toot_chars'] as int,
    pleroma: json['pleroma'] == null
        ? null
        : PleromaInstancePleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
    pollLimits: json['poll_limits'] == null
        ? null
        : PleromaInstancePollLimits.fromJson(
            json['poll_limits'] as Map<String, dynamic>),
    registrations: json['registrations'] as bool,
    shortDescription: json['short_description'] as String,
    stats: json['stats'] == null
        ? null
        : MastodonInstanceStats.fromJson(json['stats'] as Map<String, dynamic>),
    thumbnail: json['thumbnail'] as String,
    title: json['title'] as String,
    uploadLimit: json['upload_limit'] as int,
    uri: json['uri'] as String,
    urls: json['urls'] == null
        ? null
        : MastodonUrls.fromJson(json['urls'] as Map<String, dynamic>),
    vapidPublicKey: json['vapid_public_key'] as String,
    version: json['version'] as String,
    backgroundImage: json['background_image'] as String,
    chatLimit: json['chat_limit'] as int,
    description: json['description'] as String,
    descriptionLimit: json['description_limit'] as int,
    invitesEnabled: json['invites_enabled'] as bool,
  );
}

Map<String, dynamic> _$PleromaInstanceToJson(PleromaInstance instance) =>
    <String, dynamic>{
      'approval_required': instance.approvalRequired,
      'avatar_upload_limit': instance.avatarUploadLimit,
      'background_upload_limit': instance.backgroundUploadLimit,
      'banner_upload_limit': instance.bannerUploadLimit,
      'contact_account': instance.contactAccount?.toJson(),
      'email': instance.email,
      'languages': instance.languages,
      'max_toot_chars': instance.maxTootChars,
      'pleroma': instance.pleroma?.toJson(),
      'poll_limits': instance.pollLimits?.toJson(),
      'registrations': instance.registrations,
      'short_description': instance.shortDescription,
      'stats': instance.stats?.toJson(),
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'upload_limit': instance.uploadLimit,
      'uri': instance.uri,
      'urls': instance.urls?.toJson(),
      'vapid_public_key': instance.vapidPublicKey,
      'version': instance.version,
      'background_image': instance.backgroundImage,
      'chat_limit': instance.chatLimit,
      'description': instance.description,
      'description_limit': instance.descriptionLimit,
      'invites_enabled': instance.invitesEnabled,
    };
