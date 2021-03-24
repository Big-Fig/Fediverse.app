import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/timeline/pleroma_timeline_model.dart';
import 'package:flutter/cupertino.dart';

class TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldWidget
    extends StatelessWidget {
  final String? label;
  final String? description;
  final String descriptionOnDisabled;

  TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldWidget({
    this.label,
    required this.description,
    required this.descriptionOnDisabled,
  });

  @override
  Widget build(BuildContext context) =>
      TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<
            PleromaReplyVisibilityFilter?>(
          label: label ??
              S
                  .of(context)
                  .app_timeline_settings_replyVisibilityFilter_field_label,
          valueTitleMapper: (context, value) =>
              mapTimelineTypeToLabel(context, value),
          description: description,
          descriptionOnDisabled: descriptionOnDisabled,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );
}

String mapTimelineTypeToLabel(
  BuildContext context,
  PleromaReplyVisibilityFilter? pleromaReplyVisibilityFilter,
) {
  if (pleromaReplyVisibilityFilter == null) {
    return S.of(context).app_timeline_settings_replyVisibilityFilter_field_null;
  }

  switch (pleromaReplyVisibilityFilter) {
    case PleromaReplyVisibilityFilter.self:
      return S.of(context).app_timeline_settings_replyVisibilityFilter_self;
    case PleromaReplyVisibilityFilter.following:
      return S
          .of(context)
          .app_timeline_settings_replyVisibilityFilter_following;
  }
}
