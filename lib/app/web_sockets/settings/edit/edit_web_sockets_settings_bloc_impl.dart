import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditWebSocketsSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<WebSocketsSettings>
    implements IEditWebSocketsSettingsBloc {
  final IWebSocketsSettingsBloc webSocketsSettingsBloc;

  @override
  final IFormValueFieldBloc<WebSocketsSettingsType> typeFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        typeFieldBloc,
      ];

  EditWebSocketsSettingsBloc({
    @required this.webSocketsSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool enabled,
  })  : typeFieldBloc = FormValueFieldBloc<WebSocketsSettingsType>(
          originValue: webSocketsSettingsBloc.type,
          validators: [],
        ),
        super(
          globalOrInstanceSettingsBloc: webSocketsSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          enabled: enabled,
        ) {
    addDisposable(disposable: typeFieldBloc);
  }

  @override
  WebSocketsSettings calculateCurrentFormFieldsSettings() => WebSocketsSettings(
        typeString: typeFieldBloc.currentValue.toJsonValue(),
      );

  @override
  Future fillSettingsToFormFields(WebSocketsSettings settings) async {
    typeFieldBloc.changeCurrentValue(
      settings.type,
    );
  }
}
