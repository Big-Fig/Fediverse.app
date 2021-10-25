import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/pleroma_api_account_model_impl.dart';
import 'limits/poll/pleroma_api_instance_poll_limits_model_impl.dart';
import 'metadata/pleroma_api_instance_metadata_model_impl.dart';
import 'pleroma_api_instance_model.dart';
import 'stats/pleroma_api_instance_stats_model_impl.dart';
import 'urls/pleroma_api_instance_urls_model_impl.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_instance_model_impl.freezed.dart';

part 'pleroma_api_instance_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiInstancePleromaPart
    with _$PleromaApiInstancePleromaPart
    implements IPleromaApiInstancePleromaPart {
  const factory PleromaApiInstancePleromaPart({
    @HiveField(0) required PleromaApiInstanceMetadata? metadata,
  }) = _PleromaApiInstancePleromaPart;

  factory PleromaApiInstancePleromaPart.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiInstancePleromaPartFromJson(json);
}

@HiveType(typeId: 0)
@freezed
class PleromaApiInstance extends IPleromaApiInstance with _$PleromaApiInstance {
  const factory PleromaApiInstance({
    @HiveField(0)
    @JsonKey(name: 'approval_required')
        required bool? approvalRequired,
    @HiveField(1)
    @JsonKey(name: 'avatar_upload_limit')
        required int? avatarUploadLimit,
    @HiveField(2)
    @JsonKey(name: 'background_upload_limit')
        required int? backgroundUploadLimit,
    @HiveField(3)
    @JsonKey(name: 'banner_upload_limit')
        required int? bannerUploadLimit,
    @HiveField(4)
    @JsonKey(name: 'contact_account')
        required PleromaApiAccount? contactAccount,
    @HiveField(5)
        required String? email,
    @HiveField(6)
        required List<String>? languages,
    @HiveField(7)
    @JsonKey(
      name: 'max_toot_chars',
      fromJson: JsonParseHelper.intFromJsonOrNullOnError,
    )
        required int? maxTootChars,
    @HiveField(8)
        required PleromaApiInstancePleromaPart? pleroma,
    @HiveField(9)
    @JsonKey(name: 'poll_limits')
        required PleromaApiInstancePollLimits? pollLimits,
    @HiveField(10)
        required bool? registrations,
    @HiveField(11)
    @JsonKey(name: 'short_description')
        required String? shortDescription,
    @HiveField(12)
        required PleromaApiInstanceStats? stats,
    @HiveField(13)
        required String? thumbnail,
    @HiveField(14)
        required String? title,
    @HiveField(15)
    @JsonKey(name: 'upload_limit')
        required int? uploadLimit,
    @HiveField(16)
        required String uri,
    @HiveField(17)
        required PleromaApiInstanceUrls? urls,
    @HiveField(18)
    @JsonKey(name: 'vapid_public_key')
        required String? vapidPublicKey,
    @HiveField(19)
    @JsonKey(name: 'version')
        required String versionString,
    @HiveField(20)
    @JsonKey(name: 'background_image')
        required String? backgroundImage,
    @HiveField(21)
    @JsonKey(name: 'chat_limit')
        required int? chatLimit,
    @HiveField(22)
        required String? description,
    @HiveField(23)
    @JsonKey(name: 'description_limit')
        required int? descriptionLimit,
    @HiveField(24)
    @JsonKey(name: 'invites_enabled')
        required bool? invitesEnabled,
  }) = _PleromaApiInstance;

  factory PleromaApiInstance.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiInstanceFromJson(json);
}

extension PleromaApiInstanceInterfaceExtension on IPleromaApiInstance {
  PleromaApiInstance toPleromaApiInstance({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiInstance(
          approvalRequired: approvalRequired,
          avatarUploadLimit: avatarUploadLimit,
          backgroundUploadLimit: backgroundUploadLimit,
          bannerUploadLimit: bannerUploadLimit,
          contactAccount: contactAccount?.toPleromaApiAccount(
            forceNewObject: forceNewObject,
          ),
          email: email,
          languages: languages,
          maxTootChars: maxTootChars,
          pleroma: pleroma?.toPleromaApiInstancePleromaPart(
            forceNewObject: forceNewObject,
          ),
          pollLimits: pollLimits?.toPleromaApiInstancePollLimits(
            forceNewObject: forceNewObject,
          ),
          registrations: registrations,
          shortDescription: shortDescription,
          stats:
              stats?.toPleromaApiInstanceStats(forceNewObject: forceNewObject),
          thumbnail: thumbnail,
          title: title,
          uri: uri,
          urls: urls?.toPleromaApiInstanceUrls(forceNewObject: forceNewObject),
          vapidPublicKey: vapidPublicKey,
          backgroundImage: backgroundImage,
          chatLimit: chatLimit,
          description: description,
          descriptionLimit: descriptionLimit,
          invitesEnabled: invitesEnabled,
          uploadLimit: uploadLimit,
          versionString: versionString,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiInstancePleromaPartInterfaceExtension
    on IPleromaApiInstancePleromaPart {
  PleromaApiInstancePleromaPart toPleromaApiInstancePleromaPart({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiInstancePleromaPart(
          metadata: metadata?.toPleromaApiInstanceMetadata(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
