import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditFilterBloc extends IDisposable {
  static IEditFilterBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditFilterBloc>(context, listen: listen);

  IFilterFormBloc get filterFormBloc;

  bool get isReadyToSubmit;

  Stream<bool> get isReadyToSubmitStream;

  Future<IFilter> submit();

  Future<void> deleteList();

  Stream<IFilter> get submittedStream;

  Stream get deletedStream;

  bool get isPossibleToDelete;
}
