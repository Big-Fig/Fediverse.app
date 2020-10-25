import 'package:fedi/app/share/share_icon_button_widget.dart';
import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:fedi/app/ui/badge/fedi_stream_int_badge_widget.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class ShareToAccountIconButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var shareToAccount = IShareToAccountBloc.of(context, listen: false);

    return FediStreamIntBadgeWidget(
      stream: shareToAccount.shareSelectAccountBloc.targetAccountsCountStream,
      child: ShareIconButtonWidget(
        iconSize: FediSizes.appBarIconSize,
      ),
    );
  }
}
