import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPushSettingsBloc extends IDisposable {
  static IEditPushSettingsBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IEditPushSettingsBloc>(context, listen: listen);

  IFormBoolFieldBloc get favouriteFieldBloc;

  IFormBoolFieldBloc get followFieldBloc;

  IFormBoolFieldBloc get mentionFieldBloc;

  IFormBoolFieldBloc get reblogFieldBloc;

  IFormBoolFieldBloc get pollFieldBloc;

  IFormBoolFieldBloc get pleromaChatMentionFieldBloc;

  IFormBoolFieldBloc get pleromaEmojiReactionFieldBloc;
}
