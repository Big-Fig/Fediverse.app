import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/local_preferences/access_local_preference_bloc.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalPreferencesAccessBloc extends DisposableOwner
    implements IUnifediApiAccessBloc {
  final IAccessLocalPreferenceBloc accessLocalPreferenceBloc;
  final IConfigService configService;

  LocalPreferencesAccessBloc({
    required this.configService,
    required this.accessLocalPreferenceBloc,
  });

  @override
  IUnifediApiAccess get access =>
      _processAccessUrl(accessLocalPreferenceBloc.value!);

  @override
  Stream<IUnifediApiAccess> get accessStream =>
      accessLocalPreferenceBloc.stream.map(
        (access) => _processAccessUrl(access!),
      );

  IUnifediApiAccess _processAccessUrl(IUnifediApiAccess access) {
    if (configService.isActualInstanceUrlExist) {
      var url = access.url;
      var urlOnInstanceForRequest =
          configService.processUrlOnInstanceForRequest(urlOnInstance: url);

      return access.toUnifediApiAccess().copyWith(
            url: urlOnInstanceForRequest,
          );
    } else {
      return access;
    }
  }
}
