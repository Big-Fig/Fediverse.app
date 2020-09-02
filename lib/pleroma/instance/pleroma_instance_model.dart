import 'dart:convert';

import 'package:fedi/mastodon/instance/mastodon_instance_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_instance_model.g.dart';

abstract class IPleromaInstanceHistory extends IMastodonInstanceHistory {}

@JsonSerializable()
class PleromaInstanceHistory extends IPleromaInstanceHistory {
  @override
  final String logins;

  @override
  final String registrations;

  @override
  final String statuses;

  @override
  final String week;

  PleromaInstanceHistory(
      {this.logins, this.registrations, this.statuses, this.week});

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
          json.decode(str).map((x) => PleromaInstanceHistory.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaInstanceHistoryToJson(this);

  String toJsonString() => jsonEncode(_$PleromaInstanceHistoryToJson(this));
}

abstract class IPleromaInstance extends IMastodonInstance {
  int get maxTootChars;

  PleromaInstancePollLimits get pollLimits;

  int get uploadLimit;

  int get avatarUploadLimit;

  int get backgroundUploadLimit;

  int get bannerUploadLimit;

  int get descriptionLimit;

  int get chatLimit;

  PleromaInstancePleromaPart get pleroma;

  String get vapidPublicKey;

  String get backgroundImage;

  @override
  IPleromaAccount get contactAccount;
}

@JsonSerializable(explicitToJson: true)
@HiveType()
class PleromaInstancePleromaPart {
  @HiveField(0)
  PleromaInstancePleromaPartMetadata metadata;

  @HiveField(1)
  @JsonKey(name: "vapid_public_key")
  String vapidPublicKey;

  PleromaInstancePleromaPart({
    this.metadata,
    this.vapidPublicKey,
  });

