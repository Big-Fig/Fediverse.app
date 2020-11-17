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
  final IPostStatusSettingsBloc postStatusSettingsBloc;

  @override
  final IFormValueFieldBloc<PleromaVisibility> defaultVisibilityFormFieldBloc;

  @override
  final IFormBoolFieldBloc markMediaAsNsfwOnAttachFormFieldBloc;

  EditPostStatusSettingsBloc({
    @required this.postStatusSettingsBloc,
  })  : defaultVisibilityFormFieldBloc = FormValueFieldBloc(
          originValue: postStatusSettingsBloc.defaultVisibility,
          validators: [],
          isEnabled: postStatusSettingsBloc.isInstanceOrForceGlobal,
          isEnabledStream: postStatusSettingsBloc.isInstanceOrForceGlobalStream,
        ),
        markMediaAsNsfwOnAttachFormFieldBloc = FormBoolFieldBloc(
          originValue: postStatusSettingsBloc.markMediaAsNsfwOnAttach,
          isEnabled: postStatusSettingsBloc.isInstanceOrForceGlobal,
          isEnabledStream: postStatusSettingsBloc.isInstanceOrForceGlobalStream,
        ), super(postStatusSettingsBloc) {
    _subscribeForMarkMediaAsNsfwOnAttach();

    _subscribeForDefaultVisibility();
  }

  void _subscribeForDefaultVisibility() {
    addDisposable(
      streamSubscription:
          postStatusSettingsBloc.defaultVisibilityStream.distinct().listen(
        (newValue) {
          defaultVisibilityFormFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          defaultVisibilityFormFieldBloc.currentValueStream.listen(
        (value) {
          postStatusSettingsBloc.changeDefaultVisibility(value);
        },
      ),
    );
  }

  void _subscribeForMarkMediaAsNsfwOnAttach() {
    addDisposable(
      streamSubscription:
          postStatusSettingsBloc.markMediaAsNsfwOnAttachStream.distinct().listen(
        (newValue) {
          markMediaAsNsfwOnAttachFormFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          markMediaAsNsfwOnAttachFormFieldBloc.currentValueStream.listen(
        (value) {
          postStatusSettingsBloc.changeMarkMediaAsNsfwOnAttach(value);
        },
      ),
    );
  }
}
