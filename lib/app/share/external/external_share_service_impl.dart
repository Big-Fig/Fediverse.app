import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/share/external/external_share_model.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/file/temp/temp_file_helper.dart';
import 'package:fedi/file/temp/temp_file_model.dart';
import 'package:mime_type/mime_type.dart';
import 'package:share_plus/share_plus.dart';

class ExternalShareService extends DisposableOwner
    implements IExternalShareService {
  @override
  Future share({
    required String popupTitle,
    required String? text,
    required List<ShareUrlFile>? urlFiles,
  }) async {
    assert(
      text?.isNotEmpty == true || urlFiles?.isNotEmpty == true,
      'text or files should be specified',
    );

    if (urlFiles?.isNotEmpty == true) {
      if (text?.isNotEmpty == true) {
        shareSeveralUrlFilesAsLinksWithText(
          popupTitle: popupTitle,
          text: text,
          urlFiles: urlFiles!,
        );
      } else {
        if (urlFiles!.length == 1) {
          await shareSingleUrlFileAsBytesWithoutText(
            popupTitle: popupTitle,
            urlFile: urlFiles[0],
          );
        } else {
          await shareSeveralUrlFilesAsBytesWithoutText(
            urlFiles,
            text,
            popupTitle,
          );
        }
      }
    } else {
      shareTextOnly(popupTitle, text!);
    }
  }

  Future<String?> shareSeveralUrlFilesAsBytesWithoutText(
    List<ShareUrlFile> urlFiles,
    String? text,
    String popupTitle,
  ) async {
    var urlFilesPossibleToShareAsBytes =
        urlFiles.where((urlFile) => isPossibleToShareAsBytes(urlFile.url));

    var actualText = text ?? '';

    // several files sharing not supported with text
    if (urlFilesPossibleToShareAsBytes.length == 1) {
      var firstUrlFileToShareAsFiles = urlFilesPossibleToShareAsBytes.first;
      var url = firstUrlFileToShareAsFiles.url;
      var nonFirstUrlFileToShareAsBytes = urlFiles
          .where((attachment) => attachment != firstUrlFileToShareAsFiles);
      if (nonFirstUrlFileToShareAsBytes.isNotEmpty) {
        actualText += '[${nonFirstUrlFileToShareAsBytes.map(
              (attachment) => attachment.url,
            ).join(', ')}]';
      }

      var file = await TempFileHelper.downloadFileToTempFolder(
        request: DownloadTempFileRequest(
          url: url,
          filenameWithExtension:
              firstUrlFileToShareAsFiles.filenameWithExtension,
        ),
      );

      await Share.shareFiles(
        [
          file.path,
        ],
        subject: popupTitle,
        text: actualText,
      );

      await file.delete();
    } else {
      // share everything as text
      actualText +=
          '[${urlFilesPossibleToShareAsBytes.map((urlFile) => urlFile.url).join(', ')}]';
    }

    return actualText;
  }

  void shareTextOnly(String popupTitle, String text) {
    Share.share(
      text,
    );
  }

  Future shareSingleUrlFileAsBytesWithoutText({
    required String popupTitle,
    required ShareUrlFile urlFile,
  }) async {
    var url = urlFile.url;
    var filename = urlFile.filenameWithExtension;
    // other types too big, for example video
    // todo: improve sharing other media types
    if (isPossibleToShareAsBytes(url)) {
      var file = await TempFileHelper.downloadFileToTempFolder(
        request: DownloadTempFileRequest(
          url: url,
          filenameWithExtension: filename,
        ),
      );

      await Share.shareFiles(
        [
          file.path,
        ],
        subject: popupTitle,
      );

      await file.delete();
    } else {
      shareTextOnly(popupTitle, url);
    }
  }

  void shareSeveralUrlFilesAsLinksWithText({
    required String popupTitle,
    required String? text,
    required List<ShareUrlFile> urlFiles,
  }) {
    shareTextOnly(
      popupTitle,
      '${text ?? ''}  [${urlFiles.map((urlFile) => urlFile.url).join(', ')}]',
    );
  }

  bool isPossibleToShareAsBytes(String? url) => mime(url)!.contains('image');
}
