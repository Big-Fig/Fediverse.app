import 'package:fedi/app/form/field/value/string/form_string_field_form_row_widget.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareWithMessageWidget extends StatelessWidget {
  final Widget footer;
  final Widget child;

  const ShareWithMessageWidget({
    @required this.footer,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
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
                    color: IFediUiColorTheme.of(context).offWhite,
                    borderRadius: FediBorderRadius.allBigBorderRadius,
                    border: Border.all(
                        color: IFediUiColorTheme.of(context).ultraLightGrey),
                  ),
                  child: ClipRRect(
                      borderRadius: FediBorderRadius.allBigBorderRadius,
                      child: child),
                ),
              ),
            const _ShareWithMessageInputWidget(),
            if (footer != null) footer,
          ],
        ),
      ],
    );
  }
}

class _ShareWithMessageInputWidget extends StatelessWidget {
  const _ShareWithMessageInputWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shareMessageInputBloc = IShareMessageInputBloc.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormStringFieldFormRowWidget(
        formStringFieldBloc: shareMessageInputBloc.messageField,
        hint: S.of(context).app_share_with_message_field_message_hint,
        textInputAction: TextInputAction.done,
        autocorrect: true,
        label: S.of(context).app_share_with_message_field_message_label,
        onSubmitted: null,
      ),
    );
  }
}
