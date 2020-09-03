import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_action_more_dialog.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/chat_helper.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/fedi_blurred_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("account_actions_widget.dart");

class AccountActionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: false);
    return StreamBuilder<IPleromaAccountRelationship>(
      stream: accountBloc.accountRelationshipStream,
      initialData: accountBloc.accountRelationship,
      builder: (context, snapshot) {
        var relationship = snapshot.data;

        _logger.finest(() => "relationship $relationship");

        var topPadding = FediSizes.smallPadding;
        var bottomPadding = FediSizes.bigPadding;
        if (relationship?.following == null) {
          return Container(
            height: FediSizes.textButtonHeight + topPadding + bottomPadding,
            child: const Center(
              child: FediCircularProgressIndicator(
                color: FediColors.white,
              ),
            ),
          );
        } else {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;

              return FediFadeShaderMask(
                fadingColor: FediColors.darkGrey,
                fadingPercent: fadingPercent,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: topPadding, bottom: bottomPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      buildFollowButton(accountBloc, relationship),
                      const FediBigHorizontalSpacer(),
                      buildMessageButton(context, accountBloc),
                      const FediBigHorizontalSpacer(),
                      buildMoreButton(context, accountBloc, relationship),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget buildMoreButton(BuildContext context, IAccountBloc accountBloc,
      IPleromaAccountRelationship relationship) {
    return FediIconInCircleBlurredButton(
      FediIcons.menu,
      onPressed: () async {
        showAccountActionMoreDialog(
          context: context,
          accountBloc: accountBloc,
          relationship: relationship,
        );
      },
    );
  }

  Widget buildMessageButton(BuildContext context, IAccountBloc accountBloc) {
    return FediBlurredTextButton(
      tr("app.account.action.message"),
      onPressed: () async {
        var authInstanceBloc =
            ICurrentAuthInstanceBloc.of(context, listen: false);
        var account = accountBloc.account;

        if (authInstanceBloc.currentInstance.isSupportChats) {
          goToChatWithAccount(context: context, account: account);
        } else {
          goToPostStatusStartConversationPage(context,
              conversationAccountsWithoutMe: <IAccount>[account]);
        }
      },
    );
  }

  Widget buildFollowButton(
      IAccountBloc accountBloc, IPleromaAccountRelationship relationship) {

    if(relationship.requested) {
      return FediBlurredTextButton(
        tr("app.account.action.follow_requested"),
        onPressed: null,
      );
    } else {

    return PleromaAsyncOperationButtonBuilderWidget(
      showProgressDialog: false,
      asyncButtonAction: accountBloc.toggleFollow,
      builder: (BuildContext context, VoidCallback onPressed) {
        return FediBlurredTextButton(
          relationship?.following == true
              ? tr("app.account.action.unfollow")
              : tr("app.account.action.follow"),
          onPressed: onPressed,
        );
      },
    );
    }
  }

  const AccountActionListWidget();
}
