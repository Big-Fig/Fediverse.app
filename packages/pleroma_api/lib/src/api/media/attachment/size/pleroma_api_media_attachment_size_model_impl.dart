import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'pleroma_api_media_attachment_size_model.dart';

part 'pleroma_api_media_attachment_size_model_impl.freezed.dart';

part 'pleroma_api_media_attachment_size_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiMediaAttachmentSize
    with _$PleromaApiMediaAttachmentSize
    implements IPleromaApiMediaAttachmentSize {
  const factory PleromaApiMediaAttachmentSize({
    @HiveField(0) required int width,
    @HiveField(1) required int height,
    @HiveField(2) required String? size,
    @HiveField(3) required double? aspect,
  }) = _PleromaApiMediaAttachmentSize;

  factory PleromaApiMediaAttachmentSize.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PleromaApiMediaAttachmentSizeFromJson(json);
}

extension PleromaApiMediaAttachmentSizeInterfaceExtension
    on IPleromaApiMediaAttachmentSize {
  PleromaApiMediaAttachmentSize toPleromaApiMediaAttachmentSize({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiMediaAttachmentSize(
          width: width,
          height: height,
          size: size,
          aspect: aspect,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiMediaAttachmentSizeInterfaceListExtension
    on List<IPleromaApiMediaAttachmentSize> {
  List<PleromaApiMediaAttachmentSize> toPleromaApiMediaAttachmentSizeList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiMediaAttachmentSize item) =>
            item.toPleromaApiMediaAttachmentSize(),
        forceNewObject: forceNewObject,
      );
}
