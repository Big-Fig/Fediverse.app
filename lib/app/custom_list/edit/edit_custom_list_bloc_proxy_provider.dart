import 'package:fedi/app/custom_list/accounts/custom_list_account_network_only_list_bloc.dart';
import 'package:fedi/app/custom_list/accounts/custom_list_account_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:fedi/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditCustomListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  EditCustomListBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditCustomListBloc, ICustomListFormBloc>(
      update: (context, value, previous) => value.customListFormBloc,
      child: ProxyProvider<IEditCustomListBloc,
          ICustomListAccountNetworkOnlyListBloc>(
        update: (context, value, previous) => value.customListAccountListBloc,
        child: CustomListAccountListBlocProxyProvider(
          child: child,
        ),
      ),
    );
  }
}
