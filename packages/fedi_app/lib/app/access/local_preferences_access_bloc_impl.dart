import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/access/local_preferences/access_local_preference_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalPreferencesAccessBloc extends DisposableOwner
    implements IUnifediApiAccessBloc {
  final IAccessLocalPreferenceBloc accessLocalPreferenceBloc;

  LocalPreferencesAccessBloc({
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
