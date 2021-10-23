import 'package:fedi/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditFilterBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const EditFilterBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditFilterBloc, IFilterFormBloc>(
        update: (context, value, previous) => value.filterFormBloc,
        child: child,
      );
}
