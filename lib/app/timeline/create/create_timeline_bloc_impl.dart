import 'dart:developer';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_local_preferences_bloc_impl.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

typedef TimelineSavedCallback = Function(Timeline timeline);

class CreateTimelineBloc extends FormBloc implements ICreateTimelineBloc {
  final TimelineSavedCallback timelineSavedCallback;
  final AuthInstance authInstance;

  @override
  IEditTimelineSettingsBloc get editTimelineSettingsBloc =>
      editTimelineSettingsBlocSubject.value;

  @override
  Stream<IEditTimelineSettingsBloc> get editTimelineSettingsBlocStream =>
      editTimelineSettingsBlocSubject.stream;

  BehaviorSubject<IEditTimelineSettingsBloc> editTimelineSettingsBlocSubject;

  @override
  List<IFormItemBloc> currentItems = [];

  TimelineLocalPreferencesBloc timelineLocalPreferencesBloc;

  @override
  ITimelineSettingsBloc timelineSettingsBloc;

  CreateTimelineBloc({
    @required this.timelineSavedCallback,
    @required this.authInstance,
    @required ILocalPreferencesService localPreferencesService,
  }) : super(false) {
    var timelineId = TimelineSettings.generateUniqueTimelineId();

    var startType = TimelineType.public;

    idFieldBloc = StringValueFormFieldBloc(
      isEnabled: false,
      originValue: timelineId,
      validators: [],
      maxLength: null,
    );

    typeFieldBloc = TimelineTypeSingleFromListValueFormFieldBloc(
      originValue: startType,
      validators: [],
      isNullValuePossible: false,
    );
    nameFieldBloc = StringValueFormFieldBloc(
      originValue: "",
      validators: [
        StringValueFormFieldNonEmptyValidationError.createValidator(),
      ],
      maxLength: 50,
    );

    timelineLocalPreferencesBloc = TimelineLocalPreferencesBloc.byId(
      localPreferencesService,
      userAtHost: authInstance.userAtHost,
      timelineId: timelineId,
      defaultValue: Timeline.byType(
        id: timelineId,
        type: startType,
        settings: TimelineSettings.createDefaultSettings(startType),
        label: null,
        isPossibleToDelete: true,
      ),
    );

    timelineSettingsBloc = TimelineSettingsBloc(
        timelineLocalPreferencesBloc: timelineLocalPreferencesBloc);

    editTimelineSettingsBlocSubject = BehaviorSubject.seeded(
      EditTimelineSettingsBloc(
        settingsBloc: timelineSettingsBloc,
        timelineType: startType,
        authInstance: authInstance,
        isNullableValuesPossible: true,
        isEnabled: true,
      ),
    );

    _onFieldsChanged();

    addDisposable(
      streamSubscription: typeFieldBloc.currentValueStream.listen(
        (timelineType) {
          _onTypeChanged(timelineType);
        },
      ),
    );

    addDisposable(disposable: idFieldBloc);
    addDisposable(disposable: nameFieldBloc);
    addDisposable(disposable: typeFieldBloc);
    addDisposable(disposable: timelineLocalPreferencesBloc);
    addDisposable(disposable: timelineSettingsBloc);
    addDisposable(disposable: editTimelineSettingsBloc);
  }

  void _onTypeChanged(TimelineType timelineType) {
    var oldEditTimelineSettingsBloc = editTimelineSettingsBloc;

    var newEditTimelineSettingsBloc = EditTimelineSettingsBloc(
        settingsBloc: timelineSettingsBloc,
        timelineType: timelineType,
        authInstance: authInstance,
        isNullableValuesPossible: true,
        isEnabled: true);
    timelineLocalPreferencesBloc.setValue(
      Timeline(
        id: idFieldBloc.currentValue,
        typeString: timelineType?.toJsonValue(),
        settings: TimelineSettings.createDefaultSettings(
          timelineType,
        ),
        label: nameFieldBloc.currentValue,
        isPossibleToDelete: true,
      ),
    );

    editTimelineSettingsBlocSubject.add(newEditTimelineSettingsBloc);
    addDisposable(disposable: editTimelineSettingsBloc);

    _onFieldsChanged();

    oldEditTimelineSettingsBloc?.dispose();
  }

  void _onFieldsChanged() {
    currentItems = [
      idFieldBloc,
      nameFieldBloc,
      typeFieldBloc,
      editTimelineSettingsBloc,
    ];
    onItemsChanged();
  }

  @override
  void handleBackPressed() {
    timelineLocalPreferencesBloc.clearValue();
  }

  @override
  IStringValueFormFieldBloc idFieldBloc;

  @override
  IStringValueFormFieldBloc nameFieldBloc;

  @override
  ITimelineTypeSingleFromListValueFormFieldBloc typeFieldBloc;

  @override
  bool get isSomethingChanged => true;

  @override
  Stream<bool> get isSomethingChangedStream => Stream.value(isSomethingChanged);

  @override
  Future save() async {
    var timeline = Timeline(
      id: idFieldBloc.currentValue,
      label: nameFieldBloc.currentValue,
      typeString: typeFieldBloc.currentValue.toJsonValue(),
      isPossibleToDelete: true,
      settings: editTimelineSettingsBloc.currentSettings,
    );
    timelineSavedCallback(timeline);
  }
}
