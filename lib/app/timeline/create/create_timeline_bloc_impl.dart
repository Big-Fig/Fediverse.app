import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_non_null_value_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';

class CreateTimelineBloc extends FormBloc implements ICreateTimelineBloc {
  @override
  IFormValueFieldBloc<TimelineType> timelineTypeFieldBloc =
      FormValueFieldBloc(originValue: TimelineType.public, validators: []);

  @override
  IFormStringFieldBloc nameFieldBloc = FormStringFieldBloc(
    originValue: "",
    validators: [
      FormNonEmptyStringFieldValidationError.createValidator(),
    ],
    maxLength: 50,
  );

  @override
  final IFormValueFieldBloc<TimelineSettings> timelineSettingsFieldBloc =
      FormValueFieldBloc<TimelineSettings>(
          originValue: TimelineSettings.createDefaultPublicSettings(
            id: TimelineSettings.generateUniqueTimelineId(),
          ),
          validators: [FormNonNullValueFieldValidationError.createValidator()]);

  CreateTimelineBloc() {
    addDisposable(disposable: timelineTypeFieldBloc);
    addDisposable(disposable: timelineSettingsFieldBloc);
    addDisposable(disposable: nameFieldBloc);

    timelineTypeFieldBloc.currentValueStream.listen((type) {
      switch (type) {
        case TimelineType.public:
          timelineSettingsFieldBloc
              .changeCurrentValue(TimelineSettings.createDefaultPublicSettings(
            id: TimelineSettings.generateUniqueTimelineId(),
          ));
          break;
        case TimelineType.customList:
          timelineSettingsFieldBloc.changeCurrentValue(
              TimelineSettings.createDefaultCustomListSettings(
            id: TimelineSettings.generateUniqueTimelineId(),
            onlyInListWithRemoteId: null,
          ));
          break;
        case TimelineType.home:
          timelineSettingsFieldBloc
              .changeCurrentValue(TimelineSettings.createDefaultHomeSettings(
            id: TimelineSettings.generateUniqueTimelineId(),
          ));
          break;
        case TimelineType.hashtag:
          timelineSettingsFieldBloc
              .changeCurrentValue(TimelineSettings.createDefaultHashtagSettings(
            id: TimelineSettings.generateUniqueTimelineId(),
            withHashtag: null,
          ));
          break;
        case TimelineType.account:
          timelineSettingsFieldBloc
              .changeCurrentValue(TimelineSettings.createDefaultAccountSettings(
            id: TimelineSettings.generateUniqueTimelineId(),
            onlyFromAccountWithRemoteId: null,
          ));
          break;
      }
    });
  }

  @override
  void clear() {
    nameFieldBloc.clear();
    timelineTypeFieldBloc.clear();
    timelineSettingsFieldBloc.clear();
  }

  @override
  List<IFormItemBloc> get items => [
        nameFieldBloc,
        timelineTypeFieldBloc,
        timelineSettingsFieldBloc,
      ];

  @override
  Future save() {
    // TODO: implement save
    throw UnimplementedError();
  }
}
