import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MultiSelectFromListValueFormFieldBlocProxyProvider<T>
    extends StatelessWidget {
  final Widget child;

  MultiSelectFromListValueFormFieldBlocProxyProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IMultiSelectFromListValueFormFieldBloc<T>,
          ISelectFromListValueFormFieldBloc<List<T>>>(
        update: (context, value, previous) => value,
        child: SelectFromListValueFormFieldBlocProxyProvider<List<T>>(
          child: child,
        ),
      );
}
