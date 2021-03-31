import 'dart:convert';

import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/mastodon/instance/mastodon_instance_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

part 'pleroma_instance_model.g.dart';

final _logger = Logger("pleroma_instance_model.dart");

abstract class IPleromaInstanceHistory extends IMastodonInstanceHistory {}

enum PleromaInstanceVersionType { pleroma, mastodon, unknown }

extension IPleromaInstanceExtension on IPleromaInstance {
  PleromaInstance toPleromaInstance() {
    if (this is PleromaInstance) {
      return this as PleromaInstance;
    } else {
      return PleromaInstance(
        approvalRequired: approvalRequired,
        avatarUploadLimit: avatarUploadLimit,
        backgroundUploadLimit: backgroundUploadLimit,
        bannerUploadLimit: bannerUploadLimit,
        contactAccount: contactAccount?.toPleromaAccount(),
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

  PleromaInstanceVersionType get versionType {
    // todo: better type detection
    if (version == null) {
      return PleromaInstanceVersionType.unknown;
    }
    var containsPleroma = version!.contains(pleromaVersionPart);
    if (containsPleroma) {
      return PleromaInstanceVersionType.pleroma;
    } else {
      return PleromaInstanceVersionType.mastodon;
    }
  }

  bool get isPleroma => versionType == PleromaInstanceVersionType.pleroma;
}

@JsonSerializable()
class PleromaInstanceHistory extends IPleromaInstanceHistory {
  @override
  final String? logins;

  @override
  final String? registrations;

  @override
  final String? statuses;

  @override
  final String? week;

  PleromaInstanceHistory({
    required this.logins,
    required this.registrations,
    required this.statuses,
    required this.week,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaInstanceHistory &&
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
    return 'PleromaInstanceHistory{logins: $logins,'
        ' registrations: $registrations, statuses: $statuses, week: $week}';
  }

  factory PleromaInstanceHistory.fromJson(Map<String, dynamic> json) =>
      _$PleromaInstanceHistoryFromJson(json);

  factory PleromaInstanceHistory.fromJsonString(String jsonString) =>
      _$PleromaInstanceHistoryFromJson(jsonDecode(jsonString));

  static List<PleromaInstanceHistory> listFromJsonString(String str) =>
      List<PleromaInstanceHistory>.from(
        json.decode(str).map((x) => PleromaInstanceHistory.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaInstanceHistoryToJson(this);

  String toJsonString() => jsonEncode(_$PleromaInstanceHistoryToJson(this));
}

abstract class IPleromaInstance extends IMastodonInstance {
  int? get maxTootChars;

  PleromaInstancePollLimits? get pollLimits;

  int? get uploadLimit;

  int? get avatarUploadLimit;

  int? get backgroundUploadLimit;

  int? get bannerUploadLimit;

  int? get descriptionLimit;

  int? get chatLimit;

  PleromaInstancePleromaPart? get pleroma;

  String? get vapidPublicKey;

  String? get backgroundImage;

  @override
  IPleromaAccount? get contactAccount;
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 58)
class PleromaInstancePleromaPart {
  @HiveField(0)
  final PleromaInstancePleromaPartMetadata? metadata;

  PleromaInstancePleromaPart({
    required this.metadata,
  });

  @override
  String toString() {
    return 'PleromaInstancePleromaPart{metadata: $metadata}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaInstancePleromaPart &&
          runtimeType == other.runtimeType &&
          metadata == other.metadata;

  @override
  int get hashCode => metadata.hashCode;

  factory PleromaInstancePleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaInstancePleromaPartFromJson(json);

  factory PleromaInstancePleromaPart.fromJsonString(String jsonString) =>
      _$PleromaInstancePleromaPartFromJson(jsonDecode(jsonString));

  static List<PleromaInstancePleromaPart> listFromJsonString(String str) =>
      List<PleromaInstancePleromaPart>.from(
        json.decode(str).map((x) => PleromaInstancePleromaPart.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaInstancePleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaInstancePleromaPartToJson(this));
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 72)
class PleromaInstancePleromaPartMetadataFieldLimits {
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

  PleromaInstancePleromaPartMetadataFieldLimits({
    required this.maxFields,
    required this.maxRemoteFields,
    required this.nameLength,
    required this.valueLength,
  });

  factory PleromaInstancePleromaPartMetadataFieldLimits.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaInstancePleromaPartMetadataFieldLimitsFromJson(json);

  factory PleromaInstancePleromaPartMetadataFieldLimits.fromJsonString(
    String jsonString,
  ) =>
      _$PleromaInstancePleromaPartMetadataFieldLimitsFromJson(
        jsonDecode(jsonString),
      );

  static List<PleromaInstancePleromaPartMetadataFieldLimits> listFromJsonString(
    String str,
  ) =>
      List<PleromaInstancePleromaPartMetadataFieldLimits>.from(json
          .decode(str)
          .map((x) =>
              PleromaInstancePleromaPartMetadataFieldLimits.fromJson(x)));

  Map<String, dynamic> toJson() =>
      _$PleromaInstancePleromaPartMetadataFieldLimitsToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaInstancePleromaPartMetadataFieldLimitsToJson(this));
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 98)
class PleromaInstancePleromaPartMetadataFederationMfrObjectAge {
  @HiveField(0)
  final int? threshold;
  @HiveField(1)
  final List<String>? actions;

  PleromaInstancePleromaPartMetadataFederationMfrObjectAge({
    required this.threshold,
    required this.actions,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaInstancePleromaPartMetadataFederationMfrObjectAge &&
          runtimeType == other.runtimeType &&
          threshold == other.threshold &&
          actions == other.actions;

  @override
  int get hashCode => threshold.hashCode ^ actions.hashCode;

  @override
  String toString() {
    return 'PleromaInstancePleromaPartMetadataFederationMfrObjectAge{'
        'threshold: $threshold, actions: $actions}';
  }

  factory PleromaInstancePleromaPartMetadataFederationMfrObjectAge.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaInstancePleromaPartMetadataFederationMfrObjectAgeFromJson(json);

  factory PleromaInstancePleromaPartMetadataFederationMfrObjectAge.fromJsonString(
    String jsonString,
  ) =>
      _$PleromaInstancePleromaPartMetadataFederationMfrObjectAgeFromJson(
        jsonDecode(jsonString),
      );

  static List<PleromaInstancePleromaPartMetadataFederationMfrObjectAge>
      listFromJsonString(String str) =>
          List<PleromaInstancePleromaPartMetadataFederationMfrObjectAge>.from(
            json.decode(str).map((x) =>
                PleromaInstancePleromaPartMetadataFederationMfrObjectAge
                    .fromJson(x)),
          );

  Map<String, dynamic> toJson() =>
      _$PleromaInstancePleromaPartMetadataFederationMfrObjectAgeToJson(this);

  String toJsonString() => jsonEncode(
        _$PleromaInstancePleromaPartMetadataFederationMfrObjectAgeToJson(this),
      );
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: -32 + 99)
class PleromaInstancePleromaPartMetadataFederation {
  @HiveField(0)
  final bool? enabled;
  @HiveField(1)
  final bool? exclusions;
  @HiveField(2)
  @JsonKey(name: "mrf_object_age")
  final PleromaInstancePleromaPartMetadataFederationMfrObjectAge? mrfObjectAge;
  @HiveField(3)
  @JsonKey(name: "mrf_policies")
  final List<String>? mrfPolicies;
  @HiveField(4)
  @JsonKey(name: "quarantined_instances")
  final List<String>? quarantinedInstances;

  PleromaInstancePleromaPartMetadataFederation({
    required this.enabled,
    required this.exclusions,
    required this.mrfObjectAge,
    required this.mrfPolicies,
    required this.quarantinedInstances,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaInstancePleromaPartMetadataFederation &&
          runtimeType == other.runtimeType &&
          enabled == other.enabled &&
          exclusions == other.exclusions &&
          mrfObjectAge == other.mrfObjectAge &&
          mrfPolicies == other.mrfPolicies &&
          quarantinedInstances == other.quarantinedInstances;

  @override
  int get hashCode =>
      enabled.hashCode ^
      exclusions.hashCode ^
      mrfObjectAge.hashCode ^
      mrfPolicies.hashCode ^
      quarantinedInstances.hashCode;

  @override
  String toString() {
    return 'PleromaInstancePleromaPartMetadataFederation{'
        'enabled: $enabled, exclusions: $exclusions, '
        'mrfObjectAge: $mrfObjectAge, mrfPolicies: $mrfPolicies,'
        ' quarantinedInstances: $quarantinedInstances}';
  }

  factory PleromaInstancePleromaPartMetadataFederation.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaInstancePleromaPartMetadataFederationFromJson(json);

  factory PleromaInstancePleromaPartMetadataFederation.fromJsonString(
    String jsonString,
  ) =>
      _$PleromaInstancePleromaPartMetadataFederationFromJson(
        jsonDecode(jsonString),
      );

  static List<PleromaInstancePleromaPartMetadataFederation> listFromJsonString(
    String str,
  ) =>
      List<PleromaInstancePleromaPartMetadataFederation>.from(
        json.decode(str).map(
              (x) => PleromaInstancePleromaPartMetadataFederation.fromJson(x),
            ),
      );

  Map<String, dynamic> toJson() =>
      _$PleromaInstancePleromaPartMetadataFederationToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaInstancePleromaPartMetadataFederationToJson(this));
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 60)
class PleromaInstancePleromaPartMetadata {
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
  final PleromaInstancePleromaPartMetadataFieldLimits? fieldsLimits;
  @HiveField(5)
  final PleromaInstancePleromaPartMetadataFederation? federation;

  PleromaInstancePleromaPartMetadata({
    required this.features,
    required this.federation,
    required this.postFormats,
    required this.accountActivationRequired,
    required this.fieldsLimits,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaInstancePleromaPartMetadata &&
          runtimeType == other.runtimeType &&
          features == other.features &&
          federation == other.federation &&
          postFormats == other.postFormats &&
          accountActivationRequired == other.accountActivationRequired &&
          fieldsLimits == other.fieldsLimits;

  @override
  int get hashCode =>
      features.hashCode ^
      federation.hashCode ^
      postFormats.hashCode ^
      accountActivationRequired.hashCode ^
      fieldsLimits.hashCode;

  @override
  String toString() {
    return 'PleromaInstancePleromaPartMetadata{features: $features,'
        ' federation: $federation, postFormats: $postFormats,'
        ' accountActivationRequired: $accountActivationRequired,'
        ' fieldsLimits: $fieldsLimits}';
  }

  factory PleromaInstancePleromaPartMetadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaInstancePleromaPartMetadataFromJson(json);

  factory PleromaInstancePleromaPartMetadata.fromJsonString(
    String jsonString,
  ) =>
      _$PleromaInstancePleromaPartMetadataFromJson(jsonDecode(jsonString));

  static List<PleromaInstancePleromaPartMetadata> listFromJsonString(
    String str,
  ) =>
      List<PleromaInstancePleromaPartMetadata>.from(json
          .decode(str)
          .map((x) => PleromaInstancePleromaPartMetadata.fromJson(x)));

  Map<String, dynamic> toJson() =>
      _$PleromaInstancePleromaPartMetadataToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaInstancePleromaPartMetadataToJson(this));
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 63)
class PleromaInstancePollLimits {
  static const Duration defaultMinPollExpiration = Duration(minutes: 10);
  static const Duration defaultMaxPollExpiration = Duration(days: 365);
  static const Duration defaultPollExpiration = Duration(days: 1);
  static const int defaultMaxPollOptions = 20;
  static const int defaultMaxOptionChars = 256;
  static final PleromaInstancePollLimits defaultLimits =
      PleromaInstancePollLimits(
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

  const PleromaInstancePollLimits({
    required this.maxExpiration,
    required this.maxOptionChars,
    required this.maxOptions,
    required this.minExpiration,
  });

  factory PleromaInstancePollLimits.fromJson(Map<String, dynamic> json) =>
      _$PleromaInstancePollLimitsFromJson(json);

  factory PleromaInstancePollLimits.fromJsonString(String jsonString) =>
      _$PleromaInstancePollLimitsFromJson(jsonDecode(jsonString));

  static List<PleromaInstancePollLimits> listFromJsonString(String str) =>
      List<PleromaInstancePollLimits>.from(
        json.decode(str).map((x) => PleromaInstancePollLimits.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaInstancePollLimitsToJson(this);

  String toJsonString() => jsonEncode(_$PleromaInstancePollLimitsToJson(this));
}

@JsonSerializable(explicitToJson: true)
// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 59)
class PleromaInstance extends IPleromaInstance {
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
  final PleromaAccount? contactAccount;

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
    fromJson: PleromaInstance.parseMaxTootChars,
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
  final PleromaInstancePleromaPart? pleroma;

  @override
  @HiveField(9)
  @JsonKey(name: "poll_limits")
  final PleromaInstancePollLimits? pollLimits;

  @override
  @HiveField(10)
  final bool? registrations;

  @override
  @HiveField(11)
  @JsonKey(name: "short_description")
  final String? shortDescription;

  @override
  @HiveField(12)
  final MastodonInstanceStats? stats;

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
  final MastodonUrls? urls;

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

  PleromaInstance({
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

  @override
  String toString() {
    return 'PleromaInstance{'
        ' approvalRequired: $approvalRequired,'
        ' avatarUploadLimit: $avatarUploadLimit,'
        ' backgroundUploadLimit: $backgroundUploadLimit,'
        ' bannerUploadLimit: $bannerUploadLimit,'
        ' contactAccount: $contactAccount, email: $email,'
        ' languages: $languages, maxTootChars: $maxTootChars,'
        ' pleroma: $pleroma, pollLimits: $pollLimits,'
        ' registrations: $registrations, shortDescription: $shortDescription,'
        ' stats: $stats, thumbnail: $thumbnail, title: $title,'
        ' uploadLimit: $uploadLimit, uri: $uri, urls: $urls,'
        ' vapidPublicKey: $vapidPublicKey, version: $version,'
        ' backgroundImage: $backgroundImage, chatLimit: $chatLimit,'
        ' description: $description, descriptionLimit: $descriptionLimit,'
        ' invitesEnabled: $invitesEnabled}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaInstance &&
          runtimeType == other.runtimeType &&
          approvalRequired == other.approvalRequired &&
          avatarUploadLimit == other.avatarUploadLimit &&
          backgroundUploadLimit == other.backgroundUploadLimit &&
          bannerUploadLimit == other.bannerUploadLimit &&
          contactAccount == other.contactAccount &&
          email == other.email &&
          languages == other.languages &&
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
      languages.hashCode ^
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

  factory PleromaInstance.fromJson(Map<String, dynamic> json) =>
      _$PleromaInstanceFromJson(json);

  factory PleromaInstance.fromJsonString(String jsonString) =>
      _$PleromaInstanceFromJson(jsonDecode(jsonString));

  static List<PleromaInstance> listFromJsonString(String str) =>
      List<PleromaInstance>.from(
        json.decode(str).map((x) => PleromaInstance.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaInstanceToJson(this);

  String toJsonString() => jsonEncode(_$PleromaInstanceToJson(this));
}
