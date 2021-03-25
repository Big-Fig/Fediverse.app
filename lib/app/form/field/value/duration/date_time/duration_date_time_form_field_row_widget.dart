import 'package:fedi/app/duration/picker/date_time_duration_picker.dart';
import 'package:fedi/app/form/field/value/duration/duration_value_form_field_row_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// todo: refactor to use common widgets with  DurationValueFormFieldRowWidget
class DurationDateTimeValueFormFieldRowWidget extends StatelessWidget {
  final String label;
  final String? description;
  final String? descriptionOnDisabled;
  final String? negativeValue;

  DurationDateTimeValueFormFieldRowWidget({
    required this.label,
    this.description,
    this.descriptionOnDisabled,
    this.negativeValue,
  });

  @override
  Widget build(BuildContext context) =>
      DurationDateTimeValueFormFieldBlocProxyProvider(
        child: SimpleFediFormFieldRow(
          label: label,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          valueChild: _DurationDateTimeValueFormFieldRowValueWidget(
            popupTitle: label,
            negativeValue: negativeValue,
          ),
        ),
      );
}

class _DurationDateTimeValueFormFieldRowValueWidget extends StatelessWidget {
  final String popupTitle;
  final String? negativeValue;

  const _DurationDateTimeValueFormFieldRowValueWidget({
    Key? key,
    required this.popupTitle,
    required this.negativeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationDateTimeValueFormFieldBloc.of(context);

    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () {
                if (isEnabled!) {
                  _showDurationPicker(
                    popupTitle: popupTitle,
                    context: context,
                  );
                }
              },
              child: DurationDateTimeValueFormFieldRowValueTextWidget(
                negativeValue: negativeValue,
              ),
            ),
            const FediSmallHorizontalSpacer(),
          ],
        );
      },
    );
  }
}

class DurationDateTimeValueFormFieldRowValueTextWidget extends StatelessWidget {
  final String? negativeValue;

  const DurationDateTimeValueFormFieldRowValueTextWidget({
    required this.negativeValue,
  });

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationDateTimeValueFormFieldBloc.of(context);

    var fediUiTextTheme = IFediUiTextTheme.of(context);
    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;
        return StreamBuilder<Duration?>(
          stream: fieldBloc.currentValueDurationStream,
          initialData: fieldBloc.currentValueDuration,
          builder: (context, snapshot) {
            var currentValue = snapshot.data;

            String? durationText;
            if (currentValue == null) {
              durationText = S.of(context).app_duration_value_null;
            } else {
              if (negativeValue != null && currentValue.isNegative) {
                durationText = negativeValue;
              } else {
                durationText = formatDuration(
                  context: context,
                  duration: currentValue,
                );
              }
            }
            return Text(
              durationText!,
              style: isEnabled!
                  ? fediUiTextTheme.bigTallBoldMediumGrey
                  : fediUiTextTheme.bigTallBoldLightGrey,
            );
          },
        );
      },
    );
  }
}

class DurationDateTimeValueFormFieldRowIconButtonWidget
    extends StatelessWidget {
  final String popupTitle;

  const DurationDateTimeValueFormFieldRowIconButtonWidget({
    required this.popupTitle,
  });

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationDateTimeValueFormFieldBloc.of(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return StreamBuilder<bool?>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data!;
        return FediIconButton(
          icon: Icon(FediIcons.chevron_down),
          color: isEnabled
              ? fediUiColorTheme.darkGrey
              : fediUiColorTheme.lightGrey,
          onPressed: isEnabled
              ? () {
                  _showDurationPicker(
                    popupTitle: popupTitle,
                    context: context,
                  );
                }
              : null,
        );
      },
    );
  }
}

void _showDurationPicker({
  required BuildContext context,
  required String popupTitle,
}) async {
  var fieldBloc =
      IDurationDateTimeValueFormFieldBloc.of(context, listen: false);

  var durationPickerResult = await showDateTimeDurationPicker(
    context: context,
    popupTitle: popupTitle,
    minDuration: fieldBloc.minDuration,
    currentDuration: fieldBloc.currentValueDuration,
    maxDuration: fieldBloc.maxDuration,
    isDeletePossible: fieldBloc.isNullValuePossible,
  );

  if (durationPickerResult.deleted) {
    fieldBloc.deleteValue();
  } else {
    if (durationPickerResult.duration != null) {
      fieldBloc.changeCurrentValueDuration(durationPickerResult.duration);
    }
  }
}
