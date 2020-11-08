import 'package:fedi/app/media/file/path/media_file_path_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path_lib;

class MediaFilePathBloc extends DisposableOwner implements IMediaFilePathBloc {
  @override
  final String path;
  @override
  final String name;
  @override
  final String extension;

  MediaFilePathBloc({
    @required this.path,
  })  : extension = path?.isNotEmpty == true ? path_lib.extension(path) : "",
        name = path?.isNotEmpty == true ? path_lib.basename(path) : "";
}
