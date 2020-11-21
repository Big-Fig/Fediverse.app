import 'dart:developer';

import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

typedef TimelineSavedCallback = Function(Timeline timeline);

class CreateTimelineBloc extends FormBloc implements ICreateTimelineBloc {
  final TimelineSavedCallback timelineSavedCallback;

  @override
  IStringValueFormFieldBloc idFieldBloc = StringValueFormFieldBloc(
    originValue: TimelineSettings.generateUniqueTimelineId(),
    validators: [
      StringValueFormFieldNonEmptyValidationError.createValidator(),
    ],
    maxLength: 50,
  );

  @override
  IStringValueFormFieldBloc nameFieldBloc = StringValueFormFieldBloc(
    originValue: "",
    validators: [
      StringValueFormFieldNonEmptyValidationError.createValidator(),
    ],
    maxLength: 50,
  );

  @override
  IValueFormFieldBloc<TimelineType> typeFieldBloc =
      ValueFormFieldBloc(originValue: TimelineType.public, validators: []);

  @override
  ITimelineSettingsFormBloc settingsFormBloc = TimelineSettingsFormBloc(
    type: TimelineType.public,
    originalSettings: TimelineSettings.createDefaultPublicSettings(),
  );

  CreateTimelineBloc({@required this.timelineSavedCallback}) {
    addDisposable(disposable: nameFieldBloc);
    addDisposable(disposable: typeFieldBloc);
    addDisposable(disposable: settingsFormBloc);

    typeFieldBloc.currentValueStream.listen((type) {
      switch (type) {
        case TimelineType.home:
          settingsFormBloc.fill(
              type: type,
              newSettings: TimelineSettings.createDefaultHomeSettings());
          break;
        case TimelineType.public:
          settingsFormBloc.fill(
              type: type,
              newSettings: TimelineSettings.createDefaultPublicSettings());
          break;
        case TimelineType.customList:
          settingsFormBloc.fill(
            type: type,
            newSettings: TimelineSettings.createDefaultCustomListSettings(
                onlyInRemoteList: null),
          );
          break;

        case TimelineType.hashtag:
          settingsFormBloc.fill(
            type: type,
            newSettings: TimelineSettings.createDefaultHashtagSettings(
                withRemoteHashtag: null),
          );
          break;
        case TimelineType.account:
          settingsFormBloc.fill(
            type: type,
            newSettings: TimelineSettings.createDefaultAccountSettings(
                onlyFromRemoteAccount: null),
          );
          break;
      }
    });
  }

  @override
  List<IFormItemBloc> get currentItems => [
        nameFieldBloc,
        typeFieldBloc,
        settingsFormBloc,
      ];

  @override
  Future save() async {
    var timeline = Timeline(
      id: idFieldBloc.currentValue,
      label: nameFieldBloc.currentValue,
      typeString: typeFieldBloc.currentValue.toJsonValue(),
      isPossibleToDelete: true,
      settings: settingsFormBloc.timelineSettings,
    );
    timelineSavedCallback(timeline);
  }
}
