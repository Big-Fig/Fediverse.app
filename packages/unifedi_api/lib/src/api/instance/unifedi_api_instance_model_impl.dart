import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../account/unifedi_api_account_model_impl.dart';
import 'federation/unifedi_api_instance_federation_model_impl.dart';
import 'limits/unifedi_api_instance_limits_model_impl.dart';
import 'stats/unifedi_api_instance_stats_model_impl.dart';
import 'unifedi_api_instance_model.dart';
import 'urls/unifedi_api_instance_urls_model_impl.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_model_impl.freezed.dart';

part 'unifedi_api_instance_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstance extends IUnifediApiInstance with _$UnifediApiInstance {
  const factory UnifediApiInstance({
    @HiveField(0) required String type,
    @JsonKey(name: 'version') @HiveField(1) required String versionString,
    @HiveField(2) required UnifediApiInstanceLimits? limits,
    @JsonKey(name: 'vapid_public_key')
    @HiveField(3)
        required String? vapidPublicKey,
    @JsonKey(name: 'background_image')
    @HiveField(4)
        required String? backgroundImage,
    @JsonKey(name: 'contact_account')
    @HiveField(5)
        required UnifediApiAccount? contactAccount,
    @HiveField(6) required List<String>? features,
    @JsonKey(name: 'post_formats')
    @HiveField(7)
        required List<String>? postFormats,
    @HiveField(8)
    @JsonKey(name: 'account_activation')
        required bool? accountActivationRequired,
    @HiveField(9) required UnifediApiInstanceFederation? federation,
    @HiveField(10) required UnifediApiInstanceUrls? urls,
    @HiveField(11) required UnifediApiInstanceStats? stats,
    @HiveField(12) required String uri,
    @HiveField(13) required String? title,
    @JsonKey(name: 'short_description')
    @HiveField(14)
        required String? shortDescription,
    @HiveField(15) required String? description,
    @HiveField(16) required String? email,
    @HiveField(17) required String? thumbnail,
    @HiveField(18) required List<String>? languages,
    @HiveField(19) required bool? registrations,
    @JsonKey(name: 'approval_required')
    @HiveField(20)
        required bool? approvalRequired,
    @JsonKey(name: 'invites_enabled')
    @HiveField(21)
        required bool? invitesEnabled,
  }) = _UnifediApiInstance;

  // ignore: long-parameter-list
  static UnifediApiInstance only({
    required String uri,
    required String type,
    required String versionString,
    UnifediApiInstanceLimits? limits,
    String? vapidPublicKey,
    String? backgroundImage,
    UnifediApiAccount? contactAccount,
    List<String>? features,
    List<String>? postFormats,
    bool? accountActivationRequired,
    UnifediApiInstanceFederation? federation,
    UnifediApiInstanceUrls? urls,
    UnifediApiInstanceStats? stats,
    String? title,
    String? shortDescription,
    String? description,
    String? email,
    String? thumbnail,
    List<String>? languages,
    bool? registrations,
    bool? approvalRequired,
    bool? invitesEnabled,
  }) =>
      UnifediApiInstance(
        type: type,
        versionString: versionString,
        limits: limits,
        vapidPublicKey: vapidPublicKey,
        backgroundImage: backgroundImage,
        contactAccount: contactAccount,
        features: features,
        postFormats: postFormats,
        accountActivationRequired: accountActivationRequired,
        federation: federation,
        urls: urls,
        stats: stats,
        uri: uri,
        title: title,
        shortDescription: shortDescription,
        description: description,
        email: email,
        thumbnail: thumbnail,
        languages: languages,
        registrations: registrations,
        approvalRequired: approvalRequired,
        invitesEnabled: invitesEnabled,
      );

  factory UnifediApiInstance.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiInstanceFromJson(json);
}

extension UnifediApiInstanceInterfaceExtension on IUnifediApiInstance {
  UnifediApiInstance toUnifediApiInstance({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstance(
          contactAccount: contactAccount?.toUnifediApiAccount(
            forceNewObject: forceNewObject,
          ),
          stats: stats?.toUnifediApiInstanceStats(
            forceNewObject: forceNewObject,
          ),
          urls: urls?.toUnifediApiInstanceUrls(
            forceNewObject: forceNewObject,
          ),
          vapidPublicKey: vapidPublicKey,
          backgroundImage: backgroundImage,
          versionString: versionString,
          uri: uri,
          type: type,
          features: features,
          postFormats: postFormats,
          accountActivationRequired: accountActivationRequired,
          federation: federation?.toUnifediApiInstanceFederation(),
          limits: limits?.toUnifediApiInstanceLimits(),
          title: title,
          shortDescription: shortDescription,
          description: description,
          email: email,
          thumbnail: thumbnail,
          languages: languages,
          registrations: registrations,
          approvalRequired: approvalRequired,
          invitesEnabled: invitesEnabled,
        ),
        forceNewObject: forceNewObject,
      );
}
