import 'package:fedi/form/field/form_field_bloc.dart';
import 'package:fedi/form/field/info/info_form_field_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InfoFormFieldBlocProxyProvider<T> extends StatelessWidget {
  final Widget child;

  const InfoFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IInfoFormFieldBloc<T>, IFormFieldBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
