import 'package:fedi/app/share/entity/settings/share_entity_settings_bloc.dart';
import 'package:fedi/app/share/entity/settings/share_entity_settings_model.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';

class ShareEntitySettingsBloc extends DisposableOwner
    implements IShareEntitySettingsBloc {
  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IShareEntitySettingsBloc>(
      create: (context) => createFromContext(
        context,
      ),
      child: child,
    );
  }

  static ShareEntitySettingsBloc createFromContext(BuildContext context) =>
      ShareEntitySettingsBloc();

  @override
  // TODO: implement asLinkBoolField
  IBoolValueFormFieldBloc<bool?> get asLinkBoolField => throw UnimplementedError();

  @override
  // TODO: implement shareEntitySettings
  ShareEntitySettings get shareEntitySettings => throw UnimplementedError();

  @override
  // TODO: implement shareMessageInputBloc
  IShareMessageInputBloc get shareMessageInputBloc => throw UnimplementedError();
}
