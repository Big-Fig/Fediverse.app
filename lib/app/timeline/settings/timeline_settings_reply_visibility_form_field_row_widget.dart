import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/form/fedi_form_single_choose_from_list_field_row.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:flutter/cupertino.dart';

class TimelineSettingsReplyVisibilityFormFieldRowWidget
    extends StatelessWidget {
  final IFormValueFieldBloc<PleromaReplyVisibilityFilter> formValueFieldBloc;
  final bool enabled;
  final String desc;

  TimelineSettingsReplyVisibilityFormFieldRowWidget({
    @required this.formValueFieldBloc,
    this.enabled = true,
    @required this.desc,
  });

  @override
  Widget build(BuildContext context) =>
      StreamBuilder<PleromaReplyVisibilityFilter>(
          stream: formValueFieldBloc.currentValueStream,
          initialData: formValueFieldBloc.currentValue,
          builder: (context, snapshot) {
            var currentValue = snapshot.data;
            return FediFormSingleChooseFromListFieldRow<
                PleromaReplyVisibilityFilter>(
              enabled: enabled,
              nullable: true,
              error: formValueFieldBloc.isHaveAtLeastOneError
                  ? "form.field.value.error.null.desc".tr()
                  : null,
              desc: desc,
              label: "app.timeline.settings.reply_visibility_filter.field.label"
                  .tr(),
              chooserTitle:
                  "app.timeline.settings.reply_visibility_filter.field.chooser.dialog.title"
                      .tr(),
              value: currentValue,
              possibleValues: PleromaReplyVisibilityFilter.values,
              valueToTextMapper: (pleromaReplyVisibilityFilter) {
                if (pleromaReplyVisibilityFilter == null) {
                  return "app.timeline.settings.reply_visibility_filter.field.null"
                      .tr();
                }

                switch (pleromaReplyVisibilityFilter) {
                  case PleromaReplyVisibilityFilter.self:
                    return "app.timeline.settings.reply_visibility_filter.self"
                        .tr();
                    break;
                  case PleromaReplyVisibilityFilter.following:
                    return "app.timeline.settings.reply_visibility_filter.following"
                        .tr();
                    break;
                }
                throw "Invalid PleromaReplyVisibilityFilter $pleromaReplyVisibilityFilter";
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
