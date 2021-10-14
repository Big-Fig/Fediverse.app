import 'package:fedi/app/media/attachment/metadata/media_attachment_metadata_modal_bottom_sheet.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MediaAttachmentMetadataButtonWidget extends StatelessWidget {
  const MediaAttachmentMetadataButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unifediApiMediaAttachment =
        Provider.of<IUnifediApiMediaAttachment>(context);

    var description = unifediApiMediaAttachment.description;

    if (description != null && description.isNotEmpty) {
      return FediIconButton(
        icon: const Icon(FediIcons.info),
        color: IFediUiColorTheme.of(context).darkGrey,
        onPressed: () {
          showMediaAttachmentMetadataModalBottomSheet(
            context: context,
            description: description,
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
