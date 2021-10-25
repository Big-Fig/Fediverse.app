import 'package:fedi_app/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

class WebSocketsModeSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<WebSocketsMode>
    implements IWebSocketsModeSingleFromListValueFormFieldBloc {
  @override
  final List<WebSocketsMode> possibleValues;

  WebSocketsModeSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = false,
    this.possibleValues = WebSocketsMode.values,
    required WebSocketsMode originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<WebSocketsMode>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
