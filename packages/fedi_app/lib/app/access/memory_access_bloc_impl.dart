import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MemoryAccessBloc extends DisposableOwner
    implements IUnifediApiAccessBloc {
  final IConfigService configService;
  final BehaviorSubject<IUnifediApiAccess> accessSubject;

  MemoryAccessBloc({
    required this.configService,
    required IUnifediApiAccess access,
  }) : accessSubject = BehaviorSubject.seeded(
          access,
        ) {
    accessSubject.disposeWith(this);
  }

  @override
  IUnifediApiAccess get access => _processAccessUrl(accessSubject.value);

  @override
  Stream<IUnifediApiAccess> get accessStream => accessSubject.stream.map(
        _processAccessUrl,
      );

  IUnifediApiAccess _processAccessUrl(IUnifediApiAccess access) {
    var isActualInstanceUrlExist = configService.isActualInstanceUrlExist;
    IUnifediApiAccess result;
    if (isActualInstanceUrlExist) {
      var url = access.url;
      var urlOnInstanceForRequest =
          configService.processUrlOnInstanceForRequest(urlOnInstance: url);

      result = access.toUnifediApiAccess().copyWith(
            url: urlOnInstanceForRequest,
          );
    } else {
      result = access;
    }

    return result;
  }

  void changeAccess(IUnifediApiAccess access) {
    accessSubject.add(access);
  }
}
