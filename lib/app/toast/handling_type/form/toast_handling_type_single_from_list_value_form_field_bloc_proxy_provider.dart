import 'package:fedi/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/form/field/value/single_from_list/single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/single_from_list/single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ToastHandlingTypeSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  ToastHandlingTypeSingleFromListValueFormFieldBlocProxyProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IToastHandlingTypeSingleFromListValueFormFieldBloc,
          ISingleFromListValueFormFieldBloc<ToastHandlingType>>(
        update: (context, value, previous) => value,
        child: SingleFromListValueFormFieldBlocProxyProvider<ToastHandlingType>(
          child: child,
        ),
      );
}
