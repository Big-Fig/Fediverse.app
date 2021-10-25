import 'package:fedi_app/provider/provider_context_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentUnifediApiAccessContextBloc
    extends IProviderContextBloc {
  static ICurrentUnifediApiAccessContextBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ICurrentUnifediApiAccessContextBloc>(context, listen: listen);
}
