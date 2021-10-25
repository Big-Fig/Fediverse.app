import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../api/application/unifedi_api_application_model.dart';

part 'unifedi_api_application_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_application_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiApplicationMastodonAdapter
    with _$UnifediApiApplicationMastodonAdapter
    implements IUnifediApiApplication {
  const UnifediApiApplicationMastodonAdapter._();
  const factory UnifediApiApplicationMastodonAdapter(
    @HiveField(0) MastodonApiApplication value,
  ) = _UnifediApiApplicationMastodonAdapter;

  @override
  String? get name => value.name;

  @override
  String? get vapidKey => value.vapidKey;

  @override
  String? get website => value.website;
  factory UnifediApiApplicationMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiApplicationMastodonAdapterFromJson(json);
}

extension MastodonApiApplicationUnifediExtension on IMastodonApiApplication {
  UnifediApiApplicationMastodonAdapter
      toUnifediApiApplicationMastodonAdapter() =>
          UnifediApiApplicationMastodonAdapter(
            toMastodonApiApplication(),
          );
}
