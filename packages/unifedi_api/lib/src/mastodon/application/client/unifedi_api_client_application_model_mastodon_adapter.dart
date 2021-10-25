import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/application/client/unifedi_api_client_application_model.dart';

part 'unifedi_api_client_application_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_client_application_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiClientApplicationMastodonAdapter
    with _$UnifediApiClientApplicationMastodonAdapter
    implements IUnifediApiClientApplication {
  const UnifediApiClientApplicationMastodonAdapter._();
  const factory UnifediApiClientApplicationMastodonAdapter(
    @HiveField(0) MastodonApiClientApplication value,
  ) = _UnifediApiClientApplicationMastodonAdapter;

  @override
  String? get clientId => value.clientId;

  @override
  String? get clientSecret => value.clientSecret;

  @override
  String? get name => value.name;

  @override
  String? get vapidKey => value.vapidKey;

  @override
  String? get website => value.website;
  factory UnifediApiClientApplicationMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiClientApplicationMastodonAdapterFromJson(json);
}

extension MastodonApiClientApplicationUnifediExtension
    on IMastodonApiClientApplication {
  UnifediApiClientApplicationMastodonAdapter
      toUnifediApiClientApplicationMastodonAdapter() =>
          UnifediApiClientApplicationMastodonAdapter(
            toMastodonApiClientApplication(),
          );
}

extension UnifediApiClientApplicationMastodonExtension
    on IUnifediApiClientApplication {
  MastodonApiClientApplication toMastodonApiClientApplication() =>
      MastodonApiClientApplication(
        name: name,
        website: website,
        vapidKey: vapidKey,
        // ignore:avoid-non-null-assertion
        clientId: clientId!,
        // ignore:avoid-non-null-assertion
        clientSecret: clientSecret!,
      );
}
