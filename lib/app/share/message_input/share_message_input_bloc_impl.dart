import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';

class ShareMessageInputBloc extends DisposableOwner
    implements IShareMessageInputBloc {
  @override
  final IStringValueFormFieldBloc messageField;

  ShareMessageInputBloc()
      : messageField = StringValueFormFieldBloc(
          validators: [],
          originValue: "",
          maxLength: null,
        ) {
    addDisposable(disposable: messageField);
  }
}
