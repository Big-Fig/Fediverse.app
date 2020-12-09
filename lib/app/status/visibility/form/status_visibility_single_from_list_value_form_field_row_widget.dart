import 'package:fedi/app/form/field/value/single_from_list/single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/status/visibility/form/status_visibility_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/status/visibility/status_visibility_icon_widget.dart';
import 'package:fedi/app/status/visibility/status_visibility_title_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/cupertino.dart';

class StatusVisibilitySingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      StatusVisibilitySingleFromListValueFormFieldBlocProxyProvider(
        child: SingleFromListValueFormFieldRowWidget<PleromaVisibility>(
          label: S
              .of(context)
              .app_status_post_settings_field_defaultVisibility_label,
          valueTitleMapper: (context, value) =>
              StatusVisibilityTitleWidget.mapVisibilityToTitle(context, value),
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: true,
          valueIconMapper: (_, value) =>
              StatusVisibilityIconWidget.mapVisibilityToIconData(value),
        ),
      );

  const StatusVisibilitySingleFromListValueFormFieldRowWidget();
}
