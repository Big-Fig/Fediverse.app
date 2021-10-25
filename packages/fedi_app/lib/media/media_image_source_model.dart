import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_image_source_model.freezed.dart';

@freezed
class MediaImageSource with _$MediaImageSource {
  @Assert(
    "!(file != null && url != null), 'Cant use file and url in same "
    "time',",
  )
  @Assert(
    " !(file == null && url == null), 'At least one element (file or "
    "url) should be specified',",
  )
  const factory MediaImageSource({
    File? file,
    String? url,
  }) = _MediaImageSource;
}
