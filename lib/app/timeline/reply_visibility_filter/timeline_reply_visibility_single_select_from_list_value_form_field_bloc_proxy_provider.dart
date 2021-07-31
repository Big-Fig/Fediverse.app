import 'package:fedi/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
              PleromaApiReplyVisibilityFilter?>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            PleromaApiReplyVisibilityFilter?>(
          child: child,
        ),
      );
}
