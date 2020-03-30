
import 'package:fedi/refactored/provider/provider_context_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentInstanceContextBloc extends IProviderContextBloc {
  static ICurrentInstanceContextBloc of(BuildContext context,
      {bool listen = true}) =>
      Provider.of<ICurrentInstanceContextBloc>(context, listen: listen);

}
