import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ITimelineSettingsBloc extends Disposable {
  static ITimelineSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ITimelineSettingsBloc>(context, listen: listen);

  IFormBoolFieldBloc get onlyNoRepliesFieldBloc;

  IFormBoolFieldBloc get onlyWithMediaFieldBloc;

  IFormBoolFieldBloc get onlyNoNsfwSensitiveFieldBloc;

  IFormBoolFieldBloc get onlyRemoteFieldBloc;

  IFormBoolFieldBloc get onlyLocalFieldBloc;

  IFormBoolFieldBloc get onlyNotMutedFieldBloc;
}
