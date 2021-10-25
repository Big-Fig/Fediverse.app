import 'package:fedi_app/app/share/share_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IExternalShareBloc extends IShareBloc {
  static IExternalShareBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IExternalShareBloc>(context, listen: listen);
}
