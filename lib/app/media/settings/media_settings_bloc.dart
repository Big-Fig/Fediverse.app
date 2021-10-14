import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMediaSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<MediaSettings> {
  static IMediaSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMediaSettingsBloc>(context, listen: listen);

  bool get autoInit;

  Stream<bool> get autoInitStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeAutoInit(bool value);

  bool get autoPlay;

  Stream<bool> get autoPlayStream;

  // ignore: avoid_positional_boolean_parameters
  Future changeAutoPlay(bool value);
}
