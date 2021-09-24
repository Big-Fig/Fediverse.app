import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/access/local_preferences/auth_instance_local_preference_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalPreferencesUnifediApiAccessBloc extends DisposableOwner
    implements IUnifediApiAccessBloc {
  final IUnifediApiAccessLocalPreferenceBloc accessLocalPreferenceBloc;

  LocalPreferencesUnifediApiAccessBloc({
    required this.accessLocalPreferenceBloc,
  });

  @override
  IUnifediApiAccess get access => accessLocalPreferenceBloc.value!;

  @override
  Stream<IUnifediApiAccess> get accessStream =>
      accessLocalPreferenceBloc.stream.map(
        (e) => e!,
      );
}
