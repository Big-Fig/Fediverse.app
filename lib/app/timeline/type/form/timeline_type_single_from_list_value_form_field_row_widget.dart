import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class TimelineTypeSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      TimelineTypeSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<TimelineType>(
          label: S.of(context).app_timeline_type_field_label,
          valueTitleMapper: (context, value) =>
              mapTimelineTypeToLabel(context, value),
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );

  const TimelineTypeSingleFromListValueFormFieldRowWidget();
}

String mapTimelineTypeToLabel(BuildContext context, TimelineType type) {
  if(type == null) {
    return S.of(context).app_timeline_type_field_null;
  }
  switch (type) {
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
  throw "Unsupported TimelineType $type";
}
