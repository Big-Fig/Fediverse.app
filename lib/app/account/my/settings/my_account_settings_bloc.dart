import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountSettingsBloc extends Disposable {
  static IMyAccountSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMyAccountSettingsBloc>(context, listen: listen);

  FormBoolFieldBloc get isRealtimeWebSocketsEnabledFieldBloc;

  FormBoolFieldBloc get isNewChatsEnabledFieldBloc;
}
