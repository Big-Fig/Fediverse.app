import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'unifedi_api_media_attachment_size_model.dart';

part 'unifedi_api_media_attachment_size_model_impl.freezed.dart';

part 'unifedi_api_media_attachment_size_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiMediaAttachmentSize
    with _$UnifediApiMediaAttachmentSize
    implements IUnifediApiMediaAttachmentSize {
  const factory UnifediApiMediaAttachmentSize({
    @HiveField(0) required int width,
    @HiveField(1) required int height,
    @HiveField(2) required String? size,
    @HiveField(3) required double? aspect,
  }) = _UnifediApiMediaAttachmentSize;

  factory UnifediApiMediaAttachmentSize.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiMediaAttachmentSizeFromJson(json);
}

extension UnifediApiMediaAttachmentSizeInterfaceExtension
    on IUnifediApiMediaAttachmentSize {
  UnifediApiMediaAttachmentSize toUnifediApiMediaAttachmentSize({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiMediaAttachmentSize(
          width: width,
          height: height,
          size: size,
          aspect: aspect,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiMediaAttachmentSizeInterfaceListExtension
    on List<IUnifediApiMediaAttachmentSize> {
  List<UnifediApiMediaAttachmentSize> toUnifediApiMediaAttachmentSizeList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiMediaAttachmentSize item) =>
            item.toUnifediApiMediaAttachmentSize(),
        forceNewObject: forceNewObject,
      );
}
