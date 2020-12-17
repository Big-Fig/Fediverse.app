import 'package:fedi/app/duration/picker/date_time_duration_picker.dart';
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
  final String description;
  final String descriptionOnDisabled;

  DurationDateTimeValueFormFieldRowWidget({
    @required this.label,
    this.description,
    this.descriptionOnDisabled,
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
          ),
        ),
      );
}

class _DurationDateTimeValueFormFieldRowValueWidget extends StatelessWidget {
  final String popupTitle;

  const _DurationDateTimeValueFormFieldRowValueWidget({
    Key key,
    @required this.popupTitle,
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
                if (isEnabled) {
                  _showDurationPicker(
                    popupTitle: popupTitle,
                    context: context,
                  );
                }
              },
              child: const DurationDateTimeValueFormFieldRowValueTextWidget(),
            ),
            const FediSmallHorizontalSpacer(),
          ],
        );
      },
    );
  }
}

class DurationDateTimeValueFormFieldRowValueTextWidget extends StatelessWidget {
  const DurationDateTimeValueFormFieldRowValueTextWidget();

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationDateTimeValueFormFieldBloc.of(context);

    var fediUiTextTheme = IFediUiTextTheme.of(context);
    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;
        return StreamBuilder<Duration>(
          stream: fieldBloc.currentValueDurationStream,
          initialData: fieldBloc.currentValueDuration,
          builder: (context, snapshot) {
            var currentValue = snapshot.data;
            return Text(
              currentValue != null
                  ? formatDuration(
                      context: context,
                      duration: currentValue,
                    )
                  : S.of(context).app_duration_value_null,
              style: isEnabled
                  ? fediUiTextTheme.bigTallBoldMediumGrey
                  : fediUiTextTheme.bigTallBoldLightGrey,
            );
          },
        );
      },
    );
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
      return S.of(context).duration_hour(inHours);
    } else {
      var inMinutes = duration.inMinutes;

      if (inMinutes == 0) {
        inMinutes = 1;
      }
      return S.of(context).duration_minute(inMinutes);
    }
  }
}

class DurationDateTimeValueFormFieldRowIconButtonWidget
    extends StatelessWidget {
  final String popupTitle;

  const DurationDateTimeValueFormFieldRowIconButtonWidget({
    @required this.popupTitle,
  });

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationDateTimeValueFormFieldBloc.of(context);

    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data;
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
  @required BuildContext context,
  @required String popupTitle,
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
