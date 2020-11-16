import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/form/form_pleroma_visibility_field_form_row_widget.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

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
        FormPleromaVisibilityFieldFormRowWidget(
          label: S
              .of(context)
              .app_status_post_settings_field_defaultVisibility_label,
          field: editPostStatusSettingsBloc.defaultVisibilityFormFieldBloc,
          displayIcon: false,
        ),
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_status_post_settings_field_markMediaAsNsfwOnAttach_label,
          field:
              editPostStatusSettingsBloc.markMediaAsNsfwOnAttachFormFieldBloc,
        ),
      ],
    );
  }
}
