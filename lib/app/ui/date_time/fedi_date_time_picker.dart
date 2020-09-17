library flutter_datetime_picker;

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/button/text/fedi_transparent_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/src/date_model.dart';
import 'package:flutter_datetime_picker/src/i18n_model.dart';

export 'package:flutter_datetime_picker/src/date_model.dart';
export 'package:flutter_datetime_picker/src/datetime_picker_theme.dart';
export 'package:flutter_datetime_picker/src/i18n_model.dart';

typedef void DateChangedCallback(DateTime time);
typedef void DateCancelledCallback();
typedef String StringAtIndexCallBack(int index);

class FediDatePicker {
  ///
  /// Display date picker bottom sheet.
  ///
  static Future<DateTime> showDatePicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateTime minTime,
    DateTime maxTime,
    DateChangedCallback onChanged,
    DateChangedCallback onConfirm,
    DateCancelledCallback onCancel,
    locale = LocaleType.en,
    DateTime currentTime,
    FediDatePickerTheme theme,
  }) async {
    return _showDatePickerPopup(
      showTitleActions: showTitleActions,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      locale: locale,
      theme: theme,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pickerModel: DatePickerModel(
          currentTime: currentTime,
          maxTime: maxTime,
          minTime: minTime,
          locale: locale),
      context: context,
    );
  }

  ///
  /// Display time picker bottom sheet.
  ///
  static Future<DateTime> showTimePicker(
    BuildContext context, {
    bool showTitleActions = true,
    bool showSecondsColumn = true,
    DateChangedCallback onChanged,
    DateChangedCallback onConfirm,
    DateCancelledCallback onCancel,
    locale = LocaleType.en,
    DateTime currentTime,
    FediDatePickerTheme theme,
  }) async {
    return _showDatePickerPopup(
      showTitleActions: showTitleActions,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      locale: locale,
      theme: theme,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pickerModel: TimePickerModel(
          currentTime: currentTime,
          locale: locale,
          showSecondsColumn: showSecondsColumn),
      context: context,
    );
  }

  ///
  /// Display time picker bottom sheet with AM/PM.
  ///
  static Future<DateTime> showTime12hPicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateChangedCallback onChanged,
    DateChangedCallback onConfirm,
    DateCancelledCallback onCancel,
    locale = LocaleType.en,
    DateTime currentTime,
    FediDatePickerTheme theme,
  }) async {
    return _showDatePickerPopup(
      showTitleActions: showTitleActions,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      locale: locale,
      theme: theme,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pickerModel: Time12hPickerModel(currentTime: currentTime, locale: locale),
      context: context,
    );
  }

  ///
  /// Display date&time picker bottom sheet.
  ///
  static Future<DateTime> showDateTimePicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateTime minDateTime,
    DateTime maxDateTime,
    DateChangedCallback onChanged,
    DateChangedCallback onConfirm,
    DateCancelledCallback onCancel,
    locale = LocaleType.en,
    DateTime currentTime,
    FediDatePickerTheme theme,
  }) async {
    return _showDatePickerPopup(
      showTitleActions: showTitleActions,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      locale: locale,
      theme: theme,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pickerModel: DateTimePickerModel(
          currentTime: currentTime,
          minTime: minDateTime,
          maxTime: maxDateTime,
          locale: locale),
      context: context,
    );
  }

  ///
  /// Display date picker bottom sheet witch custom picker model.
  ///
  static Future<DateTime> showPicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateChangedCallback onChanged,
    DateChangedCallback onConfirm,
    DateCancelledCallback onCancel,
    locale = LocaleType.en,
    BasePickerModel pickerModel,
    FediDatePickerTheme theme,
  }) async {
    return _showDatePickerPopup(
      showTitleActions: showTitleActions,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      locale: locale,
      theme: theme,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pickerModel: pickerModel,
      context: context,
    );
  }

  static Future<DateTime> _showDatePickerPopup(
      {@required BuildContext context,
      @required bool showTitleActions,
      @required DateChangedCallback onChanged,
      @required DateChangedCallback onConfirm,
      @required DateCancelledCallback onCancel,
      @required LocaleType locale,
      @required FediDatePickerTheme theme,
      @required String barrierLabel,
      @required BasePickerModel pickerModel}) {
    var completer = Completer<DateTime>();
    Widget widget = _FediDatePickerComponent(
      onChanged: onChanged,
      locale: locale,
      pickerModel: pickerModel,
      showTitleActions: showTitleActions,
      theme: theme,
      onConfirm: (time) {
        completer.complete(time);
        if (onConfirm != null) {
          onConfirm(time);
        }
      },
      onCancel: () {
        completer.complete(null);
        if (onCancel != null) {
          onCancel();
        }
      },
    );
    ThemeData inheritTheme = Theme.of(context, shadowThemeOnly: true);
    if (inheritTheme != null) {
      widget = Theme(data: inheritTheme, child: widget);
    }
    showFediModalBottomSheetDialog(context: context, child: widget);

    return completer.future;
  }
}

