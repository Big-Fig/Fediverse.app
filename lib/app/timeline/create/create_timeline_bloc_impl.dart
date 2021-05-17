import 'dart:developer';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/edit/edit_timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:rxdart/rxdart.dart';

typedef TimelineSavedCallback = Function(Timeline timeline);

class CreateTimelineBloc extends FormBloc implements ICreateTimelineBloc {
  final TimelineSavedCallback timelineSavedCallback;
  final AuthInstance authInstance;

  @override
  IEditTimelineSettingsBloc? get editTimelineSettingsBloc =>
      editTimelineSettingsBlocSubject.value;

  @override
  Stream<IEditTimelineSettingsBloc?> get editTimelineSettingsBlocStream =>
      editTimelineSettingsBlocSubject.stream;

  late BehaviorSubject<IEditTimelineSettingsBloc?>
      editTimelineSettingsBlocSubject;

  @override
  late List<IFormItemBloc> currentItems = [];

  late TimelineLocalPreferenceBloc timelineLocalPreferencesBloc;

  @override
  late ITimelineSettingsBloc timelineSettingsBloc;

  final IWebSocketsSettingsBloc webSocketsSettingsBloc;

  CreateTimelineBloc({
    required this.timelineSavedCallback,
    required this.authInstance,
    required this.webSocketsSettingsBloc,
    required ILocalPreferencesService localPreferencesService,
  }) : super(isAllItemsInitialized: false) {
    var timelineId = TimelineSettings.generateUniqueTimelineId();

    var startType = TimelineType.public;
    timelineLocalPreferencesBloc = _createTimelineLocalPreferencesBloc(
      localPreferencesService: localPreferencesService,
      timelineId: timelineId,
      startType: startType,
    );

    timelineSettingsBloc = TimelineSettingsBloc(
      timelineLocalPreferencesBloc: timelineLocalPreferencesBloc,
    );

    idFieldBloc = _createIdField(timelineId);

    typeFieldBloc = _createTypeField(startType);
    nameFieldBloc = _createNameField();

    editTimelineSettingsBlocSubject = BehaviorSubject.seeded(
      _createEditTimelineSettingsBloc(startType),
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

  EditTimelineSettingsBloc _createEditTimelineSettingsBloc(
    TimelineType startType,
  ) {
    return EditTimelineSettingsBloc(
      settingsBloc: timelineSettingsBloc,
      timelineType: startType,
      authInstance: authInstance,
      isNullableValuesPossible: true,
      isEnabled: true,
      webSocketsSettingsBloc: webSocketsSettingsBloc,
    );
  }

  TimelineLocalPreferenceBloc _createTimelineLocalPreferencesBloc({
    required ILocalPreferencesService localPreferencesService,
    required String timelineId,
    required TimelineType startType,
  }) {
    return TimelineLocalPreferenceBloc.byId(
      localPreferencesService,
      userAtHost: authInstance.userAtHost,
      timelineId: timelineId,
      defaultPreferenceValue: Timeline.byType(
        id: timelineId,
        type: startType,
        settings: TimelineSettings.createDefaultSettings(startType),
        label: null,
        isPossibleToDelete: true,
      ),
    );
  }

  StringValueFormFieldBloc _createNameField() {
    return StringValueFormFieldBloc(
      originValue: '',
      validators: [
        StringValueFormFieldNonEmptyValidationError.createValidator(),
      ],
      // ignore: no-magic-number
      maxLength: 50,
    );
  }

  TimelineTypeSingleFromListValueFormFieldBloc _createTypeField(
    TimelineType startType,
  ) {
    return TimelineTypeSingleFromListValueFormFieldBloc(
      originValue: startType,
      validators: [],
      isNullValuePossible: false,
    );
  }

  StringValueFormFieldBloc _createIdField(String timelineId) {
    return StringValueFormFieldBloc(
      isEnabled: false,
      originValue: timelineId,
      validators: [],
      maxLength: null,
    );
  }

  void _onTypeChanged(TimelineType timelineType) {
    var oldEditTimelineSettingsBloc = editTimelineSettingsBloc;

    var newEditTimelineSettingsBloc =
        _createEditTimelineSettingsBloc(timelineType);
    timelineLocalPreferencesBloc.setValue(
      Timeline(
        id: idFieldBloc.currentValue,
        typeString: timelineType.toJsonValue(),
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
      if (editTimelineSettingsBloc != null) editTimelineSettingsBloc!,
    ];
    onFormItemsChanged();
  }

  @override
  void handleBackPressed() {
    timelineLocalPreferencesBloc.clearValue();
  }

  @override
  late IStringValueFormFieldBloc idFieldBloc;

  @override
  late IStringValueFormFieldBloc nameFieldBloc;

  @override
  late ITimelineTypeSingleFromListValueFormFieldBloc typeFieldBloc;

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
      settings: editTimelineSettingsBloc!.currentSettings!,
    );
    timelineSavedCallback(timeline);
  }
}
