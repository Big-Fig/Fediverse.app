import 'package:fedi_app/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi_app/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditCustomListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const EditCustomListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditCustomListBloc, ICustomListFormBloc>(
        update: (context, value, previous) => value.customListFormBloc,
        child: child,
      );
}
