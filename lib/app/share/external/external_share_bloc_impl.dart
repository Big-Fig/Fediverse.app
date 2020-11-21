import 'package:fedi/app/share/external/external_share_bloc.dart';
import 'package:fedi/app/share/external/external_share_service.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc_impl.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:moor_flutter/moor_flutter.dart';

abstract class ExternalShareBloc extends DisposableOwner
    implements IExternalShareBloc {
  final IExternalShareService externalShareService;

  @override
  IBoolValueFormFieldBloc asLinkBoolField = BoolValueFormFieldBloc(originValue: false);

  String get message {
    var message = shareMessageInputBloc.messageField.currentValue;

    if (message?.isNotEmpty != true) {
      message = null;
    }

    return message;
  }

  @override
  IShareMessageInputBloc shareMessageInputBloc = ShareMessageInputBloc();

  ExternalShareBloc({
    @required this.externalShareService,
  }) {
    addDisposable(disposable: shareMessageInputBloc);
    addDisposable(disposable: asLinkBoolField);
  }
}
