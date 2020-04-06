import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/avatar/account_avatar_widget.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc.dart';
import 'package:fedi/refactored/stream_builder/initial_data_stream_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationAvatarWidget extends StatelessWidget {
  final double baseAvatarSize;

  ConversationAvatarWidget({this.baseAvatarSize = 50.0});

  @override
  Widget build(BuildContext context) {
    IConversationBloc conversationBloc =
        IConversationBloc.of(context, listen: true);
    return SizedBox(
      width: baseAvatarSize,
      height: baseAvatarSize,
      child: StreamBuilder<List<IAccount>>(
          stream: conversationBloc.accountsWithoutMeStream.distinct(),
          builder: (context, snapshot) {
            var accounts = snapshot.data;
            if(accounts?.isNotEmpty != true) {
              return SizedBox.shrink();
            }

            switch (accounts.length) {
              case 1:
                var account = accounts.first;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(baseAvatarSize / 2),
                  child: AccountAvatarWidget.buildAccountAvatarWidget(
                      avatarUrl: account.avatar,
                      progressSize: baseAvatarSize / 2,
                      imageSize: baseAvatarSize),
                );
                break;
              case 2:
                var sizeMultiplier = 0.7;
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: buildAccountAvatar(sizeMultiplier, accounts[0]),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: buildAccountAvatar(sizeMultiplier, accounts[1]),
                    )
                  ],
                );
                break;
              case 3:
                var sizeMultiplier = 0.65;
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: buildAccountAvatar(sizeMultiplier, accounts[0]),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: buildAccountAvatar(sizeMultiplier, accounts[1]),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: buildAccountAvatar(sizeMultiplier, accounts[2]),
                    )
                  ],
                );
                break;
              case 4:
                var sizeMultiplier = 0.6;
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: buildAccountAvatar(sizeMultiplier, accounts[0]),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: buildAccountAvatar(sizeMultiplier, accounts[1]),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: buildAccountAvatar(sizeMultiplier, accounts[2]),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: buildAccountAvatar(sizeMultiplier, accounts[3]),
                    )
                  ],
                );
                break;
              default:
                var sizeMultiplier = 0.55;
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: buildAccountAvatar(sizeMultiplier, accounts[0]),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: buildAccountAvatar(sizeMultiplier, accounts[1]),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: buildAccountAvatar(sizeMultiplier, accounts[2]),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: buildAccountAvatar(sizeMultiplier, accounts[3]),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: buildAccountAvatar(sizeMultiplier, accounts[4]),
                    )
                  ],
                );
                break;
            }
          }),
    );
  }

  Widget buildAccountAvatar(double sizeMultiplier, IAccount account) {
    return Container(
      width: baseAvatarSize * sizeMultiplier,
      height: baseAvatarSize * sizeMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(baseAvatarSize * sizeMultiplier / 2)),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 2.0,
        ),
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(baseAvatarSize / 2 * sizeMultiplier),
        child: AccountAvatarWidget.buildAccountAvatarWidget(
            avatarUrl: account.avatar,
            progressSize: baseAvatarSize / 2 * sizeMultiplier,
            imageSize: baseAvatarSize * sizeMultiplier),
      ),
    );
  }
}
