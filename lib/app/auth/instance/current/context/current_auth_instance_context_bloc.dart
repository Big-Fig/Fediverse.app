import 'package:fedi/provider/provider_context_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAuthInstanceContextBloc extends IProviderContextBloc {
  static ICurrentAuthInstanceContextBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<ICurrentAuthInstanceContextBloc>(context, listen: listen);
}
