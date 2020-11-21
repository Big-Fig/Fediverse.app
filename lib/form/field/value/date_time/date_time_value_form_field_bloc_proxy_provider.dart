import 'package:fedi/form/field/value/date_time/date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DateTimeValueFormFieldBlocProxyProvider extends StatelessWidget {
  final Widget child;

  DateTimeValueFormFieldBlocProxyProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IDateTimeValueFormFieldBloc, IValueFormFieldBloc<DateTime>>(
        update: (context, value, previous) => value,
        child: ValueFormFieldBlocProxyProvider<DateTime>(
          child: child,
        ),
      );
}
