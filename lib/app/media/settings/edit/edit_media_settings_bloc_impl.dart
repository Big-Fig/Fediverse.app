import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditMediaSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<MediaSettings>
    implements IEditMediaSettingsBloc {
  final IMediaSettingsBloc mediaSettingsBloc;

  @override
  final IFormBoolFieldBloc autoPlayFieldBloc;

  @override
  final IFormBoolFieldBloc autoInitFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        autoInitFieldBloc,
        autoPlayFieldBloc,
      ];

  EditMediaSettingsBloc({
    @required this.mediaSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool enabled,
  })  : autoPlayFieldBloc = FormBoolFieldBloc(
          originValue: mediaSettingsBloc.autoPlay,
        ),
        autoInitFieldBloc = FormBoolFieldBloc(
          originValue: mediaSettingsBloc.autoInit,
        ),
        super(
          globalOrInstanceSettingsBloc: mediaSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          enabled: enabled,
        ) {
    _subscribeForAutoInitFieldBloc();
    _subscribeForAutoPlay();
  }

  void _subscribeForAutoInitFieldBloc() {
    addDisposable(
      streamSubscription: mediaSettingsBloc.autoInitStream.distinct().listen(
        (newValue) {
          autoInitFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          autoInitFieldBloc.currentValueStream.distinct().listen(
        (value) {
          mediaSettingsBloc.changeAutoInit(value);
        },
      ),
    );
  }

  void _subscribeForAutoPlay() {
    addDisposable(
      streamSubscription: mediaSettingsBloc.autoPlayStream.distinct().listen(
        (newValue) {
          autoPlayFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          autoPlayFieldBloc.currentValueStream.distinct().listen(
        (value) {
          mediaSettingsBloc.changeAutoPlay(value);
        },
      ),
    );
  }

  @override
  MediaSettings calculateCurrentFormFieldsSettings() => MediaSettings(
        autoInit: autoInitFieldBloc.currentValue,
        autoPlay: autoPlayFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(MediaSettings settings) async {
    autoInitFieldBloc.changeCurrentValue(
      settings.autoInit,
    );
    autoPlayFieldBloc.changeCurrentValue(
      settings.autoPlay,
    );
  }
}
