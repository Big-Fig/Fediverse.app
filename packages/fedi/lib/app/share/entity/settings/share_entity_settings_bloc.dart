import 'package:fedi/app/share/entity/settings/share_entity_settings_model.dart';
import 'package:fedi/app/share/entity/share_entity_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IShareEntitySettingsBloc implements IFormBloc {
  static IShareEntitySettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IShareEntitySettingsBloc>(context, listen: listen);

  ShareEntity get shareEntity;

  ShareEntitySettings get shareEntitySettings;

  Stream<ShareEntitySettings> get shareEntitySettingsStream;

  IBoolValueFormFieldBloc<bool> get appendFromAccountBoolField;

  IBoolValueFormFieldBloc<bool> get withCreatedAtBoolField;

  IBoolValueFormFieldBloc<bool> get withMediaBoolField;

  IBoolValueFormFieldBloc<bool> get withTextBoolField;

  IBoolValueFormFieldBloc<bool> get withLinkBoolField;

  IBoolValueFormFieldBloc<bool> get wholeAsLinkBoolField;

  IBoolValueFormFieldBloc<bool> get mediaAsLinkBoolField;

  IStringValueFormFieldBloc get withMessageStringField;
}
