import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareWithMessageWidget extends StatelessWidget {
  final Widget footer;
  final Widget child;

  ShareWithMessageWidget({
    @required this.footer,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var shareMessageInputBloc =
        IShareMessageInputBloc.of(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: <Widget>[
            if (child != null)
              Padding(
                padding: FediPadding.allSmallPadding,
                child: Container(
                  decoration: BoxDecoration(
                    color: FediColors.offWhite,
                    borderRadius: FediBorderRadius.allBigBorderRadius,
                    border: Border.all(color: FediColors.ultraLightGrey),
                  ),
                  child: ClipRRect(
                      borderRadius: FediBorderRadius.allBigBorderRadius,
                      child: child),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FormStringFieldFormRowWidget(
                formStringFieldBloc: shareMessageInputBloc.messageField,
                hint: "app.share.with_message.field.message.hint".tr(),
                textInputAction: TextInputAction.done,
                autocorrect: true,
                label: "app.share.with_message.field.message.label".tr(),
                onSubmitted: null,
              ),
            ),
            if (footer != null) footer,
          ],
        ),
      ],
    );
  }
}
