import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/media/attachment/focus/unifedi_api_media_attachment_focus_model.dart';
import '../../../../api/media/attachment/meta/unifedi_api_media_attachment_meta_model.dart';
import '../../../../api/media/attachment/size/unifedi_api_media_attachment_size_model.dart';
import '../focus/unifedi_api_media_attachment_focus_model_pleroma_adapter.dart';
import '../size/unifedi_api_media_attachment_size_model_pleroma_adapter.dart';

part 'unifedi_api_media_attachment_meta_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_media_attachment_meta_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMediaAttachmentMetaPleromaAdapter
    with _$UnifediApiMediaAttachmentMetaPleromaAdapter
    implements IUnifediApiMediaAttachmentMeta {
  const UnifediApiMediaAttachmentMetaPleromaAdapter._();
  const factory UnifediApiMediaAttachmentMetaPleromaAdapter(
    @HiveField(0) PleromaApiMediaAttachmentMeta value,
  ) = _UnifediApiMediaAttachmentMetaPleromaAdapter;

  @override
  IUnifediApiMediaAttachmentFocus? get focus =>
      value.focus?.toUnifediApiMediaAttachmentFocusPleromaAdapter();

  @override
  IUnifediApiMediaAttachmentSize? get small =>
      value.small?.toUnifediApiMediaAttachmentSizePleromaAdapter();

  @override
  IUnifediApiMediaAttachmentSize? get original =>
      value.original?.toUnifediApiMediaAttachmentSizePleromaAdapter();
  factory UnifediApiMediaAttachmentMetaPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentMetaPleromaAdapterFromJson(json);
}

extension PleromaApiMediaAttachmentMetaUnifediExtension
    on IPleromaApiMediaAttachmentMeta {
  UnifediApiMediaAttachmentMetaPleromaAdapter
      toUnifediApiMediaAttachmentMetaPleromaAdapter() =>
          UnifediApiMediaAttachmentMetaPleromaAdapter(
            toPleromaApiMediaAttachmentMeta(),
          );
}

extension PleromaApiMediaAttachmentMetaUnifediListExtension
    on List<IPleromaApiMediaAttachmentMeta> {
  List<UnifediApiMediaAttachmentMetaPleromaAdapter>
      toUnifediApiMediaAttachmentMetaPleromaAdapterList() => map(
            (item) => item.toUnifediApiMediaAttachmentMetaPleromaAdapter(),
          ).toList();
}
