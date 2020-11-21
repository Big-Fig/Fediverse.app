import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/form/field/value/form_value_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditPostStatusSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<PostStatusSettings>
    implements IEditPostStatusSettingsBloc {
  final IPostStatusSettingsBloc postStatusSettingsBloc;

  @override
  final IFormValueFieldBloc<PleromaVisibility> defaultVisibilityFormFieldBloc;

  @override
  final IFormBoolFieldBloc markMediaAsNsfwOnAttachFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        defaultVisibilityFormFieldBloc,
        markMediaAsNsfwOnAttachFormFieldBloc,
      ];

  EditPostStatusSettingsBloc({
    @required this.postStatusSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool enabled,
  })  : defaultVisibilityFormFieldBloc = FormValueFieldBloc(
          originValue: postStatusSettingsBloc.defaultVisibility,
          validators: [],
        ),
        markMediaAsNsfwOnAttachFormFieldBloc = FormBoolFieldBloc(
          originValue: postStatusSettingsBloc.markMediaAsNsfwOnAttach,
        ),
        super(
          globalOrInstanceSettingsBloc: postStatusSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          enabled: enabled,
        ) {
    addDisposable(disposable: defaultVisibilityFormFieldBloc);
    addDisposable(disposable: markMediaAsNsfwOnAttachFormFieldBloc);
  }

  @override
  PostStatusSettings calculateCurrentFormFieldsSettings() => PostStatusSettings(
        defaultVisibilityString:
            defaultVisibilityFormFieldBloc.currentValue.toJsonValue(),
        markMediaAsNsfwOnAttach:
            markMediaAsNsfwOnAttachFormFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(PostStatusSettings settings) async {
    defaultVisibilityFormFieldBloc
        .changeCurrentValue(settings.defaultVisibilityPleroma);
    markMediaAsNsfwOnAttachFormFieldBloc
        .changeCurrentValue(settings.markMediaAsNsfwOnAttach);
  }
}
