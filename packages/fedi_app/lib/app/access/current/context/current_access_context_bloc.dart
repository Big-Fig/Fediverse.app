import 'package:fedi_app/provider/provider_context_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentAccessContextBloc extends IProviderContextBloc {
  static ICurrentAccessContextBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICurrentAccessContextBloc>(context, listen: listen);
}
