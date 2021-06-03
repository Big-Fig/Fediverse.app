import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PaginationBlocProxyProvider<TPage extends PaginationPage<TItem>, TItem>
    extends StatelessWidget {
  final Widget child;

  PaginationBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IPaginationBloc<TPage, TItem>,
        IPaginationBloc<PaginationPage<TItem>, TItem>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IPaginationBloc<TPage, TItem>, IPaginationBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
