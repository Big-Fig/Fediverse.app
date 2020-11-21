import 'package:fedi/app/form/field/value/bool/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/visibility/form/status_visibility_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/status/visibility/form/status_visibility_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditPostStatusSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditPostStatusSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editPostStatusSettingsBloc = IEditPostStatusSettingsBloc.of(context);
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        ProxyProvider<IEditPostStatusSettingsBloc,
            IStatusVisibilitySingleFromListValueFormFieldBloc>(
          update: (context, value, previous) =>
              value.defaultVisibilityFormFieldBloc,
          child: const StatusVisibilitySingleFromListValueFormFieldRowWidget(),
        ),
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_status_post_settings_field_markMediaAsNsfwOnAttach_label,
          field:
              editPostStatusSettingsBloc.markMediaAsNsfwOnAttachFormFieldBloc,
          enabled: editPostStatusSettingsBloc.enabled,
        ),
      ],
    );
  }
}
