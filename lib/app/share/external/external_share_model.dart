import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as path;

part 'external_share_model.freezed.dart';

@freezed
class ShareUrlFile with _$ShareUrlFile {
  const factory ShareUrlFile({
    required String url,
    required String filenameWithExtension,
  }) = _ShareUrlFile;

  static ShareUrlFile fromUrl({
    required String url,
  }) =>
      ShareUrlFile(
        url: url,
        filenameWithExtension: path.basename(url),
      );
}
