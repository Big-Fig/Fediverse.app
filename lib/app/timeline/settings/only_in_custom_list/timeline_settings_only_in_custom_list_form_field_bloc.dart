import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsOnlyInCustomListFormFieldBloc
    implements IValueFormFieldBloc<IPleromaApiList?> {
  static ITimelineSettingsOnlyInCustomListFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ITimelineSettingsOnlyInCustomListFormFieldBloc>(
        context,
        listen: listen,
      );
}
