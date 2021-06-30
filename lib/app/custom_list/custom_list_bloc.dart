import 'package:fedi/app/custom_list/custom_list_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICustomListBloc implements IDisposable {
  static ICustomListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICustomListBloc>(context, listen: listen);

  ICustomList? get customList;

  Stream<ICustomList?> get customListStream;

  String? get title;

  Stream<String?> get titleStream;

  Stream get deletedStream;

  void updateList(ICustomList? customList);
}
