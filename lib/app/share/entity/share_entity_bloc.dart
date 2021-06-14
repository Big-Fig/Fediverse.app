import 'package:fedi/app/share/entity/settings/share_entity_settings_model.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';

abstract class IShareEntityBloc implements IDisposable {
  ShareEntity get shareEntity;
}

extension IShareEntityExtension on IShareEntityBloc {
  Future<String?> combineAllItemsAsRawText({
    required ShareEntitySettings settings,
  }) async {

    // var accountAcctAndDisplayName =
    //     entity.account.acct + ' (${entity.account.displayName})';
    //
    // var entitySpoiler = entity.spoilerText;
    // var entityContent = entity.content?.isNotEmpty == true
    //     ? entity.content?.extractRawStringFromHtmlString()
    //     : null;
    // var entityUrl = entity.url;
    // String? entityMediaAttachmentsString;
    // String? mediaId;
    // if (entity.mediaAttachments?.length == 1) {
    //   if (isNeedReUploadMediaAttachments) {
    //     var reuploadedMediaAttachment =
    //     await mediaAttachmentReuploadService.reuploadMediaAttachment(
    //       originalMediaAttachment: entity.mediaAttachments!.first,
    //     );
    //     mediaId = reuploadedMediaAttachment.id;
    //   } else {
    //     mediaId = entity.mediaAttachments!.first.id;
    //   }
    // } else {
    //   entityMediaAttachmentsString = entity.mediaAttachments
    //       ?.map((mediaAttachment) => mediaAttachment.url)
    //       .join(', ');
    // }
    //
    // if (entityMediaAttachmentsString != null) {
    //   entityMediaAttachmentsString = '[$entityMediaAttachmentsString]';
    // }
    // var additionalMessage = message;
    //
    // var contentParts = <String?>[
    //   accountAcctAndDisplayName,
    //   entitySpoiler,
    //   entityContent,
    //   entityMediaAttachmentsString,
    //   additionalMessage,
    //   entityUrl,
    // ].where((element) => element?.isNotEmpty == true).toList();
    //
    // var content = contentParts.join('\n\n');
    return shareEntity.items.map((item) => item.text).join('\n');
  }

  Future<List<IPleromaApiMediaAttachment>?> combineAllItemsAsMediaAttachments({
    required ShareEntitySettings settings,
  }) async {
    var mediaAttachments = <IPleromaApiMediaAttachment>[];

    shareEntity.items.forEach((item) {
      var itemMediaAttachments = item.mediaAttachments;
      var mediaLocalFiles = item.mediaLocalFiles;
      if (itemMediaAttachments != null) {
        mediaAttachments.addAll(
          itemMediaAttachments,
        );
      }
    });

    return mediaAttachments.isNotEmpty ? mediaAttachments : null;
  }
}
