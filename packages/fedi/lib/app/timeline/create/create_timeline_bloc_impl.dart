import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
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
import 'package:fedi/id/fake_id_helper.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

typedef TimelineSavedCallback = FutureOr<void> Function(Timeline timeline);

class CreateTimelineBloc extends FormBloc implements ICreateTimelineBloc {
  final TimelineSavedCallback timelineSavedCallback;
  final UnifediApiAccess authInstance;

  @override
  IEditTimelineSettingsBloc? get editTimelineSettingsBloc =>
      editTimelineSettingsBlocSubject.valueOrNull;

  @override
  Stream<IEditTimelineSettingsBloc?> get editTimelineSettingsBlocStream =>
      editTimelineSettingsBlocSubject.stream;

  // ignore: avoid-late-keyword
  late BehaviorSubject<IEditTimelineSettingsBloc?>
      editTimelineSettingsBlocSubject;

  @override
  // ignore: avoid-late-keyword
  late List<IFormItemBloc> currentItems = [];

  // ignore: avoid-late-keyword
  late TimelineLocalPreferenceBloc timelineLocalPreferencesBloc;

  @override
  // ignore: avoid-late-keyword
  late ITimelineSettingsBloc timelineSettingsBloc;

  final IWebSocketsSettingsBloc webSocketsSettingsBloc;

  CreateTimelineBloc({
    required this.timelineSavedCallback,
    required this.authInstance,
    required this.webSocketsSettingsBloc,
    required ILocalPreferencesService localPreferencesService,
  }) : super(isAllItemsInitialized: false) {
    var timelineId = FakeIdHelper.generateUniqueId();

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

    typeFieldBloc.currentValueStream
        .listen(
          _onTypeChanged,
        )
        .disposeWith(this);

    addDisposable(idFieldBloc);
    addDisposable(nameFieldBloc);
    addDisposable(typeFieldBloc);
    addDisposable(timelineLocalPreferencesBloc);
    addDisposable(timelineSettingsBloc);
    addDisposable(editTimelineSettingsBloc!);
  }

  EditTimelineSettingsBloc _createEditTimelineSettingsBloc(
    TimelineType startType,
  ) =>
      EditTimelineSettingsBloc(
        settingsBloc: timelineSettingsBloc,
        timelineType: startType,
        unifediApiInstance: authInstance.info!,
        isNullableValuesPossible: true,
        isEnabled: true,
        webSocketsSettingsBloc: webSocketsSettingsBloc,
        instanceLocation: InstanceLocation.local,
      );

  TimelineLocalPreferenceBloc _createTimelineLocalPreferencesBloc({
    required ILocalPreferencesService localPreferencesService,
    required String timelineId,
    required TimelineType startType,
  }) =>
      TimelineLocalPreferenceBloc.byId(
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

  StringValueFormFieldBloc _createNameField() => StringValueFormFieldBloc(
        originValue: '',
        validators: [
          StringValueFormFieldNonEmptyValidationError.createValidator(),
        ],
        // ignore: no-magic-number
        maxLength: 50,
      );

  TimelineTypeSingleFromListValueFormFieldBloc _createTypeField(
    TimelineType startType,
  ) =>
      TimelineTypeSingleFromListValueFormFieldBloc(
        originValue: startType,
        validators: [],
        isNullValuePossible: false,
      );

  StringValueFormFieldBloc _createIdField(String timelineId) =>
      StringValueFormFieldBloc(
        isEnabled: false,
        originValue: timelineId,
        validators: [],
        maxLength: null,
      );

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
    addDisposable(editTimelineSettingsBloc!);

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
  // ignore: avoid-late-keyword
  late IStringValueFormFieldBloc idFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IStringValueFormFieldBloc nameFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late ITimelineTypeSingleFromListValueFormFieldBloc typeFieldBloc;

  @override
  bool get isSomethingChanged => true;

  @override
  Stream<bool> get isSomethingChangedStream => Stream.value(isSomethingChanged);

  @override
  Future<void> save() async {
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
