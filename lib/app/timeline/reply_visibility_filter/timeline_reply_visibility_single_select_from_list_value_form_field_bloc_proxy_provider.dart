import 'package:fedi/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ITimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<
              UnifediApiReplyVisibilityFilter?>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            UnifediApiReplyVisibilityFilter?>(
          child: child,
        ),
      );
}
