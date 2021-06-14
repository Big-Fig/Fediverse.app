import 'dart:io';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/foundation.dart';

class ShareEntity {
  final List<ShareEntityItem> items;

  bool get isSingle => items.length == 1;

  bool get isMulti => items.length > 1;

  ShareEntity({
    required this.items,
  }) {
    assert(items.isNotEmpty);
  }

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
  final List<IPleromaApiMediaAttachment>? mediaAttachments;
  final List<File>? mediaLocalFiles;
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
