import 'package:fedi/form/field/value/list/list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ListValueFormFieldBlocProxyProvider<T> extends StatelessWidget {
  final Widget child;

  ListValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IListValueFormFieldBloc<T>, IValueFormFieldBloc<List<T>?>>(
        update: (context, value, previous) => value,
        child: ValueFormFieldBlocProxyProvider<List<T>?>(
          child: child,
        ),
      );
}
