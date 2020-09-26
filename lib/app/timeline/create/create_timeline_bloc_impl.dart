import 'package:fedi/app/timeline/create/create_timeline_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_form_bloc_impl.dart';
import 'package:fedi/app/timeline/settings/timeline_settings_model.dart';
import 'package:fedi/app/timeline/timeline_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';

class CreateTimelineBloc extends FormBloc implements ICreateTimelineBloc {
  @override
  IFormStringFieldBloc idFieldBloc = FormStringFieldBloc(
    originValue: TimelineSettings.generateUniqueTimelineId(),
    validators: [
      FormNonEmptyStringFieldValidationError.createValidator(),
    ],
    maxLength: 50,
  );

  @override
  IFormStringFieldBloc nameFieldBloc = FormStringFieldBloc(
    originValue: "",
    validators: [
      FormNonEmptyStringFieldValidationError.createValidator(),
    ],
    maxLength: 50,
  );

  @override
  IFormValueFieldBloc<TimelineType> typeFieldBloc =
      FormValueFieldBloc(originValue: TimelineType.public, validators: []);

  @override
  final ITimelineSettingsFormBloc settingsFormBloc = TimelineSettingsFormBloc(
      originalSettings: TimelineSettings.createDefaultPublicSettings());

  CreateTimelineBloc() {
    addDisposable(disposable: nameFieldBloc);
    addDisposable(disposable: typeFieldBloc);
    addDisposable(disposable: settingsFormBloc);

    typeFieldBloc.currentValueStream.listen((type) {
      switch (type) {
        case TimelineType.home:
          settingsFormBloc.fill(TimelineSettings.createDefaultHomeSettings());
          break;
        case TimelineType.public:
          settingsFormBloc.fill(TimelineSettings.createDefaultPublicSettings());
          break;
        case TimelineType.customList:
          settingsFormBloc.fill(
            TimelineSettings.createDefaultCustomListSettings(
                onlyInRemoteList: null),
          );
          break;

        case TimelineType.hashtag:
          settingsFormBloc.fill(
            TimelineSettings.createDefaultHashtagSettings(
                withRemoteHashtag: null),
          );
          break;
        case TimelineType.account:
          settingsFormBloc.fill(
            TimelineSettings.createDefaultAccountSettings(
                onlyFromRemoteAccount: null),
          );
          break;
      }
    });
  }

  @override
  List<IFormItemBloc> get items => [
        nameFieldBloc,
        typeFieldBloc,
        settingsFormBloc,
      ];

  @override
  Future save() {
    // TODO: implement save
    throw UnimplementedError();
  }
}
