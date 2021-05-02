import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/instance/mastodon_api_instance_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_instance_model.g.dart';

final _logger = Logger("pleroma_instance_model.dart");

abstract class IPleromaApiInstanceHistory extends IMastodonApiInstanceHistory {}

enum PleromaApiInstanceVersionType { pleroma, mastodon, unknown }

extension IPleromaApiInstanceExtension on IPleromaApiInstance {
  PleromaApiInstance toPleromaApiInstance({bool forceNewObject = false}) {
    if (this is PleromaApiInstance && !forceNewObject) {
      return this as PleromaApiInstance;
    } else {
      return PleromaApiInstance(
        approvalRequired: approvalRequired,
        avatarUploadLimit: avatarUploadLimit,
        backgroundUploadLimit: backgroundUploadLimit,
        bannerUploadLimit: bannerUploadLimit,
        contactAccount: contactAccount?.toPleromaApiAccount(),
        email: email,
        languages: languages,
        maxTootChars: maxTootChars,
        pleroma: pleroma,
        pollLimits: pollLimits,
        registrations: registrations,
        shortDescription: shortDescription,
        stats: stats,
        thumbnail: thumbnail,
        title: title,
        uri: uri,
        urls: urls,
        vapidPublicKey: vapidPublicKey,
        backgroundImage: backgroundImage,
        chatLimit: chatLimit,
        description: description,
        descriptionLimit: descriptionLimit,
        invitesEnabled: invitesEnabled,
        uploadLimit: uploadLimit,
        version: version,
      );
    }
  }

  static const pleromaVersionPart = "(compatible; Pleroma";

  PleromaApiInstanceVersionType get versionType {
    // todo: better type detection
    if (version == null) {
      return PleromaApiInstanceVersionType.unknown;
    }
    var containsPleroma = version!.contains(pleromaVersionPart);
    if (containsPleroma) {
      return PleromaApiInstanceVersionType.pleroma;
    } else {
      return PleromaApiInstanceVersionType.mastodon;
    }
  }

  bool get isPleroma => versionType == PleromaApiInstanceVersionType.pleroma;
}

