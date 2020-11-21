import 'package:fedi/app/ui/dialog/chooser/fedi_selection_chooser_dialog.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/app/ui/form/fedi_form_row_label.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger =
    Logger("form_web_sockets_settings_type_field_form_row_widget.dart");

class FormWebSocketsSettingsTypeFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String description;
  final IFormValueFieldBloc<WebSocketsSettingsType> field;
  final bool enabled;

  FormWebSocketsSettingsTypeFieldFormRowWidget({
    @required this.label,
    this.description,
    @required this.field,
    @required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiTextTheme = IFediUiTextTheme.of(context);
    return StreamBuilder<WebSocketsSettingsType>(
      stream: field.currentValueStream.distinct(),
      initialData: field.currentValue,
      builder: (context, snapshot) {
        var currentValue = snapshot.data;

        _logger.finest(() => "currentValue $currentValue");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                if (enabled) {
                  _showDialog(context, currentValue);
                }
              },
              child: FediFormRow(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FediFormRowLabel(label),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          mapWebSocketsSettingsTypeToLabel(
                              context, currentValue),
                          style: enabled
                              ? fediUiTextTheme.mediumShortDarkGrey
                              : fediUiTextTheme.mediumShortLightGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (description != null) FediFormColumnDesc(description),
          ],
        );
      },
    );
  }

  void _showDialog(BuildContext context, WebSocketsSettingsType currentValue) {
    showFediSelectionChooserDialog(
      context: context,
      title: S.of(context).app_web_sockets_settings_field_type_label,
      actions: [
        buildDialogAction(
          context,
          field,
          WebSocketsSettingsType.disabled,
          currentValue,
        ),
        // buildDialogAction(
        //   context,
        //   field,
        //   WebSocketsSettingsType.onlyForCurrentScreen,
        //   currentValue,
        // ),
        buildDialogAction(
          context,
          field,
          WebSocketsSettingsType.currentScreenAndAllIndicators,
          currentValue,
        ),
      ],
    );
  }

  SelectionDialogAction buildDialogAction(
    BuildContext context,
    IFormValueFieldBloc<WebSocketsSettingsType> field,
    WebSocketsSettingsType type,
    WebSocketsSettingsType currentValue,
  ) {
    return SelectionDialogAction(
      icon: null,
      label: mapWebSocketsSettingsTypeToLabel(context, type),
      onAction: (context) {
        field.changeCurrentValue(type);
        Navigator.of(context).pop();
      },
      isSelected: type == currentValue,
    );
  }
}

String mapWebSocketsSettingsTypeToLabel(
    BuildContext context, WebSocketsSettingsType type) {
  switch (type) {
    case WebSocketsSettingsType.disabled:
      return S.of(context).app_web_sockets_settings_type_disabled;
      break;
    case WebSocketsSettingsType.onlyForCurrentScreen:
      return S.of(context).app_web_sockets_settings_type_onlyForCurrentScreen;
      break;
    case WebSocketsSettingsType.currentScreenAndAllIndicators:
      return S
          .of(context)
          .app_web_sockets_settings_type_currentScreenAndAllIndicators;
      break;
  }

  throw "Unsupported WebSocketsSettingsType $type";
}
