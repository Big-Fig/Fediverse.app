import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../api/media/attachment/focus/unifedi_api_media_attachment_focus_model.dart';

part 'unifedi_api_media_attachment_focus_model_mastodon_adapter.freezed.dart';

part 'unifedi_api_media_attachment_focus_model_mastodon_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMediaAttachmentFocusMastodonAdapter
    with _$UnifediApiMediaAttachmentFocusMastodonAdapter
    implements IUnifediApiMediaAttachmentFocus {
  const UnifediApiMediaAttachmentFocusMastodonAdapter._();
  const factory UnifediApiMediaAttachmentFocusMastodonAdapter(
    @HiveField(0) MastodonApiMediaAttachmentFocus value,
  ) = _UnifediApiMediaAttachmentFocusMastodonAdapter;

  @override
  double get x => value.x;

  @override
  double get y => value.y;
  factory UnifediApiMediaAttachmentFocusMastodonAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentFocusMastodonAdapterFromJson(json);
}

extension MastodonApiMediaAttachmentFocusUnifediExtension
    on IMastodonApiMediaAttachmentFocus {
  UnifediApiMediaAttachmentFocusMastodonAdapter
      toUnifediApiMediaAttachmentFocusMastodonAdapter() =>
          UnifediApiMediaAttachmentFocusMastodonAdapter(
            toMastodonApiMediaAttachmentFocus(),
          );
}

extension UnifediApiMediaAttachmentFocusMastodonExtension
    on IUnifediApiMediaAttachmentFocus {
  MastodonApiMediaAttachmentFocus toMastodonApiMediaAttachmentFocus() =>
      MastodonApiMediaAttachmentFocus(
        x: x,
        y: y,
      );
}

extension MastodonApiMediaAttachmentFocusUnifediListExtension
    on List<IMastodonApiMediaAttachmentFocus> {
  List<UnifediApiMediaAttachmentFocusMastodonAdapter>
      toUnifediApiMediaAttachmentFocusMastodonAdapterList() => map(
            (item) => item.toUnifediApiMediaAttachmentFocusMastodonAdapter(),
          ).toList();
}
