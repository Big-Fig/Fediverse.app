import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/form/fedi_form_column_desc.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/form/field/value/duration/form_duration_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("form_duration_field_form_row_widget.dart");

class FormDurationFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String desc;
  final IFormDurationFieldBloc field;

  final String popupTitle;

  FormDurationFieldFormRowWidget({
    @required this.label,
    @required this.popupTitle,
    this.desc,
    @required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
        stream: field.currentValueStream.distinct(),
        initialData: field.currentValue,
        builder: (context, snapshot) {
          var currentValue = snapshot.data;
          _logger.finest(() => "currentValue $currentValue");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    label,
                    style: IFediUiTextTheme.of(context).bigTallMediumGrey,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showDatePicker(context);
                        },
                        child: Text(
                          formatDuration(
                            context: context,
                            duration: field.currentValue,
                          ),
                          style: IFediUiTextTheme.of(context)
                              .bigTallBoldMediumGrey,
                        ),
                      ),
                      const FediSmallHorizontalSpacer(),
                      FediIconButton(
                        icon: Icon(FediIcons.chevron_down),
                        color: IFediUiColorTheme.of(context).darkGrey,
                        onPressed: () {
                          showDatePicker(context);
                        },
                      )
                    ],
                  ),
                ],
              ),
              if (desc != null) FediFormColumnDesc(desc),
            ],
          );
        });
  }

  Future showDatePicker(BuildContext context) async {
    var minDuration = field.minDuration;
    var maxDuration = field.maxDuration;

    var now = DateTime.now();
    var dateTime = await FediDatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minDateTime: minDuration != null ? now.add(minDuration) : null,
      maxDateTime: maxDuration != null ? now.add(maxDuration) : null,
      currentDateTime: now.add(field.currentValue ?? now),
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
        field.changeCurrentValue(diffDuration);
      } else {
        field.changeCurrentValue(minDuration);
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
