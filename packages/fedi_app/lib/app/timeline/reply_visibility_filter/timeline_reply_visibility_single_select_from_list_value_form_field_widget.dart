import 'package:fedi_app/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:unifedi_api/unifedi_api.dart';

class TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldWidget
    extends StatelessWidget {
  final String? label;
  final String? description;
  final String descriptionOnDisabled;

  const TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldWidget({
    Key? key,
    required this.description,
    required this.descriptionOnDisabled,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<
            UnifediApiReplyVisibilityFilter?>(
          label: label ??
              S
                  .of(context)
                  .app_timeline_settings_replyVisibilityFilter_field_label,
          valueTitleMapper: mapTimelineTypeToLabel,
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
  UnifediApiReplyVisibilityFilter? unifediApiReplyVisibilityFilter,
) =>
    unifediApiReplyVisibilityFilter?.map(
      following: (_) =>
          S.of(context).app_timeline_settings_replyVisibilityFilter_following,
      self: (_) =>
          S.of(context).app_timeline_settings_replyVisibilityFilter_self,
    ) ??
    S.of(context).app_timeline_settings_replyVisibilityFilter_field_null;
