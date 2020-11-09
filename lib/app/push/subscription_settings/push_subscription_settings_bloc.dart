import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSubscriptionSettingsBloc extends IDisposable {
  static IPushSubscriptionSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPushSubscriptionSettingsBloc>(context, listen: listen);

  Future subscribeAllEnabled();

  bool get isHaveSubscription;

  Stream<bool> get failedToUpdateStream;

  IFormBoolFieldBloc get favouriteFieldBloc;

  IFormBoolFieldBloc get followFieldBloc;

  IFormBoolFieldBloc get mentionFieldBloc;

  IFormBoolFieldBloc get reblogFieldBloc;

  IFormBoolFieldBloc get pollFieldBloc;

  IFormBoolFieldBloc get chatFieldBloc;
}
