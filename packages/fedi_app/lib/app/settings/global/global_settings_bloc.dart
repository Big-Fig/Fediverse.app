import 'package:fedi_app/app/settings/settings_bloc.dart';
import 'package:fedi_app/app/settings/settings_model.dart';

abstract class IGlobalSettingsBloc<T extends ISettings<dynamic>?>
    implements ISettingsBloc<T> {}
