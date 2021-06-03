// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstancePleromaPartAdapter
    extends TypeAdapter<PleromaApiInstancePleromaPart> {
  @override
  final int typeId = 26;

  @override
  PleromaApiInstancePleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstancePleromaPart(
      metadata: fields[0] as PleromaApiInstancePleromaPartMetadata?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstancePleromaPart obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.metadata);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiInstancePleromaPartMetadataFieldLimitsAdapter
    extends TypeAdapter<PleromaApiInstancePleromaPartMetadataFieldLimits> {
  @override
  final int typeId = 40;

  @override
  PleromaApiInstancePleromaPartMetadataFieldLimits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstancePleromaPartMetadataFieldLimits(
      maxFields: fields[0] as int?,
      maxRemoteFields: fields[1] as int?,
      nameLength: fields[2] as int?,
      valueLength: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer,
      PleromaApiInstancePleromaPartMetadataFieldLimits obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.maxFields)
      ..writeByte(1)
      ..write(obj.maxRemoteFields)
      ..writeByte(2)
      ..write(obj.nameLength)
      ..writeByte(3)
      ..write(obj.valueLength);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartMetadataFieldLimitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiInstancePleromaPartMetadataFederationMfrObjectAgeAdapter
    extends TypeAdapter<
        PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge> {
  @override
  final int typeId = 66;

  @override
  PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge read(
      BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge(
      threshold: fields[0] as int?,
      actions: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer,
      PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.threshold)
      ..writeByte(1)
      ..write(obj.actions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartMetadataFederationMfrObjectAgeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiInstancePleromaPartMetadataFederationAdapter
    extends TypeAdapter<PleromaApiInstancePleromaPartMetadataFederation> {
  @override
  final int typeId = 67;

  @override
  PleromaApiInstancePleromaPartMetadataFederation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstancePleromaPartMetadataFederation(
      enabled: fields[0] as bool?,
      exclusions: fields[1] as bool?,
      mrfObjectAge: fields[2]
          as PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge?,
      mrfPolicies: (fields[3] as List?)?.cast<String>(),
      quarantinedInstances: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer,
      PleromaApiInstancePleromaPartMetadataFederation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.enabled)
      ..writeByte(1)
      ..write(obj.exclusions)
      ..writeByte(2)
      ..write(obj.mrfObjectAge)
      ..writeByte(3)
      ..write(obj.mrfPolicies)
      ..writeByte(4)
      ..write(obj.quarantinedInstances);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartMetadataFederationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiInstancePleromaPartMetadataAdapter
    extends TypeAdapter<PleromaApiInstancePleromaPartMetadata> {
  @override
  final int typeId = 28;

  @override
  PleromaApiInstancePleromaPartMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstancePleromaPartMetadata(
      features: (fields[0] as List?)?.cast<String>(),
      federation: fields[5] as PleromaApiInstancePleromaPartMetadataFederation?,
      postFormats: (fields[2] as List?)?.cast<String>(),
      accountActivationRequired: fields[3] as bool?,
      fieldsLimits:
          fields[4] as PleromaApiInstancePleromaPartMetadataFieldLimits?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstancePleromaPartMetadata obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.features)
      ..writeByte(2)
      ..write(obj.postFormats)
      ..writeByte(3)
      ..write(obj.accountActivationRequired)
      ..writeByte(4)
      ..write(obj.fieldsLimits)
      ..writeByte(5)
      ..write(obj.federation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiInstancePollLimitsAdapter
    extends TypeAdapter<PleromaApiInstancePollLimits> {
  @override
  final int typeId = 31;

  @override
  PleromaApiInstancePollLimits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstancePollLimits(
      maxExpiration: fields[0] as int?,
      maxOptionChars: fields[1] as int?,
      maxOptions: fields[2] as int?,
      minExpiration: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstancePollLimits obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.maxExpiration)
      ..writeByte(1)
      ..write(obj.maxOptionChars)
      ..writeByte(2)
      ..write(obj.maxOptions)
      ..writeByte(3)
      ..write(obj.minExpiration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePollLimitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiInstanceAdapter extends TypeAdapter<PleromaApiInstance> {
  @override
  final int typeId = 27;

  @override
  PleromaApiInstance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstance(
      approvalRequired: fields[0] as bool?,
      avatarUploadLimit: fields[1] as int?,
      backgroundUploadLimit: fields[2] as int?,
      bannerUploadLimit: fields[3] as int?,
      contactAccount: fields[4] as PleromaApiAccount?,
      email: fields[5] as String?,
      languages: (fields[6] as List?)?.cast<String>(),
      maxTootChars: fields[7] as int?,
      pleroma: fields[8] as PleromaApiInstancePleromaPart?,
      pollLimits: fields[9] as PleromaApiInstancePollLimits?,
      registrations: fields[10] as bool?,
      shortDescription: fields[11] as String?,
      stats: fields[12] as MastodonApiInstanceStats?,
      thumbnail: fields[13] as String?,
      title: fields[14] as String?,
      uploadLimit: fields[15] as int?,
      uri: fields[16] as String?,
      urls: fields[17] as MastodonApiUrls?,
      vapidPublicKey: fields[18] as String?,
      version: fields[19] as String?,
      backgroundImage: fields[20] as String?,
      chatLimit: fields[21] as int?,
      description: fields[22] as String?,
      descriptionLimit: fields[23] as int?,
      invitesEnabled: fields[24] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstance obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.approvalRequired)
      ..writeByte(1)
      ..write(obj.avatarUploadLimit)
      ..writeByte(2)
      ..write(obj.backgroundUploadLimit)
      ..writeByte(3)
      ..write(obj.bannerUploadLimit)
      ..writeByte(4)
      ..write(obj.contactAccount)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.languages)
      ..writeByte(7)
      ..write(obj.maxTootChars)
      ..writeByte(8)
      ..write(obj.pleroma)
      ..writeByte(9)
      ..write(obj.pollLimits)
      ..writeByte(10)
      ..write(obj.registrations)
      ..writeByte(11)
      ..write(obj.shortDescription)
      ..writeByte(12)
      ..write(obj.stats)
      ..writeByte(13)
      ..write(obj.thumbnail)
      ..writeByte(14)
      ..write(obj.title)
      ..writeByte(15)
      ..write(obj.uploadLimit)
      ..writeByte(16)
      ..write(obj.uri)
      ..writeByte(17)
      ..write(obj.urls)
      ..writeByte(18)
      ..write(obj.vapidPublicKey)
      ..writeByte(19)
      ..write(obj.version)
      ..writeByte(20)
      ..write(obj.backgroundImage)
      ..writeByte(21)
      ..write(obj.chatLimit)
      ..writeByte(22)
      ..write(obj.description)
      ..writeByte(23)
      ..write(obj.descriptionLimit)
      ..writeByte(24)
      ..write(obj.invitesEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiInstanceActivityItem _$PleromaApiInstanceActivityItemFromJson(
    Map<String, dynamic> json) {
  return PleromaApiInstanceActivityItem(
    logins: int.parse(json['logins'] as String),
    registrations: int.parse(json['registrations'] as String),
    statuses: int.parse(json['statuses'] as String),
    week: int.parse(json['week'] as String),
  );
}

Map<String, dynamic> _$PleromaApiInstanceActivityItemToJson(
        PleromaApiInstanceActivityItem instance) =>
    <String, dynamic>{
      'logins': PleromaApiInstanceActivityItem._intToString(instance.logins),
      'registrations':
          PleromaApiInstanceActivityItem._intToString(instance.registrations),
      'statuses':
          PleromaApiInstanceActivityItem._intToString(instance.statuses),
      'week': PleromaApiInstanceActivityItem._intToString(instance.week),
    };

PleromaApiInstancePleromaPart _$PleromaApiInstancePleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaApiInstancePleromaPart(
    metadata: json['metadata'] == null
        ? null
        : PleromaApiInstancePleromaPartMetadata.fromJson(
            json['metadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiInstancePleromaPartToJson(
        PleromaApiInstancePleromaPart instance) =>
    <String, dynamic>{
      'metadata': instance.metadata?.toJson(),
    };

PleromaApiInstancePleromaPartMetadataFieldLimits
    _$PleromaApiInstancePleromaPartMetadataFieldLimitsFromJson(
        Map<String, dynamic> json) {
  return PleromaApiInstancePleromaPartMetadataFieldLimits(
    maxFields: json['max_fields'] as int?,
    maxRemoteFields: json['max_remote_fields'] as int?,
    nameLength: json['name_length'] as int?,
    valueLength: json['value_length'] as int?,
  );
}

Map<String, dynamic> _$PleromaApiInstancePleromaPartMetadataFieldLimitsToJson(
        PleromaApiInstancePleromaPartMetadataFieldLimits instance) =>
    <String, dynamic>{
      'max_fields': instance.maxFields,
      'max_remote_fields': instance.maxRemoteFields,
      'name_length': instance.nameLength,
      'value_length': instance.valueLength,
    };

PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge
    _$PleromaApiInstancePleromaPartMetadataFederationMfrObjectAgeFromJson(
        Map<String, dynamic> json) {
  return PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge(
    threshold: json['threshold'] as int?,
    actions:
        (json['actions'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic>
    _$PleromaApiInstancePleromaPartMetadataFederationMfrObjectAgeToJson(
            PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge
                instance) =>
        <String, dynamic>{
          'threshold': instance.threshold,
          'actions': instance.actions,
        };

PleromaApiInstancePleromaPartMetadataFederation
    _$PleromaApiInstancePleromaPartMetadataFederationFromJson(
        Map<String, dynamic> json) {
  return PleromaApiInstancePleromaPartMetadataFederation(
    enabled: json['enabled'] as bool?,
    exclusions: json['exclusions'] as bool?,
    mrfObjectAge: json['mrf_object_age'] == null
        ? null
        : PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge.fromJson(
            json['mrf_object_age'] as Map<String, dynamic>),
    mrfPolicies: (json['mrf_policies'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    quarantinedInstances: (json['quarantined_instances'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$PleromaApiInstancePleromaPartMetadataFederationToJson(
        PleromaApiInstancePleromaPartMetadataFederation instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'exclusions': instance.exclusions,
      'mrf_object_age': instance.mrfObjectAge?.toJson(),
      'mrf_policies': instance.mrfPolicies,
      'quarantined_instances': instance.quarantinedInstances,
    };

PleromaApiInstancePleromaPartMetadata
    _$PleromaApiInstancePleromaPartMetadataFromJson(Map<String, dynamic> json) {
  return PleromaApiInstancePleromaPartMetadata(
    features:
        (json['features'] as List<dynamic>?)?.map((e) => e as String).toList(),
    federation: json['federation'] == null
        ? null
        : PleromaApiInstancePleromaPartMetadataFederation.fromJson(
            json['federation'] as Map<String, dynamic>),
    postFormats: (json['post_formats'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    accountActivationRequired: json['account_activation_required'] as bool?,
    fieldsLimits: json['fields_limits'] == null
        ? null
        : PleromaApiInstancePleromaPartMetadataFieldLimits.fromJson(
            json['fields_limits'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiInstancePleromaPartMetadataToJson(
        PleromaApiInstancePleromaPartMetadata instance) =>
    <String, dynamic>{
      'features': instance.features,
      'post_formats': instance.postFormats,
      'account_activation_required': instance.accountActivationRequired,
      'fields_limits': instance.fieldsLimits?.toJson(),
      'federation': instance.federation?.toJson(),
    };

PleromaApiInstancePollLimits _$PleromaApiInstancePollLimitsFromJson(
    Map<String, dynamic> json) {
  return PleromaApiInstancePollLimits(
    maxExpiration: json['max_expiration'] as int?,
    maxOptionChars: json['max_option_chars'] as int?,
    maxOptions: json['max_options'] as int?,
    minExpiration: json['min_expiration'] as int?,
  );
}

Map<String, dynamic> _$PleromaApiInstancePollLimitsToJson(
        PleromaApiInstancePollLimits instance) =>
    <String, dynamic>{
      'max_expiration': instance.maxExpiration,
      'max_option_chars': instance.maxOptionChars,
      'max_options': instance.maxOptions,
      'min_expiration': instance.minExpiration,
    };

PleromaApiInstance _$PleromaApiInstanceFromJson(Map<String, dynamic> json) {
  return PleromaApiInstance(
    approvalRequired: json['approval_required'] as bool?,
    avatarUploadLimit: json['avatar_upload_limit'] as int?,
    backgroundUploadLimit: json['background_upload_limit'] as int?,
    bannerUploadLimit: json['banner_upload_limit'] as int?,
    contactAccount: json['contact_account'] == null
        ? null
        : PleromaApiAccount.fromJson(
            json['contact_account'] as Map<String, dynamic>),
    email: json['email'] as String?,
    languages:
        (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList(),
    maxTootChars: PleromaApiInstance.parseMaxTootChars(json['max_toot_chars']),
    pleroma: json['pleroma'] == null
        ? null
        : PleromaApiInstancePleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
    pollLimits: json['poll_limits'] == null
        ? null
        : PleromaApiInstancePollLimits.fromJson(
            json['poll_limits'] as Map<String, dynamic>),
    registrations: json['registrations'] as bool?,
    shortDescription: json['short_description'] as String?,
    stats: json['stats'] == null
        ? null
        : MastodonApiInstanceStats.fromJson(
            json['stats'] as Map<String, dynamic>),
    thumbnail: json['thumbnail'] as String?,
    title: json['title'] as String?,
    uploadLimit: json['upload_limit'] as int?,
    uri: json['uri'] as String?,
    urls: json['urls'] == null
        ? null
        : MastodonApiUrls.fromJson(json['urls'] as Map<String, dynamic>),
    vapidPublicKey: json['vapid_public_key'] as String?,
    version: json['version'] as String?,
    backgroundImage: json['background_image'] as String?,
    chatLimit: json['chat_limit'] as int?,
    description: json['description'] as String?,
    descriptionLimit: json['description_limit'] as int?,
    invitesEnabled: json['invites_enabled'] as bool?,
  );
}

Map<String, dynamic> _$PleromaApiInstanceToJson(PleromaApiInstance instance) =>
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
