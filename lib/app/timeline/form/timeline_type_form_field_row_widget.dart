import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/ui/form/fedi_form_choose_from_list_field_row.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class TimelineTypeFormFieldRowWidget extends StatelessWidget {
  final IFormValueFieldBloc<TimelineType> formValueFieldBloc;

  TimelineTypeFormFieldRowWidget({@required this.formValueFieldBloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TimelineType>(
        stream: formValueFieldBloc.currentValueStream,
        initialData: formValueFieldBloc.currentValue,
        builder: (context, snapshot) {
          var currentValue = snapshot.data;
          return FediFormChooseFromListFieldRow<TimelineType>(
            label: "app.timeline.create.field.type.label".tr(),
            chooserTitle: "app.timeline.type.chooser.dialog.title".tr(),
            value: currentValue,
            possibleValues: TimelineType.values,
            valueToTextMapper: (timelineType) {
              switch (timelineType) {
                case TimelineType.public:
                  return "app.timeline.type.public".tr();
                  break;
                case TimelineType.customList:
                  return "app.timeline.type.custom_list".tr();
                  break;
                case TimelineType.home:
                  return "app.timeline.type.home".tr();
                  break;
                case TimelineType.hashtag:
                  return "app.timeline.type.hashtag".tr();
                  break;
                case TimelineType.account:
                  return "app.timeline.type.account".tr();
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
