import 'dart:io';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/foundation.dart';

class ShareEntity {
  final List<ShareEntityItem> items;

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

  ShareEntity({
    required this.items,
  }) : assert(items.isNotEmpty);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShareEntity &&
          runtimeType == other.runtimeType &&
          listEquals(items, other.items);

  @override
  int get hashCode => listHash(items);

  @override
  String toString() => 'ShareEntity{items: $items}';
}

class ShareEntityItem {
  final DateTime? createdAt;
  final IAccount? fromAccount;
  final String? text;
  final String? linkToOriginal;
  final List<IUnifediApiMediaAttachment>? mediaAttachments;
  final List<ShareEntityItemLocalMediaFile>? mediaLocalFiles;
  final bool isNeedReUploadMediaAttachments;

  ShareEntityItem({
    required this.createdAt,
    required this.fromAccount,
    required this.text,
    required this.linkToOriginal,
    required this.mediaAttachments,
    required this.mediaLocalFiles,
    required this.isNeedReUploadMediaAttachments,
  });

  bool get isHaveMedia => isHaveRemoteMedia || isHaveLocalMedia;

  bool get isHaveRemoteMedia => mediaAttachments?.isNotEmpty == true;

  bool get isHaveLocalMedia => mediaLocalFiles?.isNotEmpty == true;

  bool get isHaveLink => linkToOriginal?.isNotEmpty == true;

  bool get isHaveText => text?.isNotEmpty == true;

  bool get isHaveFromAccount => fromAccount != null;

  bool get isHaveCreatedAt => createdAt != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShareEntityItem &&
          runtimeType == other.runtimeType &&
          createdAt == other.createdAt &&
          fromAccount == other.fromAccount &&
          text == other.text &&
          linkToOriginal == other.linkToOriginal &&
          listEquals(mediaAttachments, other.mediaAttachments) &&
          listEquals(mediaLocalFiles, other.mediaLocalFiles) &&
          isNeedReUploadMediaAttachments ==
              other.isNeedReUploadMediaAttachments;

  @override
  int get hashCode =>
      createdAt.hashCode ^
      fromAccount.hashCode ^
      text.hashCode ^
      linkToOriginal.hashCode ^
      listHash(mediaAttachments) ^
      listHash(mediaLocalFiles) ^
      isNeedReUploadMediaAttachments.hashCode;

  @override
  String toString() => 'ShareEntityItem{'
      'createdAt: $createdAt, '
      'fromAccount: $fromAccount, '
      'text: $text, '
      'linkToOriginal: $linkToOriginal, '
      'mediaAttachments: $mediaAttachments, '
      'mediaLocalFiles: $mediaLocalFiles, '
      'isNeedReUploadMedia: $isNeedReUploadMediaAttachments'
      '}';
}

class ShareEntityItemLocalMediaFile {
  final File file;
  final bool isNeedDeleteAfterUsage;

  ShareEntityItemLocalMediaFile({
    required this.file,
    required this.isNeedDeleteAfterUsage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShareEntityItemLocalMediaFile &&
          runtimeType == other.runtimeType &&
          file == other.file &&
          isNeedDeleteAfterUsage == other.isNeedDeleteAfterUsage;

  @override
  int get hashCode => file.hashCode ^ isNeedDeleteAfterUsage.hashCode;

  @override
  String toString() => 'ShareEntityItemLocalMediaFile{'
      'file: $file, '
      'isNeedDeleteAfterUsage: $isNeedDeleteAfterUsage'
      '}';
}

bool _foldBoolOr(bool previousValue, bool element) => previousValue || element;

bool _foldBoolAnd(bool previousValue, bool element) => previousValue && element;
