import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditWebSocketsSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<WebSocketsSettings>
    implements IEditWebSocketsSettingsBloc {
  final IWebSocketsSettingsBloc webSocketsSettingsBloc;

  @override
  WebSocketsHandlingTypeSingleFromListValueFormFieldBloc typeFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        typeFieldBloc,
      ];

  EditWebSocketsSettingsBloc({
    @required this.webSocketsSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool isEnabled,
  }) : super(
            globalOrInstanceSettingsBloc: webSocketsSettingsBloc,
            globalOrInstanceSettingsType: globalOrInstanceSettingsType,
            isEnabled: isEnabled,
            isAllItemsInitialized: false) {
    typeFieldBloc = WebSocketsHandlingTypeSingleFromListValueFormFieldBloc(
      originValue: currentSettings.type,
      isEnabled: isEnabled,
    );
    addDisposable(disposable: typeFieldBloc);
    onItemsChanged();
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
