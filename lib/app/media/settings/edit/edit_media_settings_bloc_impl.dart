import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditMediaSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditMediaSettingsBloc {
  final IMediaSettingsBloc mediaSettingsBloc;

  @override
  final IFormBoolFieldBloc autoPlayFieldBloc;

  @override
  final IFormBoolFieldBloc autoInitFieldBloc;

  EditMediaSettingsBloc({
    @required this.mediaSettingsBloc,
  })  : autoPlayFieldBloc = FormBoolFieldBloc(
          originValue: mediaSettingsBloc.autoPlay,
          isEnabled: mediaSettingsBloc.isInstance,
          isEnabledStream: mediaSettingsBloc.isInstanceStream,
        ),
        autoInitFieldBloc = FormBoolFieldBloc(
          originValue: mediaSettingsBloc.autoInit,
          isEnabled: mediaSettingsBloc.isInstance,
          isEnabledStream: mediaSettingsBloc.isInstanceStream,
        ), super(mediaSettingsBloc) {
    _subscribeForAutoInitFieldBloc();
    _subscribeForAutoPlay();
  }

  void _subscribeForAutoInitFieldBloc() {
    addDisposable(
      streamSubscription:
          mediaSettingsBloc.autoInitStream.distinct().listen(
        (newValue) {
          autoInitFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: autoInitFieldBloc.currentValueStream.listen(
        (value) {
          mediaSettingsBloc.changeAutoInit(value);
        },
      ),
    );
  }

  void _subscribeForAutoPlay() {
    addDisposable(
      streamSubscription:
          mediaSettingsBloc.autoPlayStream.distinct().listen(
        (newValue) {
          autoPlayFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: autoPlayFieldBloc.currentValueStream.listen(
        (value) {
          mediaSettingsBloc.changeAutoPlay(value);
        },
      ),
    );
  }
}
