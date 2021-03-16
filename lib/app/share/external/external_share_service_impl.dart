import 'dart:io';
import 'dart:typed_data';

import 'package:fedi/app/share/external/external_share_model.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/foundation.dart';
import 'package:mime_type/mime_type.dart';
import 'package:share/share.dart';

class ExternalShareService extends DisposableOwner
    implements IExternalShareService {
  static Future<Uint8List> loadBytesFromUrl(String url) async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  }

  @override
  Future share({
    required String popupTitle,
    required String? text,
    required List<ShareUrlFile>? urlFiles,
  }) async {
    assert(text?.isNotEmpty == true || urlFiles?.isNotEmpty == true);

    if (urlFiles?.isNotEmpty == true) {
      if (text?.isNotEmpty == true) {
        shareSeveralUrlFilesAsLinksWithText(popupTitle, text, urlFiles);
      } else {
        if (urlFiles!.length == 1) {
          await shareSingleUrlFileAsBytesWithoutText(urlFiles[0], popupTitle);
        } else {
          await shareSeveralUrlFilesAsBytesWithoutText(
              urlFiles, text, popupTitle);
        }
      }
    } else {
      shareTextOnly(popupTitle, text!);
    }
  }

  Future<String?> shareSeveralUrlFilesAsBytesWithoutText(
      List<ShareUrlFile> urlFiles, String? text, String popupTitle) async {
    var urlFilesPossibleToShareAsBytes =
        urlFiles.where((urlFile) => isPossibleToShareAsBytes(urlFile.url));

    text = text ?? "";

    // several files sharing not supported with text
    if (urlFilesPossibleToShareAsBytes.length == 1) {
      var firstUrlFileToShareAsBytes = urlFilesPossibleToShareAsBytes.first;
      var url = firstUrlFileToShareAsBytes.url;
      var mimeType = mime(url);
      var nonFirstUrlFileToShareAsBytes = urlFiles
          .where((attachment) => attachment != firstUrlFileToShareAsBytes);
      if (nonFirstUrlFileToShareAsBytes.isNotEmpty == true) {
        text +=
            "[${nonFirstUrlFileToShareAsBytes.map((attachment) => attachment.url).join(", ")}]";
      }
      //
      // Share.shareFiles(paths)
      //
      // await Share.file(popupTitle, firstUrlFileToShareAsBytes.filename,
      //     await loadBytesFromUrl(url), mimeType,
      //     text: text);
    } else {
      // share everything as text
      text +=
          "[${urlFilesPossibleToShareAsBytes.map((urlFile) => urlFile.url).join(", ")}]";
    }
    return text;
  }

  void shareTextOnly(String popupTitle, String text) {
    Share.share(
      text,
    );
  }

  Future shareSingleUrlFileAsBytesWithoutText(
      ShareUrlFile urlFile, String popupTitle) async {
    var url = urlFile.url;
    var filename = urlFile.filename;
    // other types too big, for example video
    // todo: improve sharing other media types
    if (isPossibleToShareAsBytes(url)) {
      Uint8List bytes = await loadBytesFromUrl(url!);
      // await Share.file(popupTitle, filename, bytes, mime(url));
    } else {
      shareTextOnly(popupTitle, url!);
    }
  }

  void shareSeveralUrlFilesAsLinksWithText(
      String popupTitle, String? text, List<ShareUrlFile>? urlFiles) {
    // Share.text(
    //   popupTitle,
    //   "$text  [${urlFiles.map((urlFile) => urlFile.url).join(", ")}]",
    //   textMimeType,
    // );
  }

  bool isPossibleToShareAsBytes(String? url) => mime(url)!.contains("image");
}
