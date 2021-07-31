import 'package:fedi/app/status/visibility/form/single_from_list/status_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusVisibilitySelectSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  StatusVisibilitySelectSingleFromListValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IStatusVisibilitySelectSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<PleromaApiVisibility>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            PleromaApiVisibility>(
          child: child,
        ),
      );
}
