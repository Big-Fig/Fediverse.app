import 'package:fedi/app/filter/filter_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilterBloc implements IDisposable {
  static IFilterBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IFilterBloc>(context, listen: listen);

  String get remoteId;

  IFilter get filter;

  Stream<IFilter> get filterStream;

  bool get isExpired;

  Stream<bool> get isExpiredStream;
}
