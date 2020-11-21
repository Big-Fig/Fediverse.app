import 'package:fedi/app/ui/form/fedi_form_single_choose_from_list_field_row.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:fedi/form/field/value/form_value_field_bloc.dart';
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
                  ? S.of(context).form_field_value_error_null_desc
                  : null,
              desc: desc,
              label: S
                  .of(context)
                  .app_timeline_settings_replyVisibilityFilter_field_label,
              chooserTitle: S
                  .of(context)
                  .app_timeline_settings_replyVisibilityFilter_field_chooser_dialog_title,
              value: currentValue,
              possibleValues: PleromaReplyVisibilityFilter.values,
              valueToTextMapper: (pleromaReplyVisibilityFilter) {
                if (pleromaReplyVisibilityFilter == null) {
                  return S
                      .of(context)
                      .app_timeline_settings_replyVisibilityFilter_field_null;
                }

                switch (pleromaReplyVisibilityFilter) {
                  case PleromaReplyVisibilityFilter.self:
                    return S
                        .of(context)
                        .app_timeline_settings_replyVisibilityFilter_self;
                    break;
                  case PleromaReplyVisibilityFilter.following:
                    return S
                        .of(context)
                        .app_timeline_settings_replyVisibilityFilter_following;
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
