import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/form/field/value/string/form_string_field_bloc_impl.dart';

class ShareMessageInputBloc extends DisposableOwner
    implements IShareMessageInputBloc {
  @override
  final IFormStringFieldBloc messageField;

  ShareMessageInputBloc()
      : messageField = FormStringFieldBloc(
          validators: [],
          originValue: null,
          maxLength: null,
        ) {
    addDisposable(disposable: messageField);
  }
}
