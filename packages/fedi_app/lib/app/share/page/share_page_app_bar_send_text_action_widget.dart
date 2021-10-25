import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/share/share_bloc.dart';
import 'package:fedi_app/app/ui/button/fedi_text_button.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class SharePageAppBarSendTextActionWidget extends StatelessWidget {
  const SharePageAppBarSendTextActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shareBloc = IShareBloc.of(context, listen: false);

    return StreamBuilder<bool>(
      stream: shareBloc.isPossibleToShareStream,
      initialData: shareBloc.isPossibleToShare,
      builder: (context, snapshot) {
        var isPossibleToShare = snapshot.data;

        return UnifediAsyncOperationButtonBuilderWidget(
          showProgressDialog: true,
          builder: (context, onPressed) => FediTextButton(
            text: S.of(context).app_share_action_send,
            onPressed: isPossibleToShare! ? onPressed : null,
          ),
          successToastMessage: S.of(context).app_share_toast_success,
          asyncButtonAction: () async {
            await shareBloc.share();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
