import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class ToastHandlingTypeSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  const ToastHandlingTypeSingleFromListValueFormFieldRowWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ToastHandlingTypeSingleSelectFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<ToastHandlingType>(
          label: S.of(context).app_toast_settings_field_handling_type_label,
          valueTitleMapper: (context, value) =>
              mapToastHandlingTypeToLabel(context, value!),
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );
}

String mapToastHandlingTypeToLabel(
  BuildContext context,
  ToastHandlingType type,
) {
  switch (type) {
    case ToastHandlingType.never:
      return S.of(context).app_toast_handling_type_never;
    case ToastHandlingType.always:
      return S.of(context).app_toast_handling_type_always;
    case ToastHandlingType.onlyWhenInstanceNotSelected:
      return S.of(context).app_toast_handling_type_onlyWhenInstanceNotSelected;
    case ToastHandlingType.onlyWhenInstanceSelected:
      return S.of(context).app_toast_handling_type_onlyWhenInstanceSelected;
  }
}
