import 'package:fedi/form/field/form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ValueFormFieldBlocProxyProvider<T> extends StatelessWidget {
  final Widget child;

  ValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IValueFormFieldBloc<T>, IFormFieldBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