class _FediDatePickerComponent extends StatefulWidget {
  _FediDatePickerComponent({
    Key key,
    @required this.theme,
    @required this.locale,
    @required this.pickerModel,
    @required this.showTitleActions,
    @required this.onChanged,
    @required this.onConfirm,
    @required this.onCancel,
  });

  final DateChangedCallback onChanged;
  final DateChangedCallback onConfirm;
  final DateCancelledCallback onCancel;
  final FediDatePickerTheme theme;

  final LocaleType locale;

  final BasePickerModel pickerModel;

  final bool showTitleActions;

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<_FediDatePickerComponent> {
  FixedExtentScrollController leftScrollCtrl, middleScrollCtrl, rightScrollCtrl;

  @override
  void initState() {
    super.initState();
    refreshScrollOffset();
  }

  void refreshScrollOffset() {
//    print('refreshScrollOffset ${widget.pickerModel.currentRightIndex()}');
    leftScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentLeftIndex());
    middleScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentMiddleIndex());
    rightScrollCtrl = FixedExtentScrollController(
        initialItem: widget.pickerModel.currentRightIndex());
  }

  @override
  Widget build(BuildContext context) {
    FediDatePickerTheme theme = widget.theme;

    return _renderPickerView(theme);
  }

  void _notifyDateChanged() {
    if (widget.onChanged != null) {
      widget.onChanged(widget.pickerModel.finalTime());
    }
  }

  Widget _renderPickerView(FediDatePickerTheme theme) {
    Widget itemView = _renderItemView(theme);
    if (widget.showTitleActions) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: FediSizes.smallPadding),
            child: Text(
              theme.customTitle,
              style: FediTextStyles.dialogTitleBoldDarkGrey,
            ),
          ),
          itemView,
          _renderTitleActionsView(theme),
        ],
      );
    }
    return itemView;
  }

  Widget _renderColumnView(
      ValueKey key,
      FediDatePickerTheme theme,
      StringAtIndexCallBack stringAtIndexCB,
      ScrollController scrollController,
      int layoutProportion,
      ValueChanged<int> selectedChangedWhenScrolling,
      ValueChanged<int> selectedChangedWhenScrollEnd) {
    return Expanded(
      flex: layoutProportion,
      child: Container(
          padding: EdgeInsets.all(8.0),
          height: theme.containerHeight,
          child: NotificationListener(
              onNotification: (ScrollNotification notification) {
                if (notification.depth == 0 &&
                    selectedChangedWhenScrollEnd != null &&
                    notification is ScrollEndNotification &&
                    notification.metrics is FixedExtentMetrics) {
                  final FixedExtentMetrics metrics = notification.metrics;
                  final int currentItemIndex = metrics.itemIndex;
                  selectedChangedWhenScrollEnd(currentItemIndex);
                }
                return false;
              },
              child: CupertinoPicker.builder(
                  key: key,
                  scrollController: scrollController,
                  itemExtent: theme.itemHeight,
                  onSelectedItemChanged: (int index) {
                    selectedChangedWhenScrolling(index);
                  },
                  useMagnifier: true,
                  itemBuilder: (BuildContext context, int index) {
                    final content = stringAtIndexCB(index);
                    if (content == null) {
                      return null;
                    }
                    return Container(
                      height: theme.itemHeight,
                      alignment: Alignment.center,
                      child: Text(
                        content,
                        style: theme.itemStyle,
                        textAlign: TextAlign.start,
                      ),
                    );
                  }))),
    );
  }

  Widget _renderItemView(FediDatePickerTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: widget.pickerModel.layoutProportions()[0] > 0
              ? _renderColumnView(
                  ValueKey(widget.pickerModel.currentLeftIndex()),
                  theme,
                  widget.pickerModel.leftStringAtIndex,
                  leftScrollCtrl,
                  widget.pickerModel.layoutProportions()[0], (index) {
                  widget.pickerModel.setLeftIndex(index);
                }, (index) {
                  setState(() {
                    refreshScrollOffset();
                    _notifyDateChanged();
                  });
                })
              : null,
        ),
        Text(
          widget.pickerModel.leftDivider(),
          style: theme.itemStyle,
        ),
        Container(
          child: widget.pickerModel.layoutProportions()[1] > 0
              ? _renderColumnView(
                  ValueKey(widget.pickerModel.currentLeftIndex()),
                  theme,
                  widget.pickerModel.middleStringAtIndex,
                  middleScrollCtrl,
                  widget.pickerModel.layoutProportions()[1], (index) {
                  widget.pickerModel.setMiddleIndex(index);
                }, (index) {
                  setState(() {
                    refreshScrollOffset();
                    _notifyDateChanged();
                  });
                })
              : null,
        ),
        Text(
          widget.pickerModel.rightDivider(),
          style: theme.itemStyle,
        ),
        Container(
          child: widget.pickerModel.layoutProportions()[2] > 0
              ? _renderColumnView(
                  ValueKey(widget.pickerModel.currentMiddleIndex() * 100 +
                      widget.pickerModel.currentLeftIndex()),
                  theme,
                  widget.pickerModel.rightStringAtIndex,
                  rightScrollCtrl,
                  widget.pickerModel.layoutProportions()[2], (index) {
                  widget.pickerModel.setRightIndex(index);
                  _notifyDateChanged();
                }, null)
              : null,
        ),
      ],
    );
  }

  // Title View
  Widget _renderTitleActionsView(FediDatePickerTheme theme) {
    String done = _localeDone();
    String cancel = _localeCancel();

    return Container(
      height: theme.titleHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FediPrimaryFilledTextButton(
            '$done',
            onPressed: () {
              Navigator.pop(context, widget.pickerModel.finalTime());
              if (widget.onConfirm != null) {
                widget.onConfirm(widget.pickerModel.finalTime());
              }
            },
          ),
          FediTransparentTextButton(
            '$cancel',
            color: FediColors.darkGrey,
            onPressed: () {
              Navigator.pop(context);
              if (widget.onCancel != null) {
                widget.onCancel();
              }
            },
          ),
        ],
      ),
    );
  }

  String _localeDone() {
    return widget.theme.customDone ?? i18nObjInLocale(widget.locale)['done'];
  }

  String _localeCancel() {
    return widget.theme.customCancel ??
        i18nObjInLocale(widget.locale)['cancel'];
  }
}

