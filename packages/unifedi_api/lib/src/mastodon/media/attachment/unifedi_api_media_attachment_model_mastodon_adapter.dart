import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/media/attachment/meta/unifedi_api_media_attachment_meta_model.dart';
import '../../../api/media/attachment/unifedi_api_media_attachment_model.dart';
import 'meta/unifedi_api_media_attachment_meta_model_mastodon_adapter.dart';
import 'type/unifedi_api_media_attachment_type_sealed_mastodon_converter.dart';

part 'unifedi_api_media_attachment_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_media_attachment_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMediaAttachmentMastodonAdapter
    with _$UnifediApiMediaAttachmentMastodonAdapter
    implements IUnifediApiMediaAttachment {
  const UnifediApiMediaAttachmentMastodonAdapter._();

  const factory UnifediApiMediaAttachmentMastodonAdapter(
    @HiveField(0) MastodonApiMediaAttachment value,
  ) = _UnifediApiMediaAttachmentMastodonAdapter;

  @override
  String? get description => value.description;

  @override
  String get id => value.id;

  @override
  String? get mimeType => null;

  @override
  String? get previewUrl => value.previewUrl;

  @override
  String? get remoteUrl => value.remoteUrl;

  @override
  String? get textUrl => value.textUrl;

  @override
  String get type =>
      value.typeAsMastodonApi.toUnifediApiMediaAttachmentType().stringValue;

  @override
  String? get url => value.url;

  @override
  String? get blurhash => value.blurhash;

  @override
  IUnifediApiMediaAttachmentMeta? get meta =>
      value.meta?.toUnifediApiMediaAttachmentMetaMastodonAdapter();

  factory UnifediApiMediaAttachmentMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentMastodonAdapterFromJson(json);
}

extension MastodonApiMediaAttachmentUnifediExtension
    on IMastodonApiMediaAttachment {
  UnifediApiMediaAttachmentMastodonAdapter
      toUnifediApiMediaAttachmentMastodonAdapter() =>
          UnifediApiMediaAttachmentMastodonAdapter(
            toMastodonApiMediaAttachment(),
          );
}

extension MastodonApiMediaAttachmentUnifediListExtension
    on List<IMastodonApiMediaAttachment> {
  List<UnifediApiMediaAttachmentMastodonAdapter>
      toUnifediApiMediaAttachmentMastodonAdapterList() => map(
            (item) => item.toUnifediApiMediaAttachmentMastodonAdapter(),
          ).toList();
}
