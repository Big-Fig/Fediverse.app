import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_adapter.dart';
import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/duration_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DurationDateTimeValueFormFieldBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const DurationDateTimeValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IDurationDateTimeValueFormFieldBloc, IDurationValueFormFieldBloc>(
        update: (context, value, previous) =>
            DurationDateTimeValueFormFieldBlocAdapter(value),
        child: DurationValueFormFieldBlocProxyProvider(
          child: child,
        ),
      );
}
