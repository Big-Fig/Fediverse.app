import 'package:fedi_app/form/field/form_field_bloc.dart';
import 'package:fedi_app/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ValueFormFieldBlocProxyProvider<T> extends StatelessWidget {
  final Widget child;

  const ValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IValueFormFieldBloc<T>, IFormFieldBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
