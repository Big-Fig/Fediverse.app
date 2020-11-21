import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_from_list_field_row.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class TimelineTypeFormFieldRowWidget extends StatelessWidget {
  final IValueFormFieldBloc<TimelineType> formValueFieldBloc;
  final bool enabled;
  final String desc;

  TimelineTypeFormFieldRowWidget({
    @required this.formValueFieldBloc,
    this.enabled = true,
    @required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TimelineType>(
        stream: formValueFieldBloc.currentValueStream,
        initialData: formValueFieldBloc.currentValue,
        builder: (context, snapshot) {
          var currentValue = snapshot.data;
          return FediFormSingleChooseFromListFieldRow<TimelineType>(
            nullable: false,
            enabled: enabled,
            error: formValueFieldBloc.isHaveAtLeastOneError
                ? S.of(context).form_field_value_error_null_desc
                : null,
            desc: desc,
            label: S.of(context).app_timeline_type_field_label,
            chooserTitle: S.of(context).app_timeline_type_field_chooser_dialog_title,
            value: currentValue,
            possibleValues: TimelineType.values,
            valueToTextMapper: (timelineType) {
              if (timelineType == null) {
                return S.of(context).app_timeline_type_field_null;
              }
              switch (timelineType) {
                case TimelineType.public:
                  return S.of(context).app_timeline_type_public;
                  break;
                case TimelineType.customList:
                  return S.of(context).app_timeline_type_customList;
                  break;
                case TimelineType.home:
                  return S.of(context).app_timeline_type_home;
                  break;
                case TimelineType.hashtag:
                  return S.of(context).app_timeline_type_hashtag;
                  break;
                case TimelineType.account:
                  return S.of(context).app_timeline_type_account;
                  break;
              }
              throw "Invalid timelineType $timelineType";
            },
            valueToIconMapper: null,
            onChanged: (oldValue, newValue) {
              if (oldValue != newValue) {
                formValueFieldBloc.changeCurrentValue(newValue);
              }
            },
          );
        });
  }
}
