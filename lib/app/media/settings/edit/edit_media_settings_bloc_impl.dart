import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditMediaSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditMediaSettingsBloc {
  final IMediaSettingsBloc mediaSettingBloc;

  @override
  final IFormBoolFieldBloc autoPlayFieldBloc;

  @override
  final IFormBoolFieldBloc autoInitFieldBloc;

  EditMediaSettingsBloc({
    @required this.mediaSettingBloc,
  })  : autoPlayFieldBloc = FormBoolFieldBloc(
          originValue: mediaSettingBloc.autoPlay,
          isEnabled: mediaSettingBloc.isInstance,
          isEnabledStream: mediaSettingBloc.isInstanceStream,
        ),
        autoInitFieldBloc = FormBoolFieldBloc(
          originValue: mediaSettingBloc.autoInit,
          isEnabled: mediaSettingBloc.isInstance,
          isEnabledStream: mediaSettingBloc.isInstanceStream,
        ) {
    _subscribeForAutoInitFieldBloc();
    _subscribeForAutoPlay();
  }

  void _subscribeForAutoInitFieldBloc() {
    addDisposable(
      streamSubscription:
          mediaSettingBloc.autoInitStream.distinct().listen(
        (newValue) {
          autoInitFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: autoInitFieldBloc.currentValueStream.listen(
        (value) {
          mediaSettingBloc.changeAutoInit(value);
        },
      ),
    );
  }

  void _subscribeForAutoPlay() {
    addDisposable(
      streamSubscription:
          mediaSettingBloc.autoPlayStream.distinct().listen(
        (newValue) {
          autoPlayFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: autoPlayFieldBloc.currentValueStream.listen(
        (value) {
          mediaSettingBloc.changeAutoPlay(value);
        },
      ),
    );
  }
}
