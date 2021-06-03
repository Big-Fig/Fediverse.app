import 'package:fedi/app/settings/settings_bloc.dart';
import 'package:fedi/app/settings/settings_model.dart';

abstract class IInstanceSettingsBloc<T extends ISettings?>
    implements ISettingsBloc<T> {}
