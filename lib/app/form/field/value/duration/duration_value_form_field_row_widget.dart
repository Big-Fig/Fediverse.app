import 'package:fedi/app/duration/picker/duration_picker_model.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
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
  final DurationPickerType pickerType;

  DurationValueFormFieldRowWidget({
    @required this.label,
    this.description,
    this.descriptionOnDisabled,
    @required this.pickerType,
  });

  @override
  Widget build(BuildContext context) => DurationValueFormFieldBlocProxyProvider(
        child: SimpleFediFormFieldRow(
          label: label,
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          valueChild: _DurationValueFormFieldRowValueWidget(
            popupTitle: label,
            pickerType: pickerType,
          ),
        ),
      );
}

class _DurationValueFormFieldRowValueWidget extends StatelessWidget {
  final String popupTitle;
  final DurationPickerType pickerType;

  const _DurationValueFormFieldRowValueWidget({
    Key key,
    @required this.popupTitle,
    @required this.pickerType,
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
                  _showPicker(
                    context: context,
                  );
                }
              },
              child: StreamBuilder<Duration>(
                stream: fieldBloc.currentValueStream,
                initialData: fieldBloc.currentValue,
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
                      _showPicker(
                        context: context,
                      );
                    }
                  : null,
            )
          ],
        );
      },
    );
  }

  void _showPicker({@required BuildContext context}) async {
    var fieldBloc = IDurationValueFormFieldBloc.of(context, listen: false);
    var duration = await pickerType.showPicker(
      context: context,
      popupTitle: popupTitle,
      minDuration: fieldBloc.minDuration,
      currentDuration: fieldBloc.currentValue,
      maxDuration: fieldBloc.maxDuration,
    );

    if (duration != null) {
      fieldBloc.changeCurrentValue(duration);
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
}
