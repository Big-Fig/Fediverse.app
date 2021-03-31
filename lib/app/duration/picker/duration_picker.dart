import 'package:duration_picker/duration_picker.dart';
import 'package:fedi/app/duration/picker/duration_picker_model.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_transparent_text_button_with_border.dart';
import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

Future<DurationPickerResult> showDurationPicker({
  required BuildContext context,
  required String popupTitle,
  required Duration? minDuration,
  required Duration? currentDuration,
  required Duration? maxDuration,
  required bool isDeletePossible,
}) async {
  bool canceled = false;
  bool deleted = false;
  Duration? pickedDuration = await showFediModalBottomSheetDialog<Duration>(
    context: context,
    // isScrollControlled: false,
    enableDrag: false,
    child: _DurationPickerBody(
      initialDuration: currentDuration,
      deleteCallback: () {
        deleted = true;
      },
      cancelCallback: () {
        canceled = true;
      },
      isDeletePossible: isDeletePossible,
    ),
  );

  Duration? resultDuration;

  if (pickedDuration != null) {
    if ((maxDuration == null || pickedDuration < maxDuration) &&
        (minDuration == null || pickedDuration > minDuration)) {
      resultDuration = pickedDuration;
    } else {
      if ((maxDuration == null || pickedDuration > maxDuration)) {
        resultDuration = maxDuration;
      } else {
        resultDuration = minDuration;
      }
    }
  } else {
    resultDuration = null;
  }

  return DurationPickerResult(
    deleted: deleted,
    canceled: canceled,
    duration: resultDuration,
  );
}

class _DurationPickerBody extends StatefulWidget {
  final Duration? initialDuration;
  final VoidCallback cancelCallback;
  final VoidCallback deleteCallback;
  final bool isDeletePossible;

  _DurationPickerBody({
    required this.initialDuration,
    required this.cancelCallback,
    required this.deleteCallback,
    required this.isDeletePossible,
  });

  @override
  __DurationPickerBodyState createState() => __DurationPickerBodyState(
        currentSelectedDuration: initialDuration,
      );
}

class __DurationPickerBodyState extends State<_DurationPickerBody> {
  Duration? currentSelectedDuration;

  __DurationPickerBodyState({
    required this.currentSelectedDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // DurationPickerDialogBody(
        //   initialTime: currentDuration ?? Duration(minutes: 1),),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: DialogPickerDial(
              duration: currentSelectedDuration ?? Duration(minutes: 1),
              onChanged: (newSelectedDuration) {
                setState(() {
                  currentSelectedDuration = newSelectedDuration;
                });
              },
              snapToMins: 1.0,
            ),
          ),
        ),
        Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FediPrimaryFilledTextButtonWithBorder(
                S.of(context).app_duration_picker_action_done,
                onPressed: () {
                  Navigator.pop(context, currentSelectedDuration);
                },
                expanded: false,
              ),
              if (widget.isDeletePossible)
                FediTransparentTextButtonWithBorder(
                  S.of(context).app_duration_picker_action_delete,
                  color: IFediUiColorTheme.of(context).darkGrey,
                  onPressed: () {
                    widget.deleteCallback();
                    Navigator.pop(context, null);
                  },
                  expanded: false,
                ),
              FediTransparentTextButtonWithBorder(
                S.of(context).app_duration_picker_action_cancel,
                color: IFediUiColorTheme.of(context).darkGrey,
                onPressed: () {
                  widget.cancelCallback();
                  Navigator.pop(context, currentSelectedDuration);
                },
                expanded: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
