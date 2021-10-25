import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/media/attachment/size/unifedi_api_media_attachment_size_model.dart';

part 'unifedi_api_media_attachment_size_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_media_attachment_size_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMediaAttachmentSizeMastodonAdapter
    with _$UnifediApiMediaAttachmentSizeMastodonAdapter
    implements IUnifediApiMediaAttachmentSize {
  const UnifediApiMediaAttachmentSizeMastodonAdapter._();
  const factory UnifediApiMediaAttachmentSizeMastodonAdapter(
    @HiveField(0) MastodonApiMediaAttachmentSize value,
  ) = _UnifediApiMediaAttachmentSizeMastodonAdapter;

  @override
  int get width => value.width;
  @override
  int get height => value.height;
  @override
  String? get size => value.size;
  @override
  double? get aspect => value.aspect;
  factory UnifediApiMediaAttachmentSizeMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentSizeMastodonAdapterFromJson(json);
}

extension MastodonApiMediaAttachmentSizeUnifediExtension
    on IMastodonApiMediaAttachmentSize {
  UnifediApiMediaAttachmentSizeMastodonAdapter
      toUnifediApiMediaAttachmentSizeMastodonAdapter() =>
          UnifediApiMediaAttachmentSizeMastodonAdapter(
            toMastodonApiMediaAttachmentSize(),
          );
}

extension MastodonApiMediaAttachmentSizeUnifediListExtension
    on List<IMastodonApiMediaAttachmentSize> {
  List<UnifediApiMediaAttachmentSizeMastodonAdapter>
      toUnifediApiMediaAttachmentSizeMastodonAdapterList() => map(
            (item) => item.toUnifediApiMediaAttachmentSizeMastodonAdapter(),
          ).toList();
}
