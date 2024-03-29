import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/action/account_action_more_dialog.dart';
import 'package:fedi_app/app/account/action/message/account_action_message.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/ui/button/icon/fedi_icon_in_circle_blurred_button.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_blurred_text_button_with_border.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/shader_mask/fedi_fade_shader_mask.dart';
import 'package:fedi_app/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _topPadding = FediSizes.smallPadding;
var _bottomPadding = FediSizes.bigPadding;

class AccountActionListWidget extends StatelessWidget {
  const AccountActionListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const _AccountActionListBodyLayoutBuilderWidget();
}

class _AccountActionListBodyLayoutBuilderWidget extends StatelessWidget {
  const _AccountActionListBodyLayoutBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
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

class _AccountActionListBodyWidget extends StatelessWidget {
  const _AccountActionListBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);
    var myAccountBloc = IMyAccountBloc.of(context);

    var isLocal = accountBloc.instanceLocation == InstanceLocation.local;
    var isMyAccount = myAccountBloc.checkAccountIsMe(accountBloc.account);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (isLocal && !isMyAccount)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AccountActionListFollowWidget(),
              FediBigHorizontalSpacer(),
            ],
          ),
        if (isLocal && !isMyAccount)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AccountActionListMessageWidget(),
              FediBigHorizontalSpacer(),
            ],
          ),
        const _AccountActionListMoreWidget(),
      ],
    );
  }
}

class _AccountActionListMessageWidget extends StatelessWidget {
  const _AccountActionListMessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediBlurredTextButtonWithBorder(
        S.of(context).app_account_action_message,
        onPressed: () {
          goToMessagesPageAccountAction(context);
        },
        expanded: false,
      );
}

class _AccountActionListMoreWidget extends StatelessWidget {
  const _AccountActionListMoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediIconInCircleBlurredButton(
        FediIcons.menu_vertical,
        onPressed: () async {
          var accountBloc = IAccountBloc.of(context, listen: false);
          await showAccountActionMoreDialog(
            context: context,
            accountBloc: accountBloc,
          );
        },
      );
}

class _AccountActionListFollowWidget extends StatelessWidget {
  const _AccountActionListFollowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context);

    return StreamBuilder<IUnifediApiAccountRelationship?>(
      stream: accountBloc.relationshipStream,
      builder: (context, snapshot) {
        var relationship = accountBloc.relationship;

        if (relationship?.following == null) {
          return const SizedBox.shrink();
        }
        if (relationship?.requested == true &&
            !(relationship?.following == true)) {
          return UnifediAsyncOperationButtonBuilderWidget(
            showProgressDialog: false,
            asyncButtonAction: accountBloc.toggleFollow,
            builder: (BuildContext context, VoidCallback? onPressed) =>
                FediBlurredTextButtonWithBorder(
              S.of(context).app_account_action_followRequested,
              onPressed: onPressed,
              expanded: false,
            ),
          );
        } else {
          return UnifediAsyncOperationButtonBuilderWidget(
            showProgressDialog: false,
            asyncButtonAction: accountBloc.toggleFollow,
            builder: (BuildContext context, VoidCallback? onPressed) =>
                FediBlurredTextButtonWithBorder(
              relationship?.requested == true
                  ? S.of(context).app_account_action_followRequested
                  : relationship?.following == true
                      ? S.of(context).app_account_action_unfollow
                      : S.of(context).app_account_action_follow,
              onPressed: onPressed,
              expanded: false,
            ),
          );
        }
      },
    );
  }
}
