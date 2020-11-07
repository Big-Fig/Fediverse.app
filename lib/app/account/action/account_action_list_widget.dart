import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/action/account_action_more_dialog.dart';
import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/start/status/post_status_start_conversation_chat_page.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_helper.dart';
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

var _topPadding = FediSizes.smallPadding;
var _bottomPadding = FediSizes.bigPadding;
var _height = FediSizes.textButtonHeight + _topPadding + _bottomPadding;

class AccountActionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    return StreamBuilder<IPleromaAccountRelationship>(
      stream: accountBloc.accountRelationshipStream,
      builder: (context, snapshot) {
        var relationship = snapshot.data;

        _logger.finest(() => "relationship $relationship");

        if (relationship?.following == null) {
          return Container(
            height: _height,
            child: const _AccountActionListLoadingWidget(),
          );
        } else {
          return const _AccountActionListBodyLayoutBuilderWidget();
        }
      },
    );
  }

  const AccountActionListWidget();
}

class _AccountActionListBodyLayoutBuilderWidget extends StatelessWidget {
  const _AccountActionListBodyLayoutBuilderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var fadingPercent = FediSizes.smallPadding / constraints.maxWidth;

        return FediFadeShaderMask(
          fadingColor: IFediUiColorTheme.of(context).darkGrey,
          fadingPercent: fadingPercent,
          child: Padding(
            padding: EdgeInsets.only(
              top: _topPadding,
              bottom: _bottomPadding,
              right: FediSizes.smallPadding,
            ),
            child: const _AccountActionListBodyWidget(),
          ),
        );
      },
    );
  }
}

class _AccountActionListBodyWidget extends StatelessWidget {
  const _AccountActionListBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        const _AccountActionListFollowWidget(),
        const FediBigHorizontalSpacer(),
        const _AccountActionListMessageWidget(),
        const FediBigHorizontalSpacer(),
        const _AccountActionListMoreWidget(),
      ],
    );
  }
}

class _AccountActionListMessageWidget extends StatelessWidget {
  const _AccountActionListMessageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediBlurredTextButton(
      S.of(context).app_account_action_message,
      onPressed: () async {
        var authInstanceBloc = ICurrentAuthInstanceBloc.of(context);
        var accountBloc = IAccountBloc.of(context);
        var account = accountBloc.account;

        if (authInstanceBloc.currentInstance.isSupportChats) {
          goToPleromaChatWithAccount(context: context, account: account);
        } else {
          goToPostStatusStartConversationPage(context,
              conversationAccountsWithoutMe: <IAccount>[account]);
        }
      },
    );
  }
}

class _AccountActionListMoreWidget extends StatelessWidget {
  const _AccountActionListMoreWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediIconInCircleBlurredButton(
      FediIcons.menu,
      onPressed: () async {
        var accountBloc = IAccountBloc.of(context, listen: false);
        showAccountActionMoreDialog(
          context: context,
          accountBloc: accountBloc,
        );
      },
    );
  }
}

class _AccountActionListFollowWidget extends StatelessWidget {
  const _AccountActionListFollowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    return StreamBuilder<IPleromaAccountRelationship>(
      stream: accountBloc.accountRelationshipStream,
      initialData: accountBloc.accountRelationship,
      builder: (context, snapshot) {
        var relationship = accountBloc.accountRelationship;
        if (relationship.requested && !relationship.following) {
          return PleromaAsyncOperationButtonBuilderWidget(
            showProgressDialog: false,
            asyncButtonAction: accountBloc.toggleFollow,
            builder: (BuildContext context, VoidCallback onPressed) {
              return FediBlurredTextButton(
                S.of(context).app_account_action_followRequested,
                onPressed: onPressed,
              );
            },
          );
        } else {
          return PleromaAsyncOperationButtonBuilderWidget(
            showProgressDialog: false,
            asyncButtonAction: accountBloc.toggleFollow,
            builder: (BuildContext context, VoidCallback onPressed) {
              return FediBlurredTextButton(
                relationship?.requested == true
                    ? S.of(context).app_account_action_followRequested
                    : relationship?.following == true
                        ? S.of(context).app_account_action_unfollow
                        : S.of(context).app_account_action_follow,
                onPressed: onPressed,
              );
            },
          );
        }
      },
    );
  }
}

class _AccountActionListLoadingWidget extends StatelessWidget {
  const _AccountActionListLoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FediCircularProgressIndicator(
        color: IFediUiColorTheme.of(context).white,
      ),
    );
  }
}
