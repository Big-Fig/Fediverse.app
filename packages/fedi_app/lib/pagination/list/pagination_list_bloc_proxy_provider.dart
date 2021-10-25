import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PaginationListBlocProxyProvider<TPage extends PaginationPage<TItem>,
    TItem> extends StatelessWidget {
  final Widget child;

  const PaginationListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IPaginationListBloc<TPage, TItem>,
          IPaginationListBloc<PaginationPage<TItem>, TItem>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IPaginationListBloc<TPage, TItem>,
            IPaginationListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
