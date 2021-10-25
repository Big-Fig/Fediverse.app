import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/account/my/edit/field/avatar/edit_my_account_avatar_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/bot/edit_my_account_bot_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/custom_fields/edit_my_account_custom_fields_list_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/discoverable/edit_my_account_discoverable_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/display_name/edit_my_account_display_name_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/header/edit_my_account_header_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/locked/edit_my_account_locked_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/note/edit_my_account_note_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/accepts_chat_messages/edit_my_account_unifedi_accepts_chat_messages_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/allow_following_move/edit_my_account_unifedi_allow_following_move_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/background_image/edit_my_account_unifedi_background_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/hide_favourites/edit_my_account_unifedi_hide_favourites_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/hide_followers/count/edit_my_account_unifedi_hide_followers_count_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/hide_followers/edit_my_account_unifedi_hide_followers_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/hide_follows/count/edit_my_account_unifedi_hide_follows_count_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/hide_follows/edit_my_account_unifedi_hide_follows_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/no_rich_text/edit_my_account_unifedi_no_rich_text_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/show_role/edit_my_account_unifedi_show_role_field_widget.dart';
import 'package:fedi_app/app/account/my/edit/field/unifedi/skip_thread_containment/edit_my_account_unifedi_skip_thread_containment_field_widget.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

const double _editAccountAvatarSize = 120.0;
const double _editAccountAvatarCircleBorderWidth = 4.0;
const double _editAccountHeaderHeight = 148.0;
const double _editAccountBackgroundHeight = 200.0;
const double _editAccountAvatarTopPadding = 50.0;

class EditMyAccountWidget extends StatelessWidget {
  const EditMyAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: const <Widget>[
          _EditMyAccountTopHeaderAndAvatarWidget(),
          FediSmallVerticalSpacer(),
          Padding(
            padding: FediPadding.horizontalBigPadding,
            child: _EditMyAccountBodyWidget(),
          ),
        ],
      );
}

class _EditMyAccountTopHeaderAndAvatarWidget extends StatelessWidget {
  const _EditMyAccountTopHeaderAndAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: _editAccountAvatarTopPadding +
            _editAccountAvatarSize +
            // ignore: no-magic-number
            _editAccountAvatarCircleBorderWidth * 2,
        child: Stack(
          children: [
            const SizedBox(
              height: _editAccountHeaderHeight,
              child: EditMyAccountHeaderFieldWidget(),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: _editAccountAvatarTopPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  EditMyAccountAvatarFieldWidget(
                    avatarSize: _editAccountAvatarSize,
                    avatarCircleBorderWidth:
                        _editAccountAvatarCircleBorderWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _EditMyAccountBodyWidget extends StatelessWidget {
  const _EditMyAccountBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUnifediApiAccessBloc = ICurrentAccessBloc.of(context);

    return Column(
      children: [
        if (currentUnifediApiAccessBloc.currentInstance!.isPleroma)
          const EditMyAccountUnifediBackgroundFieldWidget(
            backgroundHeight: _editAccountBackgroundHeight,
          ),
        const EditMyAccountDisplayNameFieldWidget(),
        const EditMyAccountNoteFieldWidget(),
        const EditMyAccountLockedFieldWidget(),
        const EditMyAccountDiscoverableFieldWidget(),
        const EditMyAccountBotFieldWidget(),
        if (currentUnifediApiAccessBloc.currentInstance!.isPleroma) ...[
          const EditMyAccountacceptsChatMessagesFieldWidget(),
          const EditMyAccountUnifediAllowFollowingMoveFieldWidget(),
          const EditMyAccountUnifediHideFavouritesFieldWidget(),
          const EditMyAccounthideFollowersFieldWidget(),
          const EditMyAccounthideFollowersCountFieldWidget(),
          const EditMyAccountUnifediHideFollowsFieldWidget(),
          const EditMyAccountUnifediHideFollowsCountFieldWidget(),
          const EditMyAccountUnifediNoRichTextFieldWidget(),
          const EditMyAccountUnifediShowRoleFieldWidget(),
          const EditMyAccountUnifediSkipThreadContainmentFieldWidget(),
        ],
        const EditMyAccountCustomFieldsListFieldWidget(),
      ],
    );
  }
}
