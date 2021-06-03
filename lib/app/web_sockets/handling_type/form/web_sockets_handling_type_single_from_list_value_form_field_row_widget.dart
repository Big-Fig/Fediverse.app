import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:flutter/cupertino.dart';

class WebSocketsHandlingTypeSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      WebSocketsHandlingTypeSingleFromListValueFormFieldBlocProxyProvider(
        child:
            SingleSelectFromListValueFormFieldRowWidget<WebSocketsHandlingType>(
          label: S.of(context).app_web_sockets_settings_field_type_label,
          valueTitleMapper: (context, value) =>
              mapWebSocketsHandlingTypeToLabel(context, value!),
          description:
              S.of(context).app_web_sockets_settings_field_type_description,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );

  const WebSocketsHandlingTypeSingleFromListValueFormFieldRowWidget();
}

String mapWebSocketsHandlingTypeToLabel(
  BuildContext context,
  WebSocketsHandlingType type,
) {
  switch (type) {
    case WebSocketsHandlingType.disabled:
      return S.of(context).app_web_sockets_settings_type_disabled;
    case WebSocketsHandlingType.onlyForeground:
      return S.of(context).app_web_sockets_settings_type_onlyForeground;
    case WebSocketsHandlingType.foregroundAndBackground:
      return S
          .of(context)
          .app_web_sockets_settings_type_foregroundAndBackground;
  }
}
