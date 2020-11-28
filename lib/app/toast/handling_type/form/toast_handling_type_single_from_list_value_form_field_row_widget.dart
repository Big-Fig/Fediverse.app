import 'package:fedi/app/form/field/value/single_from_list/single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class ToastHandlingTypeSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ToastHandlingTypeSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleFromListValueFormFieldRowWidget<ToastHandlingType>(
          label: S.of(context).app_toast_settings_field_handling_type_label,
          valueTitleMapper: (context, value) =>
              mapToastHandlingTypeToLabel(context, value),
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );

  const ToastHandlingTypeSingleFromListValueFormFieldRowWidget();
}

String mapToastHandlingTypeToLabel(
    BuildContext context, ToastHandlingType type) {
  switch (type) {
    case ToastHandlingType.always:
      return S.of(context).app_toast_handling_type_always;
      break;
    case ToastHandlingType.onlyWhenInstanceNotSelected:
      return S.of(context).app_toast_handling_type_onlyWhenInstanceNotSelected;
      break;
    case ToastHandlingType.onlyWhenInstanceSelected:
      return S.of(context).app_toast_handling_type_onlyWhenInstanceSelected;
      break;
  }

  throw "Unsupported ToastHandlingType $type";
}
