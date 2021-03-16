import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BoolValueFormFieldBlocProxyProvider extends StatelessWidget {
  final Widget child;

  BoolValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IBoolValueFormFieldBloc, IValueFormFieldBloc<bool?>>(
        update: (context, value, previous) => value,
        child: ValueFormFieldBlocProxyProvider<bool>(
          child: child,
        ),
      );
}
