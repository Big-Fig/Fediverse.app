import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi/ui/form/field/value/duration/form_duration_field_bloc.dart';
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
                    style: FediTextStyles.bigTallMediumGrey,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showDatePicker(context);
                        },
                        child: Text(
                          formatDuration(field.currentValue),
                          style: FediTextStyles.bigTallBoldMediumGrey,
                        ),
                      ),
                      const FediSmallHorizontalSpacer(),
                      FediIconButton(
                        icon: Icon(FediIcons.chevron_down),
                        color: FediColors.darkGrey,
                        onPressed: () {
                          showDatePicker(context);
                        },
                      )
                    ],
                  ),
                ],
              ),
              if (desc != null) Text(desc),
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
      theme: FediDatePickerTheme.byDefault(customTitle: popupTitle),
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

  String formatDuration(Duration duration) {
    var inDays = duration.inDays;

    if (inDays > 0) {
      return "duration.day".plural(inDays);
    } else {
      var inHours = duration.inHours;

      if (inHours > 0) {
        return "duration.hour".plural(inHours);
      } else {
        var inMinutes = duration.inMinutes;

        if (inMinutes == 0) {
          inMinutes = 1;
        }

        return "duration.minute".plural(inMinutes);
      }
    }
  }
}
