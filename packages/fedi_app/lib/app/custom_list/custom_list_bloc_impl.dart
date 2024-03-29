import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/app/custom_list/custom_list_bloc.dart';
import 'package:fedi_app/app/custom_list/custom_list_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class CustomListBloc extends DisposableOwner implements ICustomListBloc {
  final IUnifediApiListService unifediListService;

  BehaviorSubject<ICustomList?> customListSubject;

  CustomListBloc({
    required ICustomList? customList,
    required this.unifediListService,
  }) : customListSubject = BehaviorSubject.seeded(customList) {
    customListSubject.disposeWith(this);
  }

  // todo: rework this logic
  @override
  Stream get deletedStream =>
      customListStream.where((customList) => customList == null);

  @override
  ICustomList? get customList => customListSubject.value!;

  @override
  Stream<ICustomList?> get customListStream => customListSubject.stream;

  @override
  void updateList(ICustomList? customList) {
    customListSubject.add(customList);
  }

  @override
  String? get title => customList!.title;

  @override
  Stream<String?> get titleStream =>
      customListStream.map((customList) => customList!.title);

  static CustomListBloc createFromContext(
    BuildContext context, {
    required ICustomList customList,
  }) =>
      CustomListBloc(
        customList: customList,
        unifediListService: Provider.of<IUnifediApiListService>(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required ICustomList customList,
  }) =>
      DisposableProvider<ICustomListBloc>(
        create: (context) => CustomListBloc.createFromContext(
          context,
          customList: customList,
        ),
        child: child,
      );
}
