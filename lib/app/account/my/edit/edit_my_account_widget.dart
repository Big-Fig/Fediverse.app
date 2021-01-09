import 'package:fedi/app/account/my/edit/field/avatar/edit_my_account_avatar_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/bot/edit_my_account_bot_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/custom_fields/edit_my_account_custom_fields_list_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/discoverable/edit_my_account_discoverable_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/display_name/edit_my_account_display_name_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/header/edit_my_account_header_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/locked/edit_my_account_locked_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/note/edit_my_account_note_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/accepts_chat_messages/edit_my_account_pleroma_accepts_chat_messages_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/allow_following_move/edit_my_account_pleroma_allow_following_move_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/background_image/edit_my_account_pleroma_background_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/hide_favourites/edit_my_account_pleroma_hide_favourites_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/hide_followers/count/edit_my_account_pleroma_hide_followers_count_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/hide_followers/edit_my_account_pleroma_hide_followers_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/hide_follows/count/edit_my_account_pleroma_hide_follows_count_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/hide_follows/edit_my_account_pleroma_hide_follows_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/no_rich_text/edit_my_account_pleroma_no_rich_text_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/show_role/edit_my_account_pleroma_show_role_field_widget.dart';
import 'package:fedi/app/account/my/edit/field/pleroma/skip_thread_containment/edit_my_account_pleroma_skip_thread_containment_field_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/spacer/fedi_small_vertical_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _editAccountAvatarSize = 120.0;
const double _editAccountAvatarCircleBorderWidth = 4.0;
const double _editAccountHeaderHeight = 148.0;
const double _editAccountBackgroundHeight = 200.0;
const double _editAccountAvatarTopPadding = 50.0;

class EditMyAccountWidget extends StatelessWidget {
  const EditMyAccountWidget();

  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
          const _EditMyAccountTopHeaderAndAvatarWidget(),
          const FediSmallVerticalSpacer(),
          Padding(
            padding: FediPadding.horizontalBigPadding,
            child: const _EditMyAccountBodyWidget(),
          ),
        ],
      );
}

class _EditMyAccountTopHeaderAndAvatarWidget extends StatelessWidget {
  const _EditMyAccountTopHeaderAndAvatarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _editAccountAvatarTopPadding +
          _editAccountAvatarSize +
          _editAccountAvatarCircleBorderWidth * 2,
      child: Container(
        child: Stack(
          children: [
            Container(
              height: _editAccountHeaderHeight,
              child: const EditMyAccountHeaderFieldWidget(),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: _editAccountAvatarTopPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const EditMyAccountAvatarFieldWidget(
                    avatarSize: _editAccountAvatarSize,
                    avatarCircleBorderWidth:
                        _editAccountAvatarCircleBorderWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditMyAccountBodyWidget extends StatelessWidget {
  const _EditMyAccountBodyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);

    return Column(
      children: [
        if (currentAuthInstanceBloc.currentInstance.isPleromaInstance)
          const EditMyAccountPleromaBackgroundFieldWidget(
            backgroundHeight: _editAccountBackgroundHeight,
          ),
        const EditMyAccountDisplayNameFieldWidget(),
        const EditMyAccountNoteFieldWidget(),
        const EditMyAccountLockedFieldWidget(),
        const EditMyAccountDiscoverableFieldWidget(),
        const EditMyAccountBotFieldWidget(),
        if (currentAuthInstanceBloc.currentInstance.isPleromaInstance) ...[
          const EditMyAccountPleromaAcceptsChatMessagesFieldWidget(),
          const EditMyAccountPleromaAllowFollowingMoveFieldWidget(),
          const EditMyAccountPleromaHideFavouritesFieldWidget(),
          const EditMyAccountPleromaHideFollowersFieldWidget(),
          const EditMyAccountPleromaHideFollowersCountFieldWidget(),
          const EditMyAccountPleromaHideFollowsFieldWidget(),
          const EditMyAccountPleromaHideFollowsCountFieldWidget(),
          const EditMyAccountPleromaNoRichTextFieldWidget(),
          const EditMyAccountPleromaShowRoleFieldWidget(),
          const EditMyAccountPleromaSkipThreadContainmentFieldWidget(),
        ],
        const EditMyAccountCustomFieldsListFieldWidget(),
      ],
    );
  }
}
