import 'package:fedi/app/card/card_widget.dart';
import 'package:fedi/app/share/share_with_message_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/mastodon/api/card/mastodon_api_card_model.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShareStatusWithMessageWidget extends StatelessWidget {
  final Widget? footer;

  const ShareStatusWithMessageWidget({
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    return ShareWithMessageWidget(
      footer: footer,
      child: ProxyProvider<IStatus, IPleromaApiCard?>(
        update: (context, status, _) => PleromaApiCard(
          authorName: status.account.displayName,
          authorUrl: status.account.url,
          url: status.url,
          type: MastodonApiCardType.link,
          title: status.spoilerText,
          description: status.content,
          image: status.mediaAttachments?.isNotEmpty == true
              ? status.mediaAttachments!.first.url
              : null,
          embedUrl: null,
          providerUrl: null,
          width: null,
          height: null,
          providerName: null,
          html: null,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: FediSizes.bigPadding,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // todo: refactor
              // ignore: no-magic-number
              maxHeight: mediaQueryData.size.height * 0.2,
            ),
            child: const CardWidget(),
          ),
        ),
      ),
    );
  }
}
