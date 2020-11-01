import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/share/share_bloc.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';

class ShareIconButtonWidget extends StatelessWidget {
  final double iconSize;

  const ShareIconButtonWidget({
    @required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    var shareBloc = IShareBloc.of(context, listen: false);


    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return StreamBuilder<bool>(
        stream: shareBloc.isPossibleToShareStream,
        initialData: shareBloc.isPossibleToShare,
        builder: (context, snapshot) {
          var isPossibleToShare = snapshot.data;
          return PleromaAsyncOperationButtonBuilderWidget(
            showProgressDialog: true,
            builder: (context, onPressed) {
              return FediIconButton(
                color: fediUiColorTheme.darkGrey,
                icon: Icon(
                  FediIcons.share,
                  size: iconSize,
                ),
                onPressed: isPossibleToShare ? onPressed : null,
              );
            },
            successToastMessage: S.of(context).app_share_toast_success,
            asyncButtonAction: () async {
              await shareBloc.share();
              Navigator.of(context).pop();
            },
          );
        });
  }
}
