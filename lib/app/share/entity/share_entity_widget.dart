import 'package:fedi/app/media/attachment/media_attachment_widget.dart';
import 'package:fedi/app/share/share_with_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareEntityWidget extends StatelessWidget {
  final Widget? footer;

  const ShareEntityWidget({
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);

    return ShareWithMessageWidget(
      footer: footer,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // todo: refactor
          // ignore: no-magic-number
          maxHeight: mediaQueryData.size.height * 0.2,
        ),
        child: const MediaAttachmentWidget(),
      ),
    );
  }
}

// class ExternalShareAsLinkFieldWidget extends StatelessWidget {
//   const ExternalShareAsLinkFieldWidget();
//
//   @override
//   Widget build(BuildContext context) =>
//       ProxyProvider<IExternalShareBloc, IBoolValueFormFieldBloc>(
//         update: (context, value, previous) => value.asLinkBoolField,
//         child: BoolValueFormFieldRowWidget(
//           label: S.of(context).app_share_external_field_shareAsLink,
//         ),
//       );
// }
