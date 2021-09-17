import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/cupertino.dart';

class WebSocketsModeSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      WebSocketsModeSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<WebSocketsMode>(
          label: S.of(context).app_web_sockets_settings_field_type_label,
          valueTitleMapper: (context, value) =>
              mapWebSocketsModeToLabel(context, value!),
          description:
              S.of(context).app_web_sockets_settings_field_type_description,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );

  const WebSocketsModeSingleFromListValueFormFieldRowWidget();
}

String mapWebSocketsModeToLabel(
  BuildContext context,
  WebSocketsMode mode,
) => mode.map(
    disabled: (_) => S.of(context).app_web_sockets_settings_type_disabled,
    onlyForeground: (_) =>
        S.of(context).app_web_sockets_settings_type_onlyForeground,
    foregroundAndBackground: (_) =>
        S.of(context).app_web_sockets_settings_type_foregroundAndBackground,
  );
