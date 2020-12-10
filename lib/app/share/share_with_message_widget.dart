import 'package:fedi/app/form/field/value/string/string_value_form_field_row_widget.dart';
import 'package:fedi/app/share/message_input/share_message_input_bloc.dart';
import 'package:fedi/app/ui/fedi_border_radius.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                padding: FediPadding.allBigPadding,
                child: ClipRRect(
                  borderRadius: FediBorderRadius.allBigBorderRadius,
                  child: child,
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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProxyProvider<IShareMessageInputBloc, IStringValueFormFieldBloc>(
          update: (context, value, previous) => value.messageField,
          child: StringValueFormFieldRowWidget(
            hint: S.of(context).app_share_with_message_field_message_hint,
            textInputAction: TextInputAction.done,
            autocorrect: true,
            label: S.of(context).app_share_with_message_field_message_label,
            onSubmitted: null,
          ),
        ),
      );
}