class FediDatePickerTheme {
  final TextStyle cancelStyle;
  final TextStyle doneStyle;
  final TextStyle itemStyle;
  final Color backgroundColor;
  final Color headerColor;

  final double containerHeight;
  final double titleHeight;
  final double itemHeight;
  final String customTitle;
  final String customDone;
  final String customCancel;

  const FediDatePickerTheme({
    this.cancelStyle = const TextStyle(color: Colors.black54, fontSize: 16),
    this.doneStyle = const TextStyle(color: Colors.blue, fontSize: 16),
    this.itemStyle = const TextStyle(color: Color(0xFF000046), fontSize: 18),
    this.backgroundColor = Colors.white,
    this.headerColor,
    this.containerHeight = 210.0,
    this.titleHeight = 44.0,
    this.itemHeight = 36.0,
    @required this.customTitle,
    @required this.customDone,
    @required this.customCancel,
  });

  FediDatePickerTheme.byDefault({String customTitle})
      : this(
          headerColor: FediColors.white,
          backgroundColor: FediColors.white,
          itemStyle: FediTextStyles.mediumShortBoldDarkGrey,
          doneStyle: FediTextStyles.mediumShortBoldPrimary,
          customTitle: customTitle ?? "app.datetime.picker.title".tr(),
          customDone: "app.datetime.picker.action.ok".tr(),
          customCancel: "app.datetime.picker.action.cancel".tr(),
        );
}
