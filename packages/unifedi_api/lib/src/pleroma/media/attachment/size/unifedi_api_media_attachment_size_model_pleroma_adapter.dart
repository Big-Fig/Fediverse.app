import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/media/attachment/size/unifedi_api_media_attachment_size_model.dart';

part 'unifedi_api_media_attachment_size_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_media_attachment_size_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiMediaAttachmentSizePleromaAdapter
    with _$UnifediApiMediaAttachmentSizePleromaAdapter
    implements IUnifediApiMediaAttachmentSize {
  const UnifediApiMediaAttachmentSizePleromaAdapter._();
  const factory UnifediApiMediaAttachmentSizePleromaAdapter(
    @HiveField(0) PleromaApiMediaAttachmentSize value,
  ) = _UnifediApiMediaAttachmentSizePleromaAdapter;

  @override
  int get width => value.width;
  @override
  int get height => value.height;
  @override
  String? get size => value.size;
  @override
  double? get aspect => value.aspect;
  factory UnifediApiMediaAttachmentSizePleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentSizePleromaAdapterFromJson(json);
}

extension PleromaApiMediaAttachmentSizeUnifediExtension
    on IPleromaApiMediaAttachmentSize {
  UnifediApiMediaAttachmentSizePleromaAdapter
      toUnifediApiMediaAttachmentSizePleromaAdapter() =>
          UnifediApiMediaAttachmentSizePleromaAdapter(
            toPleromaApiMediaAttachmentSize(),
          );
}

extension PleromaApiMediaAttachmentSizeUnifediListExtension
    on List<IPleromaApiMediaAttachmentSize> {
  List<UnifediApiMediaAttachmentSizePleromaAdapter>
      toUnifediApiMediaAttachmentSizePleromaAdapterList() => map(
            (item) => item.toUnifediApiMediaAttachmentSizePleromaAdapter(),
          ).toList();
}
