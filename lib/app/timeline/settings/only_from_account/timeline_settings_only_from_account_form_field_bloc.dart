import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class ITimelineSettingsOnlyFromAccountFormFieldBloc
    implements IValueFormFieldBloc<IUnifediApiAccount?> {
  static ITimelineSettingsOnlyFromAccountFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ITimelineSettingsOnlyFromAccountFormFieldBloc>(
        context,
        listen: listen,
      );
}
