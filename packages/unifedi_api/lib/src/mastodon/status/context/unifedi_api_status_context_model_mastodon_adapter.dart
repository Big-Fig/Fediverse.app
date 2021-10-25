import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/status/context/unifedi_api_status_context_model.dart';
import '../../../api/status/unifedi_api_status_model.dart';

import '../unifedi_api_status_model_mastodon_adapter.dart';

part 'unifedi_api_status_context_model_mastodon_adapter.freezed.dart';
part 'unifedi_api_status_context_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiStatusContextMastodonAdapter
    with _$UnifediApiStatusContextMastodonAdapter
    implements IUnifediApiStatusContext {
  const UnifediApiStatusContextMastodonAdapter._();
  const factory UnifediApiStatusContextMastodonAdapter(
    @HiveField(0) MastodonApiStatusContext value,
  ) = _UnifediApiStatusContextMastodonAdapter;

  @override
  List<IUnifediApiStatus> get ancestors =>
      value.ancestors.toUnifediApiStatusMastodonAdapterList();

  @override
  List<IUnifediApiStatus> get descendants =>
      value.descendants.toUnifediApiStatusMastodonAdapterList();
  factory UnifediApiStatusContextMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiStatusContextMastodonAdapterFromJson(json);
}

mixin UnifediApiStatusContextMastodonAdapterMixin
    implements IUnifediApiStatusContext {
  MastodonApiStatusContext get value;
}

extension MastodonApiStatusContextUnifediExtension
    on IMastodonApiStatusContext {
  UnifediApiStatusContextMastodonAdapter
      toUnifediApiStatusContextMastodonAdapter() =>
          UnifediApiStatusContextMastodonAdapter(
            toMastodonApiStatusContext(),
          );
}

extension MastodonApiStatusContextUnifediListExtension
    on List<IMastodonApiStatusContext> {
  List<UnifediApiStatusContextMastodonAdapter>
      toUnifediApiStatusContextMastodonAdapterList() => map(
            (item) => item.toUnifediApiStatusContextMastodonAdapter(),
          ).toList();
}
