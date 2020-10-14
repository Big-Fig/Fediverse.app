import 'package:fedi/app/custom_list/edit/edit_custom_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICreateCustomListBloc extends IEditCustomListBloc {
  static ICreateCustomListBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICreateCustomListBloc>(context, listen: listen);
}
