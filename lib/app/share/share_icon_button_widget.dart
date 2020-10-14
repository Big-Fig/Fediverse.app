import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';

class ShareIconButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var shareBloc = IShareBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: shareBloc.isPossibleToShareStream,
        initialData: shareBloc.isPossibleToShare,
        builder: (context, snapshot) {
          var isPossibleToShare = snapshot.data;
          return PleromaAsyncOperationButtonBuilderWidget(
            showProgressDialog: true,
            builder: (context, onPressed) {
              return FediIconButton(
                icon: Icon(FediIcons.share),
                onPressed: isPossibleToShare ? onPressed : null,
              );
            },
            successToastMessage: "app.share.toast.success".tr(),
            asyncButtonAction: () async {
              await shareBloc.share();
              Navigator.of(context).pop();
            },
          );
        });
  }
}