@JsonSerializable()
class PleromaApiInstanceHistory extends IPleromaApiInstanceHistory
    implements IJsonObject {
  @override
  final String? logins;

  @override
  final String? registrations;

  @override
  final String? statuses;

  @override
  final String? week;

  PleromaApiInstanceHistory({
    required this.logins,
    required this.registrations,
    required this.statuses,
    required this.week,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstanceHistory &&
          runtimeType == other.runtimeType &&
          logins == other.logins &&
          registrations == other.registrations &&
          statuses == other.statuses &&
          week == other.week;

  @override
  int get hashCode =>
      logins.hashCode ^
      registrations.hashCode ^
      statuses.hashCode ^
      week.hashCode;

  @override
  String toString() {
    return 'PleromaApiInstanceHistory{'
        'logins: $logins, '
        'registrations: $registrations, '
        'statuses: $statuses, '
        'week: $week'
        '}';
  }

  static PleromaApiInstanceHistory fromJson(Map<String, dynamic> json) =>
      _$PleromaApiInstanceHistoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiInstanceHistoryToJson(this);
}

abstract class IPleromaApiInstance extends IMastodonApiInstance {
  int? get maxTootChars;

  PleromaApiInstancePollLimits? get pollLimits;

  int? get uploadLimit;

  int? get avatarUploadLimit;

  int? get backgroundUploadLimit;

  int? get bannerUploadLimit;

  int? get descriptionLimit;

  int? get chatLimit;

  PleromaApiInstancePleromaPart? get pleroma;

  String? get vapidPublicKey;

  String? get backgroundImage;

  @override
  IPleromaApiAccount? get contactAccount;
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 58)
class PleromaApiInstancePleromaPart implements IJsonObject {
  @HiveField(0)
  final PleromaApiInstancePleromaPartMetadata? metadata;

  PleromaApiInstancePleromaPart({
    required this.metadata,
  });

  @override
  String toString() {
    return 'PleromaApiInstancePleromaPart{metadata: $metadata}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPart &&
          runtimeType == other.runtimeType &&
          metadata == other.metadata;

  @override
  int get hashCode => metadata.hashCode;

  static PleromaApiInstancePleromaPart fromJson(Map<String, dynamic> json) =>
      _$PleromaApiInstancePleromaPartFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiInstancePleromaPartToJson(this);
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 72)
class PleromaApiInstancePleromaPartMetadataFieldLimits implements IJsonObject {
  @HiveField(0)
  @JsonKey(name: "max_fields")
  final int? maxFields;
  @JsonKey(name: "max_remote_fields")
  @HiveField(1)
  final int? maxRemoteFields;
  @JsonKey(name: "name_length")
  @HiveField(2)
  final int? nameLength;
  @JsonKey(name: "value_length")
  @HiveField(3)
  final int? valueLength;

  PleromaApiInstancePleromaPartMetadataFieldLimits({
    required this.maxFields,
    required this.maxRemoteFields,
    required this.nameLength,
    required this.valueLength,
  });

  static PleromaApiInstancePleromaPartMetadataFieldLimits fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstancePleromaPartMetadataFieldLimitsFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PleromaApiInstancePleromaPartMetadataFieldLimitsToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartMetadataFieldLimits &&
          runtimeType == other.runtimeType &&
          maxFields == other.maxFields &&
          maxRemoteFields == other.maxRemoteFields &&
          nameLength == other.nameLength &&
          valueLength == other.valueLength;

  @override
  int get hashCode =>
      maxFields.hashCode ^
      maxRemoteFields.hashCode ^
      nameLength.hashCode ^
      valueLength.hashCode;

  @override
  String toString() {
    return 'PleromaApiInstancePleromaPartMetadataFieldLimits{'
        'maxFields: $maxFields, '
        'maxRemoteFields: $maxRemoteFields, '
        'nameLength: $nameLength, '
        'valueLength: $valueLength'
        '}';
  }
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 98)
class PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge
    implements IJsonObject {
  @HiveField(0)
  final int? threshold;
  @HiveField(1)
  final List<String>? actions;

  PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge({
    required this.threshold,
    required this.actions,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge &&
          runtimeType == other.runtimeType &&
          threshold == other.threshold &&
          listEquals(actions, other.actions);

  @override
  int get hashCode => threshold.hashCode ^ listHash(actions);

  @override
  String toString() {
    return 'PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge{'
        'threshold: $threshold, '
        'actions: $actions'
        '}';
  }

  static PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstancePleromaPartMetadataFederationMfrObjectAgeFromJson(
          json);

  @override
  Map<String, dynamic> toJson() =>
      _$PleromaApiInstancePleromaPartMetadataFederationMfrObjectAgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 99)
class PleromaApiInstancePleromaPartMetadataFederation implements IJsonObject {
  @HiveField(0)
  final bool? enabled;
  @HiveField(1)
  final bool? exclusions;
  @HiveField(2)
  @JsonKey(name: "mrf_object_age")
  final PleromaApiInstancePleromaPartMetadataFederationMfrObjectAge?
      mrfObjectAge;
  @HiveField(3)
  @JsonKey(name: "mrf_policies")
  final List<String>? mrfPolicies;
  @HiveField(4)
  @JsonKey(name: "quarantined_instances")
  final List<String>? quarantinedInstances;

  PleromaApiInstancePleromaPartMetadataFederation({
    required this.enabled,
    required this.exclusions,
    required this.mrfObjectAge,
    required this.mrfPolicies,
    required this.quarantinedInstances,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartMetadataFederation &&
          runtimeType == other.runtimeType &&
          enabled == other.enabled &&
          exclusions == other.exclusions &&
          mrfObjectAge == other.mrfObjectAge &&
          listEquals(mrfPolicies, other.mrfPolicies) &&
          listEquals(quarantinedInstances, other.quarantinedInstances);

  @override
  int get hashCode =>
      enabled.hashCode ^
      exclusions.hashCode ^
      mrfObjectAge.hashCode ^
      listHash(mrfPolicies) ^
      listHash(quarantinedInstances);

  @override
  String toString() {
    return 'PleromaApiInstancePleromaPartMetadataFederation{'
        'enabled: $enabled, '
        'exclusions: $exclusions, '
        'mrfObjectAge: $mrfObjectAge, '
        'mrfPolicies: $mrfPolicies, '
        'quarantinedInstances: $quarantinedInstances'
        '}';
  }

  static PleromaApiInstancePleromaPartMetadataFederation fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstancePleromaPartMetadataFederationFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PleromaApiInstancePleromaPartMetadataFederationToJson(this);
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 60)
class PleromaApiInstancePleromaPartMetadata implements IJsonObject {
  @HiveField(0)
  final List<String>? features;

  @HiveField(2)
  @JsonKey(name: "post_formats")
  final List<String>? postFormats;
  @HiveField(3)
  @JsonKey(name: "account_activation_required")
  final bool? accountActivationRequired;
  @HiveField(4)
  @JsonKey(name: "fields_limits")
  final PleromaApiInstancePleromaPartMetadataFieldLimits? fieldsLimits;
  @HiveField(5)
  final PleromaApiInstancePleromaPartMetadataFederation? federation;

  PleromaApiInstancePleromaPartMetadata({
    required this.features,
    required this.federation,
    required this.postFormats,
    required this.accountActivationRequired,
    required this.fieldsLimits,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePleromaPartMetadata &&
          runtimeType == other.runtimeType &&
          listEquals(features, other.features) &&
          federation == other.federation &&
          listEquals(postFormats, other.postFormats) &&
          accountActivationRequired == other.accountActivationRequired &&
          fieldsLimits == other.fieldsLimits;

  @override
  int get hashCode =>
      listHash(features) ^
      federation.hashCode ^
      listHash(postFormats) ^
      accountActivationRequired.hashCode ^
      fieldsLimits.hashCode;

  @override
  String toString() {
    return 'PleromaApiInstancePleromaPartMetadata{'
        'features: $features, '
        'federation: $federation, '
        'postFormats: $postFormats, '
        'accountActivationRequired: $accountActivationRequired, '
        'fieldsLimits: $fieldsLimits'
        '}';
  }

  static PleromaApiInstancePleromaPartMetadata fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstancePleromaPartMetadataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PleromaApiInstancePleromaPartMetadataToJson(this);
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 63)
class PleromaApiInstancePollLimits {
  static const Duration defaultMinPollExpiration = Duration(minutes: 10);
  static const Duration defaultMaxPollExpiration = Duration(days: 365);
  static const Duration defaultPollExpiration = Duration(days: 1);
  static const int defaultMaxPollOptions = 20;
  static const int defaultMaxOptionChars = 256;
  static final PleromaApiInstancePollLimits defaultLimits =
      PleromaApiInstancePollLimits(
    maxExpiration: defaultMaxPollExpiration.totalSeconds,
    minExpiration: defaultMinPollExpiration.totalSeconds,
    maxOptionChars: defaultMaxOptionChars,
    maxOptions: defaultMaxPollOptions,
  );

  Duration get minExpirationDurationOrDefault =>
      minExpiration?.toDuration() ?? defaultMinPollExpiration;

  Duration get maxExpirationDurationOrDefault =>
      maxExpiration?.toDuration() ?? defaultMaxPollExpiration;

  int get maxOptionsOrDefault => maxOptions ?? defaultMaxPollOptions;

  int get maxOptionCharsOrDefault => maxOptionChars ?? defaultMaxOptionChars;

  @HiveField(0)
  @JsonKey(name: "max_expiration")
  final int? maxExpiration;
  @HiveField(1)
  @JsonKey(name: "max_option_chars")
  final int? maxOptionChars;
  @HiveField(2)
  @JsonKey(name: "max_options")
  final int? maxOptions;
  @HiveField(3)
  @JsonKey(name: "min_expiration")
  final int? minExpiration;

  const PleromaApiInstancePollLimits({
    required this.maxExpiration,
    required this.maxOptionChars,
    required this.maxOptions,
    required this.minExpiration,
  });

  static PleromaApiInstancePollLimits fromJson(Map<String, dynamic> json) =>
      _$PleromaApiInstancePollLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiInstancePollLimitsToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstancePollLimits &&
          runtimeType == other.runtimeType &&
          maxExpiration == other.maxExpiration &&
          maxOptionChars == other.maxOptionChars &&
          maxOptions == other.maxOptions &&
          minExpiration == other.minExpiration;

  @override
  int get hashCode =>
      maxExpiration.hashCode ^
      maxOptionChars.hashCode ^
      maxOptions.hashCode ^
      minExpiration.hashCode;

  @override
  String toString() {
    return 'PleromaApiInstancePollLimits{'
        'maxExpiration: $maxExpiration, '
        'maxOptionChars: $maxOptionChars, '
        'maxOptions: $maxOptions, '
        'minExpiration: $minExpiration'
        '}';
  }
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 59)
class PleromaApiInstance extends IPleromaApiInstance implements IJsonObject {
  @override
  @HiveField(0)
  @JsonKey(name: "approval_required")
  final bool? approvalRequired;

  @override
  @HiveField(1)
  @JsonKey(name: "avatar_upload_limit")
  final int? avatarUploadLimit;

  @override
  @HiveField(2)
  @JsonKey(name: "background_upload_limit")
  final int? backgroundUploadLimit;

  @override
  @HiveField(3)
  @JsonKey(name: "banner_upload_limit")
  final int? bannerUploadLimit;

  @override
  @HiveField(4)
  @JsonKey(name: "contact_account")
  final PleromaApiAccount? contactAccount;

  @override
  @HiveField(5)
  final String? email;

  @override
  @HiveField(6)
  final List<String>? languages;

  @override
  @HiveField(7)
  @JsonKey(
    name: "max_toot_chars",
    fromJson: PleromaApiInstance.parseMaxTootChars,
  )
  final int? maxTootChars;

  static int? parseMaxTootChars(json) {
    if (json == null) {
      return null;
    }
    if (json is int) {
      return json;
    } else {
      try {
        return int.parse(json.toString());
      } catch (e, stackTrace) {
        _logger.warning(() => "error during parseMaxTootChars", e, stackTrace);
        return null;
      }
    }
  }

  @override
  @HiveField(8)
  final PleromaApiInstancePleromaPart? pleroma;

  @override
  @HiveField(9)
  @JsonKey(name: "poll_limits")
  final PleromaApiInstancePollLimits? pollLimits;

  @override
  @HiveField(10)
  final bool? registrations;

  @override
  @HiveField(11)
  @JsonKey(name: "short_description")
  final String? shortDescription;

  @override
  @HiveField(12)
  final MastodonApiInstanceStats? stats;

  @override
  @HiveField(13)
  final String? thumbnail;

  @override
  @HiveField(14)
  final String? title;

  @override
  @HiveField(15)
  @JsonKey(name: "upload_limit")
  final int? uploadLimit;

  @override
  @HiveField(16)
  final String? uri;

  @override
  @HiveField(17)
  final MastodonApiUrls? urls;

  @override
  @HiveField(18)
  @JsonKey(name: "vapid_public_key")
  final String? vapidPublicKey;

  @override
  @HiveField(19)
  final String? version;

  @override
  @HiveField(20)
  @JsonKey(name: "background_image")
  final String? backgroundImage;

  @override
  @HiveField(21)
  @JsonKey(name: "chat_limit")
  final int? chatLimit;

  @override
  @HiveField(22)
  final String? description;

  @override
  @HiveField(23)
  @JsonKey(name: "description_limit")
  final int? descriptionLimit;

  @override
  @HiveField(24)
  @JsonKey(name: "invites_enabled")
  final bool? invitesEnabled;

  PleromaApiInstance({
    required this.approvalRequired,
    required this.avatarUploadLimit,
    required this.backgroundUploadLimit,
    required this.bannerUploadLimit,
    required this.contactAccount,
    required this.email,
    required this.languages,
    required this.maxTootChars,
    required this.pleroma,
    required this.pollLimits,
    required this.registrations,
    required this.shortDescription,
    required this.stats,
    required this.thumbnail,
    required this.title,
    required this.uploadLimit,
    required this.uri,
    required this.urls,
    required this.vapidPublicKey,
    required this.version,
    required this.backgroundImage,
    required this.chatLimit,
    required this.description,
    required this.descriptionLimit,
    required this.invitesEnabled,
  });

  PleromaApiInstance.only({
    this.approvalRequired,
    this.avatarUploadLimit,
    this.backgroundUploadLimit,
    this.bannerUploadLimit,
    this.contactAccount,
    this.email,
    this.languages,
    this.maxTootChars,
    this.pleroma,
    this.pollLimits,
    this.registrations,
    this.shortDescription,
    this.stats,
    this.thumbnail,
    this.title,
    this.uploadLimit,
    this.uri,
    this.urls,
    this.vapidPublicKey,
    this.version,
    this.backgroundImage,
    this.chatLimit,
    this.description,
    this.descriptionLimit,
    this.invitesEnabled,
  });

  @override
  String toString() {
    return 'PleromaApiInstance{'
        'approvalRequired: $approvalRequired, '
        'avatarUploadLimit: $avatarUploadLimit, '
        'backgroundUploadLimit: $backgroundUploadLimit, '
        'bannerUploadLimit: $bannerUploadLimit, '
        'contactAccount: $contactAccount, '
        'email: $email, '
        'languages: $languages, '
        'maxTootChars: $maxTootChars, '
        'pleroma: $pleroma, '
        'pollLimits: $pollLimits, '
        'registrations: $registrations, '
        'shortDescription: $shortDescription, '
        'stats: $stats, '
        'thumbnail: $thumbnail, '
        'title: $title, '
        'uploadLimit: $uploadLimit, '
        'uri: $uri, '
        'urls: $urls, '
        'vapidPublicKey: $vapidPublicKey, '
        'version: $version, '
        'backgroundImage: $backgroundImage, '
        'chatLimit: $chatLimit, '
        'description: $description, '
        'descriptionLimit: $descriptionLimit, '
        'invitesEnabled: $invitesEnabled'
        '}';
  }

  @override
  // ignore: code-metrics
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstance &&
          runtimeType == other.runtimeType &&
          approvalRequired == other.approvalRequired &&
          avatarUploadLimit == other.avatarUploadLimit &&
          backgroundUploadLimit == other.backgroundUploadLimit &&
          bannerUploadLimit == other.bannerUploadLimit &&
          contactAccount == other.contactAccount &&
          email == other.email &&
          listEquals(languages, other.languages) &&
          maxTootChars == other.maxTootChars &&
          pleroma == other.pleroma &&
          pollLimits == other.pollLimits &&
          registrations == other.registrations &&
          shortDescription == other.shortDescription &&
          stats == other.stats &&
          thumbnail == other.thumbnail &&
          title == other.title &&
          uploadLimit == other.uploadLimit &&
          uri == other.uri &&
          urls == other.urls &&
          vapidPublicKey == other.vapidPublicKey &&
          version == other.version &&
          backgroundImage == other.backgroundImage &&
          chatLimit == other.chatLimit &&
          description == other.description &&
          descriptionLimit == other.descriptionLimit &&
          invitesEnabled == other.invitesEnabled;

  @override
  int get hashCode =>
      approvalRequired.hashCode ^
      avatarUploadLimit.hashCode ^
      backgroundUploadLimit.hashCode ^
      bannerUploadLimit.hashCode ^
      contactAccount.hashCode ^
      email.hashCode ^
      listHash(languages) ^
      maxTootChars.hashCode ^
      pleroma.hashCode ^
      pollLimits.hashCode ^
      registrations.hashCode ^
      shortDescription.hashCode ^
      stats.hashCode ^
      thumbnail.hashCode ^
      title.hashCode ^
      uploadLimit.hashCode ^
      uri.hashCode ^
      urls.hashCode ^
      vapidPublicKey.hashCode ^
      version.hashCode ^
      backgroundImage.hashCode ^
      chatLimit.hashCode ^
      description.hashCode ^
      descriptionLimit.hashCode ^
      invitesEnabled.hashCode;

  static PleromaApiInstance fromJson(Map<String, dynamic> json) =>
      _$PleromaApiInstanceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiInstanceToJson(this);
}
