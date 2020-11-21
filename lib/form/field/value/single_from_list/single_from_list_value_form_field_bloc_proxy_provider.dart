import 'package:fedi/form/field/value/single_from_list/single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SingleFromListValueFormFieldBlocProxyProvider<T> extends StatelessWidget {
  final Widget child;

  SingleFromListValueFormFieldBlocProxyProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ISingleFromListValueFormFieldBloc<T>, IValueFormFieldBloc<T>>(
        update: (context, value, previous) => value,
        child: ValueFormFieldBlocProxyProvider<T>(
          child: child,
        ),
      );
}
