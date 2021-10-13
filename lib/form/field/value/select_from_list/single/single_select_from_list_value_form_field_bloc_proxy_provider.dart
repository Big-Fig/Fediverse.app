import 'package:fedi/form/field/value/select_from_list/select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SingleSelectFromListValueFormFieldBlocProxyProvider<T>
    extends StatelessWidget {
  final Widget child;

  const SingleSelectFromListValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ISingleSelectFromListValueFormFieldBloc<T>,
          ISelectFromListValueFormFieldBloc<T>>(
        update: (context, value, previous) => value,
        child: SelectFromListValueFormFieldBlocProxyProvider<T>(
          child: child,
        ),
      );
}
