import 'package:fedi/app/custom_list/custom_list_bloc.dart';
import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';

class CustomListBloc extends DisposableOwner implements ICustomListBloc {
  final IPleromaApiListService pleromaListService;

  BehaviorSubject<ICustomList?> customListSubject;

  CustomListBloc({
    required ICustomList? customList,
    required this.pleromaListService,
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
        pleromaListService: IPleromaApiListService.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required ICustomList customList,
  }) {
    return DisposableProvider<ICustomListBloc>(
      create: (context) => CustomListBloc.createFromContext(
        context,
        customList: customList,
      ),
      child: child,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomListBloc &&
          runtimeType == other.runtimeType &&
          customList == other.customList;

  @override
  int get hashCode => customList.hashCode;
}
