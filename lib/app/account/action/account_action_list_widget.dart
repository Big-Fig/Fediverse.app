import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_action_more_dialog.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/chat_helper.dart';
import 'package:fedi/app/conversation/start/status/post_status_start_conversation_page.dart';
import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi/app/ui/button/text/fedi_blurred_text_button.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/progress/fedi_circular_progress_indicator.dart';
import 'package:fedi/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
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
            child: Center(
              child: FediCircularProgressIndicator(
                color: IFediUiColorTheme.of(context).white,
              ),
            ),
          );
        } else {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;

              return FediFadeShaderMask(
                fadingColor: IFediUiColorTheme.of(context).darkGrey,
                fadingPercent: fadingPercent,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: topPadding, bottom: bottomPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      buildFollowButton(
                        context: context,
                        accountBloc: accountBloc,
                        relationship: relationship,
                      ),
                      const FediBigHorizontalSpacer(),
                      buildMessageButton(
                        context: context,
                        accountBloc: accountBloc,
                      ),
                      const FediBigHorizontalSpacer(),
                      buildMoreButton(
                        context: context,
                        accountBloc: accountBloc,
                        relationship: relationship,
                      ),
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

  Widget buildMoreButton({
    @required BuildContext context,
    @required IAccountBloc accountBloc,
    @required IPleromaAccountRelationship relationship,
  }) {
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

  Widget buildMessageButton({
    @required BuildContext context,
    @required IAccountBloc accountBloc,
  }) {
    return FediBlurredTextButton(
      S.of(context).app_account_action_message,
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

  Widget buildFollowButton({
    @required BuildContext context,
    @required IAccountBloc accountBloc,
    @required IPleromaAccountRelationship relationship,
  }) {
    if (relationship.requested && !relationship.following) {
      return FediBlurredTextButton(
        S.of(context).app_account_action_followRequested,
        onPressed: null,
      );
    } else {
      return PleromaAsyncOperationButtonBuilderWidget(
        showProgressDialog: false,
        asyncButtonAction: accountBloc.toggleFollow,
        builder: (BuildContext context, VoidCallback onPressed) {
          return FediBlurredTextButton(
            relationship?.following == true
                ? S.of(context).app_account_action_unfollow
                : S.of(context).app_account_action_follow,
            onPressed: onPressed,
          );
        },
      );
    }
  }

  const AccountActionListWidget();
}
