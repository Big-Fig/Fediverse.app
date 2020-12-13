import 'package:fedi/app/filter/edit/edit_filter_bloc.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditFilterBlocProxyProvider extends StatelessWidget {
  final Widget child;

  EditFilterBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditFilterBloc, IFilterFormBloc>(
      update: (context, value, previous) => value.filterFormBloc,
      child: child,
    );
  }
}
