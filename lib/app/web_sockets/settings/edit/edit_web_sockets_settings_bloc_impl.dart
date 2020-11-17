import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditWebSocketsSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditWebSocketsSettingsBloc {
  final IWebSocketsSettingsBloc webSocketsSettingsBloc;

  @override
  final IFormValueFieldBloc<WebSocketsSettingsType> typeFieldBloc;

  EditWebSocketsSettingsBloc({
    @required this.webSocketsSettingsBloc,
  })  : typeFieldBloc = FormValueFieldBloc<WebSocketsSettingsType>(
          originValue: webSocketsSettingsBloc.type,
          validators: [],
          isEnabled: webSocketsSettingsBloc.isInstanceOrForceGlobal,
          isEnabledStream: webSocketsSettingsBloc.isInstanceOrForceGlobalStream,
        ),
        super(webSocketsSettingsBloc) {
    _subscribeForType();
  }

  void _subscribeForType() {
    addDisposable(
      streamSubscription: webSocketsSettingsBloc.typeStream.distinct().listen(
        (newValue) {
          typeFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: typeFieldBloc.currentValueStream.listen(
        (value) {
          webSocketsSettingsBloc.changeType(value);
        },
      ),
    );
  }
}
