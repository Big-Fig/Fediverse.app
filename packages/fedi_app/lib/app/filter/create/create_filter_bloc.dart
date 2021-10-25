import 'package:fedi_app/app/filter/edit/edit_filter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICreateFilterBloc extends IEditFilterBloc {
  static ICreateFilterBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICreateFilterBloc>(context, listen: listen);
}
