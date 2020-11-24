import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DurationValueFormFieldRowWidget extends StatelessWidget {
  final String label;
  final String description;
  final String descriptionOnDisabled;

  DurationValueFormFieldRowWidget({
    @required this.label,
    this.description,
    this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) => DurationValueFormFieldBlocProxyProvider(
        child: SimpleFediFormFieldRow(
          label: label,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          valueChild: _DurationValueFormFieldRowValueWidget(
            popupTitle: label,
          ),
        ),
      );
}

class _DurationValueFormFieldRowValueWidget extends StatelessWidget {
  final String popupTitle;

  const _DurationValueFormFieldRowValueWidget({
    Key key,
    @required this.popupTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationValueFormFieldBloc.of(context);

    var fediUiTextTheme = IFediUiTextTheme.of(context);
    var fediUiColorTheme = IFediUiColorTheme.of(context);

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
                if (isEnabled) {
                  showDatePicker(
                    context: context,
                    popupTitle: popupTitle,
                  );
                }
              },
              child: Text(
                formatDuration(
                  context: context,
                  duration: fieldBloc.currentValue,
                ),
                style: isEnabled
                    ? fediUiTextTheme.bigTallBoldMediumGrey
                    : fediUiTextTheme.bigTallBoldLightGrey,
              ),
            ),
            const FediSmallHorizontalSpacer(),
            FediIconButton(
              icon: Icon(FediIcons.chevron_down),
              color: isEnabled
                  ? fediUiColorTheme.darkGrey
                  : fediUiColorTheme.lightGrey,
              onPressed: isEnabled
                  ? () {
                      showDatePicker(
                        context: context,
                        popupTitle: popupTitle,
                      );
                    }
                  : null,
            )
          ],
        );
      },
    );
  }

  Future showDatePicker({
    @required BuildContext context,
    @required String popupTitle,
  }) async {
    var fieldBloc = IDurationValueFormFieldBloc.of(context);
    var minDuration = fieldBloc.minDuration;
    var maxDuration = fieldBloc.maxDuration;

    var now = DateTime.now();
    var dateTime = await FediDatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minDateTime: minDuration != null ? now.add(minDuration) : null,
      maxDateTime: maxDuration != null ? now.add(maxDuration) : null,
      currentDateTime: now.add(fieldBloc.currentValue ?? now),
      theme: FediDatePickerTheme.byDefault(
        context: context,
        customTitle: popupTitle,
      ),
      onCancel: () {},
      onConfirm: (date) {},
    );

    if (dateTime != null) {
      var diffDuration = dateTime.difference(now).abs();

      if ((maxDuration == null || diffDuration < maxDuration) &&
          (minDuration == null || diffDuration > minDuration)) {
        fieldBloc.changeCurrentValue(diffDuration);
      } else {
        fieldBloc.changeCurrentValue(minDuration);
      }
    }
  }

  String formatDuration({
    @required BuildContext context,
    @required Duration duration,
  }) {
    var inDays = duration.inDays;

    if (inDays > 0) {
      return S.of(context).duration_day(inDays);
    } else {
      var inHours = duration.inHours;

      if (inHours > 0) {
        return S.of(context).duration_day(inHours);
      } else {
        var inMinutes = duration.inMinutes;

        if (inMinutes == 0) {
          inMinutes = 1;
        }
        return S.of(context).duration_day(inMinutes);
      }
    }
  }
}
