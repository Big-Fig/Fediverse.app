import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class FormBoolFieldBloc extends FormValueFieldBloc<bool>
    implements IFormBoolFieldBloc {
  FormBoolFieldBloc({
    @required bool originValue,
    bool isEnabled = true,
    Stream<bool> isEnabledStream = const Stream.empty(),
  }) : super(
          originValue: originValue,
          validators: [],
          isEnabled: isEnabled,
          isEnabledStream: isEnabledStream,
        );
}
