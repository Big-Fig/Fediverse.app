import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../api/field/unifedi_api_field_model.dart';

part 'unifedi_api_field_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_field_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiFieldMastodonAdapter
    with _$UnifediApiFieldMastodonAdapter
    implements IUnifediApiField {
  const UnifediApiFieldMastodonAdapter._();
  const factory UnifediApiFieldMastodonAdapter(
    @HiveField(0) MastodonApiField valueField,
  ) = _UnifediApiFieldMastodonAdapter;

  @override
  String? get name => valueField.name;

  @override
  String? get value => valueField.value;

  @override
  DateTime? get verifiedAt => valueField.verifiedAt;
  factory UnifediApiFieldMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiFieldMastodonAdapterFromJson(json);
}

extension MastodonApiFieldUnifediExtension on IMastodonApiField {
  UnifediApiFieldMastodonAdapter toUnifediApiFieldMastodonAdapter() =>
      UnifediApiFieldMastodonAdapter(
        toMastodonApiField(),
      );
}

extension MastodonApiFieldUnifediListExtension on List<IMastodonApiField> {
  List<UnifediApiFieldMastodonAdapter> toUnifediApiFieldMastodonAdapterList() =>
      map(
        (item) => item.toUnifediApiFieldMastodonAdapter(),
      ).toList();
}

extension IUnifediApiPaginationMastodonExtension on IUnifediApiField {
  MastodonApiField toMastodonApiField() => MastodonApiField(
        name: name,
        value: value,
        verifiedAt: verifiedAt,
      );
}

extension IUnifediApiPaginationMastodonListExtension on List<IUnifediApiField> {
  List<MastodonApiField> toMastodonApiFieldList() => map(
        (item) => item.toMastodonApiField(),
      ).toList();
}
