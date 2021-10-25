import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'mastodon_api_media_attachment_size_model.dart';

part 'mastodon_api_media_attachment_size_model_impl.freezed.dart';

part 'mastodon_api_media_attachment_size_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class MastodonApiMediaAttachmentSize
    with _$MastodonApiMediaAttachmentSize
    implements IMastodonApiMediaAttachmentSize {
  const factory MastodonApiMediaAttachmentSize({
    @HiveField(0) required int width,
    @HiveField(1) required int height,
    @HiveField(2) required String? size,
    @HiveField(3) required double? aspect,
  }) = _MastodonApiMediaAttachmentSize;

  factory MastodonApiMediaAttachmentSize.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiMediaAttachmentSizeFromJson(json);
}

extension MastodonApiMediaAttachmentSizeInterfaceExtension
    on IMastodonApiMediaAttachmentSize {
  MastodonApiMediaAttachmentSize toMastodonApiMediaAttachmentSize({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiMediaAttachmentSize(
          width: width,
          height: height,
          size: size,
          aspect: aspect,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiMediaAttachmentSizeInterfaceListExtension
    on List<IMastodonApiMediaAttachmentSize> {
  List<MastodonApiMediaAttachmentSize> toMastodonApiMediaAttachmentSizeList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiMediaAttachmentSize item) =>
            item.toMastodonApiMediaAttachmentSize(),
        forceNewObject: forceNewObject,
      );
}
