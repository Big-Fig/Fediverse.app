import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsOnlyInCustomListFormFieldBloc
    implements IValueFormFieldBloc<IPleromaList?> {
  static ITimelineSettingsOnlyInCustomListFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ITimelineSettingsOnlyInCustomListFormFieldBloc>(
        context,
        listen: listen,
      );
}
