import 'package:easy_dispose/easy_dispose.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MemoryAccessBloc extends DisposableOwner
    implements IUnifediApiAccessBloc {
  final BehaviorSubject<IUnifediApiAccess> accessSubject;

  MemoryAccessBloc({
    required IUnifediApiAccess access,
  }) : accessSubject = BehaviorSubject.seeded(
          access,
        ) {
    accessSubject.disposeWith(this);
  }

  @override
  IUnifediApiAccess get access => accessSubject.value;

  @override
  Stream<IUnifediApiAccess> get accessStream => accessSubject.stream;

  void changeAccess(IUnifediApiAccess access) {
    accessSubject.add(access);
  }
}