  @override
  String toString() {
    return 'PleromaInstancePleromaPart{metadata: $metadata,'
        ' vapidPublicKey: $vapidPublicKey}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaInstancePleromaPart &&
          runtimeType == other.runtimeType &&
          metadata == other.metadata &&
          vapidPublicKey == other.vapidPublicKey;

  @override
  int get hashCode => metadata.hashCode ^ vapidPublicKey.hashCode;

  factory PleromaInstancePleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaInstancePleromaPartFromJson(json);

  factory PleromaInstancePleromaPart.fromJsonString(String jsonString) =>
      _$PleromaInstancePleromaPartFromJson(jsonDecode(jsonString));

  static List<PleromaInstancePleromaPart> listFromJsonString(String str) =>
      List<PleromaInstancePleromaPart>.from(
          json.decode(str).map((x) => PleromaInstancePleromaPart.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaInstancePleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaInstancePleromaPartToJson(this));
}

@JsonSerializable(explicitToJson: true)
@HiveType()
class PleromaInstancePleromaPartMetadataFieldLimits {
  @HiveField(0)
  @JsonKey(name: "max_fields")
  int maxFields;
  @JsonKey(name: "max_remote_fields")
  @HiveField(1)
  int maxRemoteFields;
  @JsonKey(name: "name_length")
  @HiveField(2)
  int nameLength;
  @JsonKey(name: "value_length")
  @HiveField(3)
  int valueLength;

  PleromaInstancePleromaPartMetadataFieldLimits({
    this.maxFields,
    this.maxRemoteFields,
    this.nameLength,
    this.valueLength,
  });

  factory PleromaInstancePleromaPartMetadataFieldLimits.fromJson(
          Map<String, dynamic> json) =>
      _$PleromaInstancePleromaPartMetadataFieldLimitsFromJson(json);

  factory PleromaInstancePleromaPartMetadataFieldLimits.fromJsonString(
          String jsonString) =>
      _$PleromaInstancePleromaPartMetadataFieldLimitsFromJson(
          jsonDecode(jsonString));

  static List<PleromaInstancePleromaPartMetadataFieldLimits> listFromJsonString(
          String str) =>
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
@HiveType()
class PleromaInstancePleromaPartMetadata {
  @HiveField(0)
  List<String> features;
  @HiveField(1)
  dynamic federation;

  // "federation":{
  //            "enabled":true,
  //            "exclusions":false,
  //            "mrf_object_age":{
  //               "actions":[
  //                  "delist",
  //                  "strip_followers"
  //               ],
  //               "threshold":604800
  //            },
  //            "mrf_policies":[
  //               "ObjectAgePolicy"
  //            ],
  //            "quarantined_instances":[
  //
  //            ]
  //         },

  @HiveField(2)
  @JsonKey(name: "post_formats")
  List<String> postFormats;
  @HiveField(3)
  @JsonKey(name: "account_activation_required")
  bool accountActivationRequired;
  @HiveField(4)
  @JsonKey(name: "fields_limits")
  PleromaInstancePleromaPartMetadataFieldLimits fieldsLimits;

  PleromaInstancePleromaPartMetadata(
      {this.features,
      this.federation,
      this.postFormats,
      this.accountActivationRequired,
      this.fieldsLimits});

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
          Map<String, dynamic> json) =>
      _$PleromaInstancePleromaPartMetadataFromJson(json);

  factory PleromaInstancePleromaPartMetadata.fromJsonString(
          String jsonString) =>
      _$PleromaInstancePleromaPartMetadataFromJson(jsonDecode(jsonString));

  static List<PleromaInstancePleromaPartMetadata> listFromJsonString(
          String str) =>
      List<PleromaInstancePleromaPartMetadata>.from(json
          .decode(str)
          .map((x) => PleromaInstancePleromaPartMetadata.fromJson(x)));

  Map<String, dynamic> toJson() =>
      _$PleromaInstancePleromaPartMetadataToJson(this);

  String toJsonString() =>
      jsonEncode(_$PleromaInstancePleromaPartMetadataToJson(this));
}

@JsonSerializable(explicitToJson: true)
@HiveType()
class PleromaInstancePollLimits {
  @HiveField(0)
  @JsonKey(name: "max_expiration")
  int maxExpiration;
  @HiveField(1)
  @JsonKey(name: "max_option_chars")
  int maxOptionChars;
  @HiveField(2)
  @JsonKey(name: "max_options")
  int maxOptions;
  @HiveField(3)
  @JsonKey(name: "min_expiration")
  int minExpiration;

  PleromaInstancePollLimits(
      {this.maxExpiration,
      this.maxOptionChars,
      this.maxOptions,
      this.minExpiration});

  factory PleromaInstancePollLimits.fromJson(Map<String, dynamic> json) =>
      _$PleromaInstancePollLimitsFromJson(json);

  factory PleromaInstancePollLimits.fromJsonString(String jsonString) =>
      _$PleromaInstancePollLimitsFromJson(jsonDecode(jsonString));

  static List<PleromaInstancePollLimits> listFromJsonString(String str) =>
      List<PleromaInstancePollLimits>.from(
          json.decode(str).map((x) => PleromaInstancePollLimits.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaInstancePollLimitsToJson(this);

  String toJsonString() => jsonEncode(_$PleromaInstancePollLimitsToJson(this));
}

@JsonSerializable(explicitToJson: true)
@HiveType()
class PleromaInstance extends IPleromaInstance {
  @override
  @HiveField(0)
  @JsonKey(name: "approval_required")
  bool approvalRequired;

  @override
  @HiveField(1)
  @JsonKey(name: "avatar_upload_limit")
  int avatarUploadLimit;

  @override
  @HiveField(2)
  @JsonKey(name: "background_upload_limit")
  int backgroundUploadLimit;

  @override
  @HiveField(3)
  @JsonKey(name: "banner_upload_limit")
  int bannerUploadLimit;

  @override
  @HiveField(4)
  @JsonKey(name: "contact_account")
  PleromaAccount contactAccount;

  @override
  @HiveField(5)
  String email;

  @override
  @HiveField(6)
  List<String> languages;

  @override
  @HiveField(7)
  @JsonKey(name: "max_toot_chars")
  int maxTootChars;

  @override
  @HiveField(8)
  PleromaInstancePleromaPart pleroma;

  @override
  @HiveField(9)
  @JsonKey(name: "poll_limits")
  PleromaInstancePollLimits pollLimits;

  @override
  @HiveField(10)
  bool registrations;

  @override
  @HiveField(11)
  @JsonKey(name: "short_description")
  String shortDescription;

  @override
  @HiveField(12)
  MastodonInstanceStats stats;

  @override
  @HiveField(13)
  String thumbnail;

  @override
  @HiveField(14)
  String title;

  @override
  @HiveField(15)
  @JsonKey(name: "upload_limit")
  int uploadLimit;

  @override
  @HiveField(16)
  String uri;

  @override
  @HiveField(17)
  MastodonUrls urls;

  @override
  @HiveField(18)
  @JsonKey(name: "vapid_public_key")
  String vapidPublicKey;

  @override
  @HiveField(19)
  String version;

  @override
  @HiveField(20)
  @JsonKey(name: "background_image")
  String backgroundImage;

  @override
  @HiveField(21)
  @JsonKey(name: "chat_limit")
  int chatLimit;

  @override
  @HiveField(22)
  String description;

  @override
  @HiveField(23)
  @JsonKey(name: "description_limit")
  int descriptionLimit;

  @override
  @HiveField(24)
  @JsonKey(name: "invites_enabled")
  bool invitesEnabled;

  PleromaInstance(
      {this.approvalRequired,
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
      this.invitesEnabled});

  @override
  String toString() {
    return 'PleromaInstance{approvalRequired: $approvalRequired,'
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
        ' description: $description, descriptionLimit: $descriptionLimit, '
        'invitesEnabled: $invitesEnabled}';
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
          json.decode(str).map((x) => PleromaInstance.fromJson(x)));

  Map<String, dynamic> toJson() => _$PleromaInstanceToJson(this);

  String toJsonString() => jsonEncode(_$PleromaInstanceToJson(this));
}
