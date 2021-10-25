import 'package:fedi_app/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class TimelineTypeSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  const TimelineTypeSingleFromListValueFormFieldRowWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      TimelineTypeSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<TimelineType>(
          label: S.of(context).app_timeline_type_field_label,
          valueTitleMapper: (context, value) =>
              mapTimelineTypeToLabel(context, value!),
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );
}

String mapTimelineTypeToLabel(BuildContext context, TimelineType type) {
  switch (type) {
    case TimelineType.public:
      return S.of(context).app_timeline_type_public;
    case TimelineType.customList:
      return S.of(context).app_timeline_type_customList;
    case TimelineType.home:
      return S.of(context).app_timeline_type_home;
    case TimelineType.hashtag:
      return S.of(context).app_timeline_type_hashtag;
    case TimelineType.account:
      return S.of(context).app_timeline_type_account;
  }
}
