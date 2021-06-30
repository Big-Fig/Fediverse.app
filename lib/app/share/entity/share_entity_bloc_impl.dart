import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';

class ShareEntityBloc extends DisposableOwner implements IShareEntityBloc {
  @override
  final ShareEntity shareEntity;

  ShareEntityBloc({
    required this.shareEntity,
  }) {
    addCustomDisposable(
      () => shareEntity.allMediaLocalFiles.forEach(
        (localFile) {
          if (localFile.isNeedDeleteAfterUsage) {
            localFile.file.delete();
          }
        },
      ),
    );
  }
}
