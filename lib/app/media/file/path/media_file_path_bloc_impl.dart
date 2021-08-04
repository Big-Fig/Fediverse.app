import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/media/file/path/media_file_path_bloc.dart';
import 'package:path/path.dart' as path_lib;

class MediaFilePathBloc extends DisposableOwner implements IMediaFilePathBloc {
  @override
  final String? path;
  @override
  final String name;
  @override
  final String extension;

  MediaFilePathBloc({
    required this.path,
    String? customName,
  })  : extension = path?.isNotEmpty == true ? path_lib.extension(path!) : '',
        name = customName?.isNotEmpty == true
            ? customName!
            : path?.isNotEmpty == true
                ? path_lib.basename(path!)
                : '';
}
