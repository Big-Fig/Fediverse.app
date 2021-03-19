import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:fedi/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CustomListNetworkOnlyListBloc extends INetworkOnlyListBloc<ICustomList> {
  final IPleromaListService pleromaListService;

  CustomListNetworkOnlyListBloc({
    required this.pleromaListService,
  });

  @override
  IPleromaApi get pleromaApi => pleromaListService;

  static CustomListNetworkOnlyListBloc createFromContext(BuildContext context) {
    return CustomListNetworkOnlyListBloc(
      pleromaListService: IPleromaListService.of(context, listen: false),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<INetworkOnlyListBloc<ICustomList>>(
      create: (context) =>
          CustomListNetworkOnlyListBloc.createFromContext(context),
      child: ProxyProvider<INetworkOnlyListBloc<ICustomList>,
          INetworkOnlyListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }

  @override
  Future<List<ICustomList>> loadItemsFromRemoteForPage({
    int? pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    if (pageIndex == 0) {
      var pleromaLists = await pleromaListService.getLists();
      return pleromaLists
          .map((pleromaList) => pleromaList.toCustomList())
          .toList();
    } else {
      return [];
    }
  }
}
