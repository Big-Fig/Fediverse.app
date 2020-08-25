import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/form/form_string_field_form_row_widget.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:fedi/app/ui/button/text/fedi_primary_filled_text_button.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:flutter/cupertino.dart';

class ShareWithMessageWidget extends StatelessWidget {
  final Widget header;
  final Widget child;

  ShareWithMessageWidget({
    @required this.header,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var shareMessageInputBloc =
        IShareMessageInputBloc.of(context, listen: false);
    var shareBloc = IShareBloc.of(context, listen: false);
    return ListView(
      children: <Widget>[
        if (header != null) header,
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
        StreamBuilder<bool>(
            stream: shareBloc.isPossibleToShareStream,
            initialData: shareBloc.isPossibleToShare,
            builder: (context, snapshot) {
              var isPossibleToShare = snapshot.data;
              return PleromaAsyncOperationButtonBuilderWidget(
                showProgressDialog: true,
                builder: (context, onPressed) {
                  return FediPrimaryFilledTextButton(
                    "app.share.action.share".tr(),
                    expanded: false,
                    onPressed: isPossibleToShare ? onPressed : null,
                  );
                },
                successToastMessage: "app.share.toast.success".tr(),
                asyncButtonAction: () async {
                  await shareBloc.share();
                  Navigator.of(context).pop();
                },
              );
            }),
        if (child != null)
          Padding(
            padding: FediPadding.allSmallPadding,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: FediSubHeaderText("app.share.content".tr()),
                ),
                FediSmallVerticalSpacer(),
                Container(
                  decoration: BoxDecoration(
                    color: FediColors.offWhite,
                    borderRadius: FediBorderRadius.allBigBorderRadius,
                    border: Border.all(color: FediColors.grey),
                  ),
                  child: ClipRRect(
                      borderRadius: FediBorderRadius.allBigBorderRadius,
                      child: child),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
