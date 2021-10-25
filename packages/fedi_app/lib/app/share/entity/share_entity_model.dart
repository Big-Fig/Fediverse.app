import 'dart:io';

import 'package:fedi_app/app/account/account_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'share_entity_model.freezed.dart';

@freezed
class ShareEntity with _$ShareEntity {
  const ShareEntity._();

  const factory ShareEntity({
    required List<ShareEntityItem> items,
  }) = _ShareEntity;

  bool get isSingle => items.length == 1;

  bool get isMulti => items.length > 1;

  bool get isHaveMedia =>
      items.map((item) => item.isHaveMedia).fold(false, _foldBoolOr);

  bool get isHaveLocalMedia =>
      items.map((item) => item.isHaveLocalMedia).fold(true, _foldBoolAnd);

  bool get isHaveLink =>
      items.map((item) => item.isHaveLink).fold(false, _foldBoolOr);

  bool get isAllHaveLink =>
      items.map((item) => item.isHaveLink).fold(true, _foldBoolAnd);

  bool get isHaveCreatedAt =>
      items.map((item) => item.isHaveCreatedAt).fold(false, _foldBoolOr);

  bool get isHaveText =>
      items.map((item) => item.isHaveText).fold(false, _foldBoolOr);

  bool get isHaveOnlyText => isHaveText && !isHaveMedia;

  bool get isHaveOnlyMedia => isHaveMedia && !isHaveText;

  bool get isHaveFromAccount =>
      items.map((item) => item.isHaveFromAccount).fold(false, _foldBoolOr);

  List<IUnifediApiMediaAttachment> get allMediaAttachments => items.fold(
        <IUnifediApiMediaAttachment>[],
        (previousValue, element) {
          var mediaAttachments = element.mediaAttachments;
          if (mediaAttachments != null) {
            previousValue.addAll(mediaAttachments);
          }

          return previousValue;
        },
      );

  List<ShareEntityItemLocalMediaFile> get allMediaLocalFiles => items.fold(
        <ShareEntityItemLocalMediaFile>[],
        (previousValue, element) {
          var mediaLocalFiles = element.mediaLocalFiles;
          if (mediaLocalFiles != null) {
            previousValue.addAll(mediaLocalFiles);
          }

          return previousValue;
        },
      );
}

@freezed
class ShareEntityItem with _$ShareEntityItem {
  const ShareEntityItem._();

  const factory ShareEntityItem({
    required DateTime? createdAt,
    required IAccount? fromAccount,
    required String? text,
    required String? linkToOriginal,
    required List<IUnifediApiMediaAttachment>? mediaAttachments,
    required List<ShareEntityItemLocalMediaFile>? mediaLocalFiles,
    required bool isNeedReUploadMediaAttachments,
  }) = _ShareEntityItem;

  bool get isHaveMedia => isHaveRemoteMedia || isHaveLocalMedia;

  bool get isHaveRemoteMedia => mediaAttachments?.isNotEmpty == true;

  bool get isHaveLocalMedia => mediaLocalFiles?.isNotEmpty == true;

  bool get isHaveLink => linkToOriginal?.isNotEmpty == true;

  bool get isHaveText => text?.isNotEmpty == true;

  bool get isHaveFromAccount => fromAccount != null;

  bool get isHaveCreatedAt => createdAt != null;
}

@freezed
class ShareEntityItemLocalMediaFile with _$ShareEntityItemLocalMediaFile {
  const factory ShareEntityItemLocalMediaFile({
    required File file,
    required bool isNeedDeleteAfterUsage,
  }) = _ShareEntityItemLocalMediaFile;
}

bool _foldBoolOr(bool previousValue, bool element) => previousValue || element;

bool _foldBoolAnd(bool previousValue, bool element) => previousValue && element;
