import 'dart:io';

import 'package:fedi_app/file/temp/temp_file_model.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

final _logger = Logger('temp_file_helper.dart');

var _pathPosix = path.posix;

class TempFileHelper {
  static Future<Directory> getTemporaryDirectory() =>
      path_provider.getTemporaryDirectory();

  static Future<Directory> createUniqueTemporaryDirectory() async {
    var temporaryDirectory = await getTemporaryDirectory();

    var dateTime = DateTime.now();

    var millisecondsSinceEpoch = dateTime.millisecondsSinceEpoch;

    var uniqueDirectory = Directory(
      _pathPosix.join(
        temporaryDirectory.path,
        millisecondsSinceEpoch.toString(),
      ),
    );

    // ignore: avoid-ignoring-return-values
    await uniqueDirectory.create();

    return uniqueDirectory;
  }

  static Future<List<File>> downloadFilesToTempFolder({
    required List<DownloadTempFileRequest> requests,
  }) async {
    var futures = requests
        .map(
          (request) => TempFileHelper.downloadFileToTempFolder(
            request: request,
          ),
        )
        .toList();

    var files = await Future.wait(futures);

    return files;
  }

  static Future<File> downloadFileToTempFolder({
    required DownloadTempFileRequest request,
  }) async {
    var url = request.url;
    var filename = request.filenameWithExtension;

    // todo: auth header?
    HttpClientRequest? httpRequest;
    try {
      httpRequest = await HttpClient().getUrl(Uri.parse(url));
      var response = await httpRequest.close();
      var bytes = await consolidateHttpClientResponseBytes(response);

      var directory = await createUniqueTemporaryDirectory();
      var file = File(
        _pathPosix.join(
          directory.absolute.path,
          filename,
        ),
      );

      // ignore: avoid-ignoring-return-values
      await file.writeAsBytes(bytes);

      return file;
      // ignore: avoid_catches_without_on_clauses
    } catch (e, stackTrace) {
      _logger.warning(
        () => 'error during downloadFileToTempFolder',
        e,
        stackTrace,
      );
      // ignore: avoid-ignoring-return-values
      await httpRequest?.close();
      rethrow;
    }
  }
}
