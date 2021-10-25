import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/account/unifedi_api_account_model.dart';
import '../../api/instance/federation/unifedi_api_instance_federation_model.dart';
import '../../api/instance/limits/unifedi_api_instance_limits_model.dart';
import '../../api/instance/stats/unifedi_api_instance_stats_model.dart';
import '../../api/instance/type/unifedi_api_instance_type_model.dart';
import '../../api/instance/unifedi_api_instance_model.dart';
import '../../api/instance/urls/unifedi_api_instance_urls_model.dart';
import '../../api/version/unifedi_api_version_model.dart';
import '../account/unifedi_api_account_model_pleroma_adapter.dart';
import '../version/unifedi_api_version_model_pleroma_adapter.dart';
import 'federation/unifedi_api_instance_federation_model_pleroma_adapter.dart';
import 'limits/field/unifedi_api_instance_field_limits_model_pleroma_adapter.dart';
import 'limits/poll/unifedi_api_instance_poll_limits_model_pleroma_adapter.dart';
import 'limits/unifedi_api_instance_limits_model_pleroma_adapter.dart';
import 'stats/unifedi_api_instance_stats_model_pleroma_adapter.dart';
import 'urls/unifedi_api_instance_urls_model_pleroma_adapter.dart';

part 'unifedi_api_instance_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstancePleromaAdapter
    with _$UnifediApiInstancePleromaAdapter
    implements IUnifediApiInstance {
  const UnifediApiInstancePleromaAdapter._();

  const factory UnifediApiInstancePleromaAdapter(
    @HiveField(0) PleromaApiInstance value,
  ) = _UnifediApiInstancePleromaAdapter;

  IUnifediApiVersion get version =>
      value.versionAsPleromaApi.toUnifediApiVersionPleromaAdapter();

  @override
  String get versionString => value.versionString;

  @override
  String get uri => value.uri;

  @override
  // ignore: avoid-non-null-assertion
  String get type => UnifediApiInstanceType.pleromaValue.stringValue!;

  @override
  bool? get accountActivationRequired =>
      value.pleroma?.metadata?.accountActivationRequired;

  @override
  String? get backgroundImage => value.backgroundImage;

  @override
  IUnifediApiAccount? get contactAccount =>
      value.contactAccount?.toUnifediApiAccountPleromaAdapter();

  @override
  List<String>? get features => value.pleroma?.metadata?.features;

  @override
  IUnifediApiInstanceFederation? get federation =>
      value.pleroma?.metadata?.federation
          ?.toUnifediApiInstanceFederationPleromaAdapter();

  @override
  IUnifediApiInstanceLimits get limits =>
      value.toUnifediApiInstanceLimitsPleromaAdapter();

  @override
  List<String>? get postFormats => value.pleroma?.metadata?.postFormats;

  @override
  String? get vapidPublicKey => value.vapidPublicKey;

  @override
  IUnifediApiInstanceStats? get stats =>
      value.stats?.toUnifediApiInstanceStatsPleromaAdapter();

  @override
  IUnifediApiInstanceUrls? get urls =>
      value.urls?.toUnifediApiInstanceUrlsPleromaAdapter();

  @override
  bool? get approvalRequired => value.approvalRequired;

  @override
  String? get description => value.description;

  @override
  String? get email => value.email;

  @override
  bool? get invitesEnabled => value.invitesEnabled;

  @override
  List<String>? get languages => value.languages;

  @override
  bool? get registrations => value.registrations;

  @override
  String? get shortDescription => value.shortDescription;

  @override
  String? get thumbnail => value.thumbnail;

  @override
  String? get title => value.title;

  factory UnifediApiInstancePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstancePleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension on IPleromaApiInstance {
  UnifediApiInstancePleromaAdapter toUnifediApiInstancePleromaAdapter() =>
      UnifediApiInstancePleromaAdapter(
        toPleromaApiInstance(),
      );
}

extension UnifediApiInstancePleromaExtension on IUnifediApiInstance {
  PleromaApiInstance toPleromaApiInstance() => PleromaApiInstance(
        approvalRequired: approvalRequired,
        avatarUploadLimit: limits?.media?.avatarUploadLimit,
        backgroundUploadLimit: limits?.media?.backgroundUploadLimit,
        bannerUploadLimit: limits?.media?.bannerUploadLimit,
        contactAccount: contactAccount?.toPleromaApiAccount(),
        email: email,
        languages: languages,
        maxTootChars: limits?.status?.maxTootChars,
        pleroma: PleromaApiInstancePleromaPart(
          metadata: PleromaApiInstanceMetadata(
            features: features,
            postFormats: postFormats,
            accountActivationRequired: accountActivationRequired,
            fieldsLimits: limits?.field?.toPleromaApiInstanceFieldLimits(),
            federation: federation?.toPleromaApiInstanceFederation(),
          ),
        ),
        pollLimits: limits?.poll?.toPleromaApiInstancePollLimits(),
        registrations: registrations,
        shortDescription: shortDescription,
        stats: stats?.toPleromaApiInstanceStats(),
        thumbnail: thumbnail,
        title: title,
        uploadLimit: limits?.media?.uploadLimit,
        uri: uri,
        urls: urls?.toPleromaApiInstanceUrls(),
        vapidPublicKey: vapidPublicKey,
        versionString: versionString,
        backgroundImage: backgroundImage,
        chatLimit: limits?.chat?.messageLimit,
        description: description,
        descriptionLimit: limits?.media?.descriptionLimit,
        invitesEnabled: invitesEnabled,
      );
}
