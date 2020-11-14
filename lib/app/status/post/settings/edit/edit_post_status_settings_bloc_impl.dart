import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditPostStatusSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditPostStatusSettingsBloc {
  final IPostStatusSettingsBloc postStatusSettingBloc;

  @override
  final IFormValueFieldBloc<PleromaVisibility> defaultVisibilityFormFieldBloc;

  @override
  final IFormBoolFieldBloc markMediaAsNsfwOnAttachFormFieldBloc;

  EditPostStatusSettingsBloc({
    @required this.postStatusSettingBloc,
  })  : defaultVisibilityFormFieldBloc = FormValueFieldBloc(
          originValue: postStatusSettingBloc.defaultVisibility,
          validators: [],
          isEnabled: postStatusSettingBloc.isInstance,
          isEnabledStream: postStatusSettingBloc.isInstanceStream,
        ),
        markMediaAsNsfwOnAttachFormFieldBloc = FormBoolFieldBloc(
          originValue: postStatusSettingBloc.markMediaAsNsfwOnAttach,
          isEnabled: postStatusSettingBloc.isInstance,
          isEnabledStream: postStatusSettingBloc.isInstanceStream,
        ) {
    _subscribeForMarkMediaAsNsfwOnAttach();

    _subscribeForDefaultVisibility();
  }

  void _subscribeForDefaultVisibility() {
    addDisposable(
      streamSubscription:
          postStatusSettingBloc.defaultVisibilityStream.distinct().listen(
        (newValue) {
          defaultVisibilityFormFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          defaultVisibilityFormFieldBloc.currentValueStream.listen(
        (value) {
          postStatusSettingBloc.changeDefaultVisibility(value);
        },
      ),
    );
  }

  void _subscribeForMarkMediaAsNsfwOnAttach() {
    addDisposable(
      streamSubscription:
          postStatusSettingBloc.markMediaAsNsfwOnAttachStream.distinct().listen(
        (newValue) {
          markMediaAsNsfwOnAttachFormFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          markMediaAsNsfwOnAttachFormFieldBloc.currentValueStream.listen(
        (value) {
          postStatusSettingBloc.changeMarkMediaAsNsfwOnAttach(value);
        },
      ),
    );
  }
}
