import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StringValueFormFieldBlocProxyProvider extends StatelessWidget {
  final Widget child;

  StringValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IStringValueFormFieldBloc, IValueFormFieldBloc<String?>>(
        update: (context, value, previous) => value,
        child: ValueFormFieldBlocProxyProvider<String>(
          child: child,
        ),
      );
}
