import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/media/attachment/focus/unifedi_api_media_attachment_focus_model.dart';
import '../../../../api/media/attachment/meta/unifedi_api_media_attachment_meta_model.dart';
import '../../../../api/media/attachment/size/unifedi_api_media_attachment_size_model.dart';
import '../focus/unifedi_api_media_attachment_focus_model_mastodon_adapter.dart';
import '../size/unifedi_api_media_attachment_size_model_mastodon_adapter.dart';

part 'unifedi_api_media_attachment_meta_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_media_attachment_meta_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMediaAttachmentMetaMastodonAdapter
    with _$UnifediApiMediaAttachmentMetaMastodonAdapter
    implements IUnifediApiMediaAttachmentMeta {
  const UnifediApiMediaAttachmentMetaMastodonAdapter._();
  const factory UnifediApiMediaAttachmentMetaMastodonAdapter(
    @HiveField(0) MastodonApiMediaAttachmentMeta value,
  ) = _UnifediApiMediaAttachmentMetaMastodonAdapter;

  @override
  IUnifediApiMediaAttachmentFocus? get focus =>
      value.focus?.toUnifediApiMediaAttachmentFocusMastodonAdapter();

  @override
  IUnifediApiMediaAttachmentSize? get small =>
      value.small?.toUnifediApiMediaAttachmentSizeMastodonAdapter();

  @override
  IUnifediApiMediaAttachmentSize? get original =>
      value.original?.toUnifediApiMediaAttachmentSizeMastodonAdapter();
  factory UnifediApiMediaAttachmentMetaMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentMetaMastodonAdapterFromJson(json);
}

extension MastodonApiMediaAttachmentMetaUnifediExtension
    on IMastodonApiMediaAttachmentMeta {
  UnifediApiMediaAttachmentMetaMastodonAdapter
      toUnifediApiMediaAttachmentMetaMastodonAdapter() =>
          UnifediApiMediaAttachmentMetaMastodonAdapter(
            toMastodonApiMediaAttachmentMeta(),
          );
}

extension MastodonApiMediaAttachmentMetaUnifediListExtension
    on List<IMastodonApiMediaAttachmentMeta> {
  List<UnifediApiMediaAttachmentMetaMastodonAdapter>
      toUnifediApiMediaAttachmentMetaMastodonAdapterList() => map(
            (item) => item.toUnifediApiMediaAttachmentMetaMastodonAdapter(),
          ).toList();
}
