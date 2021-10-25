import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/custom_list/custom_list_model.dart';
import 'package:fedi_app/app/custom_list/custom_list_model_adapter.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class CustomListNetworkOnlyListBloc extends INetworkOnlyListBloc<ICustomList> {
  final IUnifediApiListService unifediListService;

  CustomListNetworkOnlyListBloc({
    required this.unifediListService,
  });

  @override
  IUnifediApiService get unifediApi => unifediListService;

  static CustomListNetworkOnlyListBloc createFromContext(
    BuildContext context,
  ) =>
      CustomListNetworkOnlyListBloc(
        unifediListService:
            Provider.of<IUnifediApiListService>(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<INetworkOnlyListBloc<ICustomList>>(
        create: CustomListNetworkOnlyListBloc.createFromContext,
        child: ProxyProvider<INetworkOnlyListBloc<ICustomList>,
            INetworkOnlyListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );

  @override
  Future<List<ICustomList>> loadItemsFromRemoteForPage({
    int? pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    if (pageIndex == 0) {
      var unifediLists = await unifediListService.getLists();

      return unifediLists
          .map((unifediList) => unifediList.toCustomList())
          .toList();
    } else {
      return [];
    }
  }
}
