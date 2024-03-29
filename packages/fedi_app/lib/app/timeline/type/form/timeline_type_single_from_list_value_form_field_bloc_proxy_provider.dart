import 'package:fedi_app/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/timeline/type/timeline_type_model.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TimelineTypeSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const TimelineTypeSingleFromListValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ITimelineTypeSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<TimelineType>>(
        update: (context, value, previous) => value,
        child:
            SingleSelectFromListValueFormFieldBlocProxyProvider<TimelineType>(
          child: child,
        ),
      );
}
