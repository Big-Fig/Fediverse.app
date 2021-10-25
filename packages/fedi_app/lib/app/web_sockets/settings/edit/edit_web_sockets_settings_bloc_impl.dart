import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc.dart';
import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi_app/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class EditWebSocketsSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<WebSocketsSettings>
    implements IEditWebSocketsSettingsBloc {
  final IWebSocketsSettingsBloc webSocketsSettingsBloc;

  @override
  // ignore: avoid-late-keyword
  late WebSocketsModeSingleFromListValueFormFieldBloc typeFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        typeFieldBloc,
      ];

  EditWebSocketsSettingsBloc({
    required this.webSocketsSettingsBloc,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: webSocketsSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    typeFieldBloc = WebSocketsModeSingleFromListValueFormFieldBloc(
      originValue: currentSettings.type,
      isEnabled: isEnabled,
    );
    addDisposable(typeFieldBloc);
    onFormItemsChanged();
  }

  @override
  WebSocketsSettings calculateCurrentFormFieldsSettings() =>
      WebSocketsSettings.fromEnum(
        handlingType: typeFieldBloc.currentValue,
      );

  @override
  Future<void> fillSettingsToFormFields(WebSocketsSettings settings) async {
    typeFieldBloc.changeCurrentValue(
      settings.type,
    );
  }
}
