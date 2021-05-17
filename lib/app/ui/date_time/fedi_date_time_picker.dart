library flutter_datetime_picker;

import 'dart:async';

import 'package:fedi/app/localization/locale/supported_localization_locale_list.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_datetime_picker/src/date_model.dart';
import 'package:flutter_datetime_picker/src/i18n_model.dart';

export 'package:flutter_datetime_picker/src/date_model.dart';
export 'package:flutter_datetime_picker/src/datetime_picker_theme.dart';
export 'package:flutter_datetime_picker/src/i18n_model.dart';

typedef DateChangedCallback = void Function(DateTime? time);
typedef DateCancelledCallback = void Function();
typedef DateDeletedCallback = void Function();
typedef StringAtIndexCallBack = String? Function(int index);

// todo: refactor
// ignore_for_file: no-magic-number

class FediDatePicker {
  ///
  /// Display date picker bottom sheet.
  ///
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  static Future<DateTime?> showDatePicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateTime? minTime,
    DateTime? maxTime,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale = LocaleType.en,
    DateTime? currentTime,
    FediDatePickerTheme? theme,
    required DateDeletedCallback onDelete,
    required bool isDeletePossible,
  }) async {
    return _showDatePickerPopup(
      onDelete: onDelete,
      isDeletePossible: isDeletePossible,
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
        locale: locale,
      ),
      context: context,
    );
  }

  ///
  /// Display time picker bottom sheet.
  ///
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  static Future<DateTime?> showTimePicker(
    BuildContext context, {
    bool showTitleActions = true,
    bool showSecondsColumn = true,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale = LocaleType.en,
    DateTime? currentTime,
    FediDatePickerTheme? theme,
    required DateDeletedCallback onDelete,
    required bool isDeletePossible,
  }) async {
    return _showDatePickerPopup(
      onDelete: onDelete,
      isDeletePossible: isDeletePossible,
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
        showSecondsColumn: showSecondsColumn,
      ),
      context: context,
    );
  }

  ///
  /// Display time picker bottom sheet with AM/PM.
  ///
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  static Future<DateTime?> showTime12hPicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale = LocaleType.en,
    DateTime? currentTime,
    FediDatePickerTheme? theme,
    required DateDeletedCallback onDelete,
    required bool isDeletePossible,
  }) async {
    return _showDatePickerPopup(
      onDelete: onDelete,
      isDeletePossible: isDeletePossible,
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
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  static Future<DateTime?> showDateTimePicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateTime? minDateTime,
    DateTime? maxDateTime,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateDeletedCallback? onDelete,
    DateCancelledCallback? onCancel,
    LocaleType? locale,
    DateTime? currentDateTime,
    FediDatePickerTheme? theme,
    required bool isDeletePossible,
  }) async {
    if (locale == null) {
      var localizationSettingsBloc = ILocalizationSettingsBloc.of(
        context,
        listen: false,
      );

      var localizationLocale =
          localizationSettingsBloc.localizationLocale ?? defaultLocale;

      switch (localizationLocale.languageCode.toLowerCase()) {
        // todo: improve
        case 'ru':
          locale = LocaleType.ru;
          break;
        case 'en':
          locale = LocaleType.en;
          break;
        default:
          throw 'Invalid locale $locale';
      }
    }

    return _showDatePickerPopup(
      isDeletePossible: isDeletePossible,
      showTitleActions: showTitleActions,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      onDelete: onDelete,
      locale: locale,
      theme: theme,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pickerModel: DateTimePickerModel(
        currentTime: currentDateTime,
        minTime: minDateTime,
        maxTime: maxDateTime,
        locale: locale,
      ),
      context: context,
    );
  }

  ///
  /// Display date picker bottom sheet witch custom picker model.
  ///
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  static Future<DateTime?> showPicker(
    BuildContext context, {
    bool showTitleActions = true,
    DateChangedCallback? onChanged,
    DateChangedCallback? onConfirm,
    DateCancelledCallback? onCancel,
    locale = LocaleType.en,
    BasePickerModel? pickerModel,
    FediDatePickerTheme? theme,
    required DateDeletedCallback onDelete,
    required bool isDeletePossible,
  }) async {
    return _showDatePickerPopup(
      onDelete: onDelete,
      isDeletePossible: isDeletePossible,
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

  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  static Future<DateTime?> _showDatePickerPopup({
    required BuildContext context,
    required bool showTitleActions,
    required DateChangedCallback? onChanged,
    required DateChangedCallback? onConfirm,
    required DateCancelledCallback? onCancel,
    required DateDeletedCallback? onDelete,
    required LocaleType locale,
    required FediDatePickerTheme? theme,
    required String barrierLabel,
    required BasePickerModel? pickerModel,
    required bool isDeletePossible,
  }) {
    var completer = Completer<DateTime?>();
    Widget widget = FediDatePickerComponent(
      onChanged: onChanged,
      locale: locale,
      pickerModel: pickerModel,
      showTitleActions: showTitleActions,
      theme: theme,
      onConfirm: (time) {
        if (onConfirm != null) {
          onConfirm(time);
        }
        completer.complete(time);
      },
      onCancel: () {
        if (onCancel != null) {
          onCancel();
        }
        completer.complete(null);
      },
      onDelete: () {
        if (onDelete != null) {
          onDelete();
        }
        completer.complete(null);
      },
      isDeletePossible: isDeletePossible,
    );
    ThemeData inheritTheme = Theme.of(context);
    widget = Theme(data: inheritTheme, child: widget);

    showFediModalBottomSheetDialog(context: context, child: widget);

    return completer.future;
  }
}

class FediDatePickerComponent extends StatefulWidget {
  FediDatePickerComponent({
    Key? key,
    required this.theme,
    required this.locale,
    required this.pickerModel,
    required this.showTitleActions,
    required this.onChanged,
    required this.isDeletePossible,
    required this.onDelete,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  final DateChangedCallback? onChanged;
  final DateChangedCallback? onConfirm;
  final DateCancelledCallback? onCancel;
  final DateDeletedCallback? onDelete;
  final bool isDeletePossible;
  final FediDatePickerTheme? theme;

  final LocaleType locale;

  final BasePickerModel? pickerModel;

  final bool showTitleActions;

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<FediDatePickerComponent> {
  FixedExtentScrollController? leftScrollCtrl,
      middleScrollCtrl,
      rightScrollCtrl;

  @override
  void initState() {
    super.initState();
    refreshScrollOffset();
  }

  void refreshScrollOffset() {
//    print('refreshScrollOffset ${widget.pickerModel.currentRightIndex()}');
    leftScrollCtrl = FixedExtentScrollController(
      initialItem: widget.pickerModel!.currentLeftIndex(),
    );
    middleScrollCtrl = FixedExtentScrollController(
      initialItem: widget.pickerModel!.currentMiddleIndex(),
    );
    rightScrollCtrl = FixedExtentScrollController(
      initialItem: widget.pickerModel!.currentRightIndex(),
    );
  }

  @override
  Widget build(BuildContext context) {
    FediDatePickerTheme theme = widget.theme!;

    return _renderPickerView(theme);
  }

  void _notifyDateChanged() {
    if (widget.onChanged != null) {
      widget.onChanged!(widget.pickerModel!.finalTime());
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
              style: IFediUiTextTheme.of(context).dialogTitleBoldDarkGrey,
            ),
          ),
          itemView,
          _renderTitleActionsView(theme),
        ],
      );
    }

    return Container(child: itemView);
  }

  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  Widget _renderColumnView(
    ValueKey key,
    FediDatePickerTheme theme,
    StringAtIndexCallBack stringAtIndexCB,
    ScrollController? scrollController,
    int layoutProportion,
    ValueChanged<int> selectedChangedWhenScrolling,
    ValueChanged<int>? selectedChangedWhenScrollEnd,
  ) {
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
              final FixedExtentMetrics metrics =
                  notification.metrics as FixedExtentMetrics;
              final int currentItemIndex = metrics.itemIndex;
              selectedChangedWhenScrollEnd(currentItemIndex);
            }

            return false;
          },
          child: CupertinoPicker.builder(
            key: key,
            scrollController:
                // todo : check
                scrollController as FixedExtentScrollController?,
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
            },
          ),
        ),
      ),
    );
  }

  // todo: refactor
  // ignore: long-method
  Widget _renderItemView(FediDatePickerTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: widget.pickerModel!.layoutProportions()[0] > 0
              ? _renderColumnView(
                  ValueKey(widget.pickerModel!.currentLeftIndex()),
                  theme,
                  widget.pickerModel!.leftStringAtIndex,
                  leftScrollCtrl,
                  widget.pickerModel!.layoutProportions()[0],
                  (index) {
                    widget.pickerModel!.setLeftIndex(index);
                  },
                  (index) {
                    setState(() {
                      refreshScrollOffset();
                      _notifyDateChanged();
                    });
                  },
                )
              : null,
        ),
        Text(
          widget.pickerModel!.leftDivider(),
          style: theme.itemStyle,
        ),
        Container(
          child: widget.pickerModel!.layoutProportions()[1] > 0
              ? _renderColumnView(
                  ValueKey(widget.pickerModel!.currentLeftIndex()),
                  theme,
                  widget.pickerModel!.middleStringAtIndex,
                  middleScrollCtrl,
                  widget.pickerModel!.layoutProportions()[1],
                  (index) {
                    widget.pickerModel!.setMiddleIndex(index);
                  },
                  (index) {
                    setState(() {
                      refreshScrollOffset();
                      _notifyDateChanged();
                    });
                  },
                )
              : null,
        ),
        Text(
          widget.pickerModel!.rightDivider(),
          style: theme.itemStyle,
        ),
        Container(
          child: widget.pickerModel!.layoutProportions()[2] > 0
              ? _renderColumnView(
                  ValueKey(widget.pickerModel!.currentMiddleIndex() * 100 +
                      widget.pickerModel!.currentLeftIndex()),
                  theme,
                  widget.pickerModel!.rightStringAtIndex,
                  rightScrollCtrl,
                  widget.pickerModel!.layoutProportions()[2],
                  (index) {
                    widget.pickerModel!.setRightIndex(index);
                    _notifyDateChanged();
                  },
                  null,
                )
              : null,
        ),
      ],
    );
  }

  // Title View
  Widget _renderTitleActionsView(FediDatePickerTheme theme) {
    String done = _localeDone();
    String cancel = _localeCancel();
    String delete = _localeDelete();

    return Container(
      height: theme.titleHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FediPrimaryFilledTextButtonWithBorder(
            '$done',
            onPressed: () {
              Navigator.pop(context, widget.pickerModel!.finalTime());
              if (widget.onConfirm != null) {
                widget.onConfirm!(widget.pickerModel!.finalTime());
              }
            },
            expanded: false,
          ),
          if (widget.isDeletePossible)
            FediTransparentTextButtonWithBorder(
              '$delete',
              color: IFediUiColorTheme.of(context).primary,
              onPressed: () {
                if (widget.onDelete != null) {
                  widget.onDelete!();
                }
                Navigator.pop(context);
              },
              expanded: false,
            ),
          FediTransparentTextButtonWithBorder(
            '$cancel',
            color: IFediUiColorTheme.of(context).darkGrey,
            onPressed: () {
              Navigator.pop(context);
              if (widget.onCancel != null) {
                widget.onCancel!();
              }
            },
            expanded: false,
          ),
        ],
      ),
    );
  }

  String _localeDone() {
    return widget.theme!.customDone ??
        S.of(context).app_datetime_picker_action_done;
  }

  String _localeCancel() {
    return widget.theme!.customCancel ??
        S.of(context).app_datetime_picker_action_cancel;
  }

  String _localeDelete() {
    return S.of(context).app_datetime_picker_action_delete;
  }
}

