import 'package:fedi/app/share/external/external_share_as_link_field_widget.dart';
import 'package:fedi/app/share/external/external_share_media_bloc_impl.dart';
import 'package:fedi/app/share/media/share_media_with_message_widget.dart';
import 'package:fedi/app/share/share_icon_button_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExternalShareMediaPage extends StatelessWidget {
  final IPleromaMediaAttachment mediaAttachment;

  ExternalShareMediaPage({@required this.mediaAttachment});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediSubPageTitleAppBar(
          title: S.of(context).app_share_external_title,
          actions: [
            ShareIconButtonWidget(
              iconSize: FediSizes.appBarIconSize,
            ),
          ],
        ),
        body: ShareMediaWithMessageWidget(
          mediaAttachment: mediaAttachment,
          footer: Padding(
            padding: FediPadding.horizontalSmallPadding,
            child: ExternalShareAsLinkFieldWidget(),
          ),
        ),
      );
}

void goToExternalShareMediaPage(
    {@required BuildContext context,
    @required IPleromaMediaAttachment mediaAttachment}) {
  Navigator.push(
    context,
    createExternalShareMediaPageRoute(
      context: context,
      mediaAttachment: mediaAttachment,
    ),
  );
}

MaterialPageRoute createExternalShareMediaPageRoute({
  @required BuildContext context,
  @required IPleromaMediaAttachment mediaAttachment,
}) {
  return MaterialPageRoute(
    builder: (context) => ExternalShareMediaBloc.provideToContext(
      context,
      mediaAttachment: mediaAttachment,
      child: Provider.value(
        value: mediaAttachment,
        child: ExternalShareMediaPage(
          mediaAttachment: mediaAttachment,
        ),
      ),
      popupTitle: S.of(context).app_share_external_title,
    ),
  );
}
