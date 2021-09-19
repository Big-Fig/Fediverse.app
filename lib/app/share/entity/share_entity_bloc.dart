import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/media/attachment/reupload/media_attachment_reupload_service.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_model.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _dateFormat = DateFormat('yyyy-MM-dd HH:mm');

abstract class IShareEntityBloc implements IDisposable {
  ShareEntity get shareEntity;

  static IShareEntityBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IShareEntityBloc>(context, listen: listen);
}

extension IShareEntityExtension on IShareEntityBloc {
  String? convertAllItemsToRawText({
    required ShareEntitySettings settings,
  }) {
    String? itemsJoined = shareEntity.items
        .map(
          (item) => convertSingleItemToRawText(
            settings: settings,
            item: item,
          ),
        )
        .whereNotNull()
        .join('\n\n');

    if (itemsJoined.isEmpty) {
      itemsJoined = null;
    }

    var withMessage = settings.withMessage;
    if (withMessage?.isNotEmpty == true) {
      if (itemsJoined?.isNotEmpty == true) {
        return withMessage! + '\n\n' + itemsJoined!;
      } else {
        return withMessage;
      }
    } else {
      return itemsJoined;
    }
  }

  Future<List<IUnifediApiMediaAttachment>?> convertAllItemsToMediaAttachments({
    required ShareEntitySettings settings,
    required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
    required IMediaAttachmentReuploadService mediaAttachmentReuploadService,
    required bool reUploadRequired,
  }) async {
    if (!settings.withMedia && !settings.wholeAsLink) {
      return null;
    }

    var mediaAttachments = <IUnifediApiMediaAttachment>[];

    for (var item in shareEntity.items) {
      var itemMediaAttachments = await convertSingleItemToMediaAttachments(
        item: item,
        mediaAttachmentReuploadService: mediaAttachmentReuploadService,
        unifediApiMediaAttachmentService: unifediApiMediaAttachmentService,
        reUploadRequired: reUploadRequired,
      );
      mediaAttachments.addAll(itemMediaAttachments ?? []);
    }

    return mediaAttachments.isNotEmpty ? mediaAttachments : null;
  }
}

Future<List<IUnifediApiMediaAttachment>?> convertSingleItemToMediaAttachments({
  required ShareEntityItem item,
  required IMediaAttachmentReuploadService mediaAttachmentReuploadService,
  required IUnifediApiMediaAttachmentService unifediApiMediaAttachmentService,
  required bool reUploadRequired,
}) async {
  var mediaAttachments = <IUnifediApiMediaAttachment>[];
  var itemMediaAttachments = item.mediaAttachments;
  if (itemMediaAttachments != null) {
    if (item.isNeedReUploadMediaAttachments && reUploadRequired) {
      for (var mediaAttachment in itemMediaAttachments) {
        var reuploadedMediaAttachment =
            await mediaAttachmentReuploadService.reuploadMediaAttachment(
          originalMediaAttachment: mediaAttachment,
        );
        mediaAttachments.add(reuploadedMediaAttachment);
      }
    } else {
      mediaAttachments.addAll(
        itemMediaAttachments,
      );
    }
  }
  var mediaLocalFiles = item.mediaLocalFiles;

  if (mediaLocalFiles != null) {
    for (var mediaLocalFile in mediaLocalFiles) {
      var mediaAttachment = await unifediApiMediaAttachmentService.uploadMedia(
        file: mediaLocalFile.file,
        thumbnail: null,
        description: null,
        focus: null,
        processInBackground: null,
      );
      mediaAttachments.add(mediaAttachment);
    }
  }

  return mediaAttachments.isNotEmpty ? mediaAttachments : null;
}

String? convertSingleItemToRawText({
  required ShareEntitySettings settings,
  required ShareEntityItem item,
}) {
  if (settings.wholeAsLink) {
    return item.linkToOriginal!;
  }

  String? accountAcctAndDisplayName;
  var fromAccount = item.fromAccount;
  if (fromAccount != null && settings.appendFromAccount) {
    var acct = fromAccount.acct;
    var displayName = fromAccount.displayName;

    accountAcctAndDisplayName =
        acct + (displayName != null ? ' ($displayName)' : '');
  }

  var text = settings.withText ? item.text : null;
  var createdAtString = settings.withCreatedAt && item.createdAt != null
      ? _dateFormat.format(item.createdAt!)
      : null;

  var linkToOriginal = settings.withLink ? item.linkToOriginal : null;

  String? mediaAttachmentsLinksString;

  if (settings.withMedia && settings.mediaAsLink) {
    var mediaLocalFiles = item.mediaLocalFiles;
    assert(
      mediaLocalFiles == null || mediaLocalFiles.isEmpty,
      "Can't share local media as link",
    );
    var mediaAttachments = item.mediaAttachments;

    if (mediaAttachments?.isNotEmpty == true) {
      mediaAttachmentsLinksString = mediaAttachments!
          .map(
            (mediaAttachment) => mediaAttachment.url,
          )
          .join(', ');

      mediaAttachmentsLinksString = '[' + mediaAttachmentsLinksString + ']';
    }
  }

  var contentParts = <String?>[
    createdAtString,
    accountAcctAndDisplayName,
    text,
    mediaAttachmentsLinksString,
    linkToOriginal,
  ].where((element) => element?.isNotEmpty == true).toList();

  var content = contentParts.join('\n');

  return content.trim().isNotEmpty ? content : null;
}
