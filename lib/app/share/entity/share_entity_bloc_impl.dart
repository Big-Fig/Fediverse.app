import 'package:fedi/app/share/entity/share_entity_bloc.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';

class ShareEntityBloc extends DisposableOwner implements IShareEntityBloc {
  @override
  final ShareEntity shareEntity;

  ShareEntityBloc({
    required this.shareEntity,
  }) {
    addDisposable(
      custom: () {
        shareEntity.allMediaLocalFiles.forEach(
          (localFile) {
            if (localFile.isNeedDeleteAfterUsage) {
              localFile.file.delete();
            }
          },
        );
      },
    );
  }
}
