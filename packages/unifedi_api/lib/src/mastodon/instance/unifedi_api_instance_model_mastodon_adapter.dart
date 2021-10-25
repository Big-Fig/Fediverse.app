import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/account/unifedi_api_account_model.dart';
import '../../api/instance/federation/unifedi_api_instance_federation_model.dart';
import '../../api/instance/limits/status/unifedi_api_instance_status_limits_model_impl.dart';
import '../../api/instance/limits/unifedi_api_instance_limits_model.dart';
import '../../api/instance/limits/unifedi_api_instance_limits_model_impl.dart';
import '../../api/instance/stats/unifedi_api_instance_stats_model.dart';
import '../../api/instance/type/unifedi_api_instance_type_model.dart';
import '../../api/instance/unifedi_api_instance_model.dart';
import '../../api/instance/urls/unifedi_api_instance_urls_model.dart';
import '../../api/version/unifedi_api_version_model.dart';
import '../account/unifedi_api_account_model_mastodon_adapter.dart';
import '../version/unifedi_api_version_model_mastodon_adapter.dart';
import 'stats/unifedi_api_instance_stats_model_mastodon_adapter.dart';
import 'urls/unifedi_api_instance_urls_model_mastodon_adapter.dart';

part 'unifedi_api_instance_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_instance_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceMastodonAdapter
    with _$UnifediApiInstanceMastodonAdapter
    implements IUnifediApiInstance {
  const UnifediApiInstanceMastodonAdapter._();

  const factory UnifediApiInstanceMastodonAdapter(
    @HiveField(0) MastodonApiInstance value,
  ) = _UnifediApiInstanceMastodonAdapter;

  IUnifediApiVersion get version =>
      value.versionAsMastodonApi.toUnifediApiVersionMastodonAdapter();

  @override
  String get versionString => value.versionString;

  @override
  String get uri => value.uri;

  @override
  // ignore: avoid-non-null-assertion
  String get type => UnifediApiInstanceType.mastodonValue.stringValue!;

  @override
  bool? get accountActivationRequired => null;

  @override
  String? get backgroundImage => null;

  @override
  IUnifediApiAccount? get contactAccount =>
      value.contactAccount?.toUnifediApiAccountMastodonAdapter();

  @override
  List<String>? get features => null;

  @override
  IUnifediApiInstanceFederation? get federation => null;

  @override
  IUnifediApiInstanceLimits? get limits => const UnifediApiInstanceLimits(
        poll: null,
        field: null,
        media: null,
        chat: null,
        status: UnifediApiInstanceStatusLimits(
          maxTootChars: null,
          maxMediaAttachmentsCount: IMastodonApiInstance.maxAttachedMedia,
        ),
      );

  @override
  List<String>? get postFormats => null;

  @override
  String? get vapidPublicKey => null;

  @override
  IUnifediApiInstanceStats? get stats =>
      value.stats?.toUnifediApiInstanceStatsMastodonAdapter();

  @override
  IUnifediApiInstanceUrls? get urls =>
      value.urls?.toUnifediApiInstanceUrlsMastodonAdapter();

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

  factory UnifediApiInstanceMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceMastodonAdapterFromJson(json);
}

extension MastodonApiFeatureUnifediExtension on IMastodonApiInstance {
  UnifediApiInstanceMastodonAdapter toUnifediApiInstanceMastodonAdapter() =>
      UnifediApiInstanceMastodonAdapter(
        toMastodonApiInstance(),
      );
}

extension UnifediApiInstanceMastodonExtension on IUnifediApiInstance {
  MastodonApiInstance toMastodonApiInstance() => MastodonApiInstance(
        approvalRequired: approvalRequired,
        contactAccount: contactAccount?.toMastodonApiAccount(),
        email: email,
        languages: languages,
        registrations: registrations,
        shortDescription: shortDescription,
        stats: stats?.toMastodonApiInstanceStats(),
        thumbnail: thumbnail,
        title: title,
        uri: uri,
        urls: urls?.toMastodonApiInstanceUrls(),
        versionString: versionString,
        description: description,
        invitesEnabled: invitesEnabled,
      );
}
