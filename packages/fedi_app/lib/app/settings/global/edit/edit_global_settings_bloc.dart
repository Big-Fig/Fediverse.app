import 'package:fedi_app/app/settings/edit_settings_bloc.dart';
import 'package:fedi_app/app/settings/settings_model.dart';

abstract class IEditGlobalSettingsBloc<T extends ISettings<dynamic>?>
    implements IEditSettingsBloc<T> {}
