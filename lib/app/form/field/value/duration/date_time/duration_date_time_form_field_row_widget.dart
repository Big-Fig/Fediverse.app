import 'dart:async';

import 'package:fedi/app/duration/picker/date_time_duration_picker.dart';
import 'package:fedi/app/form/field/value/duration/duration_value_form_field_row_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/date_time/fedi_date_time_picker.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/form/fedi_form_field_row.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_model.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

// todo: refactor to use common widgets with  DurationValueFormFieldRowWidget
class DurationDateTimeValueFormFieldRowWidget extends StatelessWidget {
  final String label;
  final String? description;
  final String? descriptionOnDisabled;
  final String? negativeValue;
  final bool useDialogPickerForValueSelection;

  const DurationDateTimeValueFormFieldRowWidget({
    required this.label,
    required this.useDialogPickerForValueSelection,
    this.description,
    this.descriptionOnDisabled,
    this.negativeValue,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DurationDateTimeValueFormFieldBlocProxyProvider(
            child: SimpleFediFormFieldRow(
              label: label,
              description: description,
              descriptionOnDisabled: descriptionOnDisabled,
              valueChild: useDialogPickerForValueSelection
                  ? _DurationDateTimeValueFormFieldRowValueWidget(
                      popupTitle: label,
                      negativeValue: negativeValue,
                      useDialogPickerForValueSelection:
                          useDialogPickerForValueSelection,
                    )
                  : Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: FediSizes.bigPadding),
                        child: _DurationDateTimeValueFormFieldRowValueWidget(
                          popupTitle: label,
                          negativeValue: negativeValue,
                          useDialogPickerForValueSelection:
                              useDialogPickerForValueSelection,
                        ),
                      ),
                    ),
            ),
          ),
          if (!useDialogPickerForValueSelection)
            const _DurationDateTimeValueFormFieldRowPickerWidget(),
        ],
      );
}

class _DurationDateTimeValueFormFieldRowPickerWidget extends StatefulWidget {
  const _DurationDateTimeValueFormFieldRowPickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  __DurationDateTimeValueFormFieldRowPickerWidgetState createState() =>
      __DurationDateTimeValueFormFieldRowPickerWidgetState();
}

