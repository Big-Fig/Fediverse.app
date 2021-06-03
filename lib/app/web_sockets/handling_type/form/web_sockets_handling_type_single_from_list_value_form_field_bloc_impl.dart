import 'package:fedi/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

class WebSocketsHandlingTypeSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<WebSocketsHandlingType>
    implements IWebSocketsHandlingTypeSingleFromListValueFormFieldBloc {
  @override
  final List<WebSocketsHandlingType> possibleValues;

  WebSocketsHandlingTypeSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = false,
    this.possibleValues = WebSocketsHandlingType.values,
    required WebSocketsHandlingType originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<WebSocketsHandlingType>> validators =
        const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
