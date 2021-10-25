import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/media/attachment/focus/unifedi_api_media_attachment_focus_model.dart';

part 'unifedi_api_media_attachment_focus_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_media_attachment_focus_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMediaAttachmentFocusPleromaAdapter
    with _$UnifediApiMediaAttachmentFocusPleromaAdapter
    implements IUnifediApiMediaAttachmentFocus {
  const UnifediApiMediaAttachmentFocusPleromaAdapter._();
  const factory UnifediApiMediaAttachmentFocusPleromaAdapter(
    @HiveField(0) PleromaApiMediaAttachmentFocus value,
  ) = _UnifediApiMediaAttachmentFocusPleromaAdapter;

  @override
  double get x => value.x;

  @override
  double get y => value.y;
  factory UnifediApiMediaAttachmentFocusPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentFocusPleromaAdapterFromJson(json);
}

extension PleromaApiMediaAttachmentFocusUnifediExtension
    on IPleromaApiMediaAttachmentFocus {
  UnifediApiMediaAttachmentFocusPleromaAdapter
      toUnifediApiMediaAttachmentFocusPleromaAdapter() =>
          UnifediApiMediaAttachmentFocusPleromaAdapter(
            toPleromaApiMediaAttachmentFocus(),
          );
}

extension UnifediApiMediaAttachmentFocusPleromaExtension
    on IUnifediApiMediaAttachmentFocus {
  PleromaApiMediaAttachmentFocus toPleromaApiMediaAttachmentFocus() =>
      PleromaApiMediaAttachmentFocus(
        x: x,
        y: y,
      );
}

extension PleromaApiMediaAttachmentFocusUnifediListExtension
    on List<IPleromaApiMediaAttachmentFocus> {
  List<UnifediApiMediaAttachmentFocusPleromaAdapter>
      toUnifediApiMediaAttachmentFocusPleromaAdapterList() => map(
            (item) => item.toUnifediApiMediaAttachmentFocusPleromaAdapter(),
          ).toList();
}
