import 'package:fedi_app/form/field/value/select_from_list/select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SelectFromListValueFormFieldBlocProxyProvider<T> extends StatelessWidget {
  final Widget child;

  const SelectFromListValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ISelectFromListValueFormFieldBloc<T>, IValueFormFieldBloc<T?>>(
        update: (context, value, previous) => value,
        child: ValueFormFieldBlocProxyProvider<T?>(
          child: child,
        ),
      );
}
