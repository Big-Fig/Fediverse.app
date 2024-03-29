import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi_app/app/account/header/account_header_bloc.dart';
import 'package:fedi_app/app/account/header/account_header_bloc_impl.dart';
import 'package:fedi_app/app/account/header/account_header_followers_count_widget.dart';
import 'package:fedi_app/app/account/header/account_header_following_count_widget.dart';
import 'package:fedi_app/app/account/header/account_header_statuses_count_widget.dart';
import 'package:fedi_app/app/account/info/account_info_bloc.dart';
import 'package:fedi_app/app/account/info/account_info_bloc_impl.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/spacer/fedi_small_horizontal_spacer.dart';
import 'package:fedi_app/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountInfoWidget extends StatelessWidget {
  final OnClickUiCallback onStatusesTapCallback;

  const AccountInfoWidget({
    Key? key,
    required this.onStatusesTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              const AccountAvatarWidget(
                imageSize: FediSizes.accountAvatarBigSize,
                progressSize: FediSizes.accountAvatarProgressBigSize,
              ),
              const FediSmallHorizontalSpacer(),
              DisposableProvider<IAccountInfoBloc>(
                create: (context) => AccountInfoBloc(
                  brightness: Brightness.light,
                  onStatusesTapCallback: onStatusesTapCallback,
                ),
                child: DisposableProxyProvider<IAccountInfoBloc,
                    IAccountHeaderBloc>(
                  update: (context, value, _) => AccountHeaderBloc(
                    brightness: value.brightness,
                  ),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const <Widget>[
                        AccountHeaderStatusesCountWidget(
                          onStatusesTapCallback: _onStatusesTapCallback,
                        ),
                        AccountHeaderFollowingCountWidget(),
                        AccountHeaderFollowersCountWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}

void _onStatusesTapCallback(BuildContext context) =>
    IAccountInfoBloc.of(context, listen: false).onStatusesTapCallback!(context);