class FediDatePickerTheme {
  final TextStyle cancelStyle;
  final TextStyle doneStyle;
  final TextStyle itemStyle;
  final Color backgroundColor;
  final Color? headerColor;

  final double containerHeight;
  final double titleHeight;
  final double itemHeight;
  final String customTitle;
  final String? customDone;
  final String? customCancel;

  const FediDatePickerTheme({
    this.cancelStyle = const TextStyle(color: Colors.black54, fontSize: 16),
    this.doneStyle = const TextStyle(color: Colors.blue, fontSize: 16),
    this.itemStyle = const TextStyle(color: Color(0xFF000046), fontSize: 18),
    this.backgroundColor = Colors.white,
    this.headerColor,
    this.containerHeight = 210.0,
    this.titleHeight = 44.0,
    this.itemHeight = 36.0,
    required this.customTitle,
    required this.customDone,
    required this.customCancel,
  });

  FediDatePickerTheme.byDefault({
    required BuildContext context,
    String? customTitle,
  }) : this(
          headerColor: IFediUiColorTheme.of(context, listen: false).white,
          backgroundColor: IFediUiColorTheme.of(context, listen: false).white,
          itemStyle: IFediUiTextTheme.of(context, listen: false)
              .mediumShortBoldDarkGrey,
          doneStyle: IFediUiTextTheme.of(context, listen: false)
              .mediumShortBoldPrimary,
          customTitle: customTitle ?? S.of(context).app_datetime_title,
          customDone: S.of(context).app_datetime_picker_action_ok,
          customCancel: S.of(context).app_datetime_picker_action_cancel,
        );
}