class __DurationDateTimeValueFormFieldRowPickerWidgetState
    extends State<_DurationDateTimeValueFormFieldRowPickerWidget> {
  DateTime? onChangedDateTime;

  DurationDateTime? currentDurationDateTime;
  StreamSubscription? streamSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var fieldBloc =
        IDurationDateTimeValueFormFieldBloc.of(context, listen: false);

    streamSubscription = fieldBloc.currentValueStream.listen(
      (durationDateTime) {
        DurationDateTime? newDurationDateTime;

        // hack to avoid too much rebuilds
        // todo: should be reworked
        if (durationDateTime == null) {
          newDurationDateTime = null;
        } else {
          if (onChangedDateTime != null) {
            newDurationDateTime = DurationDateTime(
              duration: null,
              dateTime: onChangedDateTime,
            );
          } else {
            newDurationDateTime = durationDateTime;
          }
        }

        if (currentDurationDateTime != newDurationDateTime) {
          setState(() {
            currentDurationDateTime = newDurationDateTime;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    streamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationDateTimeValueFormFieldBloc.of(context);

    if (currentDurationDateTime != null) {
      var minDateTimeJiffy = Jiffy();
      var maxDateTimeJiffy = Jiffy();
      var currentDateTimeJiffy = Jiffy();

      DateTime? minDateTime;
      DateTime? maxDateTime;
      DateTime? currentDateTime;

      if (fieldBloc.minDuration != null) {
        minDateTimeJiffy.add(duration: fieldBloc.minDuration!);
        minDateTime = minDateTimeJiffy.dateTime;
      }

      if (fieldBloc.maxDuration != null) {
        maxDateTimeJiffy.add(duration: fieldBloc.maxDuration!);
        maxDateTime = maxDateTimeJiffy.dateTime;
      }

      if (fieldBloc.currentValueDuration != null) {
        currentDateTimeJiffy.add(duration: fieldBloc.currentValueDuration!);
        currentDateTime = currentDateTimeJiffy.dateTime;
      }

      // todo: refactor
      return FediDatePickerComponent(
        onChanged: (dateTime) {
          onChangedDateTime = dateTime;
          currentDurationDateTime = DurationDateTime(
            duration: null,
            dateTime: onChangedDateTime,
          );
          fieldBloc.changeCurrentValue(
            DurationDateTime(
              dateTime: dateTime,
              duration: null,
            ),
          );
        },
        locale: LocaleType.en,
        pickerModel: DateTimePickerModel(
          currentTime: currentDateTime,
          minTime: minDateTime,
          maxTime: maxDateTime,
          locale: LocaleType.en,
        ),
        showTitleActions: false,
        theme: FediDatePickerTheme.byDefault(
          context: context,
        ),
        onConfirm: null,
        onCancel: null,
        onDelete: null,
        isDeletePossible: false,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class _DurationDateTimeValueFormFieldRowValueWidget extends StatelessWidget {
  final String popupTitle;
  final String? negativeValue;
  final bool useDialogPickerForValueSelection;

  const _DurationDateTimeValueFormFieldRowValueWidget({
    Key? key,
    required this.popupTitle,
    required this.negativeValue,
    required this.useDialogPickerForValueSelection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationDateTimeValueFormFieldBloc.of(context);

    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data!;

        return InkWell(
          onTap: () {
            if (isEnabled) {
              if (useDialogPickerForValueSelection) {
                _showDurationPicker(
                  popupTitle: popupTitle,
                  context: context,
                );
              } else {
                fieldBloc.changeCurrentValueDuration(fieldBloc.minDuration);
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: useDialogPickerForValueSelection
                  ? null
                  : Border(
                      bottom: BorderSide(
                        color: IFediUiColorTheme.of(context).lightGrey,
                      ),
                    ),
            ),
            child: Row(
              mainAxisSize: useDialogPickerForValueSelection
                  ? MainAxisSize.min
                  : MainAxisSize.max,
              mainAxisAlignment: useDialogPickerForValueSelection
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DurationDateTimeValueFormFieldRowValueTextWidget(
                  useDialogPickerForValueSelection:
                      useDialogPickerForValueSelection,
                  negativeValue: negativeValue,
                ),
                if (!useDialogPickerForValueSelection)
                  StreamBuilder<bool>(
                    stream: fieldBloc.isValueExistStream,
                    initialData: fieldBloc.isValueExist,
                    builder: (context, snapshot) {
                      var isValueExist = snapshot.data!;

                      return Icon(
                        isValueExist
                            ? FediIcons.chevron_up
                            : FediIcons.chevron_down,
                        // ignore: no-magic-number
                        size: 16.0,
                        color: isValueExist
                            ? IFediUiColorTheme.of(context).primary
                            : IFediUiColorTheme.of(context).darkGrey,
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DurationDateTimeValueFormFieldRowValueTextWidget extends StatelessWidget {
  final String? negativeValue;
  final bool useDialogPickerForValueSelection;

  const DurationDateTimeValueFormFieldRowValueTextWidget({
    required this.negativeValue,
    required this.useDialogPickerForValueSelection,
  });

  @override
  Widget build(BuildContext context) {
    var fieldBloc = IDurationDateTimeValueFormFieldBloc.of(context);

    var fediUiTextTheme = IFediUiTextTheme.of(context);

    return StreamBuilder<bool>(
      stream: fieldBloc.isEnabledStream,
      initialData: fieldBloc.isEnabled,
      builder: (context, snapshot) {
        var isEnabled = snapshot.data!;

        return StreamBuilder<Duration?>(
          stream: fieldBloc.currentValueDurationStream,
          initialData: fieldBloc.currentValueDuration,
          builder: (context, snapshot) {
            var currentValue = snapshot.data;

            String durationText;
            if (currentValue == null) {
              durationText = S.of(context).app_duration_value_null;
            } else {
              if (negativeValue != null && currentValue.isNegative) {
                durationText = negativeValue!;
              } else {
                durationText = formatDuration(
                  context: context,
                  duration: currentValue,
                );
              }
            }
            TextStyle textStyle;
            if (useDialogPickerForValueSelection) {
              textStyle = isEnabled
                  ? fediUiTextTheme.bigTallBoldMediumGrey
                  : fediUiTextTheme.bigTallBoldLightGrey;
            } else {
              textStyle = isEnabled
                  ? currentValue == null
                      ? fediUiTextTheme.bigTallMediumGrey
                      : fediUiTextTheme.bigTallPrimaryDark
                  : fediUiTextTheme.bigTallLightGrey;
            }

            return Text(
              durationText,
              style: textStyle,
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
          icon: const Icon(FediIcons.chevron_down),
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

Future _showDurationPicker({
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
