import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountSettingsBloc extends IDisposable {
  static IMyAccountSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMyAccountSettingsBloc>(context, listen: listen);

  FormBoolFieldBloc get isRealtimeWebSocketsEnabledFieldBloc;

  FormBoolFieldBloc get isNewChatsEnabledFieldBloc;

  FormBoolFieldBloc get isAlwaysShowSpoilerFieldBloc;

  FormBoolFieldBloc get isAlwaysShowNsfwFieldBloc;

  FormValueFieldBloc<PleromaVisibility> get defaultVisibilityFieldBloc;

  FormBoolFieldBloc get markMediaNsfwByDefaultFieldBloc;

  FormBoolFieldBloc get foregroundSoundForChatAndDmFieldBloc;

  FormBoolFieldBloc get foregroundSoundForMentionFieldBloc;

  FormBoolFieldBloc get mediaAutoInitFieldBloc;

  FormBoolFieldBloc get mediaAutoPlayFieldBloc;
}
