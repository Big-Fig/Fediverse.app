import 'package:fedi_app/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DurationValueFormFieldBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const DurationValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IDurationValueFormFieldBloc, IValueFormFieldBloc<Duration?>>(
        update: (context, value, previous) => value,
        child: ValueFormFieldBlocProxyProvider<Duration?>(
          child: child,
        ),
      );
}
