import 'package:fedi/app/ui/modal_bottom_sheet/fedi_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

Future<void> showMediaAttachmentMetadataModalBottomSheet({
  required BuildContext context,
  required String description,
}) {
  var fediUiTextTheme = IFediUiTextTheme.of(
    context,
    listen: false,
  );

  return showFediModalBottomSheetDialog<void>(
    context: context,
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                S.of(context).app_media_description_title,
                style: fediUiTextTheme.bigBoldDarkGrey,
              ),
              const FediBigVerticalSpacer(),
              Text(
                description,
                style: fediUiTextTheme.bigShortDarkGrey,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
