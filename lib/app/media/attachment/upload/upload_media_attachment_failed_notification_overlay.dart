import 'package:fedi/app/media/attachment/upload/upload_media_exception.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/file/file_size_helper.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

final _numberFormat = NumberFormat('#.#');

void showMediaAttachmentFailedNotificationOverlay(
  BuildContext context,
  dynamic e,
) {
  String contentText;
  if (e is UploadMediaExceedFileSizeLimitException) {
    // todo: todo rework copy-pasted code
    contentText = S
        .of(context)
        .app_media_upload_failed_notification_exceedSize_content(
          _numberFormat.format(
            FileSizeHelper.convertBytesToMegaBytes(e.currentFileSizeInBytes),
          ),
          _numberFormat.format(
            FileSizeHelper.convertBytesToMegaBytes(e.maximumFileSizeInBytes!),
          ),
        );
  } else {
    contentText = e.toString();
  }
  var toastService = IToastService.of(context, listen: false);

  toastService.showErrorToast(
    context: context,
    content: contentText,
    title: S.of(context).app_media_upload_failed_notification_title,
  );
}
