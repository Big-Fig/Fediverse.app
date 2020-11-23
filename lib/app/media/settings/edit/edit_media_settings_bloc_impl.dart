import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_bloc.dart';
import 'package:fedi/app/media/settings/media_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditMediaSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<MediaSettings>
    implements IEditMediaSettingsBloc {
  final IMediaSettingsBloc mediaSettingsBloc;

  @override
  IBoolValueFormFieldBloc autoPlayFieldBloc;

  @override
  IBoolValueFormFieldBloc autoInitFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        autoInitFieldBloc,
        autoPlayFieldBloc,
      ];

  EditMediaSettingsBloc({
    @required this.mediaSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool enabled,
  }) : super(
          globalOrInstanceSettingsBloc: mediaSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          enabled: enabled,
          isAllItemsInitialized: false,
        ) {
    autoPlayFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.autoPlay,
    );

    autoInitFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.autoInit,
    );

    _subscribeForAutoInitFieldBloc();
    _subscribeForAutoPlay();

    onItemsChanged();
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
